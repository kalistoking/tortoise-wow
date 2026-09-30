# mod-onyxias-lair (local only, not for the core)

Onyxias Lair's C++ lives here and nowhere else (EPIC10's AM1, `handoff/manager-091`):
its files are gone from the core, with their lines in `src/scripts/CMakeLists.txt` and
`ScriptLoader.cpp`; the module registers their scripts under the names the world database gives.

Taken from the core:

- `src/scripts/dungeons/onyxias_lair/instance_onyxia_lair.cpp`
- `src/scripts/dungeons/onyxias_lair/onyxian_whelp.cpp`

## The switch

- **loaded**: its C++ runs, as before;
- **unloaded** (`module unload mod-onyxias-lair` on a running server, or `mod-onyxias-lair.Enable = 0` for the next
  start): the names find no script, and the core gives the creatures their `ai_name`.

Made by trt's `scripts/am1_modules.py`.
