# mod-zulgurub (local only, not for the core)

Zulgurub's C++ lives here and nowhere else (EPIC10's AM1, `handoff/manager-091`):
its files are gone from the core, with their lines in `src/scripts/CMakeLists.txt` and
`ScriptLoader.cpp`; the module registers their scripts under the names the world database gives.

Taken from the core:

- `src/scripts/dungeons/zulgurub/boss_gahzranka.cpp`
- `src/scripts/dungeons/zulgurub/boss_venoxis.cpp`
- `src/scripts/dungeons/zulgurub/zulgurub_bat_rider.cpp`
- `src/scripts/dungeons/zulgurub/zulgurub_gong.cpp`
- `src/scripts/dungeons/zulgurub/zulgurub_trash.cpp`

## The switch

- **loaded**: its C++ runs, as before;
- **unloaded** (`module unload mod-zulgurub` on a running server, or `mod-zulgurub.Enable = 0` for the next
  start): the names find no script, and the core gives the creatures their `ai_name`.

Made by trt's `scripts/am1_modules.py`.
