# mod-black-morass (local only, not for the core)

Black Morass's C++ lives here and nowhere else (EPIC10's AM1, `handoff/manager-091`):
its files are gone from the core, with their lines in `src/scripts/CMakeLists.txt` and
`ScriptLoader.cpp`; the module registers their scripts under the names the world database gives.

Taken from the core:

- `src/scripts/dungeons/black_morass/black_morass.h`
- `src/scripts/dungeons/black_morass/black_morass_trash.cpp`
- `src/scripts/dungeons/black_morass/black_morass_trash.hpp`
- `src/scripts/dungeons/black_morass/boss_chronormu.cpp`
- `src/scripts/dungeons/black_morass/boss_chronormu.hpp`
- `src/scripts/dungeons/black_morass/boss_gerastrasz.cpp`
- `src/scripts/dungeons/black_morass/boss_gerastrasz.hpp`
- `src/scripts/dungeons/black_morass/instance_black_morass.cpp`

## The switch

- **loaded**: its C++ runs, as before;
- **unloaded** (`module unload mod-black-morass` on a running server, or `mod-black-morass.Enable = 0` for the next
  start): the names find no script, and the core gives the creatures their `ai_name`.

Made by trt's `scripts/am1_modules.py`.
