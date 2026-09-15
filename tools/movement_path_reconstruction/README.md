# Movement path reconstruction from a network capture

Reconstructs a creature's `creature_movement` waypoints from a captured world
session, given its already-extracted 40-byte session key. Built to record a
target NPC's patrol on another server and reproduce it here.

## What it needs

- A `.pcap`/`.pcapng` capture of the world session (port matching the
  target's `WorldServerPort`, 8090 by default in this repo).
- The 40-byte session key for that capture, already extracted separately
  (e.g. the known-plaintext attack against the encrypted `CMSG` header bytes
  used by scripts like `wow_session_key.py` circulating for this purpose).
  This tool only consumes an already-known key; it does not derive one.

## Usage

```sh
pip install scapy

# 1. find the target: prints every moving unit's wire GUID with its decoded entry
python3 extract_creature_path.py capture.pcap <session_key_hex> --port 8090

# 2. reconstruct its path once you know the entry
python3 extract_creature_path.py capture.pcap <session_key_hex> --entry 62635

# 3. emit ready-to-run creature_movement rows for a specific spawn guid
python3 extract_creature_path.py capture.pcap <session_key_hex> --entry 62635 --sql-guid 2590698
```

No bounding-box guessing needed to find the right unit -- `creature_template`
entry is embedded directly in the wire `ObjectGuid` (bits 24-47), so
`--port`/summary mode alone is enough to identify a target by entry.

## How it works

Only the server -> client direction is needed: movement packets are
server-authored, and the header cipher is a running stream keyed purely by
message order in that one direction (no need to touch client -> server
traffic or CMSG headers at all).

1. Reassemble the server -> client TCP stream from the capture.
2. Decrypt each `SMSG` header (4 bytes: 2-byte size, 2-byte opcode) with the
   session key, mirroring `AuthCrypt::EncryptSend` in reverse.
3. Decompress `SMSG_COMPRESSED_MOVES` payloads (a `uint32` uncompressed size
   + zlib blob; inside, repeated `[uint8 len][uint16 opcode][payload]` frames
   that are *not* separately re-encrypted).
4. Parse `SMSG_MONSTER_MOVE` / `SMSG_MONSTER_MOVE_TRANSPORT` bodies.
5. The core sends a patrol as a series of point-to-point linear hops, not one
   curve, so the ordered sequence of hop destinations *is* the waypoint list.
   A patrol repeats for as long as the capture runs, so the tool trims the
   sequence the first time it returns near its own starting point.

## Validated against known-good data

Cross-checked against this repo's own Ralthas (`creature_template` entry
62635, spawn `guid` 2590698) on a local capture: the reconstructed X/Y
matched the authored `creature_movement` waypoints to sub-centimeter
precision; Z differed by a few tenths of a yard at some points, consistent
with the live server's mmap ground-snap adjusting height at runtime rather
than a decoding error. Every matched packet in that capture arrived via
`SMSG_COMPRESSED_MOVES`, so the zlib/inner-framing path was exercised too,
not just the simpler direct one.

Two real bugs were caught and fixed during that validation, both from
reading this repo's own C++ source rather than guessing:

- The `SMSG` header's `size` field is big-endian but `cmd` (opcode) is
  little-endian (`src/framework/Network/MangosSocketImpl.h`,
  `iSendPacket`) -- easy to get backwards since the `CMSG` header the
  session-key extractor reads is documented the other way (opcode as
  part of a `>HH`-style read looks plausible but is wrong for `SMSG`).
- `packGUID` reconstruction must place each present byte at its *mask bit*
  position, not at the position it happened to be read in -- getting this
  wrong still produces a plausible-looking but wrong 64-bit value.

## Known limitations

- **Z can be a few tenths off.** Runtime pathfinding height-snap, not something
  to "fix" -- decide per point whether to trust the sniffed Z or re-derive it
  from ground height when writing the final SQL.
- **Loop trimming is a simple nearest-return-to-start heuristic**
  (`trim_to_one_loop`), not real loop detection. Works well for a simple
  closed patrol; a patrol with waypoints that pass close to the start point
  mid-route (not just at the end) could trim early. Inspect the point count
  against what you expect before trusting it blind.
- `orientation`, `waittime`, and `script_id` are not recoverable from the
  spline packets themselves. `waittime` can be estimated from the capture by
  comparing each hop's `duration_ms` against the real-world gap before the
  *next* hop starts; `orientation` and `script_id` are not present in the
  wire data at all.
- The capture must start at (or before) `SMSG_AUTH_CHALLENGE` for the header
  crypto's running state to sync correctly; joining mid-session desyncs the
  decode immediately (the tool warns about this).
- Only tested against this fork's 1.12.1 opcode table
  (`src/game/Protocol/Opcodes_1_12_1.h`). A server on a different opcode
  table needs the `SMSG_*` constants at the top of the script updated first.
