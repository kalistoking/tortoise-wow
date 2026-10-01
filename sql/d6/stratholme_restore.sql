-- Puts back what stratholme_as_rows.sql replaced, as t1_world had it when the migration
-- was written (scripts/tier2/a22_stratholme.py). The rows the migration added are removed.

UPDATE `creature_template` SET `ai_name` = '', `script_name` = 'mobs_spectral_ghostly_citizen', `flags_extra` = 0 WHERE `entry` = 10384;
UPDATE `creature_template` SET `ai_name` = '', `script_name` = 'mobs_spectral_ghostly_citizen', `flags_extra` = 0 WHERE `entry` = 10385;
UPDATE `creature_template` SET `ai_name` = '', `script_name` = 'mobs_cristal_zuggurat', `flags_extra` = 2097218 WHERE `entry` = 10415;
UPDATE `creature_template` SET `ai_name` = '', `script_name` = 'npc_crimson_guardsman', `flags_extra` = 0 WHERE `entry` = 10418;
UPDATE `creature_template` SET `ai_name` = '', `script_name` = 'boss_magistrate_barthilas', `flags_extra` = 33554432 WHERE `entry` = 10435;
UPDATE `creature_template` SET `ai_name` = '', `script_name` = 'boss_nerubenkan', `flags_extra` = 0 WHERE `entry` = 10437;
UPDATE `creature_template` SET `ai_name` = '', `script_name` = 'boss_maleki_the_pallid', `flags_extra` = 0 WHERE `entry` = 10438;
UPDATE `creature_template` SET `ai_name` = '', `script_name` = 'boss_ramstein_the_gorger', `flags_extra` = 2097152 WHERE `entry` = 10439;
UPDATE `creature_template` SET `ai_name` = '', `script_name` = 'boss_timmy_the_cruel', `flags_extra` = 0 WHERE `entry` = 10808;
UPDATE `creature_template` SET `ai_name` = '', `script_name` = 'boss_cannon_master_willey', `flags_extra` = 0 WHERE `entry` = 10997;
UPDATE `creature_template` SET `ai_name` = '', `script_name` = 'mob_restless_soul', `flags_extra` = 2 WHERE `entry` = 11122;
UPDATE `creature_template` SET `ai_name` = '', `script_name` = 'mob_freed_soul', `flags_extra` = 2 WHERE `entry` = 11136;
UPDATE `creature_template` SET `ai_name` = '', `script_name` = 'boss_postmaster_malown', `flags_extra` = 2097152 WHERE `entry` = 11143;
UPDATE `creature_template` SET `ai_name` = '', `script_name` = 'boss_atiesh', `flags_extra` = 32769 WHERE `entry` = 16387;
DELETE FROM `conditions` WHERE `condition_entry` IN (329001, 329002, 329003, 329004, 329005, 329006, 329007, 329008, 329010, 329020, 329030, 329040, 329041, 329042, 329050);
DELETE FROM `broadcast_text` WHERE `entry` IN (329101, 329102, 329103, 329104, 329110);
DELETE FROM `creature_ai_events` WHERE `id` IN (1038401, 1038402, 1038403, 1038411, 1038412, 1038413, 1038414, 1038415, 1038501, 1038502, 1038503, 1038511, 1038512, 1038513, 1038514, 1038515, 1041501, 1041502, 1041811, 1041812, 1041813, 1041814, 1043501, 1043502, 1043503, 1043511, 1043512, 1043513, 1043514, 1043711, 1043712, 1043713, 1043714, 1043811, 1043812, 1043813, 1043814, 1043901, 1043902, 1043903, 1043911, 1043912, 1080811, 1080812, 1099701, 1099702, 1099703, 1099704, 1099711, 1099712, 1099713, 1099714, 1099715, 1112201, 1113601, 1113602, 1114301, 1114302, 1114311, 1114312, 1114313, 1114314, 1114315, 1638711, 1638712, 1638713, 1638714, 1638715, 1638716);
DELETE FROM `creature_ai_scripts` WHERE `id` IN (1038401, 1038402, 1038403, 1038411, 1038412, 1038413, 1038414, 1038415, 1038501, 1038502, 1038503, 1038511, 1038512, 1038513, 1038514, 1038515, 1041501, 1041502, 1041811, 1041812, 1041813, 1041814, 1043501, 1043502, 1043503, 1043511, 1043512, 1043513, 1043514, 1043711, 1043712, 1043713, 1043714, 1043811, 1043812, 1043813, 1043814, 1043901, 1043902, 1043903, 1043911, 1043912, 1080811, 1080812, 1099701, 1099702, 1099703, 1099704, 1099711, 1099712, 1099713, 1099714, 1099715, 1112201, 1113601, 1113602, 1114301, 1114302, 1114311, 1114312, 1114313, 1114314, 1114315, 1638711, 1638712, 1638713, 1638714, 1638715, 1638716);
DELETE FROM `generic_scripts` WHERE `id` IN (3290001, 3290002, 3290003, 3290004, 3290005, 3290006, 3290007, 3290008, 3290009, 3290010, 3290011, 3290012, 3290013, 3290014, 3290015, 3290016, 3290017, 3290018, 3290019, 3290020, 3290021, 3290022, 3290023, 3290024, 3290025, 3290026, 3290027, 3290028, 3290029, 3290030, 3290031, 3290032, 3290033, 3290034, 3290035, 3290036, 3290037, 3290038, 3290039, 3290040, 3290041, 3290042, 3290043, 3290044, 3290045, 3290046);
DELETE FROM `gameobject_scripts` WHERE `id` IN (20761, 20768, 45220, 47273, 47274, 47275, 47276, 47277, 49592, 399000, 399001, 399002, 399003, 399004, 399005, 399006, 399007, 399008, 399009, 399010, 399011, 399012, 399013, 399014, 399015, 399016, 399017, 399018, 399019, 399020, 399021, 399022, 399023, 399024, 399025, 399026, 399027, 399028, 399029, 399030, 399031, 399032, 399033, 399034, 399035, 399039, 399040, 399041, 399042, 399043, 399044, 399045, 399046, 399047, 399048, 399049, 399050, 399051, 399052, 399053, 399054, 399055, 399056, 399057, 399058, 399059, 399060, 399061, 399062);
INSERT INTO `creature_ai_events`
(`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`)
VALUES
(1638701, 16387, 0, 4, 0, 100, 0, 0, 0, 0, 0, 1638701, 0, 0, 'Atiesh - Cast Unholy Aura on Aggro');

INSERT INTO `creature_ai_scripts`
(`id`, `delay`, `priority`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`)
VALUES
(1638701, 0, 0, 15, 17467, 1, 0, 0, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Atiesh - Cast Spell Unholy Aura');

INSERT INTO `creature_ai_events`
(`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`)
VALUES
(1638702, 16387, 0, 9, 0, 100, 13, 0, 40, 7000, 16000, 1638702, 0, 0, 'Atiesh - Cast Shadow Bolt');

INSERT INTO `creature_ai_scripts`
(`id`, `delay`, `priority`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`)
VALUES
(1638702, 0, 0, 15, 21077, 0, 0, 0, 0, 0, 4, 8, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Atiesh - Cast Spell Shadow Bolt');

INSERT INTO `creature_ai_events`
(`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`)
VALUES
(1638703, 16387, 0, 8, 2, 100, 0, 676, -1, 0, 0, 1638703, 0, 0, 'Atiesh - Cast Reaper of Souls DND and Increase Phase on Disarm Spellhit');

INSERT INTO `creature_ai_scripts`
(`id`, `delay`, `priority`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`)
VALUES
(1638703, 0, 0, 44, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Atiesh - Increment Phase'),
(1638703, 0, 0, 15, 28355, 1, 0, 0, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Atiesh - Cast Spell Reaper of Souls DND');

INSERT INTO `creature_ai_events`
(`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`)
VALUES
(1041801, 10418, 0, 4, 0, 100, 0, 0, 0, 0, 0, 1041801, 0, 0, 'Crimson Guardsman - Cast Shield Charge on Aggro');

INSERT INTO `creature_ai_scripts`
(`id`, `delay`, `priority`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`)
VALUES
(1041801, 0, 0, 15, 15749, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Crimson Guardsman - Cast Spell Shield Charge');

INSERT INTO `creature_ai_events`
(`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`)
VALUES
(1041802, 10418, 0, 0, 0, 100, 13, 6000, 6000, 15000, 15000, 1041802, 0, 0, 'Crimson Guardsman - Cast Disarm');

INSERT INTO `creature_ai_scripts`
(`id`, `delay`, `priority`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`)
VALUES
(1041802, 0, 0, 15, 6713, 0, 0, 0, 0, 0, 1, 8, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Crimson Guardsman - Cast Spell Disarm');

INSERT INTO `creature_ai_events`
(`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`)
VALUES
(1041803, 10418, 0, 0, 0, 100, 13, 4000, 4000, 8000, 8000, 1041803, 0, 0, 'Crimson Guardsman - Cast Shield Bash');

INSERT INTO `creature_ai_scripts`
(`id`, `delay`, `priority`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`)
VALUES
(1041803, 0, 0, 15, 11972, 0, 0, 0, 0, 0, 1, 8, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Crimson Guardsman - Cast Spell Shield Bash');

INSERT INTO `creature_ai_events`
(`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`)
VALUES
(1041804, 10418, 54055, 6, 0, 100, 0, 0, 0, 0, 0, 1041804, 0, 0, 'Crimson Guardsman - Spawn Undead on Group Dead');

INSERT INTO `creature_ai_scripts`
(`id`, `delay`, `priority`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`)
VALUES
(1041804, 0, 0, 0, 6, 0, 0, 0, 52129, 0, 9, 2, 6436, 0, 0, 0, 0, 0, 0, 0, 0, 'Crimson Gallant - Yell to Zone'),
(1041804, 0, 0, 91, 52124, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Crimson Guardsman - Spawn Undead Group');

-- The shared conditions go only once nothing names them: the other migration that writes them is then not applied either.
DELETE FROM `conditions` WHERE `condition_entry` = 230000 AND NOT EXISTS (SELECT 1 FROM `creature_ai_events` WHERE `condition_id` = 230000) AND NOT EXISTS (SELECT 1 FROM `creature_ai_scripts` WHERE `condition_id` = 230000) AND NOT EXISTS (SELECT 1 FROM `generic_scripts` WHERE `condition_id` = 230000) AND NOT EXISTS (SELECT 1 FROM `gameobject_scripts` WHERE `condition_id` = 230000) AND NOT EXISTS (SELECT 1 FROM `gossip_scripts` WHERE `condition_id` = 230000) AND NOT EXISTS (SELECT 1 FROM `event_scripts` WHERE `condition_id` = 230000) AND NOT EXISTS (SELECT 1 FROM `creature_movement_scripts` WHERE `condition_id` = 230000) AND NOT EXISTS (SELECT 1 FROM `quest_start_scripts` WHERE `condition_id` = 230000) AND NOT EXISTS (SELECT 1 FROM `quest_end_scripts` WHERE `condition_id` = 230000) AND NOT EXISTS (SELECT 1 FROM `spell_scripts` WHERE `condition_id` = 230000) AND NOT EXISTS (SELECT 1 FROM `gossip_menu` WHERE `condition_id` = 230000) AND NOT EXISTS (SELECT 1 FROM `gossip_menu_option` WHERE `condition_id` = 230000) AND NOT EXISTS (SELECT 1 FROM `gameobject_spawn_state` WHERE `condition_id` = 230000) AND NOT EXISTS (SELECT 1 FROM `areatrigger_generic_script` WHERE `condition_id` = 230000) AND NOT EXISTS (SELECT 1 FROM (SELECT * FROM `conditions`) c WHERE c.`type` < 0 AND 230000 IN (c.`value1`, c.`value2`, c.`value3`, c.`value4`));
DELETE FROM `conditions` WHERE `condition_entry` = 230040 AND NOT EXISTS (SELECT 1 FROM `creature_ai_events` WHERE `condition_id` = 230040) AND NOT EXISTS (SELECT 1 FROM `creature_ai_scripts` WHERE `condition_id` = 230040) AND NOT EXISTS (SELECT 1 FROM `generic_scripts` WHERE `condition_id` = 230040) AND NOT EXISTS (SELECT 1 FROM `gameobject_scripts` WHERE `condition_id` = 230040) AND NOT EXISTS (SELECT 1 FROM `gossip_scripts` WHERE `condition_id` = 230040) AND NOT EXISTS (SELECT 1 FROM `event_scripts` WHERE `condition_id` = 230040) AND NOT EXISTS (SELECT 1 FROM `creature_movement_scripts` WHERE `condition_id` = 230040) AND NOT EXISTS (SELECT 1 FROM `quest_start_scripts` WHERE `condition_id` = 230040) AND NOT EXISTS (SELECT 1 FROM `quest_end_scripts` WHERE `condition_id` = 230040) AND NOT EXISTS (SELECT 1 FROM `spell_scripts` WHERE `condition_id` = 230040) AND NOT EXISTS (SELECT 1 FROM `gossip_menu` WHERE `condition_id` = 230040) AND NOT EXISTS (SELECT 1 FROM `gossip_menu_option` WHERE `condition_id` = 230040) AND NOT EXISTS (SELECT 1 FROM `gameobject_spawn_state` WHERE `condition_id` = 230040) AND NOT EXISTS (SELECT 1 FROM `areatrigger_generic_script` WHERE `condition_id` = 230040) AND NOT EXISTS (SELECT 1 FROM (SELECT * FROM `conditions`) c WHERE c.`type` < 0 AND 230040 IN (c.`value1`, c.`value2`, c.`value3`, c.`value4`));
