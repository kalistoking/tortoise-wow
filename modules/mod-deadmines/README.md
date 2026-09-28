# mod-deadmines (local only, not for the core)

The Deadmines' boss, instance and object scripts -- Mr. Smite, `instance_deadmines`, the doors
and the cannon -- live here and nowhere else: `src/scripts/dungeons/deadmines` is gone from the
core, with its lines in `src/scripts/CMakeLists.txt` and `ScriptLoader.cpp`. The world database
names the scripts (`boss_mr_smite`, `instance_deadmines`, ...); the module registers them under
the same names, with the legacy `Script` + `RegisterSelf`.

Without the module the server still starts: it logs that it could not load the module, and the
database names scripts no one registered. The Deadmines then run without their C++ -- Mr. Smite
on the generic AI, no instance script (no Iron Clad Door event, no locked boss doors); the bosses'
EventAI still opens their doors when they die.

The constructor of `boss_mr_smiteAI` logs `[mod-deadmines] ...` to show the module's copy runs.

`instance_deadmines` makes the doors to the next boss not interactable (tortoise-wow#545 makes
the same change in the core's copy).

## Its settings

`conf/mod-deadmines.conf.dist` -- copied beside the server's, as `mod-deadmines.conf`:
`mod-deadmines.Enable = 0` registers nothing, as if the module were not there.

## Its database

`data/sql/world/2026_09_28_00_mod_deadmines_script_names.sql` sets the `script_name` of the rows
the module's scripts serve -- Mr. Smite (646), the map (36), the cannon (16398), the gunpowder
(17155) and the lever (101833) -- so the module carries the names it answers to. Applied by the
DB auto-updater when `Database.AutoUpdate.AllowedModules` lets the module in; idempotent. The
module owns no table; one it would own is named `mod_deadmines_...`, as `modules/README.md` says.

Built dynamic on Windows it needs mangosd to export what it uses (tortoise-wow#544 and the branch
`feature/windows-modules-core-data`); on Linux mangosd links with `-rdynamic`.
