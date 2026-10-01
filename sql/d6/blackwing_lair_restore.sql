-- Puts back what blackwing_lair_as_rows.sql replaced, as t1_world had it when the migration
-- was written (scripts/tier2/a28_blackwing_lair.py). The rows the migration added are removed.

UPDATE `creature_template` SET `ai_name` = '', `script_name` = 'boss_flamegor', `flags_extra` = 2129921 WHERE `entry` = 11981;
UPDATE `creature_template` SET `ai_name` = '', `script_name` = 'boss_firemaw', `flags_extra` = 2129921 WHERE `entry` = 11983;
UPDATE `creature_template` SET `ai_name` = '', `script_name` = 'boss_broodlord', `flags_extra` = 2129921 WHERE `entry` = 12017;
UPDATE `creature_template` SET `ai_name` = '', `script_name` = 'npc_death_talon', `flags_extra` = 2097152 WHERE `entry` = 12460;
UPDATE `creature_template` SET `ai_name` = '', `script_name` = 'npc_death_talon', `flags_extra` = 2097152 WHERE `entry` = 12461;
UPDATE `creature_template` SET `ai_name` = '', `script_name` = 'npc_death_talon_Seether', `flags_extra` = 2097152 WHERE `entry` = 12464;
UPDATE `creature_template` SET `ai_name` = '', `script_name` = 'npc_death_talon_Captain', `flags_extra` = 2101248 WHERE `entry` = 12467;
UPDATE `creature_template` SET `ai_name` = '', `script_name` = 'npc_corrupted_whelp', `flags_extra` = 0 WHERE `entry` = 14022;
UPDATE `creature_template` SET `ai_name` = '', `script_name` = 'npc_corrupted_whelp', `flags_extra` = 0 WHERE `entry` = 14023;
UPDATE `creature_template` SET `ai_name` = '', `script_name` = 'npc_corrupted_whelp', `flags_extra` = 0 WHERE `entry` = 14024;
UPDATE `creature_template` SET `ai_name` = '', `script_name` = 'npc_corrupted_whelp', `flags_extra` = 0 WHERE `entry` = 14025;
UPDATE `creature_template` SET `ai_name` = '', `script_name` = 'boss_ebonroc', `flags_extra` = 2129921 WHERE `entry` = 14601;
DELETE FROM `conditions` WHERE `condition_entry` IN (469000, 469101, 469103, 469104, 469105, 10469100);
DELETE FROM `broadcast_text` WHERE `entry` IN (469101);
DELETE FROM `creature_ai_events` WHERE `id` IN (1198101, 1198102, 1198103, 1198106, 1198107, 1198191, 1198192, 1198193, 1198301, 1198302, 1198303, 1198304, 1198391, 1198392, 1198393, 1201701, 1201702, 1201703, 1201704, 1201705, 1201791, 1201792, 1201793, 1201794, 1201795, 1246051, 1246052, 1246053, 1246054, 1246055, 1246151, 1246152, 1246153, 1246154, 1246411, 1246412, 1246711, 1246712, 1246713, 1246714, 1246715, 1246716, 1246721, 1246722, 1246723, 1246724, 1460101, 1460102, 1460103, 1460104, 1460106, 1460191, 1460192, 1460193);
DELETE FROM `creature_ai_scripts` WHERE `id` IN (1198101, 1198102, 1198103, 1198106, 1198107, 1198191, 1198192, 1198193, 1198301, 1198302, 1198303, 1198304, 1198391, 1198392, 1198393, 1201701, 1201702, 1201703, 1201704, 1201705, 1201791, 1201792, 1201793, 1201794, 1201795, 1246051, 1246052, 1246053, 1246054, 1246055, 1246151, 1246152, 1246153, 1246154, 1246411, 1246412, 1246711, 1246712, 1246713, 1246714, 1246715, 1246716, 1246721, 1246722, 1246723, 1246724, 1460101, 1460102, 1460103, 1460104, 1460106, 1460191, 1460192, 1460193);
DELETE FROM `generic_scripts` WHERE `id` IN (4690001, 4690002, 4690003, 4690004, 4690005, 4690006, 4690007, 4690008, 4690009, 4690010, 4690011, 4690012, 4690013, 4690014, 4690015, 4690016, 4690017, 4690018, 4690019, 4690020, 4690021, 4690022, 4690023, 4690024, 4690025, 4690026);
DELETE FROM `areatrigger_generic_script` WHERE `trigger_id` = 3626 AND `script_id` = 4690024;
INSERT INTO `creature_ai_scripts`
(`id`, `delay`, `priority`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`)
VALUES
(1246001, 0, 0, 15, 24375, 0, 0, 0, 0, 0, 0, 12, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Death Talon Wyrmguard - Cast Spell War Stomp');

INSERT INTO `creature_ai_scripts`
(`id`, `delay`, `priority`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`)
VALUES
(1246002, 0, 0, 15, 15284, 0, 0, 0, 0, 0, 1, 8, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Death Talon Wyrmguard - Cast Spell Cleave');

INSERT INTO `creature_ai_scripts`
(`id`, `delay`, `priority`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`)
VALUES
(1246003, 0, 0, 15, 33001, 0, 0, 0, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Death Talon Wyrmguard - Cast Spell CustomSpell'),
(1246003, 0, 0, 44, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Death Talon Wyrmguard - Set Phase to 1'),
(1246003, 0, 0, 2, 157, 0, 0, 0, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Death Talon Wyrmguard - Set Field');

INSERT INTO `creature_ai_scripts`
(`id`, `delay`, `priority`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`)
VALUES
(1246004, 0, 0, 15, 33002, 0, 0, 0, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Death Talon Wyrmguard - Cast Spell CustomSpell'),
(1246004, 0, 0, 44, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Death Talon Wyrmguard - Set Phase to 1'),
(1246004, 0, 0, 2, 158, 0, 0, 0, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Death Talon Wyrmguard - Set Field');

INSERT INTO `creature_ai_scripts`
(`id`, `delay`, `priority`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`)
VALUES
(1246005, 0, 0, 15, 33004, 0, 0, 0, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Death Talon Wyrmguard - Cast Spell CustomSpell'),
(1246005, 0, 0, 44, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Death Talon Wyrmguard - Set Phase to 1'),
(1246005, 0, 0, 2, 159, 0, 0, 0, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Death Talon Wyrmguard - Set Field');

INSERT INTO `creature_ai_scripts`
(`id`, `delay`, `priority`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`)
VALUES
(1246006, 0, 0, 15, 33003, 0, 0, 0, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Death Talon Wyrmguard - Cast Spell CustomSpell'),
(1246006, 0, 0, 44, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Death Talon Wyrmguard - Set Phase to 1'),
(1246006, 0, 0, 2, 160, 0, 0, 0, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Death Talon Wyrmguard - Set Field');

INSERT INTO `creature_ai_scripts`
(`id`, `delay`, `priority`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`)
VALUES
(1246007, 0, 0, 15, 33005, 0, 0, 0, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Death Talon Wyrmguard - Cast Spell CustomSpell'),
(1246007, 0, 0, 44, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Death Talon Wyrmguard - Set Phase to 1'),
(1246007, 0, 0, 2, 161, 0, 0, 0, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Death Talon Wyrmguard - Set Field');

INSERT INTO `creature_ai_scripts`
(`id`, `delay`, `priority`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`)
VALUES
(1246008, 0, 0, 2, 157, 302, 0, 0, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Death Talon Wyrmguard - Set Field');

INSERT INTO `creature_ai_scripts`
(`id`, `delay`, `priority`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`)
VALUES
(1246009, 0, 0, 2, 158, 303, 0, 0, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Death Talon Wyrmguard - Set Field');

INSERT INTO `creature_ai_scripts`
(`id`, `delay`, `priority`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`)
VALUES
(1246010, 0, 0, 2, 159, 304, 0, 0, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Death Talon Wyrmguard - Set Field');

INSERT INTO `creature_ai_scripts`
(`id`, `delay`, `priority`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`)
VALUES
(1246011, 0, 0, 2, 160, 305, 0, 0, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Death Talon Wyrmguard - Set Field');

INSERT INTO `creature_ai_scripts`
(`id`, `delay`, `priority`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`)
VALUES
(1246012, 0, 0, 2, 161, 306, 0, 0, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Death Talon Wyrmguard - Set Field');

INSERT INTO `creature_ai_scripts`
(`id`, `delay`, `priority`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`)
VALUES
(1246013, 0, 0, 44, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Death Talon Wyrmguard - Set Phase to 0');

INSERT INTO `creature_ai_scripts`
(`id`, `delay`, `priority`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`)
VALUES
(1246014, 0, 0, 44, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Death Talon Wyrmguard - Set Phase to 2'),
(1246014, 0, 0, 15, 22288, 0, 0, 0, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Death Talon Wyrmguard - Cast Spell Brood Power: Green');

INSERT INTO `creature_ai_scripts`
(`id`, `delay`, `priority`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`)
VALUES
(1246015, 0, 0, 44, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Death Talon Wyrmguard - Set Phase to 2'),
(1246015, 0, 0, 15, 22283, 0, 0, 0, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Death Talon Wyrmguard - Cast Spell Brood Power: Red');

INSERT INTO `creature_ai_scripts`
(`id`, `delay`, `priority`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`)
VALUES
(1246016, 0, 0, 44, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Death Talon Wyrmguard - Set Phase to 2'),
(1246016, 0, 0, 15, 22286, 0, 0, 0, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Death Talon Wyrmguard - Cast Spell Brood Power: Bronze');

INSERT INTO `creature_ai_scripts`
(`id`, `delay`, `priority`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`)
VALUES
(1246017, 0, 0, 44, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Death Talon Wyrmguard - Set Phase to 2'),
(1246017, 0, 0, 15, 22287, 0, 0, 0, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Death Talon Wyrmguard - Cast Spell Brood Power: Black');

INSERT INTO `creature_ai_scripts`
(`id`, `delay`, `priority`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`)
VALUES
(1246018, 0, 0, 44, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Death Talon Wyrmguard - Set Phase to 2'),
(1246018, 0, 0, 15, 22285, 0, 0, 0, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Death Talon Wyrmguard - Cast Spell Brood Power: Blue');

INSERT INTO `creature_ai_scripts`
(`id`, `delay`, `priority`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`)
VALUES
(1246101, 0, 0, 15, 15284, 0, 0, 0, 0, 0, 1, 8, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Death Talon Overseer - Cast Spell Cleave');

INSERT INTO `creature_ai_scripts`
(`id`, `delay`, `priority`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`)
VALUES
(1246102, 0, 0, 15, 20623, 0, 0, 0, 0, 0, 4, 8, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Death Talon Overseer - Cast Spell Fire Blast');

INSERT INTO `creature_ai_scripts`
(`id`, `delay`, `priority`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`)
VALUES
(1246103, 0, 0, 15, 33001, 0, 0, 0, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Death Talon Overseer - Cast Spell CustomSpell'),
(1246103, 0, 0, 44, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Death Talon Overseer - Set Phase to 1'),
(1246103, 0, 0, 2, 157, 0, 0, 0, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Death Talon Overseer - Set Field');

INSERT INTO `creature_ai_scripts`
(`id`, `delay`, `priority`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`)
VALUES
(1246104, 0, 0, 15, 33002, 0, 0, 0, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Death Talon Overseer - Cast Spell CustomSpell'),
(1246104, 0, 0, 44, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Death Talon Overseer - Set Phase to 1'),
(1246104, 0, 0, 2, 158, 0, 0, 0, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Death Talon Overseer - Set Field');

INSERT INTO `creature_ai_scripts`
(`id`, `delay`, `priority`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`)
VALUES
(1246105, 0, 0, 15, 33004, 0, 0, 0, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Death Talon Overseer - Cast Spell CustomSpell'),
(1246105, 0, 0, 44, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Death Talon Overseer - Set Phase to 1'),
(1246105, 0, 0, 2, 159, 0, 0, 0, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Death Talon Overseer - Set Field');

INSERT INTO `creature_ai_scripts`
(`id`, `delay`, `priority`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`)
VALUES
(1246106, 0, 0, 44, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Death Talon Overseer - Set Phase to 1'),
(1246106, 0, 0, 15, 33003, 0, 0, 0, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Death Talon Overseer - Cast Spell CustomSpell'),
(1246106, 0, 0, 2, 160, 0, 0, 0, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Death Talon Overseer - Set Field');

INSERT INTO `creature_ai_scripts`
(`id`, `delay`, `priority`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`)
VALUES
(1246107, 0, 0, 15, 33005, 0, 0, 0, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Death Talon Overseer - Cast Spell CustomSpell'),
(1246107, 0, 0, 44, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Death Talon Overseer - Set Phase to 1'),
(1246107, 0, 0, 2, 161, 0, 0, 0, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Death Talon Overseer - Set Field');

INSERT INTO `creature_ai_scripts`
(`id`, `delay`, `priority`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`)
VALUES
(1246108, 0, 0, 2, 157, 302, 0, 0, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Death Talon Overseer - Set Field');

INSERT INTO `creature_ai_scripts`
(`id`, `delay`, `priority`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`)
VALUES
(1246109, 0, 0, 2, 158, 303, 0, 0, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Death Talon Overseer - Set Field');

INSERT INTO `creature_ai_scripts`
(`id`, `delay`, `priority`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`)
VALUES
(1246110, 0, 0, 2, 159, 304, 0, 0, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Death Talon Overseer - Set Field');

INSERT INTO `creature_ai_scripts`
(`id`, `delay`, `priority`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`)
VALUES
(1246111, 0, 0, 2, 160, 305, 0, 0, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Death Talon Overseer - Set Field');

INSERT INTO `creature_ai_scripts`
(`id`, `delay`, `priority`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`)
VALUES
(1246112, 0, 0, 2, 161, 306, 0, 0, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Death Talon Overseer - Set Field');

INSERT INTO `creature_ai_scripts`
(`id`, `delay`, `priority`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`)
VALUES
(1246113, 0, 0, 44, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Death Talon Overseer - Set Phase to 0');

INSERT INTO `creature_ai_events`
(`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`)
VALUES
(1246016, 12460, 0, 1, 13, 10, 1, 300, 300, 800, 800, 1246016, 0, 0, 'Death Talon Wyrmguard - Pouvoir d espece : bronze (Ustaag)'),
(1246015, 12460, 0, 1, 13, 10, 1, 200, 200, 700, 700, 1246015, 0, 0, 'Death Talon Wyrmguard - Pouvoir d espece : rouge (Ustaag)'),
(1246014, 12460, 0, 1, 13, 10, 1, 100, 100, 600, 600, 1246014, 0, 0, 'Death Talon Wyrmguard - Pouvoir d espece : Vert (Ustaag)'),
(1246013, 12460, 0, 11, 0, 100, 1, 0, 0, 0, 0, 1246013, 0, 0, 'Death Talon Overseer - On spawn set phase 0 (Ustaag)'),
(1246012, 12460, 0, 6, 0, 100, 0, 0, 0, 0, 0, 1246012, 0, 0, 'Death Talon Wyrmguard - On Death resist arcane (Ustaag)'),
(1246001, 12460, 0, 0, 0, 80, 13, 8000, 8000, 8000, 14000, 1246001, 0, 0, 'Death Talon Wyrmguard - Cast War Stomp'),
(1246018, 12460, 0, 1, 13, 10, 1, 500, 500, 1000, 1000, 1246018, 0, 0, 'Death Talon Wyrmguard - Pouvoir d espece : bleu (Ustaag)'),
(1246017, 12460, 0, 1, 13, 10, 1, 400, 400, 900, 900, 1246017, 0, 0, 'Death Talon Wyrmguard - Pouvoir d espece : noir (Ustaag)'),
(1246003, 12460, 0, 1, 14, 10, 1, 100, 100, 600, 600, 1246003, 0, 0, 'Death Talon Wyrmguard - sensible fire + set phase 1 (Ustaag)'),
(1246004, 12460, 0, 1, 14, 10, 1, 200, 200, 700, 700, 1246004, 0, 0, 'Death Talon Wyrmguard - sensible nature + set phase 1 (Ustaag)'),
(1246005, 12460, 0, 1, 14, 10, 1, 300, 300, 800, 800, 1246005, 0, 0, 'Death Talon Wyrmguard - sensible frost + set phase 1 (Ustaag)'),
(1246006, 12460, 0, 1, 14, 10, 1, 400, 400, 900, 900, 1246006, 0, 0, 'Death Talon Wyrmguard - sensible shadow + set phase 1 (Ustaag)'),
(1246007, 12460, 0, 1, 14, 10, 1, 500, 500, 1000, 1000, 1246007, 0, 0, 'Death Talon Wyrmguard - sensible arcane + set phase 1 (Ustaag)'),
(1246002, 12460, 0, 0, 0, 75, 13, 2000, 2000, 2000, 6000, 1246002, 0, 0, 'Death Talon Wyrmguard - Cast Cleave (Ustaag)'),
(1246008, 12460, 0, 6, 0, 100, 0, 0, 0, 0, 0, 1246008, 0, 0, 'Death Talon Wyrmguard - On Death resist fire (Ustaag)'),
(1246009, 12460, 0, 6, 0, 100, 0, 0, 0, 0, 0, 1246009, 0, 0, 'Death Talon Wyrmguard - On Death resist nature (Ustaag)'),
(1246010, 12460, 0, 6, 0, 100, 0, 0, 0, 0, 0, 1246010, 0, 0, 'Death Talon Wyrmguard - On Death resist frost (Ustaag)'),
(1246011, 12460, 0, 6, 0, 100, 0, 0, 0, 0, 0, 1246011, 0, 0, 'Death Talon Wyrmguard - On Death resist shadow (Ustaag)');

INSERT INTO `creature_ai_events`
(`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`)
VALUES
(1246108, 12461, 0, 6, 0, 100, 0, 0, 0, 0, 0, 1246108, 0, 0, 'Death Talon Overseer - On Death resist fire (Ustaag)'),
(1246109, 12461, 0, 6, 0, 100, 0, 0, 0, 0, 0, 1246109, 0, 0, 'Death Talon Overseer - On Death resist nature (Ustaag)'),
(1246110, 12461, 0, 6, 0, 100, 0, 0, 0, 0, 0, 1246110, 0, 0, 'Death Talon Overseer - On Death resist frost (Ustaag)'),
(1246111, 12461, 0, 6, 0, 100, 0, 0, 0, 0, 0, 1246111, 0, 0, 'Death Talon Overseer - On Death resist shadow (Ustaag)'),
(1246112, 12461, 0, 6, 0, 100, 0, 0, 0, 0, 0, 1246112, 0, 0, 'Death Talon Overseer - On Death resist arcane (Ustaag)'),
(1246113, 12461, 0, 11, 0, 100, 1, 0, 0, 0, 0, 1246113, 0, 0, 'Death Talon Overseer - On aggro set phase 0 (Ustaag)'),
(1246102, 12461, 0, 0, 0, 100, 13, 10000, 10000, 10000, 10000, 1246102, 0, 0, 'Death Talon Overseer - Cast Fire Blast'),
(1246101, 12461, 0, 0, 0, 75, 13, 2000, 2000, 2000, 6000, 1246101, 0, 0, 'Death Talon Overseer - Cast Cleave'),
(1246104, 12461, 0, 1, 14, 10, 1, 200, 200, 700, 700, 1246104, 0, 0, 'Death Talon Overseer - sensible nature + set phase 1 (Ustaag)'),
(1246103, 12461, 0, 1, 14, 10, 1, 100, 100, 600, 600, 1246103, 0, 0, 'Death Talon Overseer - sensible fire + set phase 1 (Ustaag)'),
(1246105, 12461, 0, 1, 14, 10, 1, 300, 300, 800, 800, 1246105, 0, 0, 'Death Talon Overseer - sensible frost + set phase 1 (Ustaag)'),
(1246106, 12461, 0, 1, 14, 10, 1, 400, 400, 900, 900, 1246106, 0, 0, 'Death Talon Overseer - sensible shadow + set phase 1 (Ustaag)'),
(1246107, 12461, 0, 1, 14, 10, 1, 500, 500, 1000, 1000, 1246107, 0, 0, 'Death Talon Overseer - sensible arcane + set phase 1 (Ustaag)');

INSERT INTO `creature_ai_events`
(`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`)
VALUES
(1246701, 12467, 0, 4, 0, 100, 0, 0, 0, 0, 0, 1246701, 0, 0, 'Death Talon Captain - Cast Commanding \n\n\nShout on aggro (Ustaag)');

INSERT INTO `creature_ai_scripts`
(`id`, `delay`, `priority`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`)
VALUES
(1246701, 0, 0, 15, 22440, 0, 0, 0, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Death Talon Captain - Cast Spell Commanding Shout');

INSERT INTO `creature_ai_events`
(`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`)
VALUES
(1246702, 12467, 0, 0, 0, 85, 13, 4000, 4000, 5000, 5000, 1246702, 0, 0, 'Death Talon Captain - Cast \n\n\nCleave');

INSERT INTO `creature_ai_scripts`
(`id`, `delay`, `priority`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`)
VALUES
(1246702, 0, 0, 15, 19983, 0, 0, 0, 0, 0, 1, 8, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Death Talon Captain - Cast Spell Cleave');

INSERT INTO `creature_ai_events`
(`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`)
VALUES
(1246703, 12467, 0, 0, 0, 80, 13, 20000, 20000, 20000, 20000, 1246703, 0, 0, 'Death Talon Captain - \n\n\nCast Mark of Detonation');

INSERT INTO `creature_ai_scripts`
(`id`, `delay`, `priority`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`)
VALUES
(1246703, 0, 0, 15, 22438, 36, 0, 0, 0, 0, 4, 8, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Death Talon Captain - Cast Spell Mark of Detonation');

INSERT INTO `creature_ai_events`
(`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`)
VALUES
(1246704, 12467, 0, 27, 0, 100, 1, 22436, 1, 0, 0, 1246704, 0, 0, 'Death Talon Captain - Cast Aura \n\n\nof flammes (Ustaag)');

INSERT INTO `creature_ai_scripts`
(`id`, `delay`, `priority`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`)
VALUES
(1246704, 0, 0, 15, 22436, 0, 0, 0, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Death Talon Captain - Cast Spell Aura of Flames');

INSERT INTO `creature_ai_events`
(`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`)
VALUES
(1246401, 12464, 0, 0, 0, 100, 13, 15000, 15000, 15000, 15000, 1246401, 0, 0, 'Death Talon Seether - Cast Frenzy');

INSERT INTO `creature_ai_scripts`
(`id`, `delay`, `priority`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`)
VALUES
(1246401, 0, 0, 15, 22428, 7, 0, 0, 0, 0, 0, 12, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Death Talon Seether - Cast Spell Frenzy');

INSERT INTO `creature_ai_events`
(`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`)
VALUES
(1246402, 12464, 0, 0, 0, 100, 13, 10000, 12000, 10000, 12000, 1246402, 0, 0, 'Death Talon Seether - Cast Mark of Flames');

INSERT INTO `creature_ai_scripts`
(`id`, `delay`, `priority`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`)
VALUES
(1246402, 0, 0, 15, 25050, 0, 0, 0, 0, 0, 1, 8, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Death Talon Seether - Cast Spell Mark of Flames');

