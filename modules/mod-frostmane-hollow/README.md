# mod-frostmane-hollow (local only, not for the core)

Frostmane Hollow's C++ -- Hailar the Frigid's lines and the ritualists channelling at him -- lives here and nowhere else (EPIC10's AM1,
`handoff/manager-091`): `src/scripts/dungeons/frostmane_hollow` is gone from the core, with its lines in
`src/scripts/CMakeLists.txt` and `ScriptLoader.cpp`. The world database names the scripts --
`boss_hailar_the_frigid` (63130), `npc_frostmane_ritualist` (36519) -- and the module registers them under the same names.

## The switch its rows are tried with

The dungeon's rows (`frostmane_hollow_as_rows.sql`: Hailar's three lines, the ritualists passive and channelling, written by trt's `scripts/tier1_rows.py`) keep those
`script_name`s and give the creatures `ai_name = 'EventAI'` beside them. So:

- **the module loaded**: its C++ runs, as before -- the script found by name comes first;
- **unloaded** (`module unload mod-frostmane-hollow` on a running server, or off for the next start): the
  names find no script, and the core gives the creatures their `ai_name` -- Hailar and the ritualists on EventAI, their rows alone.

`module unload` gives every creature running one of its scripts a new AI at once -- the rows;
its library stays loaded, so an instance opened before keeps its instance script until it closes.

## Its settings

`conf/mod-frostmane-hollow.conf.dist` -- copied beside the server's, as `mod-frostmane-hollow.conf`: `mod-frostmane-hollow.Enable = 0`
registers nothing, as if the module were not there.
