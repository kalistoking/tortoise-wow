# mod-blackwing-lair (local only, not for the core)

Blackwing Lair's C++ lives here and nowhere else (EPIC10's AM1, `handoff/manager-091`):
its files are gone from the core, with their lines in `src/scripts/CMakeLists.txt` and
`ScriptLoader.cpp`; the module registers their scripts under the names the world database gives.

Taken from the core:

- `src/scripts/dungeons/blackwing_lair/blackwing_lair_trash.cpp`
- `src/scripts/dungeons/blackwing_lair/boss_broodlord_lashlayer.cpp`
- `src/scripts/dungeons/blackwing_lair/boss_ebonroc.cpp`
- `src/scripts/dungeons/blackwing_lair/boss_firemaw.cpp`
- `src/scripts/dungeons/blackwing_lair/boss_flamegor.cpp`
- `src/scripts/dungeons/blackwing_lair/blackwing_lair_death_talon_captain.cpp`

## The switch

- **loaded**: its C++ runs, as before;
- **unloaded** (`module unload mod-blackwing-lair` on a running server, or `mod-blackwing-lair.Enable = 0` for the next
  start): the names find no script, and the core gives the creatures their `ai_name`.

Made by trt's `scripts/am1_modules.py`.
