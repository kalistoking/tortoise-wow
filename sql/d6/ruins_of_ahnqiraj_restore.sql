-- Puts back what ruins_of_ahnqiraj_as_rows.sql replaced, as t1_world had it when the migration
-- was written (scripts/tier2/a24_ruins_of_ahnqiraj.py). The rows the migration added are removed.

UPDATE `creature_template` SET `ai_name` = '', `script_name` = 'mob_hive_zara_soldier', `flags_extra` = 2097152 WHERE `entry` = 15320;
UPDATE `creature_template` SET `ai_name` = '', `script_name` = 'mob_qiraji_gladiator', `flags_extra` = 2097152 WHERE `entry` = 15324;
UPDATE `creature_template` SET `ai_name` = '', `script_name` = 'mob_hive_zara_stinger', `flags_extra` = 2097152 WHERE `entry` = 15327;
UPDATE `creature_template` SET `ai_name` = '', `script_name` = 'mob_silicate_feeder', `flags_extra` = 2097152 WHERE `entry` = 15333;
UPDATE `creature_template` SET `ai_name` = '', `script_name` = 'boss_moam', `flags_extra` = 2129921 WHERE `entry` = 15340;
UPDATE `creature_template` SET `ai_name` = '', `script_name` = 'mob_qiraji_swarmguard', `flags_extra` = 2097152 WHERE `entry` = 15343;
UPDATE `creature_template` SET `ai_name` = '', `script_name` = 'mob_swarmguard_needler', `flags_extra` = 2162688 WHERE `entry` = 15344;
UPDATE `creature_template` SET `ai_name` = '', `script_name` = 'boss_kurinnaxx', `flags_extra` = 2129921 WHERE `entry` = 15348;
UPDATE `creature_template` SET `ai_name` = '', `script_name` = 'mob_anubisath_guardian', `flags_extra` = 2097152 WHERE `entry` = 15355;
UPDATE `creature_template` SET `ai_name` = '', `script_name` = 'boss_tuubid', `flags_extra` = 2162688 WHERE `entry` = 15392;
UPDATE `creature_template` SET `ai_name` = '', `script_name` = 'mob_tornado_ossirian', `flags_extra` = 2097154 WHERE `entry` = 15428;
DELETE FROM `conditions` WHERE `condition_entry` IN (509000);
DELETE FROM `broadcast_text` WHERE `entry` IN (509101, 509102, 509103);
DELETE FROM `creature_ai_events` WHERE `id` IN (1532001, 1532002, 1532003, 1532411, 1532412, 1532413, 1532414, 1532415, 1532416, 1532417, 1532711, 1533311, 1533312, 1533313, 1533811, 1533812, 1533813, 1533814, 1534001, 1534002, 1534003, 1534004, 1534005, 1534006, 1534011, 1534012, 1534301, 1534302, 1534303, 1534411, 1534801, 1534802, 1534803, 1534804, 1534811, 1534812, 1534813, 1534814, 1535501, 1535502, 1535503, 1535504, 1535505, 1535511, 1535512, 1535513, 1535514, 1535515, 1535516, 1535517, 1538711, 1538712, 1538713, 1538714, 1539201, 1539202, 1539203, 1542801, 1542802, 1542803);
DELETE FROM `creature_ai_scripts` WHERE `id` IN (1532001, 1532002, 1532003, 1532411, 1532412, 1532413, 1532414, 1532415, 1532416, 1532417, 1532711, 1533311, 1533312, 1533313, 1533811, 1533812, 1533813, 1533814, 1534001, 1534002, 1534003, 1534004, 1534005, 1534006, 1534011, 1534012, 1534301, 1534302, 1534303, 1534411, 1534801, 1534802, 1534803, 1534804, 1534811, 1534812, 1534813, 1534814, 1535501, 1535502, 1535503, 1535504, 1535505, 1535511, 1535512, 1535513, 1535514, 1535515, 1535516, 1535517, 1538711, 1538712, 1538713, 1538714, 1539201, 1539202, 1539203, 1542801, 1542802, 1542803);
DELETE FROM `generic_scripts` WHERE `id` IN (5090001, 5090002, 5090003, 5090004, 5090005, 5090006, 5090007, 5090008, 5090009, 5090010);
INSERT INTO `creature_ai_events`
(`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`)
VALUES
(1533802, 15338, 0, 3, 0, 100, 1, 100, 99, 1000, 3000, 1533802, 0, 0, 'Obsidian Destroyer - cast Shockblast at 100% mana (Ustaag)');

INSERT INTO `creature_ai_scripts`
(`id`, `delay`, `priority`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`)
VALUES
(1533802, 0, 0, 15, 25756, 0, 0, 0, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Obsidian Destroyer - Cast Spell Purge');

INSERT INTO `creature_ai_events`
(`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`)
VALUES
(1532401, 15324, 0, 6, 0, 100, 0, 0, 0, 0, 0, 1532401, 0, 0, 'Qiraji Gladiator - Cast Vengeance on Death');

INSERT INTO `creature_ai_scripts`
(`id`, `delay`, `priority`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`)
VALUES
(1532401, 0, 0, 15, 25164, 6, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Qiraji Gladiator - Cast Spell Vengeance'),
(1532401, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1191, 0, 0, 0, 0, 0, 0, 0, 0, 'Qiraji Gladiator - Say Text');

INSERT INTO `creature_ai_events`
(`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`)
VALUES
(1532402, 15324, 0, 0, 0, 100, 13, 4000, 12000, 8000, 24000, 1532402, 0, 0, 'Qiraji Gladiator: Uppercut');

INSERT INTO `creature_ai_scripts`
(`id`, `delay`, `priority`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`)
VALUES
(1532402, 0, 0, 15, 10966, 0, 0, 0, 0, 0, 1, 8, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Qiraji Gladiator - Cast Spell Uppercut');

INSERT INTO `creature_ai_events`
(`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`)
VALUES
(1532403, 15324, 0, 0, 0, 100, 13, 3000, 6000, 4000, 8000, 1532403, 0, 0, 'Qiraji Gladiator: Trample');

INSERT INTO `creature_ai_scripts`
(`id`, `delay`, `priority`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`)
VALUES
(1532403, 0, 0, 15, 5568, 0, 0, 0, 0, 0, 0, 12, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Qiraji Gladiator - Cast Spell Trample');

INSERT INTO `creature_ai_events`
(`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`)
VALUES
(1532701, 15327, 0, 24, 0, 100, 1, 25187, 1, 100, 100, 1532701, 0, 0, 'HiveZara Stinger - Target with Catalyst debuff Set phase 1 (Ustaag)');

INSERT INTO `creature_ai_scripts`
(`id`, `delay`, `priority`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`)
VALUES
(1532701, 0, 0, 44, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Hive Zara Stinger - Set Phase to 1');

INSERT INTO `creature_ai_events`
(`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`)
VALUES
(1532702, 15327, 0, 28, 0, 100, 1, 25187, 1, 100, 100, 1532702, 0, 0, 'HiveZara Stinger - Target without Catalyst Set phase 2 (Ustaag)');

INSERT INTO `creature_ai_scripts`
(`id`, `delay`, `priority`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`)
VALUES
(1532702, 0, 0, 44, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Hive Zara Stinger - Set Phase to 2');

INSERT INTO `creature_ai_events`
(`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`)
VALUES
(1532703, 15327, 0, 0, 11, 100, 13, 5000, 10000, 5000, 10000, 1532703, 0, 0, 'HiveZara Stinger - Cast Stinger Charge - phase 2 (Ustaag)');

INSERT INTO `creature_ai_scripts`
(`id`, `delay`, `priority`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`)
VALUES
(1532703, 0, 0, 15, 25190, 0, 0, 0, 0, 0, 4, 8, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Hive Zara Stinger - Cast Spell Stinger Charge');

INSERT INTO `creature_ai_events`
(`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`)
VALUES
(1532704, 15327, 0, 0, 13, 100, 13, 5000, 10000, 5000, 10000, 1532704, 0, 0, 'HiveZara Stinger - Cast stinger charge - phase 1 (Ustaag)');

INSERT INTO `creature_ai_scripts`
(`id`, `delay`, `priority`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`)
VALUES
(1532704, 0, 0, 15, 25191, 0, 0, 0, 0, 0, 4, 8, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Hive Zara Stinger - Cast Spell Stinger Charge');

INSERT INTO `creature_ai_events`
(`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`)
VALUES
(1538701, 15387, 0, 9, 0, 100, 13, 0, 10, 7000, 11000, 1538701, 0, 0, 'Qiraji Warrior - Cast Uppercut');

INSERT INTO `creature_ai_scripts`
(`id`, `delay`, `priority`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`)
VALUES
(1538701, 0, 0, 15, 10966, 0, 0, 0, 0, 0, 1, 8, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Qiraji Warrior - Cast Spell Uppercut');

INSERT INTO `creature_ai_events`
(`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`)
VALUES
(1538703, 15387, 0, 2, 0, 100, 4, 30, 0, 0, 0, 1538703, 0, 0, 'Qiraji Warrior - Cast Enrage and Emote at 30% HP');

INSERT INTO `creature_ai_scripts`
(`id`, `delay`, `priority`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`)
VALUES
(1538703, 0, 0, 15, 8599, 1, 0, 0, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Qiraji Warrior - Cast Spell Enrage'),
(1538703, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1191, 0, 0, 0, 0, 0, 0, 0, 0, 'Qiraji Warrior - Say Text');

