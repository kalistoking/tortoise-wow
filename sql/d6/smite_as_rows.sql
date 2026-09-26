-- D6 prototype 2: Mr. Smite's fight (boss_mr_smite.cpp) as rows -- no C++, no restart.
-- For his copy 990646: a copy of creature_template 646 that runs EventAI, not boss_mr_smite.
-- Load: run this file, then in game, in this order -- the template before the rules that name it:
--   .reload creature_template 990646   (one entry: Commands.cpp:18132-18146 -- a new one too)
--   .reload generic_scripts             (refused while any DB script is running: try again)
--   .reload creature_ai_events          (the steps too: Commands.cpp:18150-18166)
-- and spawn the copy near the chest in the Deadmines (`.npc add 990646`). An edit later is the
-- same three reloads and a fresh spawn: a creature keeps the rules it was made with.
-- Written by the trt repo's scripts/d6_smite_rows.py from the same rows its engine test runs.
-- Relies on conditions 999 (IS_IN_COMBAT, flags 3: the source not in combat), already in tw_world.

DROP TEMPORARY TABLE IF EXISTS `d6_smite`;
CREATE TEMPORARY TABLE `d6_smite` SELECT * FROM `creature_template` WHERE `entry` = 646;
UPDATE `d6_smite` SET `entry` = 990646, `name` = 'Mr. Smite (D6 rows)', `ai_name` = 'EventAI', `script_name` = '';
DELETE FROM `creature_template` WHERE `entry` = 990646;
INSERT INTO `creature_template` SELECT * FROM `d6_smite`;
DROP TEMPORARY TABLE `d6_smite`;

DELETE FROM `creature_ai_events` WHERE `creature_id` = 990646;
DELETE FROM `creature_ai_scripts` WHERE `id` IN (16777201, 16777202, 16777203, 16777204, 16777205, 16777206);
DELETE FROM `generic_scripts` WHERE `id` IN (16777201, 16777202);

INSERT INTO `creature_ai_events`
(`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`)
VALUES
(99064601, 990646, 0, 4, 0, 100, 0, 0, 0, 0, 0, 16777201, 0, 0, 'Mr. Smite (D6 rows) - Yell on Aggro'),
(99064602, 990646, 0, 2, 14, 100, 0, 66, 34, 0, 0, 16777202, 0, 0, 'Mr. Smite (D6 rows) - Stomp, Say and go for the axes at 66% HP'),
(99064603, 990646, 0, 2, 10, 100, 0, 33, 0, 0, 0, 16777203, 0, 0, 'Mr. Smite (D6 rows) - Stomp, Say and go for the hammer at 33% HP'),
(99064604, 990646, 0, 0, 11, 100, 1, 1500, 4000, 1500, 4000, 16777204, 0, 0, 'Mr. Smite (D6 rows) - Thrash with the axes'),
(99064605, 990646, 0, 0, 7, 100, 1, 9000, 9000, 11000, 11000, 16777205, 0, 0, 'Mr. Smite (D6 rows) - Smite Slam with the hammer'),
(99064606, 990646, 0, 7, 0, 100, 0, 0, 0, 0, 0, 16777206, 0, 0, 'Mr. Smite (D6 rows) - Evade: his sword back, phase 0');

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
