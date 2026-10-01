-- Puts back what blackrock_spire_as_rows.sql replaced, as t1_world had it when the migration
-- was written (scripts/tier2/a18_blackrock_spire.py). The rows the migration added are removed.

UPDATE `creature_template` SET `ai_name` = '', `script_name` = 'boss_highlord_omokk', `flags_extra` = 2097152 WHERE `entry` = 9196;
UPDATE `creature_template` SET `ai_name` = '', `script_name` = 'boss_shadow_hunter_voshgajin', `flags_extra` = 32768 WHERE `entry` = 9236;
UPDATE `creature_template` SET `ai_name` = '', `script_name` = 'boss_warmaster_voone', `flags_extra` = 0 WHERE `entry` = 9237;
UPDATE `creature_template` SET `ai_name` = '', `script_name` = 'boss_overlord_wyrmthalak', `flags_extra` = 32768 WHERE `entry` = 9568;
UPDATE `creature_template` SET `ai_name` = '', `script_name` = 'quartermaster_zigris', `flags_extra` = 0 WHERE `entry` = 9736;
UPDATE `creature_template` SET `ai_name` = '', `script_name` = 'boss_pyroguard_emberseer', `flags_extra` = 32801 WHERE `entry` = 9816;
UPDATE `creature_template` SET `ai_name` = '', `script_name` = 'npc_blackhand_summoner', `flags_extra` = 0 WHERE `entry` = 9818;
UPDATE `creature_template` SET `ai_name` = '', `script_name` = 'npc_blackhand_veteran', `flags_extra` = 0 WHERE `entry` = 9819;
UPDATE `creature_template` SET `ai_name` = '', `script_name` = 'boss_halycon', `flags_extra` = 0 WHERE `entry` = 10220;
UPDATE `creature_template` SET `ai_name` = '', `script_name` = 'npc_geolier_main_noire', `flags_extra` = 0 WHERE `entry` = 10316;
UPDATE `creature_template` SET `ai_name` = '', `script_name` = 'boss_the_beast', `flags_extra` = 2129921 WHERE `entry` = 10430;
DELETE FROM `conditions` WHERE `condition_entry` IN (229000, 229010, 229100, 229101);
DELETE FROM `broadcast_text` WHERE `entry` IN (229101, 229102);
DELETE FROM `creature_ai_events` WHERE `id` IN (919601, 919602, 919603, 919604, 919605, 919606, 923601, 923602, 923603, 923701, 923702, 923703, 923704, 923705, 923711, 923712, 923713, 923714, 956801, 956802, 956803, 956804, 956811, 973601, 973602, 981601, 981602, 981603, 981604, 981611, 981612, 981613, 981801, 981802, 981803, 981811, 981911, 981921, 981922, 981923, 981924, 1022001, 1022002, 1022011, 1031601, 1031602, 1031603, 1031611, 1031612, 1031613, 1031614, 1043001, 1043002, 1043003, 1043004, 1043005, 1043011, 1043012, 1043021, 1043022, 1043023, 1043024);
DELETE FROM `creature_ai_scripts` WHERE `id` IN (919601, 919602, 919603, 919604, 919605, 919606, 923601, 923602, 923603, 923701, 923702, 923703, 923704, 923705, 923711, 923712, 923713, 923714, 956801, 956802, 956803, 956804, 956811, 973601, 973602, 981601, 981602, 981603, 981604, 981611, 981612, 981613, 981801, 981802, 981803, 981811, 981911, 981921, 981922, 981923, 981924, 1022001, 1022002, 1022011, 1031601, 1031602, 1031603, 1031611, 1031612, 1031613, 1031614, 1043001, 1043002, 1043003, 1043004, 1043005, 1043011, 1043012, 1043021, 1043022, 1043023, 1043024);
DELETE FROM `generic_scripts` WHERE `id` IN (2290001, 2290002, 2290003, 2290004, 2290005, 2290006, 2290007);
DELETE FROM `event_scripts` WHERE `id` IN (4884);
INSERT INTO `creature_ai_events`
(`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`)
VALUES
(981901, 9819, 0, 0, 0, 100, 0, 0, 3200, 0, 0, 981901, 0, 0, 'Blackhand Veteran -  Shield Charge on Aggro');

INSERT INTO `creature_ai_scripts`
(`id`, `delay`, `priority`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`)
VALUES
(981901, 0, 0, 15, 15749, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Blackhand Veteran - Cast Spell Shield Charge');

INSERT INTO `creature_ai_events`
(`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`)
VALUES
(981902, 9819, 0, 0, 0, 100, 13, 7800, 15800, 13800, 22900, 981902, 0, 0, 'Blackhand Veteran - Strike');

INSERT INTO `creature_ai_scripts`
(`id`, `delay`, `priority`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`)
VALUES
(981902, 0, 0, 15, 14516, 0, 0, 0, 0, 0, 1, 8, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Blackhand Veteran - Cast Spell Strike');

INSERT INTO `creature_ai_events`
(`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`)
VALUES
(981903, 9819, 0, 0, 0, 100, 13, 10000, 20000, 6000, 12000, 981903, 0, 0, 'Blackhand Veteran -  Shield Bash');

INSERT INTO `creature_ai_scripts`
(`id`, `delay`, `priority`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`)
VALUES
(981903, 0, 0, 15, 11972, 0, 0, 0, 0, 0, 5, 8, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Blackhand Veteran - Cast Spell Shield Bash');

INSERT INTO `creature_ai_events`
(`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`)
VALUES
(981904, 9819, 0, 2, 0, 100, 4, 15, 0, 0, 0, 981904, 0, 0, 'Blackhand Veteran - Flee at 15% HP');

INSERT INTO `creature_ai_scripts`
(`id`, `delay`, `priority`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`)
VALUES
(981904, 0, 0, 47, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Blackhand Veteran - Flee');

INSERT INTO `event_scripts`
(`id`, `delay`, `priority`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`)
VALUES
(4884, 0, 0, 10, 9816, 9000000, 0, 0, 0, 0, 0, 0, 0, 0, -1, 1, 144.32, -258.16, 96.32, 5.11, 0, '');

