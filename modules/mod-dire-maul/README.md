# mod-dire-maul (local only, not for the core)

Dire Maul's C++ lives here and nowhere else (EPIC10's AM1, `handoff/manager-091`):
its files are gone from the core, with their lines in `src/scripts/CMakeLists.txt` and
`ScriptLoader.cpp`; the module registers their scripts under the names the world database gives.

Taken from the core:

- `src/scripts/dungeons/dire_maul/boss_gordok_king.cpp`
- `src/scripts/dungeons/dire_maul/boss_immol_thar.cpp`
- `src/scripts/dungeons/dire_maul/boss_tendris_warpwood.cpp`
- `src/scripts/dungeons/dire_maul/boss_zevrim.cpp`
- `src/scripts/dungeons/dire_maul/npc_ecorcefer.cpp`
- `src/scripts/dungeons/dire_maul/npc_pusillin.cpp`
- `src/scripts/dungeons/dire_maul/dire_maul.h`
- `src/scripts/dungeons/dire_maul/dreadsteed_ritual.cpp`
- `src/scripts/dungeons/dire_maul/instance_dire_maul.cpp`

## The switch

- **loaded**: its C++ runs, as before;
- **unloaded** (`module unload mod-dire-maul` on a running server, or `mod-dire-maul.Enable = 0` for the next
  start): the names find no script, and the core gives the creatures their `ai_name`.

Made by trt's `scripts/am1_modules.py`.
