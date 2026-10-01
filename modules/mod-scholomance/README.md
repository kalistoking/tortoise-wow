# mod-scholomance (local only, not for the core)

Scholomance's C++ lives here and nowhere else (EPIC10's AM1, `handoff/manager-091`):
its files are gone from the core, with their lines in `src/scripts/CMakeLists.txt` and
`ScriptLoader.cpp`; the module registers their scripts under the names the world database gives.

Taken from the core:

- `src/scripts/dungeons/scholomance/boss_darkmaster_gandling.cpp`
- `src/scripts/dungeons/scholomance/boss_doctor_theolen_krastinov.cpp`
- `src/scripts/dungeons/scholomance/boss_illucia_barov.cpp`
- `src/scripts/dungeons/scholomance/boss_instructor_malicia.cpp`
- `src/scripts/dungeons/scholomance/boss_lord_alexei_barov.cpp`
- `src/scripts/dungeons/scholomance/boss_lorekeeper_polkelt.cpp`
- `src/scripts/dungeons/scholomance/boss_ras_frostwhisper.cpp`
- `src/scripts/dungeons/scholomance/boss_the_ravenian.cpp`
- `src/scripts/dungeons/scholomance/scholo_trash.cpp`

## The switch

- **loaded**: its C++ runs, as before;
- **unloaded** (`module unload mod-scholomance` on a running server, or `mod-scholomance.Enable = 0` for the next
  start): the names find no script, and the core gives the creatures their `ai_name`.

Made by trt's `scripts/am1_modules.py`.
