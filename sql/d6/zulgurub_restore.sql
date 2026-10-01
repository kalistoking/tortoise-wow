-- Puts back what zulgurub_as_rows.sql replaced, as t1_world had it when the migration
-- was written (scripts/tier2/a25_zulgurub.py). The rows the migration added are removed.

UPDATE `creature_template` SET `ai_name` = '', `script_name` = 'npc_hakkari_doctor', `flags_extra` = 0 WHERE `entry` = 11831;
UPDATE `creature_template` SET `ai_name` = '', `script_name` = 'boss_venoxis', `flags_extra` = 2129921 WHERE `entry` = 14507;
UPDATE `creature_template` SET `ai_name` = '', `script_name` = 'boss_jeklik', `flags_extra` = 2129921 WHERE `entry` = 14517;
UPDATE `creature_template` SET `ai_name` = '', `script_name` = 'mob_batrider', `flags_extra` = 536870912 WHERE `entry` = 14965;
UPDATE `creature_template` SET `ai_name` = '', `script_name` = 'mob_shade_of_jindo', `flags_extra` = 536870912 WHERE `entry` = 14986;
UPDATE `creature_template` SET `ai_name` = '', `script_name` = 'npc_esprit_vaudou', `flags_extra` = 536870912 WHERE `entry` = 15009;
UPDATE `creature_template` SET `ai_name` = '', `script_name` = 'boss_gahzranka', `flags_extra` = 32769 WHERE `entry` = 15114;
UPDATE `creature_template` SET `ai_name` = '', `script_name` = 'npc_brazier', `flags_extra` = 128 WHERE `entry` = 987800;
DELETE FROM `conditions` WHERE `condition_entry` IN (309001, 309004, 309010, 309011, 309310, 309311, 309312, 309330, 309331, 309332, 309350, 309351, 309352, 309353, 309354, 309355, 309356, 309357);
DELETE FROM `broadcast_text` WHERE `entry` IN (309101, 309102, 309103, 309104, 309201, 309202, 309203, 309204, 309205);
DELETE FROM `creature_ai_events` WHERE `id` IN (1135211, 1135212, 1135213, 1135214, 1135215, 1183101, 1183102, 1183103, 1183104, 1183105, 1450701, 1450702, 1450703, 1450704, 1450705, 1450706, 1450711, 1450712, 1450713, 1450714, 1450715, 1450721, 1450722, 1450723, 1450724, 1451701, 1451702, 1451703, 1451704, 1451705, 1451706, 1451711, 1451712, 1451713, 1451714, 1451715, 1451721, 1451722, 1451723, 1451724, 1451725, 1451726, 1475011, 1475012, 1475013, 1475014, 1475015, 1496501, 1496502, 1496503, 1496504, 1496505, 1498601, 1498602, 1498603, 1498604, 1498605, 1500901, 1500902, 1511401, 1511402, 1511403, 1511404, 1511405, 1511406, 1511411, 1511412, 1511413, 3099001, 3099002, 3099003, 3099004);
DELETE FROM `creature_ai_scripts` WHERE `id` IN (1135211, 1135212, 1135213, 1135214, 1135215, 1183101, 1183102, 1183103, 1183104, 1183105, 1450701, 1450702, 1450703, 1450704, 1450705, 1450706, 1450711, 1450712, 1450713, 1450714, 1450715, 1450721, 1450722, 1450723, 1450724, 1451701, 1451702, 1451703, 1451704, 1451705, 1451706, 1451711, 1451712, 1451713, 1451714, 1451715, 1451721, 1451722, 1451723, 1451724, 1451725, 1451726, 1475011, 1475012, 1475013, 1475014, 1475015, 1496501, 1496502, 1496503, 1496504, 1496505, 1498601, 1498602, 1498603, 1498604, 1498605, 1500901, 1500902, 1511401, 1511402, 1511403, 1511404, 1511405, 1511406, 1511411, 1511412, 1511413, 3099001, 3099002, 3099003, 3099004);
DELETE FROM `generic_scripts` WHERE `id` IN (3090001);
DELETE FROM `gossip_scripts` WHERE `id` IN (309500);
DELETE FROM `event_scripts` WHERE `id` = 9066 AND `command` = 32 AND `comments` = 'Gong of Bethekk - Arlokk up or done: no more';
DELETE FROM `event_scripts` WHERE `id` = 9066 AND `command` = 37 AND `comments` = 'Gong of Bethekk - Arlokk called (1 = 1)';
UPDATE `gameobject_template` SET `data3` = 309501 WHERE `entry` = 180358;
UPDATE `gameobject_template` SET `data3` = 309501 WHERE `entry` = 987654;
UPDATE `gameobject_template` SET `data3` = 309502 WHERE `entry` = 180364;
UPDATE `gameobject_template` SET `data3` = 309502 WHERE `entry` = 987655;
UPDATE `gameobject_template` SET `data3` = 309503 WHERE `entry` = 180365;
UPDATE `gameobject_template` SET `data3` = 309503 WHERE `entry` = 987656;
UPDATE `gameobject_template` SET `data3` = 309504 WHERE `entry` = 180393;
UPDATE `gameobject_template` SET `data3` = 309504 WHERE `entry` = 987657;
DELETE FROM `gossip_menu` WHERE `entry` = 309501 AND `text_id` = 7643;
DELETE FROM `gossip_menu` WHERE `entry` = 309501 AND `text_id` = 7669;
DELETE FROM `gossip_menu` WHERE `entry` = 309502 AND `text_id` = 7670;
DELETE FROM `gossip_menu` WHERE `entry` = 309502 AND `text_id` = 7675;
DELETE FROM `gossip_menu` WHERE `entry` = 309503 AND `text_id` = 7672;
DELETE FROM `gossip_menu` WHERE `entry` = 309503 AND `text_id` = 7673;
DELETE FROM `gossip_menu` WHERE `entry` = 309504 AND `text_id` = 7674;
DELETE FROM `gossip_menu` WHERE `entry` = 309504 AND `text_id` = 7682;
INSERT INTO `creature_ai_events`
(`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`)
VALUES
(1135201, 11352, 0, 0, 0, 100, 1, 12000, 15000, 15000, 20000, 1135201, 0, 0, 'Gurubashi Berserker - Cast Intimidating Roar');

INSERT INTO `creature_ai_scripts`
(`id`, `delay`, `priority`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`)
VALUES
(1135201, 0, 0, 29, 6, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, -100, 0, 0, 0, 0, 'Gurubashi Berserker - Reduce All Threat by -100.000000%'),
(1135201, 0, 0, 15, 16508, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Gurubashi Berserker - Cast Spell Intimidating Roar');

INSERT INTO `creature_ai_events`
(`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`)
VALUES
(1135204, 11352, 0, 2, 0, 100, 5, 30, 0, 120000, 120000, 1135204, 0, 0, 'Gurubashi Berserker - Cast Enrage at 30% HP');

INSERT INTO `creature_ai_scripts`
(`id`, `delay`, `priority`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`)
VALUES
(1135204, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 7798, 0, 0, 0, 0, 0, 0, 0, 0, 'Gurubashi Berserker - Say Text'),
(1135204, 0, 0, 15, 8269, 0, 0, 0, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Gurubashi Berserker - Cast Spell Enrage');

INSERT INTO `creature_ai_events`
(`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`)
VALUES
(1475001, 14750, 0, 4, 0, 100, 0, 0, 0, 0, 0, 1475001, 0, 0, 'Gurubashi Bat Rider - Cast Demoralizing Shout on Aggro');

INSERT INTO `creature_ai_scripts`
(`id`, `delay`, `priority`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`)
VALUES
(1475001, 0, 0, 15, 23511, 0, 0, 0, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Gurubashi Bat Rider - Cast Spell Demoralizing Shout');

INSERT INTO `creature_ai_events`
(`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`)
VALUES
(1475003, 14750, 0, 0, 0, 100, 0, 6500, 6500, 0, 0, 1475003, 0, 0, 'Gurubashi Bat Rider - Cast Infected Bite');

INSERT INTO `creature_ai_scripts`
(`id`, `delay`, `priority`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`)
VALUES
(1475003, 0, 0, 15, 16128, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Gurubashi Bat Rider - Cast Spell Infected Bite');

INSERT INTO `creature_ai_events`
(`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`)
VALUES
(1475005, 14750, 0, 2, 0, 100, 0, 50, 0, 0, 0, 1475005, 0, 0, 'Gurubashi Bat Rider - Cast Unstable Concoction and Throw Liquid Fire at 50% HP');

INSERT INTO `creature_ai_scripts`
(`id`, `delay`, `priority`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`)
VALUES
(1475005, 0, 0, 15, 23968, 0, 0, 0, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Gurubashi Bat Rider - Cast Spell Throw Liquid Fire'),
(1475005, 0, 0, 15, 24024, 1, 0, 0, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Gurubashi Bat Rider - Cast Spell Unstable Concoction');

-- The shared conditions go only once nothing names them: the other migration that writes them is then not applied either.
DELETE FROM `conditions` WHERE `condition_entry` = 230000 AND NOT EXISTS (SELECT 1 FROM `creature_ai_events` WHERE `condition_id` = 230000) AND NOT EXISTS (SELECT 1 FROM `creature_ai_scripts` WHERE `condition_id` = 230000) AND NOT EXISTS (SELECT 1 FROM `generic_scripts` WHERE `condition_id` = 230000) AND NOT EXISTS (SELECT 1 FROM `gameobject_scripts` WHERE `condition_id` = 230000) AND NOT EXISTS (SELECT 1 FROM `gossip_scripts` WHERE `condition_id` = 230000) AND NOT EXISTS (SELECT 1 FROM `event_scripts` WHERE `condition_id` = 230000) AND NOT EXISTS (SELECT 1 FROM `creature_movement_scripts` WHERE `condition_id` = 230000) AND NOT EXISTS (SELECT 1 FROM `quest_start_scripts` WHERE `condition_id` = 230000) AND NOT EXISTS (SELECT 1 FROM `quest_end_scripts` WHERE `condition_id` = 230000) AND NOT EXISTS (SELECT 1 FROM `spell_scripts` WHERE `condition_id` = 230000) AND NOT EXISTS (SELECT 1 FROM `gossip_menu` WHERE `condition_id` = 230000) AND NOT EXISTS (SELECT 1 FROM `gossip_menu_option` WHERE `condition_id` = 230000) AND NOT EXISTS (SELECT 1 FROM `gameobject_spawn_state` WHERE `condition_id` = 230000) AND NOT EXISTS (SELECT 1 FROM `areatrigger_generic_script` WHERE `condition_id` = 230000) AND NOT EXISTS (SELECT 1 FROM (SELECT * FROM `conditions`) c WHERE c.`type` < 0 AND 230000 IN (c.`value1`, c.`value2`, c.`value3`, c.`value4`));
DELETE FROM `conditions` WHERE `condition_entry` = 129001 AND NOT EXISTS (SELECT 1 FROM `creature_ai_events` WHERE `condition_id` = 129001) AND NOT EXISTS (SELECT 1 FROM `creature_ai_scripts` WHERE `condition_id` = 129001) AND NOT EXISTS (SELECT 1 FROM `generic_scripts` WHERE `condition_id` = 129001) AND NOT EXISTS (SELECT 1 FROM `gameobject_scripts` WHERE `condition_id` = 129001) AND NOT EXISTS (SELECT 1 FROM `gossip_scripts` WHERE `condition_id` = 129001) AND NOT EXISTS (SELECT 1 FROM `event_scripts` WHERE `condition_id` = 129001) AND NOT EXISTS (SELECT 1 FROM `creature_movement_scripts` WHERE `condition_id` = 129001) AND NOT EXISTS (SELECT 1 FROM `quest_start_scripts` WHERE `condition_id` = 129001) AND NOT EXISTS (SELECT 1 FROM `quest_end_scripts` WHERE `condition_id` = 129001) AND NOT EXISTS (SELECT 1 FROM `spell_scripts` WHERE `condition_id` = 129001) AND NOT EXISTS (SELECT 1 FROM `gossip_menu` WHERE `condition_id` = 129001) AND NOT EXISTS (SELECT 1 FROM `gossip_menu_option` WHERE `condition_id` = 129001) AND NOT EXISTS (SELECT 1 FROM `gameobject_spawn_state` WHERE `condition_id` = 129001) AND NOT EXISTS (SELECT 1 FROM `areatrigger_generic_script` WHERE `condition_id` = 129001) AND NOT EXISTS (SELECT 1 FROM (SELECT * FROM `conditions`) c WHERE c.`type` < 0 AND 129001 IN (c.`value1`, c.`value2`, c.`value3`, c.`value4`));
DELETE FROM `conditions` WHERE `condition_entry` = 532001 AND NOT EXISTS (SELECT 1 FROM `creature_ai_events` WHERE `condition_id` = 532001) AND NOT EXISTS (SELECT 1 FROM `creature_ai_scripts` WHERE `condition_id` = 532001) AND NOT EXISTS (SELECT 1 FROM `generic_scripts` WHERE `condition_id` = 532001) AND NOT EXISTS (SELECT 1 FROM `gameobject_scripts` WHERE `condition_id` = 532001) AND NOT EXISTS (SELECT 1 FROM `gossip_scripts` WHERE `condition_id` = 532001) AND NOT EXISTS (SELECT 1 FROM `event_scripts` WHERE `condition_id` = 532001) AND NOT EXISTS (SELECT 1 FROM `creature_movement_scripts` WHERE `condition_id` = 532001) AND NOT EXISTS (SELECT 1 FROM `quest_start_scripts` WHERE `condition_id` = 532001) AND NOT EXISTS (SELECT 1 FROM `quest_end_scripts` WHERE `condition_id` = 532001) AND NOT EXISTS (SELECT 1 FROM `spell_scripts` WHERE `condition_id` = 532001) AND NOT EXISTS (SELECT 1 FROM `gossip_menu` WHERE `condition_id` = 532001) AND NOT EXISTS (SELECT 1 FROM `gossip_menu_option` WHERE `condition_id` = 532001) AND NOT EXISTS (SELECT 1 FROM `gameobject_spawn_state` WHERE `condition_id` = 532001) AND NOT EXISTS (SELECT 1 FROM `areatrigger_generic_script` WHERE `condition_id` = 532001) AND NOT EXISTS (SELECT 1 FROM (SELECT * FROM `conditions`) c WHERE c.`type` < 0 AND 532001 IN (c.`value1`, c.`value2`, c.`value3`, c.`value4`));
DELETE FROM `conditions` WHERE `condition_entry` = 409020 AND NOT EXISTS (SELECT 1 FROM `creature_ai_events` WHERE `condition_id` = 409020) AND NOT EXISTS (SELECT 1 FROM `creature_ai_scripts` WHERE `condition_id` = 409020) AND NOT EXISTS (SELECT 1 FROM `generic_scripts` WHERE `condition_id` = 409020) AND NOT EXISTS (SELECT 1 FROM `gameobject_scripts` WHERE `condition_id` = 409020) AND NOT EXISTS (SELECT 1 FROM `gossip_scripts` WHERE `condition_id` = 409020) AND NOT EXISTS (SELECT 1 FROM `event_scripts` WHERE `condition_id` = 409020) AND NOT EXISTS (SELECT 1 FROM `creature_movement_scripts` WHERE `condition_id` = 409020) AND NOT EXISTS (SELECT 1 FROM `quest_start_scripts` WHERE `condition_id` = 409020) AND NOT EXISTS (SELECT 1 FROM `quest_end_scripts` WHERE `condition_id` = 409020) AND NOT EXISTS (SELECT 1 FROM `spell_scripts` WHERE `condition_id` = 409020) AND NOT EXISTS (SELECT 1 FROM `gossip_menu` WHERE `condition_id` = 409020) AND NOT EXISTS (SELECT 1 FROM `gossip_menu_option` WHERE `condition_id` = 409020) AND NOT EXISTS (SELECT 1 FROM `gameobject_spawn_state` WHERE `condition_id` = 409020) AND NOT EXISTS (SELECT 1 FROM `areatrigger_generic_script` WHERE `condition_id` = 409020) AND NOT EXISTS (SELECT 1 FROM (SELECT * FROM `conditions`) c WHERE c.`type` < 0 AND 409020 IN (c.`value1`, c.`value2`, c.`value3`, c.`value4`));
