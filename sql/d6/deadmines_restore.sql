-- Puts back what deadmines_as_rows.sql replaced, as t1_world had it when the migration was
-- written (scripts/d6_deadmines_rows.py). The rows the migration added are removed.
UPDATE `creature_template` SET `ai_name` = '', `script_name` = 'boss_mr_smite' WHERE `entry` = 646;
DELETE FROM `creature_ai_events` WHERE `creature_id` = 646;
INSERT INTO `creature_ai_events`
(`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`)
VALUES
(64601, 646, 0, 4, 0, 100, 0, 0, 0, 0, 0, 64601, 0, 0, 'Mr Smite - Yell on Aggro'),
(64602, 646, 0, 0, 0, 85, 13, 5000, 9000, 6000, 15500, 64602, 0, 0, 'Mr Smite - Cast Thrash'),
(64603, 646, 0, 0, 0, 85, 13, 9000, 9000, 11000, 11000, 64603, 0, 0, 'Mr Smite - Cast Smite Slam'),
(64604, 646, 0, 0, 0, 85, 13, 15500, 31600, 27300, 60100, 64604, 0, 0, 'Mr Smite - Cast Nimble Reflexes'),
(64605, 646, 0, 2, 0, 100, 0, 66, 34, 0, 0, 64605, 0, 0, 'Mr Smite - Cast Smite Stomp then Say then Cast Dual Wield at 66% HP'),
(64606, 646, 0, 2, 0, 100, 0, 33, 0, 0, 0, 64606, 0, 0, 'Mr Smite - Cast Smite Stomp and Say at 33% HP');

DELETE FROM `gameobject_requirement` WHERE `guid` IN (30533, 26182, 26185);
DELETE FROM `conditions` WHERE `condition_entry` IN (3600101, 3600102);
DELETE FROM `event_scripts` WHERE `id` IN (3600101, 619);
INSERT INTO `event_scripts`
(`id`, `delay`, `priority`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`)
VALUES
(619, 3, 0, 10, 634, 300000, 0, 0, 0, 0, 0, 0, 0, 0, -1, 1, -18.44, -617.46, 14.12, 0.08, 0, '');
DELETE FROM `generic_scripts` WHERE `id` = 3600101;
UPDATE `gameobject_template` SET `script_name` = 'go_defias_cannon', `data2` = 0 WHERE `entry` = 16398;
UPDATE `gameobject_template` SET `script_name` = 'go_defias_gunpowder', `data2` = 0 WHERE `entry` = 17155;
UPDATE `gameobject_template` SET `script_name` = 'go_door_lever_dm', `data2` = 196608 WHERE `entry` = 101833;
UPDATE `gameobject` SET `spawntimesecsmin` = 180, `spawntimesecsmax` = 180 WHERE `guid` = 26203;
UPDATE `gameobject_scripts` SET `condition_id` = 0 WHERE `id` = 26206 AND `command` = 11;
UPDATE `map_template` SET `script_name` = 'instance_deadmines' WHERE `entry` = 36;
