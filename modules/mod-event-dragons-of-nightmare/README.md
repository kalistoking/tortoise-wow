# mod-event-dragons-of-nightmare (local only, not for the core)

the Dragons of Nightmare's C++ lives here and nowhere else (EPIC10's AM1, `handoff/manager-088`):
its files are gone from the core, with their lines in `src/scripts/CMakeLists.txt` and
`ScriptLoader.cpp`; the module registers their scripts under the names the world database gives.

Taken from the core:

- `src/scripts/events/event_dragons_of_nightmare.cpp`
- `src/scripts/events/event_dragons_of_nightmare.h`
- `src/scripts/events/boss_emeriss.cpp`
- `src/scripts/events/boss_lethon.cpp`
- `src/scripts/events/boss_taerar.cpp`
- `src/scripts/events/boss_ysondre.cpp`

## The switch

- **loaded**: its C++ runs, as before;
- **unloaded** (`module unload mod-event-dragons-of-nightmare` on a running server, or `mod-event-dragons-of-nightmare.Enable = 0` for the next
  start): the names find no script, and the core gives the creatures their `ai_name`.

Made by trt's `scripts/am1_modules.py`.
