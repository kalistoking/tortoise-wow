# mod-crescent-grove (local only, not for the core)

Crescent Grove's C++ -- the instance script -- every creature pulling the zone into its fight, the four bosses' aggro and death yells -- lives here and nowhere else (EPIC10's AM1,
`handoff/manager-091`): `src/scripts/dungeons/crescent_grove` is gone from the core, with its lines in
`src/scripts/CMakeLists.txt` and `ScriptLoader.cpp`. The world database names the scripts --
`instance_crescent_grove` (map 802) -- and the module registers them under the same names.

## The switch its rows are tried with

The dungeon's rows (`crescent_grove_as_rows.sql`: an aggro rule on each of the dungeon's entries pulling the zone, the bosses' yells as broadcast texts, written by trt's `scripts/tier1_rows.py`) keep those
`script_name`s and give the creatures `ai_name = 'EventAI'` beside them. So:

- **the module loaded**: its C++ runs, as before -- the script found by name comes first;
- **unloaded** (`module unload mod-crescent-grove` on a running server, or off for the next start): the
  names find no script, and the core gives the creatures their `ai_name` -- no instance script: the rows alone pull the zone and yell.

`module unload` gives every creature running one of its scripts a new AI at once -- the rows;
its library stays loaded, so an instance opened before keeps its instance script until it closes.

## Its settings

`conf/mod-crescent-grove.conf.dist` -- copied beside the server's, as `mod-crescent-grove.conf`: `mod-crescent-grove.Enable = 0`
registers nothing, as if the module were not there.
