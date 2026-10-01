# mod-lower-karazhan-halls (local only, not for the core)

Lower Karazhan Halls's C++ lives here and nowhere else (EPIC10's AM1, `handoff/manager-091`):
its files are gone from the core, with their lines in `src/scripts/CMakeLists.txt` and
`ScriptLoader.cpp`; the module registers their scripts under the names the world database gives.

Taken from the core:

- `src/scripts/dungeons/lower_karazhan_halls/boss_blackwald_ii.cpp`
- `src/scripts/dungeons/lower_karazhan_halls/boss_brood_queen_araxxna.cpp`
- `src/scripts/dungeons/lower_karazhan_halls/boss_clawlord_howlfang.cpp`
- `src/scripts/dungeons/lower_karazhan_halls/boss_grizikil.cpp`
- `src/scripts/dungeons/lower_karazhan_halls/boss_moroes.cpp`
- `src/scripts/dungeons/lower_karazhan_halls/instance_lower_karazhan_halls.cpp`
- `src/scripts/dungeons/lower_karazhan_halls/lower_karazhan_halls.h`

## The switch

- **loaded**: its C++ runs, as before;
- **unloaded** (`module unload mod-lower-karazhan-halls` on a running server, or `mod-lower-karazhan-halls.Enable = 0` for the next
  start): the names find no script, and the core gives the creatures their `ai_name`.

Made by trt's `scripts/am1_modules.py`.
