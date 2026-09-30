# mod-zone-silithus (local only, not for the core)

Silithus's C++ lives here and nowhere else (EPIC10's AM1, `handoff/manager-088`):
its files are gone from the core, with their lines in `src/scripts/CMakeLists.txt` and
`ScriptLoader.cpp`; the module registers their scripts under the names the world database gives.

Taken from the core:

- `src/scripts/world/silithus.cpp`
- `src/scripts/world/silithus/silithus.h`
- `src/scripts/world/silithus/field_duty_alliance/defines.h`
- `src/scripts/world/silithus/field_duty_alliance/npc_arcanist_nozzlespring.cpp`
- `src/scripts/world/silithus/field_duty_alliance/npc_arcanist_nozzlespring.h`
- `src/scripts/world/silithus/field_duty_alliance/npc_captain_blackanvil.cpp`
- `src/scripts/world/silithus/field_duty_alliance/npc_captain_blackanvil.h`
- `src/scripts/world/silithus/field_duty_alliance/npc_hivezora_abomination.cpp`
- `src/scripts/world/silithus/field_duty_alliance/npc_hivezora_abomination.h`
- `src/scripts/world/silithus/field_duty_alliance/npc_janela_stouthammer.cpp`
- `src/scripts/world/silithus/field_duty_alliance/npc_janela_stouthammer.h`
- `src/scripts/world/silithus/field_duty_alliance/trigger_field_duty_alliance.cpp`
- `src/scripts/world/silithus/field_duty_alliance/trigger_field_duty_alliance.h`
- `src/scripts/world/silithus/field_duty_horde/defines.h`
- `src/scripts/world/silithus/field_duty_horde/npc_hiveregal_hunterkiller.h`
- `src/scripts/world/silithus/field_duty_horde/npc_krug_skullsplit.h`
- `src/scripts/world/silithus/field_duty_horde/npc_merok_longstride.h`
- `src/scripts/world/silithus/field_duty_horde/npc_orgrimmar_legion_grunt.h`
- `src/scripts/world/silithus/field_duty_horde/npc_shadow_priestess_shai.h`

## The switch

- **loaded**: its C++ runs, as before;
- **unloaded** (`module unload mod-zone-silithus` on a running server, or `mod-zone-silithus.Enable = 0` for the next
  start): the names find no script, and the core gives the creatures their `ai_name`.

Made by trt's `scripts/am1_modules.py`.
