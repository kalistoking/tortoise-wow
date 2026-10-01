-- Puts back what dire_maul_as_rows.sql replaced, as t1_world had it when the migration
-- was written (scripts/tier2/a26_dire_maul.py). The rows the migration added are removed.

UPDATE `creature_template` SET `ai_name` = '', `script_name` = 'boss_zevrim', `flags_extra` = 0, `faction` = 90, `gossip_menu_id` = 0, `scale` = 0 WHERE `entry` = 11490;
UPDATE `creature_template` SET `ai_name` = '', `script_name` = 'npc_ecorcefer', `flags_extra` = 0, `faction` = 35, `gossip_menu_id` = 0, `scale` = 0 WHERE `entry` = 11491;
UPDATE `creature_template` SET `ai_name` = '', `script_name` = 'boss_immol_thar', `flags_extra` = 2097152, `faction` = 754, `gossip_menu_id` = 0, `scale` = 0 WHERE `entry` = 11496;
UPDATE `creature_template` SET `ai_name` = '', `script_name` = 'boss_king_gordok', `flags_extra` = 2097152, `faction` = 45, `gossip_menu_id` = 0, `scale` = 0 WHERE `entry` = 11501;
UPDATE `creature_template` SET `ai_name` = '', `script_name` = 'npc_ecorcefer', `flags_extra` = 0, `faction` = 35, `gossip_menu_id` = 0, `scale` = 0 WHERE `entry` = 14241;
UPDATE `creature_template` SET `ai_name` = '', `script_name` = 'boss_chorush', `flags_extra` = 2097152, `faction` = 45, `gossip_menu_id` = 0, `scale` = 0 WHERE `entry` = 14324;
UPDATE `creature_template` SET `ai_name` = '', `script_name` = 'npc_pusillin', `flags_extra` = 2097152, `faction` = 90, `gossip_menu_id` = 0, `scale` = 1 WHERE `entry` = 14354;
DELETE FROM `conditions` WHERE `condition_entry` IN (429002, 429004, 429005, 429007, 429014, 429016, 429017, 429018, 429019, 429020);
DELETE FROM `broadcast_text` WHERE `entry` IN (1148910, 1150110);
DELETE FROM `creature_ai_events` WHERE `id` IN (1148910, 1148911, 1148912, 1148913, 1148914, 1148915, 1148916, 1149010, 1149011, 1149012, 1149101, 1149102, 1149610, 1149611, 1149612, 1149613, 1149614, 1149615, 1149616, 1150110, 1150111, 1150112, 1150113, 1150114, 1150115, 1432401, 1432402, 1432403, 1432404, 1432405, 1432410, 1432411, 1432412, 1432414, 1432415, 1432416, 1432417, 1432418, 1432419, 1432420, 1432421, 1432422, 1432423, 1432424, 1432425, 1432426, 1435401, 1435402);
DELETE FROM `creature_ai_scripts` WHERE `id` IN (1148910, 1148911, 1148912, 1148913, 1148914, 1148915, 1148916, 1149010, 1149011, 1149012, 1149101, 1149102, 1149610, 1149611, 1149612, 1149613, 1149614, 1149615, 1149616, 1150110, 1150111, 1150112, 1150113, 1150114, 1150115, 1432401, 1432402, 1432403, 1432404, 1432405, 1432410, 1432411, 1432412, 1432413, 1432414, 1432415, 1432416, 1432417, 1432418, 1432419, 1432420, 1432421, 1432422, 1432423, 1432424, 1432425, 1432426, 1435401, 1435402, 1435403, 1435404);
DELETE FROM `generic_scripts` WHERE `id` IN (1148950, 1148951, 1149650, 1432451, 1432452, 1432453, 1435450, 1435451, 1435452, 1435453, 1435454);
DELETE FROM `gossip_scripts` WHERE `id` IN (1424100, 1435400, 1435401, 1435402, 1435403, 1435404);
DELETE FROM `gossip_menu` WHERE `entry` = 1424100 AND `text_id` = 6695;
DELETE FROM `gossip_menu_option` WHERE `menu_id` = 1424100 AND `id` = 0;
DELETE FROM `gossip_menu` WHERE `entry` = 1435400 AND `text_id` = 6877;
DELETE FROM `gossip_menu_option` WHERE `menu_id` = 1435400 AND `id` = 0;
DELETE FROM `gossip_menu` WHERE `entry` = 1435401 AND `text_id` = 6878;
DELETE FROM `gossip_menu_option` WHERE `menu_id` = 1435401 AND `id` = 0;
DELETE FROM `gossip_menu` WHERE `entry` = 1435402 AND `text_id` = 6879;
DELETE FROM `gossip_menu_option` WHERE `menu_id` = 1435402 AND `id` = 0;
DELETE FROM `gossip_menu` WHERE `entry` = 1435403 AND `text_id` = 6880;
DELETE FROM `gossip_menu_option` WHERE `menu_id` = 1435403 AND `id` = 0;
DELETE FROM `gossip_menu` WHERE `entry` = 1435404 AND `text_id` = 6881;
DELETE FROM `gossip_menu_option` WHERE `menu_id` = 1435404 AND `id` = 0;
INSERT INTO `creature_ai_events`
(`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`)
VALUES
(1149001, 11490, 0, 0, 0, 100, 13, 5000, 9000, 20000, 26000, 1149001, 0, 0, 'Zevrim Thornhoof - Cast Intense Pain');

INSERT INTO `creature_ai_scripts`
(`id`, `delay`, `priority`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`)
VALUES
(1149001, 0, 0, 15, 22478, 0, 0, 0, 0, 0, 4, 8, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Zevrim Thornhoof - Cast Spell Intense Pain');

INSERT INTO `creature_ai_events`
(`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`)
VALUES
(1149002, 11490, 0, 0, 0, 100, 13, 9000, 12000, 15000, 18000, 1149002, 0, 0, 'Zevrim Thornhoof - Cast Sacrifice');

INSERT INTO `creature_ai_scripts`
(`id`, `delay`, `priority`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`)
VALUES
(1149002, 0, 0, 15, 22651, 1, 0, 0, 0, 0, 4, 8, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Zevrim Thornhoof - Cast Spell Sacrifice');

INSERT INTO `creature_ai_events`
(`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`)
VALUES
(1148905, 11489, 0, 6, 0, 100, 0, 0, 0, 0, 0, 1148905, 0, 0, 'Tendris Warpwood - Summon Ancient Equine Spirit on Death');

INSERT INTO `creature_ai_scripts`
(`id`, `delay`, `priority`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`)
VALUES
(1148905, 0, 0, 10, 14566, 120000, 0, 0, 0, 0, 0, 0, 0, 0, -1, 1, 63.5089, 492.417, -23.2966, 3.21228, 0, 'Tendris Warpwood - Summon Creature Ancient Equine Spirit');

INSERT INTO `creature_ai_events`
(`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`)
VALUES
(1149601, 11496, 0, 0, 0, 100, 13, 5000, 9000, 9000, 14000, 1149601, 0, 0, 'Immol''thar - Cast Trample');

INSERT INTO `creature_ai_scripts`
(`id`, `delay`, `priority`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`)
VALUES
(1149601, 0, 0, 15, 5568, 0, 0, 0, 0, 0, 0, 12, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Immol thar - Cast Spell Trample');

INSERT INTO `creature_ai_events`
(`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`)
VALUES
(1149602, 11496, 0, 0, 0, 100, 13, 2000, 4000, 8000, 12000, 1149602, 0, 0, 'Immol''thar - Cast Infected Bite');

INSERT INTO `creature_ai_scripts`
(`id`, `delay`, `priority`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`)
VALUES
(1149602, 0, 0, 15, 16128, 33, 0, 0, 0, 0, 1, 8, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Immol thar - Cast Spell Infected Bite');

INSERT INTO `creature_ai_events`
(`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`)
VALUES
(1149603, 11496, 0, 0, 0, 100, 13, 7000, 12000, 15000, 22000, 1149603, 0, 0, 'Immol''thar - Cast Eye of Immol''thar');

INSERT INTO `creature_ai_scripts`
(`id`, `delay`, `priority`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`)
VALUES
(1149603, 0, 0, 15, 22899, 1, 0, 0, 0, 0, 0, 12, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Immol thar - Cast Spell Eye of Immol thar');

INSERT INTO `creature_ai_events`
(`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`)
VALUES
(1149604, 11496, 0, 0, 0, 100, 13, 10000, 14000, 17000, 24000, 1149604, 0, 0, 'Immol''thar - Cast Portal of Immol''thar');

INSERT INTO `creature_ai_scripts`
(`id`, `delay`, `priority`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`)
VALUES
(1149604, 0, 0, 15, 22950, 1, 0, 0, 0, 0, 4, 8, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Immol thar - Cast Spell Portal of Immol thar');

INSERT INTO `creature_ai_events`
(`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`)
VALUES
(1149605, 11496, 0, 2, 0, 100, 4, 30, 0, 180000, 180000, 1149605, 0, 0, 'Immol''thar - Cast Frenzy at 30% HP');

INSERT INTO `creature_ai_scripts`
(`id`, `delay`, `priority`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`)
VALUES
(1149605, 0, 0, 15, 8269, 1, 0, 0, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Immol thar - Cast Spell Enrage'),
(1149605, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1191, 0, 0, 0, 0, 0, 0, 0, 0, 'Immol thar - Say Text');

INSERT INTO `creature_ai_events`
(`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`)
VALUES
(1150101, 11501, 0, 4, 0, 100, 0, 0, 0, 0, 0, 1150101, 0, 0, 'King Gordok - Cast Berserker Charge on Aggro');

INSERT INTO `creature_ai_scripts`
(`id`, `delay`, `priority`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`)
VALUES
(1150101, 0, 0, 15, 22886, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'King Gordok - Cast Spell Berserker Charge');

INSERT INTO `creature_ai_events`
(`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`)
VALUES
(1150102, 11501, 0, 0, 0, 100, 13, 5000, 7000, 9000, 14000, 1150102, 0, 0, 'King Gordok - Cast Mortal Strike');

INSERT INTO `creature_ai_scripts`
(`id`, `delay`, `priority`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`)
VALUES
(1150102, 0, 0, 15, 15708, 0, 0, 0, 0, 0, 1, 8, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'King Gordok - Cast Spell Mortal Strike');

INSERT INTO `creature_ai_events`
(`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`)
VALUES
(1150103, 11501, 0, 0, 0, 100, 13, 3000, 5000, 7000, 12000, 1150103, 0, 0, 'King Gordok - Cast Sunder Armor');

INSERT INTO `creature_ai_scripts`
(`id`, `delay`, `priority`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`)
VALUES
(1150103, 0, 0, 15, 15572, 1, 0, 0, 0, 0, 1, 8, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'King Gordok - Cast Spell Sunder Armor');

INSERT INTO `creature_ai_events`
(`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`)
VALUES
(1150104, 11501, 0, 0, 0, 100, 13, 12000, 15000, 17000, 24000, 1150104, 0, 0, 'King Gordok - Cast War Stomp');

INSERT INTO `creature_ai_scripts`
(`id`, `delay`, `priority`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`)
VALUES
(1150104, 0, 0, 15, 16727, 1, 0, 0, 0, 0, 0, 12, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'King Gordok - Cast Spell War Stomp');

INSERT INTO `creature_ai_events`
(`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`)
VALUES
(1150105, 11501, 0, 0, 0, 100, 13, 12000, 15000, 15000, 20000, 1150105, 0, 0, 'King Gordok - Cast Berserker Charge Random (Ustaag)');

INSERT INTO `creature_ai_scripts`
(`id`, `delay`, `priority`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`)
VALUES
(1150105, 0, 0, 15, 22886, 0, 0, 0, 0, 0, 5, 8, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'King Gordok - Cast Spell Berserker Charge');

INSERT INTO `creature_ai_events`
(`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`)
VALUES
(1150106, 11501, 0, 6, 0, 100, 0, 0, 0, 0, 0, 1150106, 0, 0, 'King Gordok - Cast spell 23318 on death (Ustaag)');

INSERT INTO `creature_ai_scripts`
(`id`, `delay`, `priority`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`)
VALUES
(1150106, 0, 0, 15, 23318, 3, 0, 0, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'King Gordok - Cast Spell Dragondog Breath Selection (L2)');

-- The shared conditions go only once nothing names them: the other migration that writes them is then not applied either.
DELETE FROM `conditions` WHERE `condition_entry` = 229243 AND NOT EXISTS (SELECT 1 FROM `creature_ai_events` WHERE `condition_id` = 229243) AND NOT EXISTS (SELECT 1 FROM `creature_ai_scripts` WHERE `condition_id` = 229243) AND NOT EXISTS (SELECT 1 FROM `generic_scripts` WHERE `condition_id` = 229243) AND NOT EXISTS (SELECT 1 FROM `gameobject_scripts` WHERE `condition_id` = 229243) AND NOT EXISTS (SELECT 1 FROM `gossip_scripts` WHERE `condition_id` = 229243) AND NOT EXISTS (SELECT 1 FROM `event_scripts` WHERE `condition_id` = 229243) AND NOT EXISTS (SELECT 1 FROM `creature_movement_scripts` WHERE `condition_id` = 229243) AND NOT EXISTS (SELECT 1 FROM `quest_start_scripts` WHERE `condition_id` = 229243) AND NOT EXISTS (SELECT 1 FROM `quest_end_scripts` WHERE `condition_id` = 229243) AND NOT EXISTS (SELECT 1 FROM `spell_scripts` WHERE `condition_id` = 229243) AND NOT EXISTS (SELECT 1 FROM `gossip_menu` WHERE `condition_id` = 229243) AND NOT EXISTS (SELECT 1 FROM `gossip_menu_option` WHERE `condition_id` = 229243) AND NOT EXISTS (SELECT 1 FROM `gameobject_spawn_state` WHERE `condition_id` = 229243) AND NOT EXISTS (SELECT 1 FROM `areatrigger_generic_script` WHERE `condition_id` = 229243) AND NOT EXISTS (SELECT 1 FROM (SELECT * FROM `conditions`) c WHERE c.`type` < 0 AND 229243 IN (c.`value1`, c.`value2`, c.`value3`, c.`value4`));
DELETE FROM `conditions` WHERE `condition_entry` = 229242 AND NOT EXISTS (SELECT 1 FROM `creature_ai_events` WHERE `condition_id` = 229242) AND NOT EXISTS (SELECT 1 FROM `creature_ai_scripts` WHERE `condition_id` = 229242) AND NOT EXISTS (SELECT 1 FROM `generic_scripts` WHERE `condition_id` = 229242) AND NOT EXISTS (SELECT 1 FROM `gameobject_scripts` WHERE `condition_id` = 229242) AND NOT EXISTS (SELECT 1 FROM `gossip_scripts` WHERE `condition_id` = 229242) AND NOT EXISTS (SELECT 1 FROM `event_scripts` WHERE `condition_id` = 229242) AND NOT EXISTS (SELECT 1 FROM `creature_movement_scripts` WHERE `condition_id` = 229242) AND NOT EXISTS (SELECT 1 FROM `quest_start_scripts` WHERE `condition_id` = 229242) AND NOT EXISTS (SELECT 1 FROM `quest_end_scripts` WHERE `condition_id` = 229242) AND NOT EXISTS (SELECT 1 FROM `spell_scripts` WHERE `condition_id` = 229242) AND NOT EXISTS (SELECT 1 FROM `gossip_menu` WHERE `condition_id` = 229242) AND NOT EXISTS (SELECT 1 FROM `gossip_menu_option` WHERE `condition_id` = 229242) AND NOT EXISTS (SELECT 1 FROM `gameobject_spawn_state` WHERE `condition_id` = 229242) AND NOT EXISTS (SELECT 1 FROM `areatrigger_generic_script` WHERE `condition_id` = 229242) AND NOT EXISTS (SELECT 1 FROM (SELECT * FROM `conditions`) c WHERE c.`type` < 0 AND 229242 IN (c.`value1`, c.`value2`, c.`value3`, c.`value4`));
DELETE FROM `conditions` WHERE `condition_entry` = 229241 AND NOT EXISTS (SELECT 1 FROM `creature_ai_events` WHERE `condition_id` = 229241) AND NOT EXISTS (SELECT 1 FROM `creature_ai_scripts` WHERE `condition_id` = 229241) AND NOT EXISTS (SELECT 1 FROM `generic_scripts` WHERE `condition_id` = 229241) AND NOT EXISTS (SELECT 1 FROM `gameobject_scripts` WHERE `condition_id` = 229241) AND NOT EXISTS (SELECT 1 FROM `gossip_scripts` WHERE `condition_id` = 229241) AND NOT EXISTS (SELECT 1 FROM `event_scripts` WHERE `condition_id` = 229241) AND NOT EXISTS (SELECT 1 FROM `creature_movement_scripts` WHERE `condition_id` = 229241) AND NOT EXISTS (SELECT 1 FROM `quest_start_scripts` WHERE `condition_id` = 229241) AND NOT EXISTS (SELECT 1 FROM `quest_end_scripts` WHERE `condition_id` = 229241) AND NOT EXISTS (SELECT 1 FROM `spell_scripts` WHERE `condition_id` = 229241) AND NOT EXISTS (SELECT 1 FROM `gossip_menu` WHERE `condition_id` = 229241) AND NOT EXISTS (SELECT 1 FROM `gossip_menu_option` WHERE `condition_id` = 229241) AND NOT EXISTS (SELECT 1 FROM `gameobject_spawn_state` WHERE `condition_id` = 229241) AND NOT EXISTS (SELECT 1 FROM `areatrigger_generic_script` WHERE `condition_id` = 229241) AND NOT EXISTS (SELECT 1 FROM (SELECT * FROM `conditions`) c WHERE c.`type` < 0 AND 229241 IN (c.`value1`, c.`value2`, c.`value3`, c.`value4`));
DELETE FROM `conditions` WHERE `condition_entry` = 229240 AND NOT EXISTS (SELECT 1 FROM `creature_ai_events` WHERE `condition_id` = 229240) AND NOT EXISTS (SELECT 1 FROM `creature_ai_scripts` WHERE `condition_id` = 229240) AND NOT EXISTS (SELECT 1 FROM `generic_scripts` WHERE `condition_id` = 229240) AND NOT EXISTS (SELECT 1 FROM `gameobject_scripts` WHERE `condition_id` = 229240) AND NOT EXISTS (SELECT 1 FROM `gossip_scripts` WHERE `condition_id` = 229240) AND NOT EXISTS (SELECT 1 FROM `event_scripts` WHERE `condition_id` = 229240) AND NOT EXISTS (SELECT 1 FROM `creature_movement_scripts` WHERE `condition_id` = 229240) AND NOT EXISTS (SELECT 1 FROM `quest_start_scripts` WHERE `condition_id` = 229240) AND NOT EXISTS (SELECT 1 FROM `quest_end_scripts` WHERE `condition_id` = 229240) AND NOT EXISTS (SELECT 1 FROM `spell_scripts` WHERE `condition_id` = 229240) AND NOT EXISTS (SELECT 1 FROM `gossip_menu` WHERE `condition_id` = 229240) AND NOT EXISTS (SELECT 1 FROM `gossip_menu_option` WHERE `condition_id` = 229240) AND NOT EXISTS (SELECT 1 FROM `gameobject_spawn_state` WHERE `condition_id` = 229240) AND NOT EXISTS (SELECT 1 FROM `areatrigger_generic_script` WHERE `condition_id` = 229240) AND NOT EXISTS (SELECT 1 FROM (SELECT * FROM `conditions`) c WHERE c.`type` < 0 AND 229240 IN (c.`value1`, c.`value2`, c.`value3`, c.`value4`));
DELETE FROM `conditions` WHERE `condition_entry` = 209012 AND NOT EXISTS (SELECT 1 FROM `creature_ai_events` WHERE `condition_id` = 209012) AND NOT EXISTS (SELECT 1 FROM `creature_ai_scripts` WHERE `condition_id` = 209012) AND NOT EXISTS (SELECT 1 FROM `generic_scripts` WHERE `condition_id` = 209012) AND NOT EXISTS (SELECT 1 FROM `gameobject_scripts` WHERE `condition_id` = 209012) AND NOT EXISTS (SELECT 1 FROM `gossip_scripts` WHERE `condition_id` = 209012) AND NOT EXISTS (SELECT 1 FROM `event_scripts` WHERE `condition_id` = 209012) AND NOT EXISTS (SELECT 1 FROM `creature_movement_scripts` WHERE `condition_id` = 209012) AND NOT EXISTS (SELECT 1 FROM `quest_start_scripts` WHERE `condition_id` = 209012) AND NOT EXISTS (SELECT 1 FROM `quest_end_scripts` WHERE `condition_id` = 209012) AND NOT EXISTS (SELECT 1 FROM `spell_scripts` WHERE `condition_id` = 209012) AND NOT EXISTS (SELECT 1 FROM `gossip_menu` WHERE `condition_id` = 209012) AND NOT EXISTS (SELECT 1 FROM `gossip_menu_option` WHERE `condition_id` = 209012) AND NOT EXISTS (SELECT 1 FROM `gameobject_spawn_state` WHERE `condition_id` = 209012) AND NOT EXISTS (SELECT 1 FROM `areatrigger_generic_script` WHERE `condition_id` = 209012) AND NOT EXISTS (SELECT 1 FROM (SELECT * FROM `conditions`) c WHERE c.`type` < 0 AND 209012 IN (c.`value1`, c.`value2`, c.`value3`, c.`value4`));
DELETE FROM `conditions` WHERE `condition_entry` = 189002 AND NOT EXISTS (SELECT 1 FROM `creature_ai_events` WHERE `condition_id` = 189002) AND NOT EXISTS (SELECT 1 FROM `creature_ai_scripts` WHERE `condition_id` = 189002) AND NOT EXISTS (SELECT 1 FROM `generic_scripts` WHERE `condition_id` = 189002) AND NOT EXISTS (SELECT 1 FROM `gameobject_scripts` WHERE `condition_id` = 189002) AND NOT EXISTS (SELECT 1 FROM `gossip_scripts` WHERE `condition_id` = 189002) AND NOT EXISTS (SELECT 1 FROM `event_scripts` WHERE `condition_id` = 189002) AND NOT EXISTS (SELECT 1 FROM `creature_movement_scripts` WHERE `condition_id` = 189002) AND NOT EXISTS (SELECT 1 FROM `quest_start_scripts` WHERE `condition_id` = 189002) AND NOT EXISTS (SELECT 1 FROM `quest_end_scripts` WHERE `condition_id` = 189002) AND NOT EXISTS (SELECT 1 FROM `spell_scripts` WHERE `condition_id` = 189002) AND NOT EXISTS (SELECT 1 FROM `gossip_menu` WHERE `condition_id` = 189002) AND NOT EXISTS (SELECT 1 FROM `gossip_menu_option` WHERE `condition_id` = 189002) AND NOT EXISTS (SELECT 1 FROM `gameobject_spawn_state` WHERE `condition_id` = 189002) AND NOT EXISTS (SELECT 1 FROM `areatrigger_generic_script` WHERE `condition_id` = 189002) AND NOT EXISTS (SELECT 1 FROM (SELECT * FROM `conditions`) c WHERE c.`type` < 0 AND 189002 IN (c.`value1`, c.`value2`, c.`value3`, c.`value4`));
DELETE FROM `conditions` WHERE `condition_entry` = 33003 AND NOT EXISTS (SELECT 1 FROM `creature_ai_events` WHERE `condition_id` = 33003) AND NOT EXISTS (SELECT 1 FROM `creature_ai_scripts` WHERE `condition_id` = 33003) AND NOT EXISTS (SELECT 1 FROM `generic_scripts` WHERE `condition_id` = 33003) AND NOT EXISTS (SELECT 1 FROM `gameobject_scripts` WHERE `condition_id` = 33003) AND NOT EXISTS (SELECT 1 FROM `gossip_scripts` WHERE `condition_id` = 33003) AND NOT EXISTS (SELECT 1 FROM `event_scripts` WHERE `condition_id` = 33003) AND NOT EXISTS (SELECT 1 FROM `creature_movement_scripts` WHERE `condition_id` = 33003) AND NOT EXISTS (SELECT 1 FROM `quest_start_scripts` WHERE `condition_id` = 33003) AND NOT EXISTS (SELECT 1 FROM `quest_end_scripts` WHERE `condition_id` = 33003) AND NOT EXISTS (SELECT 1 FROM `spell_scripts` WHERE `condition_id` = 33003) AND NOT EXISTS (SELECT 1 FROM `gossip_menu` WHERE `condition_id` = 33003) AND NOT EXISTS (SELECT 1 FROM `gossip_menu_option` WHERE `condition_id` = 33003) AND NOT EXISTS (SELECT 1 FROM `gameobject_spawn_state` WHERE `condition_id` = 33003) AND NOT EXISTS (SELECT 1 FROM `areatrigger_generic_script` WHERE `condition_id` = 33003) AND NOT EXISTS (SELECT 1 FROM (SELECT * FROM `conditions`) c WHERE c.`type` < 0 AND 33003 IN (c.`value1`, c.`value2`, c.`value3`, c.`value4`));
