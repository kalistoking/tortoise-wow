# mod-razorfen-downs (local only, not for the core)

Razorfen Downs's C++ lives here and nowhere else (EPIC10's AM1, `handoff/manager-091`):
its files are gone from the core, with their lines in `src/scripts/CMakeLists.txt` and
`ScriptLoader.cpp`; the module registers their scripts under the names the world database gives.

Taken from the core:

- `src/scripts/dungeons/razorfen_downs/instance_razorfen_downs.cpp`
- `src/scripts/dungeons/razorfen_downs/razorfen_downs.cpp`

## The switch

- **loaded**: its C++ runs, as before;
- **unloaded** (`module unload mod-razorfen-downs` on a running server, or `mod-razorfen-downs.Enable = 0` for the next
  start): the names find no script, and the core gives the creatures their `ai_name`.

Made by trt's `scripts/am1_modules.py`.
