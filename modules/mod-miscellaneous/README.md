# mod-miscellaneous (local only, not for the core)

Miscellaneous's C++ lives here and nowhere else (EPIC10's AM1, `handoff/manager-088`):
its files are gone from the core, with their lines in `src/scripts/CMakeLists.txt` and
`ScriptLoader.cpp`; the module registers their scripts under the names the world database gives.

Taken from the core:

- `src/scripts/miscellaneous/areatrigger_scripts.cpp`
- `src/scripts/miscellaneous/custom_exploration_triggers.cpp`
- `src/scripts/miscellaneous/feature_custom_spell_test.cpp`
- `src/scripts/miscellaneous/feature_gardening.cpp`
- `src/scripts/miscellaneous/gameobject_scripts.cpp`
- `src/scripts/miscellaneous/item_orb_of_draconic_energy.cpp`
- `src/scripts/miscellaneous/jewelcrafting.cpp`
- `src/scripts/miscellaneous/ptr.cpp`
- `src/scripts/miscellaneous/ptr.hpp`
- `src/scripts/miscellaneous/random_scripts_0.cpp`
- `src/scripts/miscellaneous/random_scripts_1.cpp`
- `src/scripts/miscellaneous/random_scripts_2.cpp`
- `src/scripts/miscellaneous/random_scripts_3.cpp`
- `src/scripts/world/boss_omen.cpp`
- `src/scripts/world/boss_omen.h`

## The switch

- **loaded**: its C++ runs, as before;
- **unloaded** (`module unload mod-miscellaneous` on a running server, or `mod-miscellaneous.Enable = 0` for the next
  start): the names find no script, and the core gives the creatures their `ai_name`.

Made by trt's `scripts/am1_modules.py`.
