-- Puts back what molten_core_as_rows.sql replaced, as t1_world had it when the migration
-- was written (scripts/tier2/a27_molten_core.py). The rows the migration added are removed.

UPDATE `creature_template` SET `ai_name` = '', `script_name` = 'mob_firelord', `flags_extra` = 2097184 WHERE `entry` = 11668;
UPDATE `creature_template` SET `ai_name` = '', `script_name` = 'mob_core_hound', `flags_extra` = 2097152 WHERE `entry` = 11671;
UPDATE `creature_template` SET `ai_name` = '', `script_name` = 'mob_core_rager', `flags_extra` = 0 WHERE `entry` = 11672;
UPDATE `creature_template` SET `ai_name` = '', `script_name` = 'mob_ancient_core_hound', `flags_extra` = 2097152 WHERE `entry` = 11673;
UPDATE `creature_template` SET `ai_name` = '', `script_name` = 'boss_magmadar', `flags_extra` = 2129921 WHERE `entry` = 11982;
UPDATE `creature_template` SET `ai_name` = '', `script_name` = 'boss_golemagg', `flags_extra` = 2129921 WHERE `entry` = 11988;
UPDATE `creature_template` SET `ai_name` = '', `script_name` = 'boss_garr', `flags_extra` = 2129921 WHERE `entry` = 12057;
UPDATE `creature_template` SET `ai_name` = '', `script_name` = 'boss_sulfuron', `flags_extra` = 2129921 WHERE `entry` = 12098;
UPDATE `creature_template` SET `ai_name` = '', `script_name` = 'mob_firesworn', `flags_extra` = 2097152 WHERE `entry` = 12099;
UPDATE `creature_template` SET `ai_name` = '', `script_name` = 'mob_lava_surger', `flags_extra` = 2097152 WHERE `entry` = 12101;
UPDATE `creature_template` SET `ai_name` = '', `script_name` = 'boss_lucifron', `flags_extra` = 2129921 WHERE `entry` = 12118;
UPDATE `creature_template` SET `ai_name` = '', `script_name` = 'boss_gehennas', `flags_extra` = 2129921 WHERE `entry` = 12259;
UPDATE `creature_template` SET `ai_name` = '', `script_name` = 'boss_shazzrah', `flags_extra` = 2129921 WHERE `entry` = 12264;
UPDATE `creature_template` SET `ai_name` = '', `script_name` = 'boss_incindis', `flags_extra` = 2130433 WHERE `entry` = 52145;
UPDATE `creature_template` SET `ai_name` = '', `script_name` = 'npc_incendic_egg', `flags_extra` = 0 WHERE `entry` = 52146;
UPDATE `creature_template` SET `ai_name` = '', `script_name` = 'npc_incendic_egg', `flags_extra` = 0 WHERE `entry` = 52147;
DELETE FROM `conditions` WHERE `condition_entry` IN (409001, 409010, 409011, 409316, 409317, 409318, 409319, 409321, 409322, 409330, 409332, 10409331, 10409333);
DELETE FROM `broadcast_text` WHERE `entry` IN (409101, 409102, 409103, 409301);
DELETE FROM `creature_ai_events` WHERE `id` IN (1166611, 1166612, 1166613, 1166811, 1166812, 1166813, 1167101, 1167102, 1167103, 1167104, 1167201, 1167202, 1167203, 1167204, 1167301, 1167302, 1167311, 1167312, 1167313, 1167314, 1167315, 1167316, 1167321, 1167322, 1167323, 1167324, 1198201, 1198202, 1198203, 1198204, 1198211, 1198212, 1198291, 1198292, 1198293, 1198801, 1198802, 1198803, 1198804, 1198811, 1198812, 1198891, 1198892, 1198893, 1205701, 1205702, 1205703, 1205791, 1205792, 1205793, 1209801, 1209802, 1209803, 1209804, 1209805, 1209891, 1209892, 1209893, 1209901, 1209902, 1209903, 1209904, 1209905, 1210111, 1211801, 1211802, 1211803, 1211891, 1211892, 1211893, 1225901, 1225902, 1225903, 1225904, 1225991, 1225992, 1225993, 1226401, 1226402, 1226403, 1226404, 1226405, 1226491, 1226492, 1226493, 5214511, 5214512, 5214513, 5214514, 5214611, 5214612, 5214613, 5214711, 5214712, 5214713);
DELETE FROM `creature_ai_scripts` WHERE `id` IN (1166611, 1166612, 1166613, 1166811, 1166812, 1166813, 1167101, 1167102, 1167103, 1167104, 1167201, 1167202, 1167203, 1167204, 1167301, 1167302, 1167311, 1167312, 1167313, 1167314, 1167315, 1167316, 1167321, 1167322, 1167323, 1167324, 1198201, 1198202, 1198203, 1198204, 1198211, 1198212, 1198291, 1198292, 1198293, 1198801, 1198802, 1198803, 1198804, 1198811, 1198812, 1198891, 1198892, 1198893, 1205701, 1205702, 1205703, 1205791, 1205792, 1205793, 1209801, 1209802, 1209803, 1209804, 1209805, 1209891, 1209892, 1209893, 1209901, 1209902, 1209903, 1209904, 1209905, 1210111, 1211801, 1211802, 1211803, 1211891, 1211892, 1211893, 1225901, 1225902, 1225903, 1225904, 1225991, 1225992, 1225993, 1226401, 1226402, 1226403, 1226404, 1226405, 1226491, 1226492, 1226493, 5214511, 5214512, 5214513, 5214514, 5214611, 5214612, 5214613, 5214711, 5214712, 5214713);
DELETE FROM `generic_scripts` WHERE `id` IN (4090001, 4090002, 4090003, 4090004, 4090005, 4090006, 4090007, 4090008, 4090009, 4090010, 4090011, 4090012, 4090013, 4090014, 4090015, 4090016);
DELETE FROM `gameobject_scripts` WHERE `id` IN (232212, 232213, 232214, 232215, 232216, 232217, 232218);
UPDATE `spell_template` SET `maxAffectedTargets` = 0 WHERE `entry` = 42036;
DELETE FROM `gameobject_requirement` WHERE `guid` = 232212;
DELETE FROM `gameobject_requirement` WHERE `guid` = 232213;
DELETE FROM `gameobject_requirement` WHERE `guid` = 232216;
DELETE FROM `gameobject_requirement` WHERE `guid` = 232215;
DELETE FROM `gameobject_requirement` WHERE `guid` = 232217;
DELETE FROM `gameobject_requirement` WHERE `guid` = 232214;
DELETE FROM `gameobject_requirement` WHERE `guid` = 232218;
INSERT INTO `creature_ai_events`
(`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`)
VALUES
(1166602, 11666, 0, 23, 0, 100, 1, 19636, 1, 1000, 1000, 1166602, 0, 0, 'Firewalker - Cast Fireblossom + stop attack (Ustaag)');

INSERT INTO `creature_ai_scripts`
(`id`, `delay`, `priority`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`)
VALUES
(1166602, 0, 0, 42, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Firewalker - Disable Melee Attack'),
(1166602, 0, 0, 15, 19637, 7, 0, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Firewalker - Cast Spell Fire Blossom');

INSERT INTO `creature_ai_events`
(`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`)
VALUES
(1166603, 11666, 0, 27, 0, 100, 1, 19636, 1, 0, 0, 1166603, 0, 0, 'Firewalker - Attack si pas debuff (Ustaag)');

INSERT INTO `creature_ai_scripts`
(`id`, `delay`, `priority`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`)
VALUES
(1166603, 0, 0, 42, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Firewalker - Enable Melee Attack');

INSERT INTO `creature_ai_events`
(`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`)
VALUES
(1166801, 11668, 0, 0, 0, 100, 13, 6000, 6000, 15000, 22000, 1166801, 0, 0, 'Firelord - Cast Soul Burn');

INSERT INTO `creature_ai_scripts`
(`id`, `delay`, `priority`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`)
VALUES
(1166801, 0, 0, 15, 19393, 0, 0, 0, 0, 0, 4, 8, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Firelord - Cast Spell Soul Burn');

INSERT INTO `creature_ai_events`
(`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`)
VALUES
(1166802, 11668, 0, 0, 0, 100, 13, 10000, 10000, 18000, 20000, 1166802, 0, 0, 'Firelord - Cast Summon Lava Spawn');

INSERT INTO `creature_ai_scripts`
(`id`, `delay`, `priority`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`)
VALUES
(1166802, 0, 0, 15, 19392, 0, 0, 0, 0, 0, 0, 12, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Firelord - Cast Spell Summon Lava Spawn');

INSERT INTO `creature_ai_events`
(`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`)
VALUES
(1210101, 12101, 0, 9, 0, 100, 13, 5, 40, 3000, 6000, 1210101, 0, 0, 'Lava Surger - Cast Afflux (Ustaag)');

INSERT INTO `creature_ai_scripts`
(`id`, `delay`, `priority`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`)
VALUES
(1210101, 0, 0, 15, 25787, 0, 0, 0, 0, 0, 4, 8, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Lava Surger - Cast Spell Surge');

-- The shared conditions go only once nothing names them: the other migration that writes them is then not applied either.
DELETE FROM `conditions` WHERE `condition_entry` = 409020 AND NOT EXISTS (SELECT 1 FROM `creature_ai_events` WHERE `condition_id` = 409020) AND NOT EXISTS (SELECT 1 FROM `creature_ai_scripts` WHERE `condition_id` = 409020) AND NOT EXISTS (SELECT 1 FROM `generic_scripts` WHERE `condition_id` = 409020) AND NOT EXISTS (SELECT 1 FROM `gameobject_scripts` WHERE `condition_id` = 409020) AND NOT EXISTS (SELECT 1 FROM `gossip_scripts` WHERE `condition_id` = 409020) AND NOT EXISTS (SELECT 1 FROM `event_scripts` WHERE `condition_id` = 409020) AND NOT EXISTS (SELECT 1 FROM `creature_movement_scripts` WHERE `condition_id` = 409020) AND NOT EXISTS (SELECT 1 FROM `quest_start_scripts` WHERE `condition_id` = 409020) AND NOT EXISTS (SELECT 1 FROM `quest_end_scripts` WHERE `condition_id` = 409020) AND NOT EXISTS (SELECT 1 FROM `spell_scripts` WHERE `condition_id` = 409020) AND NOT EXISTS (SELECT 1 FROM `gossip_menu` WHERE `condition_id` = 409020) AND NOT EXISTS (SELECT 1 FROM `gossip_menu_option` WHERE `condition_id` = 409020) AND NOT EXISTS (SELECT 1 FROM `gameobject_spawn_state` WHERE `condition_id` = 409020) AND NOT EXISTS (SELECT 1 FROM `areatrigger_generic_script` WHERE `condition_id` = 409020) AND NOT EXISTS (SELECT 1 FROM (SELECT * FROM `conditions`) c WHERE c.`type` < 0 AND 409020 IN (c.`value1`, c.`value2`, c.`value3`, c.`value4`));
DELETE FROM `conditions` WHERE `condition_entry` = 230000 AND NOT EXISTS (SELECT 1 FROM `creature_ai_events` WHERE `condition_id` = 230000) AND NOT EXISTS (SELECT 1 FROM `creature_ai_scripts` WHERE `condition_id` = 230000) AND NOT EXISTS (SELECT 1 FROM `generic_scripts` WHERE `condition_id` = 230000) AND NOT EXISTS (SELECT 1 FROM `gameobject_scripts` WHERE `condition_id` = 230000) AND NOT EXISTS (SELECT 1 FROM `gossip_scripts` WHERE `condition_id` = 230000) AND NOT EXISTS (SELECT 1 FROM `event_scripts` WHERE `condition_id` = 230000) AND NOT EXISTS (SELECT 1 FROM `creature_movement_scripts` WHERE `condition_id` = 230000) AND NOT EXISTS (SELECT 1 FROM `quest_start_scripts` WHERE `condition_id` = 230000) AND NOT EXISTS (SELECT 1 FROM `quest_end_scripts` WHERE `condition_id` = 230000) AND NOT EXISTS (SELECT 1 FROM `spell_scripts` WHERE `condition_id` = 230000) AND NOT EXISTS (SELECT 1 FROM `gossip_menu` WHERE `condition_id` = 230000) AND NOT EXISTS (SELECT 1 FROM `gossip_menu_option` WHERE `condition_id` = 230000) AND NOT EXISTS (SELECT 1 FROM `gameobject_spawn_state` WHERE `condition_id` = 230000) AND NOT EXISTS (SELECT 1 FROM `areatrigger_generic_script` WHERE `condition_id` = 230000) AND NOT EXISTS (SELECT 1 FROM (SELECT * FROM `conditions`) c WHERE c.`type` < 0 AND 230000 IN (c.`value1`, c.`value2`, c.`value3`, c.`value4`));
DELETE FROM `conditions` WHERE `condition_entry` = 409320 AND NOT EXISTS (SELECT 1 FROM `creature_ai_events` WHERE `condition_id` = 409320) AND NOT EXISTS (SELECT 1 FROM `creature_ai_scripts` WHERE `condition_id` = 409320) AND NOT EXISTS (SELECT 1 FROM `generic_scripts` WHERE `condition_id` = 409320) AND NOT EXISTS (SELECT 1 FROM `gameobject_scripts` WHERE `condition_id` = 409320) AND NOT EXISTS (SELECT 1 FROM `gossip_scripts` WHERE `condition_id` = 409320) AND NOT EXISTS (SELECT 1 FROM `event_scripts` WHERE `condition_id` = 409320) AND NOT EXISTS (SELECT 1 FROM `creature_movement_scripts` WHERE `condition_id` = 409320) AND NOT EXISTS (SELECT 1 FROM `quest_start_scripts` WHERE `condition_id` = 409320) AND NOT EXISTS (SELECT 1 FROM `quest_end_scripts` WHERE `condition_id` = 409320) AND NOT EXISTS (SELECT 1 FROM `spell_scripts` WHERE `condition_id` = 409320) AND NOT EXISTS (SELECT 1 FROM `gossip_menu` WHERE `condition_id` = 409320) AND NOT EXISTS (SELECT 1 FROM `gossip_menu_option` WHERE `condition_id` = 409320) AND NOT EXISTS (SELECT 1 FROM `gameobject_spawn_state` WHERE `condition_id` = 409320) AND NOT EXISTS (SELECT 1 FROM `areatrigger_generic_script` WHERE `condition_id` = 409320) AND NOT EXISTS (SELECT 1 FROM (SELECT * FROM `conditions`) c WHERE c.`type` < 0 AND 409320 IN (c.`value1`, c.`value2`, c.`value3`, c.`value4`));
DELETE FROM `conditions` WHERE `condition_entry` = 329004 AND NOT EXISTS (SELECT 1 FROM `creature_ai_events` WHERE `condition_id` = 329004) AND NOT EXISTS (SELECT 1 FROM `creature_ai_scripts` WHERE `condition_id` = 329004) AND NOT EXISTS (SELECT 1 FROM `generic_scripts` WHERE `condition_id` = 329004) AND NOT EXISTS (SELECT 1 FROM `gameobject_scripts` WHERE `condition_id` = 329004) AND NOT EXISTS (SELECT 1 FROM `gossip_scripts` WHERE `condition_id` = 329004) AND NOT EXISTS (SELECT 1 FROM `event_scripts` WHERE `condition_id` = 329004) AND NOT EXISTS (SELECT 1 FROM `creature_movement_scripts` WHERE `condition_id` = 329004) AND NOT EXISTS (SELECT 1 FROM `quest_start_scripts` WHERE `condition_id` = 329004) AND NOT EXISTS (SELECT 1 FROM `quest_end_scripts` WHERE `condition_id` = 329004) AND NOT EXISTS (SELECT 1 FROM `spell_scripts` WHERE `condition_id` = 329004) AND NOT EXISTS (SELECT 1 FROM `gossip_menu` WHERE `condition_id` = 329004) AND NOT EXISTS (SELECT 1 FROM `gossip_menu_option` WHERE `condition_id` = 329004) AND NOT EXISTS (SELECT 1 FROM `gameobject_spawn_state` WHERE `condition_id` = 329004) AND NOT EXISTS (SELECT 1 FROM `areatrigger_generic_script` WHERE `condition_id` = 329004) AND NOT EXISTS (SELECT 1 FROM (SELECT * FROM `conditions`) c WHERE c.`type` < 0 AND 329004 IN (c.`value1`, c.`value2`, c.`value3`, c.`value4`));
