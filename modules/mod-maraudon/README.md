# mod-maraudon (local only, not for the core)

Maraudon's C++ lives here and nowhere else (EPIC10's AM1, `handoff/manager-091`):
its files are gone from the core, with their lines in `src/scripts/CMakeLists.txt` and
`ScriptLoader.cpp`; the module registers their scripts under the names the world database gives.

Taken from the core:

- `src/scripts/dungeons/maraudon/boss_celebras_the_cursed.cpp`
- `src/scripts/dungeons/maraudon/boss_landslide.cpp`
- `src/scripts/dungeons/maraudon/boss_noxxion.cpp`
- `src/scripts/dungeons/maraudon/boss_princess_theradras.cpp`
- `src/scripts/dungeons/maraudon/instance_maraudon.cpp`
- `src/scripts/dungeons/maraudon/maraudon.h`

## The switch

- **loaded**: its C++ runs, as before;
- **unloaded** (`module unload mod-maraudon` on a running server, or `mod-maraudon.Enable = 0` for the next
  start): the names find no script, and the core gives the creatures their `ai_name`.

Made by trt's `scripts/am1_modules.py`.
