# mod-scarlet-citadel (local only, not for the core)

Scarlet Citadel's C++ lives here and nowhere else (EPIC10's AM1, `handoff/manager-091`):
its files are gone from the core, with their lines in `src/scripts/CMakeLists.txt` and
`ScriptLoader.cpp`; the module registers their scripts under the names the world database gives.

Taken from the core:

- `src/scripts/dungeons/scarlet_citadel/boss_abbendis.cpp`
- `src/scripts/dungeons/scarlet_citadel/boss_abbendis.hpp`
- `src/scripts/dungeons/scarlet_citadel/trashmobs_scarlet_citadel.cpp`
- `src/scripts/dungeons/scarlet_citadel/trashmobs_scarlet_citadel.hpp`
- `src/scripts/dungeons/scarlet_citadel/trashbosses_scarlet_citadel.cpp`
- `src/scripts/dungeons/scarlet_citadel/trashbosses_scarlet_citadel.hpp`

## The switch

- **loaded**: its C++ runs, as before;
- **unloaded** (`module unload mod-scarlet-citadel` on a running server, or `mod-scarlet-citadel.Enable = 0` for the next
  start): the names find no script, and the core gives the creatures their `ai_name`.

Made by trt's `scripts/am1_modules.py`.
