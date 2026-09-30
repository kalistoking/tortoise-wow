# mod-zone-arathi-highlands (local only, not for the core)

Arathi Highlands's C++ lives here and nowhere else (EPIC10's AM1, `handoff/manager-088`):
its files are gone from the core, with their lines in `src/scripts/CMakeLists.txt` and
`ScriptLoader.cpp`; the module registers their scripts under the names the world database gives.

Taken from the core:

- `src/scripts/world/arathi_highlands.cpp`

## The switch

- **loaded**: its C++ runs, as before;
- **unloaded** (`module unload mod-zone-arathi-highlands` on a running server, or `mod-zone-arathi-highlands.Enable = 0` for the next
  start): the names find no script, and the core gives the creatures their `ai_name`.

Made by trt's `scripts/am1_modules.py`.
