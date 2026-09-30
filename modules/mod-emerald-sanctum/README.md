# mod-emerald-sanctum (local only, not for the core)

Emerald Sanctum's C++ lives here and nowhere else (EPIC10's AM1, `handoff/manager-091`):
its files are gone from the core, with their lines in `src/scripts/CMakeLists.txt` and
`ScriptLoader.cpp`; the module registers their scripts under the names the world database gives.

Taken from the core:

- `src/scripts/dungeons/emerald_sanctum/sanctum_creatures.cpp`

## The switch

- **loaded**: its C++ runs, as before;
- **unloaded** (`module unload mod-emerald-sanctum` on a running server, or `mod-emerald-sanctum.Enable = 0` for the next
  start): the names find no script, and the core gives the creatures their `ai_name`.

Made by trt's `scripts/am1_modules.py`.
