-- The Deadmines' C++ (mod-deadmines: boss_mr_smite, instance_deadmines, the three object
-- scripts) as rows -- handoff/manager-057 item 2, ARCHITECTURE.md §20.11.
-- Written by the trt repo's scripts/d6_deadmines_rows.py; deadmines_restore.sql puts back what
-- this replaces. For the testlab (d6_world) -- R8: a person applies it.
--
-- Load, the server stopped or running:
--   run this file into the world database, then (running) .reload creature_template 646,
--   .reload creature_ai_events, .reload generic_scripts, .reload event_scripts,
--   .reload gameobject_scripts, .reload gameobject_requirement, .reload conditions --
--   the object templates' event and script names, and the map's script, take a restart.
-- mod-deadmines may stay loaded: nothing names its scripts any more.
--
-- Not rows, and so not here: the Darkmoon chest (180024) seen only by a player whose
-- "Your Fortune Awaits You..." (7938) is complete -- a spawn's visibility per player is not a
-- thing a row says. With the map's script gone the chest is seen by all; its loot is its own.

-- Mr. Smite: prototype 2's rules (his copy 990646) onto 646 itself.
UPDATE `creature_template` SET `ai_name` = 'EventAI', `script_name` = '' WHERE `entry` = 646;
DELETE FROM `creature_ai_events` WHERE `creature_id` = 646;
DELETE FROM `creature_ai_scripts` WHERE `id` IN (16777201, 16777202, 16777203, 16777204, 16777205, 16777206);
DELETE FROM `generic_scripts` WHERE `id` IN (16777201, 16777202);
INSERT INTO `creature_ai_events`
(`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`)
VALUES
(64601, 646, 0, 4, 0, 100, 0, 0, 0, 0, 0, 16777201, 0, 0, 'Mr. Smite - Yell on Aggro'),
(64602, 646, 0, 2, 14, 100, 0, 66, 34, 0, 0, 16777202, 0, 0, 'Mr. Smite - Stomp, Say and go for the axes at 66% HP'),
(64603, 646, 0, 2, 10, 100, 0, 33, 0, 0, 0, 16777203, 0, 0, 'Mr. Smite - Stomp, Say and go for the hammer at 33% HP'),
(64604, 646, 0, 0, 11, 100, 1, 1500, 4000, 1500, 4000, 16777204, 0, 0, 'Mr. Smite - Thrash with the axes'),
(64605, 646, 0, 0, 7, 100, 1, 9000, 9000, 11000, 11000, 16777205, 0, 0, 'Mr. Smite - Smite Slam with the hammer'),
(64606, 646, 0, 7, 0, 100, 0, 0, 0, 0, 0, 16777206, 0, 0, 'Mr. Smite - Evade: his sword back, phase 0');

INSERT INTO `creature_ai_scripts`
(`id`, `delay`, `priority`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`)
VALUES
(16777201, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1149, 0, 0, 0, 0, 0, 0, 0, 0, 'Mr. Smite (D6 rows) - Say'),
(16777202, 0, 0, 15, 6432, 0, 0, 0, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Mr. Smite (D6 rows) - Cast Smite Stomp'),
(16777202, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1344, 0, 0, 0, 0, 0, 0, 0, 0, 'Mr. Smite (D6 rows) - Say'),
(16777202, 0, 2, 14, 6433, 0, 0, 0, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Mr. Smite (D6 rows) - Remove Nimble Reflexes'),
(16777202, 0, 3, 44, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Mr. Smite (D6 rows) - Phase 1: changing weapons'),
(16777202, 0, 4, 39, 16777201, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0, 0, 0, 0, 0, 0, 0, 'Mr. Smite (D6 rows) - Start the weapon change'),
(16777203, 0, 0, 15, 6432, 0, 0, 0, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Mr. Smite (D6 rows) - Cast Smite Stomp'),
(16777203, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1345, 0, 0, 0, 0, 0, 0, 0, 0, 'Mr. Smite (D6 rows) - Say'),
(16777203, 0, 2, 14, 6433, 0, 0, 0, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Mr. Smite (D6 rows) - Remove Nimble Reflexes'),
(16777203, 0, 3, 44, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Mr. Smite (D6 rows) - Phase 1: changing weapons'),
(16777203, 0, 4, 39, 16777202, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0, 0, 0, 0, 0, 0, 0, 'Mr. Smite (D6 rows) - Start the weapon change'),
(16777204, 0, 0, 15, 3391, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Mr. Smite (D6 rows) - Cast Thrash'),
(16777205, 0, 0, 15, 6435, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Mr. Smite (D6 rows) - Cast Smite Slam'),
(16777206, 0, 0, 19, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Mr. Smite (D6 rows) - His own equipment again'),
(16777206, 0, 1, 44, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Mr. Smite (D6 rows) - Phase 0'),
(16777206, 0, 2, 28, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Mr. Smite (D6 rows) - Stand'),
(16777206, 0, 3, 42, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Mr. Smite (D6 rows) - Melee on'),
(16777206, 0, 4, 43, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Mr. Smite (D6 rows) - Combat movement on');

INSERT INTO `generic_scripts`
(`id`, `delay`, `priority`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`)
VALUES
(16777201, 0, 0, 42, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Mr. Smite (D6 rows) - Melee off'),
(16777201, 0, 1, 43, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Mr. Smite (D6 rows) - Combat movement off'),
(16777201, 2, 0, 32, 999, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Mr. Smite (D6 rows) - Out of combat: the rest goes'),
(16777201, 2, 1, 3, 2, 3000, 1, 2, 144111, 150, 11, 16, 0, 0, 0, 0, 2, 0, 0, -1, 0, 'Mr. Smite (D6 rows) - Walk to the chest'),
(16777201, 5, 0, 32, 999, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Mr. Smite (D6 rows) - Out of combat: the rest goes'),
(16777201, 5, 1, 19, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Mr. Smite (D6 rows) - Unarmed'),
(16777201, 5, 2, 51, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Mr. Smite (D6 rows) - Sheath: unarmed'),
(16777201, 5, 3, 28, 8, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Mr. Smite (D6 rows) - Kneel'),
(16777201, 8, 0, 32, 999, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Mr. Smite (D6 rows) - Out of combat: the rest goes'),
(16777201, 8, 1, 19, 0, 0, 0, 0, 0, 0, 0, 0, 2183, 2183, 0, 0, 0, 0, 0, 0, 0, 'Mr. Smite (D6 rows) - Armed'),
(16777201, 8, 2, 28, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Mr. Smite (D6 rows) - Stand'),
(16777201, 9, 0, 32, 999, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Mr. Smite (D6 rows) - Out of combat: the rest goes'),
(16777201, 9, 1, 51, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Mr. Smite (D6 rows) - Sheath: melee'),
(16777201, 9, 2, 42, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Mr. Smite (D6 rows) - Melee on'),
(16777201, 9, 3, 43, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Mr. Smite (D6 rows) - Combat movement on'),
(16777201, 9, 4, 44, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Mr. Smite (D6 rows) - Phase 2'),
(16777202, 0, 0, 42, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Mr. Smite (D6 rows) - Melee off'),
(16777202, 0, 1, 43, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Mr. Smite (D6 rows) - Combat movement off'),
(16777202, 2, 0, 32, 999, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Mr. Smite (D6 rows) - Out of combat: the rest goes'),
(16777202, 2, 1, 3, 2, 3000, 1, 2, 144111, 150, 11, 16, 0, 0, 0, 0, 2, 0, 0, -1, 0, 'Mr. Smite (D6 rows) - Walk to the chest'),
(16777202, 5, 0, 32, 999, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Mr. Smite (D6 rows) - Out of combat: the rest goes'),
(16777202, 5, 1, 19, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Mr. Smite (D6 rows) - Unarmed'),
(16777202, 5, 2, 51, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Mr. Smite (D6 rows) - Sheath: unarmed'),
(16777202, 5, 3, 28, 8, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Mr. Smite (D6 rows) - Kneel'),
(16777202, 8, 0, 32, 999, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Mr. Smite (D6 rows) - Out of combat: the rest goes'),
(16777202, 8, 1, 19, 0, 0, 0, 0, 0, 0, 0, 0, 10756, 0, 0, 0, 0, 0, 0, 0, 0, 'Mr. Smite (D6 rows) - Armed'),
(16777202, 8, 2, 28, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Mr. Smite (D6 rows) - Stand'),
(16777202, 8, 3, 15, 6436, 0, 0, 0, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Mr. Smite (D6 rows) - Cast Smite Hammer'),
(16777202, 9, 0, 32, 999, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Mr. Smite (D6 rows) - Out of combat: the rest goes'),
(16777202, 9, 1, 51, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Mr. Smite (D6 rows) - Sheath: melee'),
(16777202, 9, 2, 42, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Mr. Smite (D6 rows) - Melee on'),
(16777202, 9, 3, 43, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Mr. Smite (D6 rows) - Combat movement on'),
(16777202, 9, 4, 44, 3, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Mr. Smite (D6 rows) - Phase 3');

-- The boss doors: opened by rows already (the death rules 64402, 64301, 176302); what the C++
-- added is that nobody opens them by hand first.
DELETE FROM `gameobject_requirement` WHERE `guid` IN (30533, 26182, 26185);
INSERT INTO `gameobject_requirement`
(`guid`, `reqType`, `reqGuid`)
VALUES
(30533, 0, 79168),
(26182, 0, 79206),
(26185, 0, 79223);

-- The Iron Clad Door: the cannon's own event blows it open; Mr. Smite raises the alarm.
DELETE FROM `conditions` WHERE `condition_entry` IN (3600101, 3600102);
INSERT INTO `conditions`
(`condition_entry`, `type`, `value1`, `value2`, `value3`, `value4`, `flags`)
VALUES
(3600101, 55, 1, 0, 0, 0, 0),
(3600102, 50, 30534, 3600101, 0, 0, 0);
DELETE FROM `event_scripts` WHERE `id` = 3600101;
INSERT INTO `event_scripts`
(`id`, `delay`, `priority`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`)
VALUES
(3600101, 0, 0, 32, 3600102, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Deadmines cannon - only on the Iron Clad Door closed'),
(3600101, 0, 1, 80, 2, 0, 0, 0, 30534, 0, 12, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Deadmines cannon - the Iron Clad Door blown open'),
(3600101, 3, 0, 0, 6, 0, 0, 0, 646, 400, 8, 18, 1148, 0, 0, 0, 0, 0, 0, 0, 0, 'Deadmines cannon - Mr. Smite: You there! Check out that noise.'),
(3600101, 18, 0, 0, 6, 0, 0, 0, 646, 400, 8, 18, 1149, 0, 0, 0, 0, 0, 0, 0, 0, 'Deadmines cannon - Mr. Smite: We''re under attack! ...');
UPDATE `gameobject_template` SET `data2` = 3600101, `script_name` = '' WHERE `entry` = 16398;

-- The gunpowder: its event (the chest's own, 619) summons and walks the Overseer as the C++
-- did. Once an instance, as the C++'s instance data had it: the chest back in 12 hours, not 3 minutes.
DELETE FROM `event_scripts` WHERE `id` = 619;
INSERT INTO `event_scripts`
(`id`, `delay`, `priority`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`)
VALUES
(619, 0, 0, 10, 634, 310000, 1, 100, 0, 0, 0, 0, 4, 3600101, 0, 4, -131.290833, -591.243103, 18.07719, 4.792192, 0, 'Defias Gunpowder - summon the Defias Overseer');
DELETE FROM `generic_scripts` WHERE `id` = 3600101;
INSERT INTO `generic_scripts`
(`id`, `delay`, `priority`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`)
VALUES
(3600101, 0, 0, 3, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, -128.92598, -616.494629, 13.53234, 6.269623, 0, 'Defias Overseer (gunpowder) - down the ramp'),
(3600101, 11, 0, 3, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, -115.263672, -617.396118, 13.579387, 6.182347, 0, 'Defias Overseer (gunpowder) - to the powder'),
(3600101, 17, 0, 34, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, -115.263672, -617.396118, 13.579387, 6.182347, 0, 'Defias Overseer (gunpowder) - stays there');
UPDATE `gameobject_template` SET `script_name` = '' WHERE `entry` = 17155;
UPDATE `gameobject` SET `spawntimesecsmin` = 43200, `spawntimesecsmax` = 43200 WHERE `guid` = 26203;

-- The Iron Clad Door's lever: its step opens the door only while the door is closed, as the C++'s
-- check let the lever work only then.
UPDATE `gameobject_scripts` SET `condition_id` = 3600102 WHERE `id` = 26206 AND `command` = 11;
UPDATE `gameobject_template` SET `script_name` = '' WHERE `entry` = 101833;

-- The instance's script: everything it did is above, or is the chest.
UPDATE `map_template` SET `script_name` = '' WHERE `entry` = 36;
