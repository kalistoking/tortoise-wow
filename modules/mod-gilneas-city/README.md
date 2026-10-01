# mod-gilneas-city (local only, not for the core)

Gilneas City's C++ lives here and nowhere else (EPIC10's AM1, `handoff/manager-091`):
its files are gone from the core, with their lines in `src/scripts/CMakeLists.txt` and
`ScriptLoader.cpp`; the module registers their scripts under the names the world database gives.

Taken from the core:

- `src/scripts/dungeons/gilneas_city/boss_celia.cpp`
- `src/scripts/dungeons/gilneas_city/boss_lord_mortimer.cpp`
- `src/scripts/dungeons/gilneas_city/instance_gilneas_city.cpp`
- `src/scripts/dungeons/gilneas_city/instance_gilneas_city.h`

## The switch

- **loaded**: its C++ runs, as before;
- **unloaded** (`module unload mod-gilneas-city` on a running server, or `mod-gilneas-city.Enable = 0` for the next
  start): the names find no script, and the core gives the creatures their `ai_name`.

Made by trt's `scripts/am1_modules.py`.
