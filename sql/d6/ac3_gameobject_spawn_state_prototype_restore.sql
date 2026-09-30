-- Undoes ac3_gameobject_spawn_state_prototype.sql. The table stays, empty: the prototype's core
-- reads it at start and would log a missing one as an error.
DELETE FROM `gameobject_spawn_state` WHERE `guid` = 30533;
DELETE FROM `conditions` WHERE `condition_entry` = 3600103;
DELETE FROM `creature_ai_scripts` WHERE `id` = 64402 AND `command` = 37;
