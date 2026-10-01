# mod-naxxramas (local only, not for the core)

Naxxramas's C++ lives here and nowhere else (EPIC10's AM1, `handoff/manager-091`):
its files are gone from the core, with their lines in `src/scripts/CMakeLists.txt` and
`ScriptLoader.cpp`; the module registers their scripts under the names the world database gives.

Taken from the core:

- `src/scripts/dungeons/naxxramas/naxxramas_crypt_guards.cpp`
- `src/scripts/dungeons/naxxramas/naxxramas_faerlina_rp.cpp`
- `src/scripts/dungeons/naxxramas/naxxramas_plague_cloud.cpp`
- `src/scripts/dungeons/naxxramas/naxxramas_shadow_fissure.cpp`
- `src/scripts/dungeons/naxxramas/naxxramas_spirits_slimes.cpp`
- `src/scripts/dungeons/naxxramas/naxxramas_zombie_chow.cpp`
- `src/scripts/dungeons/naxxramas/naxxramas_gargoyles_warriors.cpp`
- `src/scripts/dungeons/naxxramas/naxxramas_maggots.cpp`

## The switch

- **loaded**: its C++ runs, as before;
- **unloaded** (`module unload mod-naxxramas` on a running server, or `mod-naxxramas.Enable = 0` for the next
  start): the names find no script, and the core gives the creatures their `ai_name`.

Made by trt's `scripts/am1_modules.py`.
