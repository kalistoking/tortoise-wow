# mod-temple-of-ahnqiraj (local only, not for the core)

Temple Of Ahnqiraj's C++ lives here and nowhere else (EPIC10's AM1, `handoff/manager-091`):
its files are gone from the core, with their lines in `src/scripts/CMakeLists.txt` and
`ScriptLoader.cpp`; the module registers their scripts under the names the world database gives.

Taken from the core:

- `src/scripts/dungeons/temple_of_ahnqiraj/temple_of_ahnqiraj_hatchling.cpp`
- `src/scripts/dungeons/temple_of_ahnqiraj/temple_of_ahnqiraj_huhuran.cpp`
- `src/scripts/dungeons/temple_of_ahnqiraj/temple_of_ahnqiraj_mindslayer.cpp`
- `src/scripts/dungeons/temple_of_ahnqiraj/temple_of_ahnqiraj_ouro_mounds.cpp`
- `src/scripts/dungeons/temple_of_ahnqiraj/temple_of_ahnqiraj_viscidus_globs.cpp`

## The switch

- **loaded**: its C++ runs, as before;
- **unloaded** (`module unload mod-temple-of-ahnqiraj` on a running server, or `mod-temple-of-ahnqiraj.Enable = 0` for the next
  start): the names find no script, and the core gives the creatures their `ai_name`.

Made by trt's `scripts/am1_modules.py`.
