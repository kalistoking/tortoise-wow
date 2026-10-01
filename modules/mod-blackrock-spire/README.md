# mod-blackrock-spire (local only, not for the core)

Blackrock Spire's C++ lives here and nowhere else (EPIC10's AM1, `handoff/manager-091`):
its files are gone from the core, with their lines in `src/scripts/CMakeLists.txt` and
`ScriptLoader.cpp`; the module registers their scripts under the names the world database gives.

Taken from the core:

- `src/scripts/dungeons/blackrock_spire/boss_halycon.cpp`
- `src/scripts/dungeons/blackrock_spire/boss_highlord_omokk.cpp`
- `src/scripts/dungeons/blackrock_spire/boss_overlord_wyrmthalak.cpp`
- `src/scripts/dungeons/blackrock_spire/boss_quartermaster_zigris.cpp`
- `src/scripts/dungeons/blackrock_spire/boss_shadow_hunter_voshgajin.cpp`
- `src/scripts/dungeons/blackrock_spire/boss_the_beast.cpp`
- `src/scripts/dungeons/blackrock_spire/boss_warmaster_voone.cpp`
- `src/scripts/dungeons/blackrock_spire/ubrs_trash.cpp`
- `src/scripts/dungeons/blackrock_spire/boss_pyroguard_emberseer.cpp`

## The switch

- **loaded**: its C++ runs, as before;
- **unloaded** (`module unload mod-blackrock-spire` on a running server, or `mod-blackrock-spire.Enable = 0` for the next
  start): the names find no script, and the core gives the creatures their `ai_name`.

Made by trt's `scripts/am1_modules.py`.
