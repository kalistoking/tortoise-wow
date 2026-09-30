# mod-stormwrought-ruins (local only, not for the core)

Stormwrought Ruins's C++ lives here and nowhere else (EPIC10's AM1, `handoff/manager-091`):
its files are gone from the core, with their lines in `src/scripts/CMakeLists.txt` and
`ScriptLoader.cpp`; the module registers their scripts under the names the world database gives.

Taken from the core:

- `src/scripts/dungeons/stormwrought_ruins/boss_chieftain_stormsong.cpp`
- `src/scripts/dungeons/stormwrought_ruins/boss_dagar_the_glutton.cpp`
- `src/scripts/dungeons/stormwrought_ruins/boss_deathlord_tidebane.cpp`
- `src/scripts/dungeons/stormwrought_ruins/boss_duke_balor_iv.cpp`
- `src/scripts/dungeons/stormwrought_ruins/boss_eldermaw_the_primordial.cpp`
- `src/scripts/dungeons/stormwrought_ruins/boss_ighalfor.cpp`
- `src/scripts/dungeons/stormwrought_ruins/boss_lady_drazare.cpp`
- `src/scripts/dungeons/stormwrought_ruins/boss_librarian_theodorus.cpp`
- `src/scripts/dungeons/stormwrought_ruins/boss_mycellakos.cpp`
- `src/scripts/dungeons/stormwrought_ruins/boss_oronok_torn_heart.cpp`
- `src/scripts/dungeons/stormwrought_ruins/boss_subjugator_halthas_shadecrest.cpp`
- `src/scripts/dungeons/stormwrought_ruins/instance_stormwrought_ruins.cpp`
- `src/scripts/dungeons/stormwrought_ruins/stormwrought_ruins.h`

## The switch

- **loaded**: its C++ runs, as before;
- **unloaded** (`module unload mod-stormwrought-ruins` on a running server, or `mod-stormwrought-ruins.Enable = 0` for the next
  start): the names find no script, and the core gives the creatures their `ai_name`.

Made by trt's `scripts/am1_modules.py`.
