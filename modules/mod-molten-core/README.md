# mod-molten-core (local only, not for the core)

Molten Core's C++ lives here and nowhere else (EPIC10's AM1, `handoff/manager-091`):
its files are gone from the core, with their lines in `src/scripts/CMakeLists.txt` and
`ScriptLoader.cpp`; the module registers their scripts under the names the world database gives.

Taken from the core:

- `src/scripts/dungeons/molten_core/boss_garr.cpp`
- `src/scripts/dungeons/molten_core/boss_gehennas.cpp`
- `src/scripts/dungeons/molten_core/boss_golemagg.cpp`
- `src/scripts/dungeons/molten_core/boss_lucifron.cpp`
- `src/scripts/dungeons/molten_core/boss_magmadar.cpp`
- `src/scripts/dungeons/molten_core/boss_shazzrah.cpp`
- `src/scripts/dungeons/molten_core/boss_sulfuron_harbinger.cpp`
- `src/scripts/dungeons/molten_core/molten_core.cpp`
- `src/scripts/dungeons/molten_core/boss_incindis.cpp`
- `src/scripts/dungeons/molten_core/molten_core_runes.cpp`

## The switch

- **loaded**: its C++ runs, as before;
- **unloaded** (`module unload mod-molten-core` on a running server, or `mod-molten-core.Enable = 0` for the next
  start): the names find no script, and the core gives the creatures their `ai_name`.

Made by trt's `scripts/am1_modules.py`.
