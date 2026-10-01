# mod-karazhan-crypt (local only, not for the core)

Karazhan Crypt's C++ lives here and nowhere else (EPIC10's AM1, `handoff/manager-091`):
its files are gone from the core, with their lines in `src/scripts/CMakeLists.txt` and
`ScriptLoader.cpp`; the module registers their scripts under the names the world database gives.

Taken from the core:

- `src/scripts/dungeons/karazhan_crypt/instance_karazhan_crypt.cpp`

## The switch

- **loaded**: its C++ runs, as before;
- **unloaded** (`module unload mod-karazhan-crypt` on a running server, or `mod-karazhan-crypt.Enable = 0` for the next
  start): the names find no script, and the core gives the creatures their `ai_name`.

Made by trt's `scripts/am1_modules.py`.
