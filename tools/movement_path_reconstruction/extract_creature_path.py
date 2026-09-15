#!/usr/bin/env python3
"""
Reconstruct a creature's creature_movement waypoints from a captured world
session, given its already-extracted 40-byte session key.

Pipeline: decrypt the server->client TCP stream's SMSG headers with the
session key, decompress SMSG_COMPRESSED_MOVES, and parse SMSG_MONSTER_MOVE /
SMSG_MONSTER_MOVE_TRANSPORT payloads. Only the server->client direction is
needed -- movement packets are server-authored, and its header cipher is a
running stream keyed purely by message order in that one direction.

Validated against a known-good NPC (Ralthas, entry 62635, guid 2590698 in
this repo's own tw_world) on a local capture: reconstructed X/Y matched the
authored waypoints to sub-centimeter precision; Z differed by a few tenths
of a yard at some points, consistent with the live server's mmap ground-snap
adjusting height at runtime rather than a decoding error. All matched packets
arrived via SMSG_COMPRESSED_MOVES, so the zlib/inner-framing path is exercised
too, not just the simpler direct one.

Requires the session key extracted separately (e.g. from a known-plaintext
attack on the encrypted CMSG header bytes -- see wow_session_key.py). This
tool only consumes an already-known key; it does not derive one.

Usage:
    pip install scapy
    python3 extract_creature_path.py <capture.pcap(ng)> <session_key_hex> \\
        --server-ip 127.0.0.1 --port 8090 [--entry 62635] [--sql-guid 123456]

Without --entry, prints a summary of every moving unit's wire GUID (with its
decoded entry) so you can pick the right one.
"""
import argparse
import struct
import sys
import zlib
from scapy.all import IP, TCP, Raw, rdpcap

SMSG_AUTH_CHALLENGE = 0x1EC
SMSG_MONSTER_MOVE = 0x0DD
SMSG_MONSTER_MOVE_TRANSPORT = 0x2AE
SMSG_COMPRESSED_MOVES = 0x2FB

HIGHGUID_UNIT = 0xF130

MOVESPLINEFLAG_CYCLIC = 0x00100000  # MoveSplineFlag::Cyclic
MOVESPLINEFLAG_FLYING = 0x00000200  # MoveSplineFlag::Flying == Mask_CatmullRom


# --------------------------------------------------------------------------
# TCP stream reassembly (one direction at a time; we only need server->client)
# --------------------------------------------------------------------------

def reassemble_stream(pkts, src_ip, src_port, dst_ip, dst_port):
    chunks = {}
    for p in pkts:
        if TCP in p and IP in p and Raw in p:
            if p[IP].src == src_ip and p[TCP].sport == src_port and p[IP].dst == dst_ip and p[TCP].dport == dst_port:
                payload = bytes(p[Raw].load)
                if payload:
                    chunks[p[TCP].seq] = payload

    ordered = sorted(chunks.items())
    if not ordered:
        return b""

    buf = bytearray()
    expected = ordered[0][0]
    for seq, data in ordered:
        if seq < expected:
            overlap = expected - seq
            data = data[overlap:] if overlap < len(data) else b""
        elif seq > expected:
            print(f"[!] gap in stream: expected seq {expected}, got {seq} "
                  f"({seq - expected} bytes missing -- capture likely dropped packets)", file=sys.stderr)
            buf.extend(b"\x00" * (seq - expected))
        buf.extend(data)
        expected = seq + len(data)
    return bytes(buf)


# --------------------------------------------------------------------------
# Header crypto -- mirrors src/shared/Auth/AuthCrypt.cpp EncryptSend, inverted.
# Server encrypts SMSG headers as: cipher = (plain ^ key[i]) + j ; j = cipher.
# Decrypting from a passive capture: plain = (cipher - j) ^ key[i] ; j = cipher.
# --------------------------------------------------------------------------

def decrypt_smsg_header(hdr: bytearray, key: bytes, i: int, j: int):
    n = len(key)
    for t in range(4):
        c = hdr[t]
        x = (c - j) & 0xFF
        x ^= key[i % n]
        i += 1
        j = c
        hdr[t] = x
    return i, j


def read_header(buf: bytes, pos: int):
    """ServerPktHeader (src/framework/Network/MangosSocket.h): uint16 size (BE), uint16 cmd (LE).
    iSendPacket EndianConvertReverse()'s size to big-endian but leaves cmd native/little-endian."""
    size = struct.unpack_from(">H", buf, pos)[0]
    opcode = struct.unpack_from("<H", buf, pos + 2)[0]
    return size, opcode


# --------------------------------------------------------------------------
# packGUID and SMSG_MONSTER_MOVE parsing
# --------------------------------------------------------------------------

def read_packguid(body: bytes, off: int):
    mask = body[off]
    off += 1
    guid = 0
    for bit in range(8):
        if mask & (1 << bit):
            guid |= body[off] << (bit * 8)  # byte belongs at its mask-bit position, not read order
            off += 1
    return guid, off


def guid_high(guid: int) -> int:
    return (guid >> 48) & 0xFFFF


def guid_entry(guid: int) -> int:
    """Mirrors ObjectGuid::GetEntry() (src/game/ObjectGuid.h)."""
    return (guid >> 24) & 0xFFFFFF


def unpack_offset_xyz(packed: int):
    """Mirrors ByteBuffer::appendPackXYZ (src/shared/ByteBuffer.h), inverted."""
    x = packed & 0x7FF
    y = (packed >> 11) & 0x7FF
    z = (packed >> 22) & 0x3FF
    if x >= 0x400:
        x -= 0x800
    if y >= 0x400:
        y -= 0x800
    if z >= 0x200:
        z -= 0x400
    return x * 0.25, y * 0.25, z * 0.25


def parse_monster_move(body: bytes, opcode: int):
    """
    Mirrors PacketBuilder::WriteCommonMonsterMovePart + WriteMonsterMove, and the
    hand-written "stop" shortcut in MoveSplineInit::Launch, byte for byte:

        packGUID unit  [+ packGUID transport, MOVE-only]
        Vector3 start_pos
        uint32  splineId
        uint8   moveType          (0 Normal, 1 Stop, 2 FacingSpot, 3 FacingTarget, 4 FacingAngle)
        [moveType-specific extra] (Stop: none | Spot: Vector3 | Target: uint64 | Angle: float)
        -- everything below is ABSENT when moveType == Stop --
        uint32  flags
        uint32  duration
        if flags & Flying (Mask_CatmullRom):
            uint32 count ; Vector3[count]              (cyclic fake dup point is already included)
        else:
            uint32 lastIdx ; Vector3 dest ; packedOffset[lastIdx-1]
    """
    guid, off = read_packguid(body, 0)
    if opcode == SMSG_MONSTER_MOVE_TRANSPORT:
        _transport_guid, off = read_packguid(body, off)

    sx, sy, sz = struct.unpack_from("<fff", body, off); off += 12
    spline_id = struct.unpack_from("<I", body, off)[0]; off += 4
    move_type = body[off]; off += 1

    if move_type == 1:  # MonsterMoveStop -- no further payload at all
        return {"guid": guid, "type": "stop", "spline_id": spline_id, "pos": (sx, sy, sz)}
    elif move_type == 2:  # MonsterMoveFacingSpot
        off += 12
    elif move_type == 3:  # MonsterMoveFacingTarget
        off += 8
    elif move_type == 4:  # MonsterMoveFacingAngle
        off += 4
    # move_type == 0 (Normal): no facing payload

    flags = struct.unpack_from("<I", body, off)[0]; off += 4
    duration = struct.unpack_from("<I", body, off)[0]; off += 4

    if flags & MOVESPLINEFLAG_FLYING:
        cyclic = bool(flags & MOVESPLINEFLAG_CYCLIC)
        count = struct.unpack_from("<I", body, off)[0]; off += 4
        points = []
        for _ in range(count):
            points.append(struct.unpack_from("<fff", body, off)); off += 12
        return {"guid": guid, "type": "catmullrom", "cyclic": cyclic, "spline_id": spline_id,
                "start": (sx, sy, sz), "duration_ms": duration, "points": points}
    else:
        last_idx = struct.unpack_from("<I", body, off)[0]; off += 4
        dest = struct.unpack_from("<fff", body, off); off += 12
        points = []
        for _ in range(max(last_idx - 1, 0)):
            packed = struct.unpack_from("<I", body, off)[0]; off += 4
            ox, oy, oz = unpack_offset_xyz(packed)
            points.append((dest[0] - ox, dest[1] - oy, dest[2] - oz))
        points.append(dest)
        return {"guid": guid, "type": "linear", "spline_id": spline_id, "start": (sx, sy, sz),
                "dest": dest, "duration_ms": duration, "points": points}


# --------------------------------------------------------------------------
# SMSG_COMPRESSED_MOVES container (src/game/Objects/UpdateData.cpp MovementData)
# --------------------------------------------------------------------------

def unpack_compressed_moves(body: bytes):
    """[uint32 uncompressed_size][zlib blob]; inside: repeated
    [uint8 len_incl_opcode][uint16 opcode][payload], not re-encrypted."""
    usize = struct.unpack_from("<I", body, 0)[0]
    inner = zlib.decompress(body[4:])
    if len(inner) != usize:
        print(f"[!] SMSG_COMPRESSED_MOVES size mismatch: header says {usize}, got {len(inner)}", file=sys.stderr)
    out = []
    pos = 0
    while pos < len(inner):
        plen = inner[pos]; pos += 1
        opcode = struct.unpack_from("<H", inner, pos)[0]
        payload = inner[pos + 2: pos + plen]
        pos += plen
        out.append((opcode, payload))
    return out


# --------------------------------------------------------------------------
# main extraction walk
# --------------------------------------------------------------------------

def extract_moves(pcap_path: str, key: bytes, server_ip: str, server_port: int):
    print(f"[*] reading {pcap_path} ...")
    pkts = rdpcap(pcap_path)

    client_port = None
    for p in pkts:
        if TCP in p and IP in p and p[IP].dst == server_ip and p[TCP].dport == server_port and Raw in p:
            client_port = p[TCP].sport
            break
    if client_port is None:
        sys.exit(f"[-] no client->server payload found to {server_ip}:{server_port}")

    print(f"[*] reassembling {server_ip}:{server_port} -> :{client_port} stream ...")
    stream = reassemble_stream(pkts, server_ip, server_port, server_ip, client_port)
    print(f"[*] {len(stream)} bytes reassembled")

    size, opcode = read_header(stream, 0)
    if opcode != SMSG_AUTH_CHALLENGE:
        print(f"[!] first message is opcode 0x{opcode:X}, expected SMSG_AUTH_CHALLENGE (0x{SMSG_AUTH_CHALLENGE:X}) "
              f"-- capture may not start at session begin, decode will likely desync", file=sys.stderr)
    pos = 4 + (size - 2)
    print(f"[*] skipped plaintext SMSG_AUTH_CHALLENGE ({size} bytes); encrypted traffic starts at offset {pos}")

    i = j = 0
    moves = []
    opcode_counts = {}
    while pos + 4 <= len(stream):
        hdr = bytearray(stream[pos:pos + 4])
        i, j = decrypt_smsg_header(hdr, key, i, j)
        size = struct.unpack_from(">H", hdr, 0)[0]
        opcode = struct.unpack_from("<H", hdr, 2)[0]
        body_len = size - 2
        if body_len < 0 or pos + 4 + body_len > len(stream):
            print(f"[!] desync at stream offset {pos} (size={size} opcode=0x{opcode:X}) -- stopping decode here",
                  file=sys.stderr)
            break
        body = stream[pos + 4: pos + 4 + body_len]
        opcode_counts[opcode] = opcode_counts.get(opcode, 0) + 1

        if opcode in (SMSG_MONSTER_MOVE, SMSG_MONSTER_MOVE_TRANSPORT):
            moves.append(parse_monster_move(body, opcode))
        elif opcode == SMSG_COMPRESSED_MOVES:
            for iop, ibody in unpack_compressed_moves(body):
                if iop in (SMSG_MONSTER_MOVE, SMSG_MONSTER_MOVE_TRANSPORT):
                    moves.append(parse_monster_move(ibody, iop))

        pos += 4 + body_len

    print(f"[*] decrypted {len(opcode_counts)} distinct opcodes, {len(moves)} movement packets decoded")
    return moves


def summarize_movers(moves):
    from collections import Counter
    counts = Counter(m["guid"] for m in moves)
    print(f"\n[*] {len(counts)} distinct moving units in this capture (top 15 by packet count):")
    print(f"    {'guid':<20} {'high':>6} {'entry':>8}  count")
    for g, c in counts.most_common(15):
        print(f"    0x{g:016X}   0x{guid_high(g):04X}  {guid_entry(g):>8}  {c}")


def trim_to_one_loop(dest_points, close_dist=1.0, min_len=3):
    """A patrol that runs the whole capture repeats; cut the first time the path
    comes back near its own starting point after having moved away from it."""
    if not dest_points:
        return dest_points
    x0, y0, _ = dest_points[0]
    for idx in range(min_len, len(dest_points)):
        x, y, _ = dest_points[idx]
        if (x - x0) ** 2 + (y - y0) ** 2 <= close_dist ** 2:
            return dest_points[:idx]
    return dest_points  # never returned close enough; capture may be under one loop


def build_path(moves, entry: int):
    seq = [m for m in moves if m["type"] == "linear" and guid_entry(m["guid"]) == entry]
    dests = []
    for m in seq:
        d = m["dest"]
        if not dests or (dests[-1][0] - d[0]) ** 2 + (dests[-1][1] - d[1]) ** 2 > 0.01:
            dests.append(d)
    trimmed = trim_to_one_loop(dests)
    return seq, dests, trimmed


def print_sql(points, guid_placeholder):
    print(f"\n-- creature_movement rows for guid {guid_placeholder} "
          f"(orientation/waittime/script_id unknown from a sniff, left at 0)")
    print("INSERT INTO `creature_movement`")
    print("(`id`, `point`, `position_x`, `position_y`, `position_z`, `orientation`, `waittime`, `wander_distance`, `script_id`)")
    print("VALUES")
    lines = [f"({guid_placeholder}, {i + 1}, {x:.6f}, {y:.6f}, {z:.6f}, 0, 0, 0, 0)"
             for i, (x, y, z) in enumerate(points)]
    print(",\n".join(lines) + ";")


def main():
    ap = argparse.ArgumentParser(description=__doc__, formatter_class=argparse.RawDescriptionHelpFormatter)
    ap.add_argument("capture")
    ap.add_argument("session_key_hex")
    ap.add_argument("--server-ip", default="127.0.0.1")
    ap.add_argument("--port", type=int, default=8090, help="world server port (default: 8090, this repo's WorldServerPort)")
    ap.add_argument("--entry", type=int, help="creature_template entry to reconstruct a path for")
    ap.add_argument("--sql-guid", type=int, help="creature.guid to use in the generated creature_movement INSERT (requires --entry)")
    args = ap.parse_args()

    key = bytes.fromhex(args.session_key_hex)
    moves = extract_moves(args.capture, key, args.server_ip, args.port)

    if args.entry is None:
        summarize_movers(moves)
        print("\n[*] pass --entry <id> (from the table above) to reconstruct that unit's path")
        return

    seq, dests, trimmed = build_path(moves, args.entry)
    print(f"\n[*] entry {args.entry}: {len(seq)} linear hops, {len(dests)} unique destinations, "
          f"{len(trimmed)} after trimming to one loop")
    for i, p in enumerate(trimmed):
        print(f"  {i + 1:3d}: {p[0]:.3f}, {p[1]:.3f}, {p[2]:.3f}")

    if args.sql_guid is not None:
        print_sql(trimmed, args.sql_guid)


if __name__ == "__main__":
    main()
