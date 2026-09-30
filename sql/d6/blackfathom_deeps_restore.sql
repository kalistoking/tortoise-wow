-- Puts back what blackfathom_deeps_as_rows.sql replaced, as t1_world had it when the migration
-- was written (scripts/tier2/a09_blackfathom_deeps.py). The rows the migration added are removed.

UPDATE `creature_template` SET `ai_name` = '', `script_name` = '', `flags_extra` = 32 WHERE `entry` = 12876;
UPDATE `creature_template` SET `ai_name` = '', `script_name` = 'boss_velthelaxx_the_defiler', `flags_extra` = 0 WHERE `entry` = 62530;
DELETE FROM `conditions` WHERE `condition_entry` IN (48002, 48003, 48004, 48005, 48007, 48008, 48009);
DELETE FROM `creature_ai_events` WHERE `id` IN (483207, 483208, 483209, 483210, 1287601, 6253001, 6253002, 6253003, 6253004, 6253005, 6253006, 6253007);
DELETE FROM `creature_ai_scripts` WHERE `id` IN (483207, 1287601, 6253001, 6253002, 6253003, 6253004, 6253005, 6253006, 6253007);
DELETE FROM `generic_scripts` WHERE `id` IN (483210, 483211, 483212, 483213, 483220);
DELETE FROM `gameobject_scripts` WHERE `id` IN (32686, 32930, 32931, 32932, 32933);
DELETE FROM `gameobject_spawn_state` WHERE `guid` = 32682 AND `ord` = 0;
DELETE FROM `gameobject_spawn_state` WHERE `guid` = 32930 AND `ord` = 0;
DELETE FROM `gameobject_spawn_state` WHERE `guid` = 32932 AND `ord` = 0;
DELETE FROM `gameobject_spawn_state` WHERE `guid` = 32933 AND `ord` = 0;
DELETE FROM `gameobject_spawn_state` WHERE `guid` = 32931 AND `ord` = 0;
DELETE FROM `instance_data_slot` WHERE `map` = 48 AND `slot` = 10;
DELETE FROM `instance_data_slot` WHERE `map` = 48 AND `slot` = 11;
DELETE FROM `instance_data_slot` WHERE `map` = 48 AND `slot` = 12;
DELETE FROM `instance_data_slot` WHERE `map` = 48 AND `slot` = 13;
DELETE FROM `instance_data_slot` WHERE `map` = 48 AND `slot` = 14;
