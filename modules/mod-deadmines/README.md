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

Built dynamic on Windows it needs mangosd to export what it uses (tortoise-wow#544 and the branch
`feature/windows-modules-core-data`); on Linux mangosd links with `-rdynamic`.
