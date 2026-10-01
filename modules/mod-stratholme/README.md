# mod-stratholme (local only, not for the core)

Stratholme's C++ lives here and nowhere else (EPIC10's AM1, `handoff/manager-091`):
its files are gone from the core, with their lines in `src/scripts/CMakeLists.txt` and
`ScriptLoader.cpp`; the module registers their scripts under the names the world database gives.

Taken from the core:

- `src/scripts/dungeons/stratholme/boss_atiesh.cpp`
- `src/scripts/dungeons/stratholme/boss_cannon_master_willey.cpp`
- `src/scripts/dungeons/stratholme/boss_magistrate_barthilas.cpp`
- `src/scripts/dungeons/stratholme/boss_maleki_the_pallid.cpp`
- `src/scripts/dungeons/stratholme/boss_nerubenkan.cpp`
- `src/scripts/dungeons/stratholme/boss_postmaster_malown.cpp`
- `src/scripts/dungeons/stratholme/boss_ramstein_the_gorger.cpp`
- `src/scripts/dungeons/stratholme/boss_timmy_the_cruel.cpp`
- `src/scripts/dungeons/stratholme/stratholme.cpp`

## The switch

- **loaded**: its C++ runs, as before;
- **unloaded** (`module unload mod-stratholme` on a running server, or `mod-stratholme.Enable = 0` for the next
  start): the names find no script, and the core gives the creatures their `ai_name`.

Made by trt's `scripts/am1_modules.py`.
