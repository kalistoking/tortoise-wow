# mod-scarlet-monastery (local only, not for the core)

Scarlet Monastery's C++ lives here and nowhere else (EPIC10's AM1, `handoff/manager-091`):
its files are gone from the core, with their lines in `src/scripts/CMakeLists.txt` and
`ScriptLoader.cpp`; the module registers their scripts under the names the world database gives.

Taken from the core:

- `src/scripts/dungeons/scarlet_monastery/boss_arcanist_doan.cpp`
- `src/scripts/dungeons/scarlet_monastery/boss_bloodmage_thalnos.cpp`
- `src/scripts/dungeons/scarlet_monastery/boss_herod.cpp`
- `src/scripts/dungeons/scarlet_monastery/boss_high_inquisitor_fairbanks.cpp`
- `src/scripts/dungeons/scarlet_monastery/boss_houndmaster_loksey.cpp`
- `src/scripts/dungeons/scarlet_monastery/boss_interrogator_vishas.cpp`
- `src/scripts/dungeons/scarlet_monastery/boss_scorn.cpp`

## The switch

- **loaded**: its C++ runs, as before;
- **unloaded** (`module unload mod-scarlet-monastery` on a running server, or `mod-scarlet-monastery.Enable = 0` for the next
  start): the names find no script, and the core gives the creatures their `ai_name`.

Made by trt's `scripts/am1_modules.py`.
