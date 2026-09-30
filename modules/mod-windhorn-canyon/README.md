# mod-windhorn-canyon (local only, not for the core)

Windhorn Canyon's C++ -- Narlgom and Champion Rotag, Chieftain Shalk Blackwind, the Storm Guardian -- lives here and nowhere else (EPIC10's AM1,
`handoff/manager-091`): `src/scripts/dungeons/windhorn_canyon` is gone from the core, with its lines in
`src/scripts/CMakeLists.txt` and `ScriptLoader.cpp`. The world database names the scripts --
`boss_bonespeaker_narlgom` (62780), `npc_champion_rotag` (62785), `boss_chieftain_shalk_blackwind` (62782), `npc_windhorn_storm_guardian` (62865) -- and the module registers them under the same names.

## The switch its rows are tried with

The dungeon's rows (`windhorn_canyon_as_rows.sql`: Narlgom, Rotag and Shalk as rules, written by trt's `scripts/tier1_rows.py`) keep those
`script_name`s and give the creatures `ai_name = 'EventAI'` beside them. So:

- **the module loaded**: its C++ runs, as before -- the script found by name comes first;
- **unloaded** (`module unload mod-windhorn-canyon` on a running server, or off for the next start): the
  names find no script, and the core gives the creatures their `ai_name` -- Narlgom, Rotag and Shalk on their rows alone; the Storm Guardian has no rows yet (its residues wait on AC4) and dies with no residue.

`module unload` gives every creature running one of its scripts a new AI at once -- the rows;
its library stays loaded, so an instance opened before keeps its instance script until it closes.

## Its settings

`conf/mod-windhorn-canyon.conf.dist` -- copied beside the server's, as `mod-windhorn-canyon.conf`: `mod-windhorn-canyon.Enable = 0`
registers nothing, as if the module were not there.
