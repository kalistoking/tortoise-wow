# mod-dragonmaw-retreat (local only, not for the core)

Dragonmaw Retreat's C++ lives here and nowhere else (EPIC10's AM1, `handoff/manager-091`):
its files are gone from the core, with their lines in `src/scripts/CMakeLists.txt` and
`ScriptLoader.cpp`; the module registers their scripts under the names the world database gives.

Taken from the core:

- `src/scripts/dungeons/dragonmaw_retreat/boss_bogpaw_truthsay.cpp`
- `src/scripts/dungeons/dragonmaw_retreat/boss_gowlfang.cpp`
- `src/scripts/dungeons/dragonmaw_retreat/boss_halgan_redbrand.cpp`
- `src/scripts/dungeons/dragonmaw_retreat/boss_searistrasz.cpp`
- `src/scripts/dungeons/dragonmaw_retreat/boss_zuluhed_the_whacked.cpp`
- `src/scripts/dungeons/dragonmaw_retreat/dragonmaw_retreat.h`
- `src/scripts/dungeons/dragonmaw_retreat/instance_dragonmaw_retreat.cpp`

## The switch

- **loaded**: its C++ runs, as before;
- **unloaded** (`module unload mod-dragonmaw-retreat` on a running server, or `mod-dragonmaw-retreat.Enable = 0` for the next
  start): the names find no script, and the core gives the creatures their `ai_name`.

Made by trt's `scripts/am1_modules.py`.
