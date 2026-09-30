# mod-stormwind-vaults (local only, not for the core)

Stormwind Vaults's C++ lives here and nowhere else (EPIC10's AM1, `handoff/manager-091`):
its files are gone from the core, with their lines in `src/scripts/CMakeLists.txt` and
`ScriptLoader.cpp`; the module registers their scripts under the names the world database gives.

Taken from the core:

- `src/scripts/dungeons/stormwind_vaults/boss_arctiras.cpp`
- `src/scripts/dungeons/stormwind_vaults/boss_aszosh_grimflame.cpp`
- `src/scripts/dungeons/stormwind_vaults/boss_black_bride.cpp`
- `src/scripts/dungeons/stormwind_vaults/boss_nazorna.cpp`
- `src/scripts/dungeons/stormwind_vaults/boss_thamgrarr.cpp`

## The switch

- **loaded**: its C++ runs, as before;
- **unloaded** (`module unload mod-stormwind-vaults` on a running server, or `mod-stormwind-vaults.Enable = 0` for the next
  start): the names find no script, and the core gives the creatures their `ai_name`.

Made by trt's `scripts/am1_modules.py`.
