# mod-blackrock-depths (local only, not for the core)

Blackrock Depths's C++ lives here and nowhere else (EPIC10's AM1, `handoff/manager-091`):
its files are gone from the core, with their lines in `src/scripts/CMakeLists.txt` and
`ScriptLoader.cpp`; the module registers their scripts under the names the world database gives.

Taken from the core:

- `src/scripts/dungeons/blackrock_depths/arena_challenge_ai.cpp`
- `src/scripts/dungeons/blackrock_depths/blackrock_depths_objects.cpp`
- `src/scripts/dungeons/blackrock_depths/boss_anubshiah.cpp`
- `src/scripts/dungeons/blackrock_depths/boss_emperor_dagran_thaurissan.cpp`
- `src/scripts/dungeons/blackrock_depths/boss_general_angerforge.cpp`
- `src/scripts/dungeons/blackrock_depths/boss_gorosh_the_dervish.cpp`
- `src/scripts/dungeons/blackrock_depths/boss_grizzle.cpp`
- `src/scripts/dungeons/blackrock_depths/boss_high_interrogator_gerstahn.cpp`
- `src/scripts/dungeons/blackrock_depths/boss_magmus.cpp`
- `src/scripts/dungeons/blackrock_depths/boss_tomb_of_seven.cpp`

## The switch

- **loaded**: its C++ runs, as before;
- **unloaded** (`module unload mod-blackrock-depths` on a running server, or `mod-blackrock-depths.Enable = 0` for the next
  start): the names find no script, and the core gives the creatures their `ai_name`.

Made by trt's `scripts/am1_modules.py`.
