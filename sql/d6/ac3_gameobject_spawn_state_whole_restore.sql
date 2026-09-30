-- Undoes ac3_gameobject_spawn_state_whole.sql's rows. The two columns stay: the core from a8067af0
-- reads them.
DELETE FROM `gameobject_spawn_state` WHERE `guid` = 26188;
UPDATE `gameobject_spawn_state` SET `script_id` = 0 WHERE `guid` = 30533;
DELETE FROM `generic_scripts` WHERE `id` = 3053301;
