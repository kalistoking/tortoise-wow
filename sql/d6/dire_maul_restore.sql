-- Puts back what dire_maul_as_rows.sql replaced, as d6_world had it when the migration
-- was written (scripts/tier2/a26_dire_maul.py). The rows the migration added are removed.

UPDATE `creature_template` SET `ai_name` = '', `script_name` = 'npc_gordok_brute', `flags_extra` = 0, `faction` = 45, `gossip_menu_id` = 5746, `npc_flags` = 1, `scale` = 0 WHERE `entry` = 11441;
UPDATE `creature_template` SET `ai_name` = '', `script_name` = 'npc_arcane_aberration', `flags_extra` = 32, `faction` = 834, `gossip_menu_id` = 0, `npc_flags` = 0, `scale` = 0 WHERE `entry` = 11480;
UPDATE `creature_template` SET `ai_name` = '', `script_name` = 'npc_reste_mana', `flags_extra` = 32, `faction` = 834, `gossip_menu_id` = 0, `npc_flags` = 0, `scale` = 0 WHERE `entry` = 11483;
UPDATE `creature_template` SET `ai_name` = 'EventAI', `script_name` = 'npc_residual_montruosity', `flags_extra` = 32, `faction` = 834, `gossip_menu_id` = 0, `npc_flags` = 0, `scale` = 0 WHERE `entry` = 11484;
UPDATE `creature_template` SET `ai_name` = '', `script_name` = 'boss_prince_tortheldrin', `flags_extra` = 2, `faction` = 1354, `gossip_menu_id` = 0, `npc_flags` = 0, `scale` = 0 WHERE `entry` = 11486;
UPDATE `creature_template` SET `ai_name` = '', `script_name` = 'boss_magister_kalendris', `flags_extra` = 0, `faction` = 16, `gossip_menu_id` = 0, `npc_flags` = 0, `scale` = 0 WHERE `entry` = 11487;
UPDATE `creature_template` SET `ai_name` = '', `script_name` = 'boss_zevrim', `flags_extra` = 0, `faction` = 90, `gossip_menu_id` = 0, `npc_flags` = 0, `scale` = 0 WHERE `entry` = 11490;
UPDATE `creature_template` SET `ai_name` = '', `script_name` = 'npc_ecorcefer', `flags_extra` = 0, `faction` = 35, `gossip_menu_id` = 0, `npc_flags` = 1, `scale` = 0 WHERE `entry` = 11491;
UPDATE `creature_template` SET `ai_name` = '', `script_name` = 'boss_alzzin_the_wildshaper', `flags_extra` = 0, `faction` = 90, `gossip_menu_id` = 0, `npc_flags` = 0, `scale` = 0 WHERE `entry` = 11492;
UPDATE `creature_template` SET `ai_name` = '', `script_name` = 'boss_immol_thar', `flags_extra` = 2097152, `faction` = 754, `gossip_menu_id` = 0, `npc_flags` = 0, `scale` = 0 WHERE `entry` = 11496;
UPDATE `creature_template` SET `ai_name` = '', `script_name` = 'boss_king_gordok', `flags_extra` = 2097152, `faction` = 45, `gossip_menu_id` = 0, `npc_flags` = 0, `scale` = 0 WHERE `entry` = 11501;
UPDATE `creature_template` SET `ai_name` = '', `script_name` = 'npc_ecorcefer', `flags_extra` = 0, `faction` = 35, `gossip_menu_id` = 0, `npc_flags` = 1, `scale` = 0 WHERE `entry` = 14241;
UPDATE `creature_template` SET `ai_name` = '', `script_name` = 'boss_ferra', `flags_extra` = 0, `faction` = 16, `gossip_menu_id` = 0, `npc_flags` = 0, `scale` = 0 WHERE `entry` = 14308;
UPDATE `creature_template` SET `ai_name` = '', `script_name` = 'boss_guards', `flags_extra` = 0, `faction` = 45, `gossip_menu_id` = 5734, `npc_flags` = 1, `scale` = 0 WHERE `entry` = 14321;
UPDATE `creature_template` SET `ai_name` = '', `script_name` = 'boss_guards', `flags_extra` = 0, `faction` = 45, `gossip_menu_id` = 5733, `npc_flags` = 1, `scale` = 0 WHERE `entry` = 14323;
UPDATE `creature_template` SET `ai_name` = '', `script_name` = 'boss_chorush', `flags_extra` = 2097152, `faction` = 45, `gossip_menu_id` = 0, `npc_flags` = 1, `scale` = 0 WHERE `entry` = 14324;
UPDATE `creature_template` SET `ai_name` = '', `script_name` = 'boss_kromcrush', `flags_extra` = 0, `faction` = 1374, `gossip_menu_id` = 5739, `npc_flags` = 3, `scale` = 0 WHERE `entry` = 14325;
UPDATE `creature_template` SET `ai_name` = '', `script_name` = 'boss_guards', `flags_extra` = 0, `faction` = 45, `gossip_menu_id` = 5735, `npc_flags` = 3, `scale` = 0 WHERE `entry` = 14326;
UPDATE `creature_template` SET `ai_name` = '', `script_name` = 'npc_knot_thimblejack', `flags_extra` = 2, `faction` = 35, `gossip_menu_id` = 0, `npc_flags` = 2, `scale` = 0 WHERE `entry` = 14338;
UPDATE `creature_template` SET `ai_name` = '', `script_name` = 'npc_mizzle_the_crafty', `flags_extra` = 2097154, `faction` = 35, `gossip_menu_id` = 0, `npc_flags` = 0, `scale` = 1.4 WHERE `entry` = 14353;
UPDATE `creature_template` SET `ai_name` = '', `script_name` = 'npc_pusillin', `flags_extra` = 2097152, `faction` = 90, `gossip_menu_id` = 0, `npc_flags` = 3, `scale` = 1 WHERE `entry` = 14354;
UPDATE `creature_template` SET `ai_name` = 'EventAI', `script_name` = 'boss_xorothian_dreadsteed', `flags_extra` = 0, `faction` = 90, `gossip_menu_id` = 0, `npc_flags` = 0, `scale` = 0 WHERE `entry` = 14502;
UPDATE `creature_template` SET `ai_name` = '', `script_name` = 'boss_lord_hel_nurath', `flags_extra` = 0, `faction` = 90, `gossip_menu_id` = 0, `npc_flags` = 0, `scale` = 0 WHERE `entry` = 14506;
DELETE FROM `conditions` WHERE `condition_entry` IN (429002, 429004, 429005, 429007, 429014, 429016, 429017, 429018, 429019, 429020, 429022, 429023, 429024, 429038, 429039, 429040, 429041, 429042, 429043, 429045, 429052, 429054, 429055, 429056, 429057, 429058, 429059, 429064, 429065, 429066, 429067, 429069, 429070, 429071, 429072, 429073, 429074, 429075, 429076, 429077, 429078, 429079, 429082, 429083, 429084, 429085, 429086, 429087, 429088, 429089, 429090, 429091, 429093, 429096, 429097, 429098, 429100, 429101, 429102, 429103, 429104, 429105, 429106, 429107, 429108, 429109, 429110, 429111, 429112, 429113, 429114, 429115, 429116, 429117, 429118);
DELETE FROM `broadcast_text` WHERE `entry` IN (1148910, 1150110, 4295110, 4295120, 4295130, 4295140, 4295150, 4295160, 4295170, 4295180, 4295190, 4295200, 4295210, 4295220, 4295230, 4295240, 4295250, 4295260);
DELETE FROM `creature_ai_events` WHERE `id` IN (1144160, 1144163, 1144164, 1144165, 1144166, 1144167, 1144168, 1148060, 1148061, 1148062, 1148360, 1148361, 1148362, 1148460, 1148461, 1148462, 1148660, 1148661, 1148662, 1148663, 1148664, 1148665, 1148666, 1148760, 1148761, 1148762, 1148763, 1148764, 1148765, 1148766, 1148767, 1148768, 1148910, 1148911, 1148912, 1148913, 1148914, 1148915, 1148916, 1149010, 1149011, 1149012, 1149101, 1149102, 1149260, 1149262, 1149264, 1149266, 1149267, 1149268, 1149269, 1149270, 1149271, 1149272, 1149273, 1149274, 1149275, 1149276, 1149277, 1149278, 1149279, 1149280, 1149281, 1149282, 1149283, 1149610, 1149611, 1149612, 1149613, 1149614, 1149615, 1149616, 1149660, 1149661, 1150110, 1150111, 1150112, 1150113, 1150114, 1150115, 1150160, 1430860, 1430861, 1430862, 1432160, 1432161, 1432162, 1432163, 1432164, 1432165, 1432166, 1432167, 1432168, 1432169, 1432260, 1432360, 1432361, 1432362, 1432363, 1432364, 1432365, 1432366, 1432367, 1432368, 1432369, 1432370, 1432371, 1432372, 1432401, 1432402, 1432403, 1432404, 1432405, 1432410, 1432411, 1432412, 1432414, 1432415, 1432416, 1432417, 1432418, 1432419, 1432420, 1432421, 1432422, 1432423, 1432424, 1432425, 1432426, 1432460, 1432461, 1432462, 1432560, 1432561, 1432562, 1432563, 1432564, 1432565, 1432566, 1432567, 1432568, 1432660, 1432661, 1432662, 1432663, 1432664, 1432665, 1432666, 1432667, 1432668, 1432669, 1432670, 1435360, 1435361, 1435401, 1435402, 1450260, 1450261, 1450660, 1450661, 1450662, 1450663);
DELETE FROM `creature_ai_scripts` WHERE `id` IN (1144160, 1144161, 1144162, 1144163, 1144164, 1144165, 1144166, 1144167, 1144168, 1148060, 1148061, 1148062, 1148360, 1148361, 1148362, 1148460, 1148461, 1148462, 1148660, 1148661, 1148662, 1148663, 1148664, 1148665, 1148666, 1148760, 1148761, 1148762, 1148763, 1148764, 1148765, 1148766, 1148767, 1148768, 1148910, 1148911, 1148912, 1148913, 1148914, 1148915, 1148916, 1149010, 1149011, 1149012, 1149101, 1149102, 1149260, 1149261, 1149262, 1149263, 1149264, 1149265, 1149266, 1149267, 1149268, 1149269, 1149270, 1149271, 1149272, 1149273, 1149274, 1149275, 1149276, 1149277, 1149278, 1149279, 1149280, 1149281, 1149282, 1149283, 1149610, 1149611, 1149612, 1149613, 1149614, 1149615, 1149616, 1149660, 1149661, 1150110, 1150111, 1150112, 1150113, 1150114, 1150115, 1150160, 1430860, 1430861, 1430862, 1432160, 1432161, 1432162, 1432163, 1432164, 1432165, 1432166, 1432167, 1432168, 1432169, 1432260, 1432360, 1432361, 1432362, 1432363, 1432364, 1432365, 1432366, 1432367, 1432368, 1432369, 1432370, 1432371, 1432372, 1432401, 1432402, 1432403, 1432404, 1432405, 1432410, 1432411, 1432412, 1432413, 1432414, 1432415, 1432416, 1432417, 1432418, 1432419, 1432420, 1432421, 1432422, 1432423, 1432424, 1432425, 1432426, 1432460, 1432461, 1432462, 1432560, 1432561, 1432562, 1432563, 1432564, 1432565, 1432566, 1432567, 1432568, 1432660, 1432661, 1432662, 1432663, 1432664, 1432665, 1432666, 1432667, 1432668, 1432669, 1432670, 1435360, 1435361, 1435401, 1435402, 1435403, 1435404, 1450260, 1450261, 1450660, 1450661, 1450662, 1450663);
DELETE FROM `generic_scripts` WHERE `id` IN (1148950, 1148951, 1149650, 1432451, 1432452, 1432453, 1435450, 1435451, 1435452, 1435453, 1435454, 4295001, 4295002, 4295003, 4295004, 4295005, 4295006, 4295007, 4295008, 4295009, 4295010, 4295011, 4295012, 4295013, 4295015, 4295016, 4295017, 4295018, 4295019, 4295020, 4295021, 4295022, 4295023, 4295024, 4295025, 4295026, 4295027, 4295028, 4295029, 4295030, 4295031, 4295032, 4295033, 4295034, 4295035, 4295036, 4295037, 4295038, 4295039, 4295040, 4295041, 4295042, 4295043, 4295044, 4295045, 4295046, 4295047, 4295048, 4295049, 4295050, 4295051, 4295052, 4295053, 4295054, 4295055, 4295056, 4295057, 4295058, 4295059, 4295060, 4295061, 4295062, 4295063, 4295064, 4295065, 4295066, 4295067, 4295068, 4295069);
DELETE FROM `gameobject_scripts` WHERE `id` IN (99785, 99786, 99787, 325544, 325545, 325546, 325547, 325548, 325549, 325550, 325551, 325552, 325553, 325554, 325555, 325556, 325557, 325558, 325559, 325560, 325561, 325562, 325563, 325564, 325565, 325566, 325567, 325568, 325569, 325570, 325571, 325572, 325573);
DELETE FROM `gossip_scripts` WHERE `id` IN (1424100, 1435400, 1435401, 1435402, 1435403, 1435404, 14321000, 14323000, 14325110, 14325120, 14326000, 14338001, 14338002, 14353010, 14353020);
DELETE FROM `event_scripts` WHERE `id` IN (8420, 8428);
DELETE FROM `quest_end_scripts` WHERE `id` IN (1193, 5525, 7429);
UPDATE `creature_ai_events` SET `condition_id` = 0 WHERE `id` = 1432206;
UPDATE `quest_template` SET `CompleteScript` = 0 WHERE `entry` = 1193;
UPDATE `quest_template` SET `CompleteScript` = 5525 WHERE `entry` = 5525;
UPDATE `quest_template` SET `CompleteScript` = 7429 WHERE `entry` = 7429;
DELETE FROM `gameobject_spawn_state` WHERE `guid` = 264399 AND `ord` = 0;
DELETE FROM `gameobject_spawn_state` WHERE `guid` = 397151 AND `ord` = 0;
DELETE FROM `gameobject_spawn_state` WHERE `guid` = 261760 AND `ord` = 0;
DELETE FROM `gameobject_spawn_state` WHERE `guid` = 261762 AND `ord` = 0;
DELETE FROM `gameobject_spawn_state` WHERE `guid` = 262113 AND `ord` = 0;
DELETE FROM `gameobject_spawn_state` WHERE `guid` = 262115 AND `ord` = 0;
DELETE FROM `gameobject_spawn_state` WHERE `guid` = 262117 AND `ord` = 0;
DELETE FROM `gameobject_spawn_state` WHERE `guid` = 396405 AND `ord` = 0;
DELETE FROM `gameobject_spawn_state` WHERE `guid` = 397147 AND `ord` = 0;
DELETE FROM `gameobject_spawn_state` WHERE `guid` = 397167 AND `ord` = 0;
DELETE FROM `instance_data_slot` WHERE `map` = 429 AND `slot` = 1;
DELETE FROM `instance_data_slot` WHERE `map` = 429 AND `slot` = 2;
DELETE FROM `instance_data_slot` WHERE `map` = 429 AND `slot` = 3;
DELETE FROM `instance_data_slot` WHERE `map` = 429 AND `slot` = 4;
DELETE FROM `instance_data_slot` WHERE `map` = 429 AND `slot` = 5;
DELETE FROM `instance_data_slot` WHERE `map` = 429 AND `slot` = 6;
DELETE FROM `instance_data_slot` WHERE `map` = 429 AND `slot` = 7;
DELETE FROM `instance_data_slot` WHERE `map` = 429 AND `slot` = 8;
DELETE FROM `instance_data_slot` WHERE `map` = 429 AND `slot` = 9;
DELETE FROM `instance_data_slot` WHERE `map` = 429 AND `slot` = 10;
DELETE FROM `instance_data_slot` WHERE `map` = 429 AND `slot` = 11;
DELETE FROM `instance_data_slot` WHERE `map` = 429 AND `slot` = 13;
DELETE FROM `instance_data_slot` WHERE `map` = 429 AND `slot` = 15;
DELETE FROM `instance_data_slot` WHERE `map` = 429 AND `slot` = 16;
DELETE FROM `instance_data_slot` WHERE `map` = 429 AND `slot` = 17;
DELETE FROM `instance_data_slot` WHERE `map` = 429 AND `slot` = 18;
DELETE FROM `instance_data_slot` WHERE `map` = 429 AND `slot` = 19;
DELETE FROM `instance_data_slot` WHERE `map` = 429 AND `slot` = 20;
DELETE FROM `instance_data_slot` WHERE `map` = 429 AND `slot` = 21;
DELETE FROM `instance_data_slot` WHERE `map` = 429 AND `slot` = 22;
DELETE FROM `instance_data_slot` WHERE `map` = 429 AND `slot` = 23;
DELETE FROM `instance_data_slot` WHERE `map` = 429 AND `slot` = 24;
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
DELETE FROM `gossip_menu` WHERE `entry` = 1432601 AND `text_id` = 6908;
DELETE FROM `gossip_menu` WHERE `entry` = 1432600 AND `text_id` = 6907;
DELETE FROM `gossip_menu_option` WHERE `menu_id` = 1432600 AND `id` = 0;
DELETE FROM `gossip_menu` WHERE `entry` = 1432101 AND `text_id` = 6904;
DELETE FROM `gossip_menu` WHERE `entry` = 1432100 AND `text_id` = 6903;
DELETE FROM `gossip_menu_option` WHERE `menu_id` = 1432100 AND `id` = 0;
DELETE FROM `gossip_menu` WHERE `entry` = 1432301 AND `text_id` = 6906;
DELETE FROM `gossip_menu` WHERE `entry` = 1432300 AND `text_id` = 6905;
DELETE FROM `gossip_menu_option` WHERE `menu_id` = 1432300 AND `id` = 0;
DELETE FROM `gossip_menu` WHERE `entry` = 1432500 AND `text_id` = 6913;
DELETE FROM `gossip_menu` WHERE `entry` = 1432500 AND `text_id` = 6914;
DELETE FROM `gossip_menu_option` WHERE `menu_id` = 1432500 AND `id` = 0;
DELETE FROM `gossip_menu_option` WHERE `menu_id` = 1432500 AND `id` = 1;
DELETE FROM `gossip_menu` WHERE `entry` = 1432511 AND `text_id` = 6915;
DELETE FROM `gossip_menu_option` WHERE `menu_id` = 1432511 AND `id` = 0;
DELETE FROM `gossip_menu` WHERE `entry` = 1432512 AND `text_id` = 6920;
DELETE FROM `gossip_menu_option` WHERE `menu_id` = 1432512 AND `id` = 0;
DELETE FROM `gossip_menu` WHERE `entry` = 1435301 AND `text_id` = 6882;
DELETE FROM `gossip_menu_option` WHERE `menu_id` = 1435301 AND `id` = 0;
DELETE FROM `gossip_menu` WHERE `entry` = 1435302 AND `text_id` = 6916;
DELETE FROM `gossip_menu_option` WHERE `menu_id` = 1435302 AND `id` = 0;
DELETE FROM `gossip_menu` WHERE `entry` = 1435300 AND `text_id` = 6876;
DELETE FROM `gossip_menu` WHERE `entry` = 1435300 AND `text_id` = 6895;
DELETE FROM `gossip_menu_option` WHERE `menu_id` = 1435300 AND `id` = 0;
DELETE FROM `gossip_menu_option` WHERE `menu_id` = 1435300 AND `id` = 1;
DELETE FROM `map_player_script` WHERE `map_id` = 429 AND `event` = 1 AND `script_id` = 4295012;
DELETE FROM `gossip_menu` WHERE `entry` = 1433801 AND `text_id` = 6883;
DELETE FROM `gossip_menu` WHERE `entry` = 1433800 AND `text_id` = 6795;
DELETE FROM `gossip_menu_option` WHERE `menu_id` = 1433800 AND `id` = 0;
DELETE FROM `gossip_menu_option` WHERE `menu_id` = 1433800 AND `id` = 1;
DELETE FROM `gossip_menu_option` WHERE `menu_id` = 1433800 AND `id` = 2;
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

INSERT INTO `creature_ai_events`
(`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`)
VALUES
(1148301, 11483, 0, 0, 0, 100, 13, 15000, 25000, 15000, 25000, 1148301, 0, 0, 'Mana Remnant - Cast Blink on Aggro');

INSERT INTO `creature_ai_scripts`
(`id`, `delay`, `priority`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`)
VALUES
(1148301, 0, 0, 15, 14514, 0, 0, 0, 0, 0, 0, 12, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Mana Remnant - Cast Spell Blink');

INSERT INTO `creature_ai_events`
(`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`)
VALUES
(1148302, 11483, 0, 0, 0, 100, 13, 6000, 9000, 11000, 15000, 1148302, 0, 0, 'Mana Remnant - Cast Chain Lightning');

INSERT INTO `creature_ai_scripts`
(`id`, `delay`, `priority`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`)
VALUES
(1148302, 0, 0, 15, 15659, 0, 0, 0, 0, 0, 1, 8, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Mana Remnant - Cast Spell Chain Lightning');

INSERT INTO `creature_ai_events`
(`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`)
VALUES
(1148001, 11480, 0, 9, 0, 100, 13, 0, 40, 2400, 3800, 1148001, 0, 0, 'Arcane Aberration - Cast Arcane Bolt');

INSERT INTO `creature_ai_scripts`
(`id`, `delay`, `priority`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`)
VALUES
(1148001, 0, 0, 15, 15979, 0, 0, 0, 0, 0, 1, 8, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Arcane Aberration - Cast Spell Arcane Bolt');

INSERT INTO `creature_ai_events`
(`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`)
VALUES
(1148002, 11480, 0, 6, 0, 100, 0, 0, 0, 0, 0, 1148002, 0, 0, 'Arcane Aberration - Cast Mana Burn on Death');

INSERT INTO `creature_ai_scripts`
(`id`, `delay`, `priority`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`)
VALUES
(1148002, 0, 0, 15, 22936, 7, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Arcane Aberration - Cast Spell Mana Burn');

INSERT INTO `creature_ai_events`
(`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`)
VALUES
(1148403, 11484, 0, 6, 0, 100, 0, 0, 0, 0, 0, 1148403, 0, 0, 'Residual Monstrosity - Summon Mana Bursts on Death');

INSERT INTO `creature_ai_scripts`
(`id`, `delay`, `priority`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`)
VALUES
(1148403, 0, 0, 15, 22939, 7, 0, 0, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Residual Monstrosity - Cast Spell Summon Mana Bursts');

INSERT INTO `creature_ai_events`
(`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`)
VALUES
(1148606, 11486, 0, 9, 0, 100, 13, 25, 50000, 5000, 5000, 1148606, 0, 0, 'Prince Tortheldrin - Cast Summon');

INSERT INTO `creature_ai_scripts`
(`id`, `delay`, `priority`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`)
VALUES
(1148606, 0, 0, 15, 22995, 1, 0, 0, 0, 0, 1, 8, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Prince Tortheldrin - Cast Spell Summon');

INSERT INTO `creature_ai_events`
(`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`)
VALUES
(1146001, 11460, 0, 11, 0, 100, 1, 0, 0, 0, 0, 1146001, 0, 0, 'Alzzin''s Minion - cast 33025 Event 9547 move (Ustaag)');

INSERT INTO `creature_ai_scripts`
(`id`, `delay`, `priority`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`)
VALUES
(1146001, 0, 0, 15, 33025, 4, 0, 0, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Alzzin s Minion - Cast Spell CustomSpell');

INSERT INTO `creature_ai_events`
(`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`)
VALUES
(1432504, 14325, 0, 2, 13, 100, 0, 75, 0, 0, 0, 1432504, 0, 0, 'Captain Kromcrush - Cast Call Reavers at 75% HP + set phase 2 (Ustaag) - Phase 1');

INSERT INTO `creature_ai_scripts`
(`id`, `delay`, `priority`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`)
VALUES
(1432504, 0, 0, 15, 22860, 1, 0, 0, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Captain Kromcrush - Cast Spell Call Reavers'),
(1432504, 0, 0, 44, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Captain Kromcrush - Set Phase to 2');

INSERT INTO `creature_ai_events`
(`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`)
VALUES
(1432503, 14325, 0, 0, 0, 100, 13, 9000, 18000, 15000, 19000, 1432503, 0, 0, 'Captain Kromcrush - Cast Frightening Shout (Ustaag)');

INSERT INTO `creature_ai_scripts`
(`id`, `delay`, `priority`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`)
VALUES
(1432503, 0, 0, 15, 19134, 1, 0, 0, 0, 0, 5, 8, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Captain Kromcrush - Cast Spell Intimidating Shout');

INSERT INTO `creature_ai_events`
(`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`)
VALUES
(1432309, 14323, 0, 4, 0, 100, 0, 0, 0, 0, 0, 1432309, 0, 0, 'Guard Slipkik - Zone Combat Pulse on Aggro');

INSERT INTO `creature_ai_scripts`
(`id`, `delay`, `priority`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`)
VALUES
(1432309, 0, 0, 49, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Guard Slip kik - Combat Pulse');

INSERT INTO `creature_ai_events`
(`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`)
VALUES
(1148604, 11486, 0, 0, 0, 15, 13, 1158, 1158, 1158, 1158, 1148604, 0, 0, 'Prince Tortheldrin - Cast Thrash');

INSERT INTO `creature_ai_scripts`
(`id`, `delay`, `priority`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`)
VALUES
(1148604, 0, 0, 15, 3391, 0, 0, 0, 0, 0, 0, 12, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Prince Tortheldrin - Cast Spell Thrash');

INSERT INTO `creature_ai_events`
(`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`)
VALUES
(1148603, 11486, 0, 0, 0, 100, 1, 8000, 12000, 10000, 12000, 1148603, 0, 0, 'Prince Tortheldrin - Cast Arcane Blast');

INSERT INTO `creature_ai_scripts`
(`id`, `delay`, `priority`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`)
VALUES
(1148603, 0, 0, 15, 22920, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Prince Tortheldrin - Cast Spell Arcane Blast'),
(1148603, 0, 0, 29, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 50, 0, 0, 0, 0, 'Prince Tortheldrin - Reduce Target Threat by 50.000000%');

INSERT INTO `creature_ai_events`
(`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`)
VALUES
(1148602, 11486, 0, 0, 0, 100, 13, 5000, 9000, 6000, 9000, 1148602, 0, 0, 'Prince Tortheldrin - Cast Whirlwind');

INSERT INTO `creature_ai_scripts`
(`id`, `delay`, `priority`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`)
VALUES
(1148602, 0, 0, 15, 15589, 0, 0, 0, 0, 0, 0, 12, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Prince Tortheldrin - Cast Spell Whirlwind');

INSERT INTO `creature_ai_events`
(`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`)
VALUES
(1148601, 11486, 0, 4, 0, 100, 0, 0, 0, 0, 0, 1148601, 0, 0, 'Prince Tortheldrin - Yell on Aggro');

INSERT INTO `creature_ai_scripts`
(`id`, `delay`, `priority`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`)
VALUES
(1148601, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 9407, 0, 0, 0, 0, 0, 0, 0, 0, 'Prince Tortheldrin - Say Text');

INSERT INTO `creature_ai_events`
(`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`)
VALUES
(1148702, 11487, 0, 0, 0, 100, 13, 5000, 9000, 20000, 24000, 1148702, 0, 0, 'Magister Kalendris - Cast Shadow Word: Pain');

INSERT INTO `creature_ai_scripts`
(`id`, `delay`, `priority`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`)
VALUES
(1148702, 0, 0, 15, 17146, 1, 0, 0, 0, 0, 4, 8, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Magister Kalendris - Cast Spell Shadow Word: Pain');

INSERT INTO `creature_ai_events`
(`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`)
VALUES
(1148706, 11487, 0, 2, 0, 100, 0, 30, 0, 0, 0, 1148706, 0, 0, 'Magister Kalendris - Cast Remove Shadowform at 30% HP');

INSERT INTO `creature_ai_scripts`
(`id`, `delay`, `priority`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`)
VALUES
(1148706, 0, 0, 14, 22917, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Magister Kalendris - Remove Aura Shadowform');

INSERT INTO `creature_ai_events`
(`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`)
VALUES
(1148705, 11487, 0, 2, 0, 100, 0, 60, 0, 0, 0, 1148705, 0, 0, 'Magister Kalendris - Cast Shadowform at 60% HP');

INSERT INTO `creature_ai_scripts`
(`id`, `delay`, `priority`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`)
VALUES
(1148705, 0, 0, 15, 22917, 1, 0, 0, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Magister Kalendris - Cast Spell Shadowform');

INSERT INTO `creature_ai_events`
(`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`)
VALUES
(1148704, 11487, 0, 0, 0, 100, 13, 8000, 12000, 15000, 20000, 1148704, 0, 0, 'Magister Kalendris - Cast Dominate Mind');

INSERT INTO `creature_ai_scripts`
(`id`, `delay`, `priority`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`)
VALUES
(1148704, 0, 0, 15, 7645, 1, 0, 0, 0, 0, 5, 8, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Magister Kalendris - Cast Spell Dominate Mind');

INSERT INTO `creature_ai_events`
(`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`)
VALUES
(1148703, 11487, 0, 0, 0, 100, 13, 7000, 10000, 9000, 12000, 1148703, 0, 0, 'Magister Kalendris - Cast Mind Flay');

INSERT INTO `creature_ai_scripts`
(`id`, `delay`, `priority`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`)
VALUES
(1148703, 0, 0, 15, 22919, 0, 0, 0, 0, 0, 4, 8, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Magister Kalendris - Cast Spell Mind Flay');

INSERT INTO `creature_ai_events`
(`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`)
VALUES
(1148701, 11487, 0, 0, 0, 100, 13, 1000, 3000, 6000, 8000, 1148701, 0, 0, 'Magister Kalendris - Cast Mind Blast');

INSERT INTO `creature_ai_scripts`
(`id`, `delay`, `priority`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`)
VALUES
(1148701, 0, 0, 15, 17287, 0, 0, 0, 0, 0, 1, 8, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Magister Kalendris - Cast Spell Mind Blast');

INSERT INTO `creature_ai_events`
(`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`)
VALUES
(1430803, 14308, 0, 1, 0, 100, 1, 1000, 1000, 1000, 1000, 1430803, 0, 0, 'Ferra - Aggro pulse 100y');

INSERT INTO `creature_ai_scripts`
(`id`, `delay`, `priority`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`)
VALUES
(1430803, 0, 0, 15, 28033, 0, 0, 0, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Ferra - Cast Spell Aggro all in LOS');

INSERT INTO `creature_ai_events`
(`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`)
VALUES
(1430802, 14308, 0, 0, 0, 100, 13, 3000, 6000, 5000, 8000, 1430802, 0, 0, 'Ferra - Cast Maul');

INSERT INTO `creature_ai_scripts`
(`id`, `delay`, `priority`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`)
VALUES
(1430802, 0, 0, 15, 17156, 0, 0, 0, 0, 0, 1, 8, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Ferra - Cast Spell Maul');

INSERT INTO `creature_ai_events`
(`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`)
VALUES
(1432105, 14321, 0, 2, 0, 100, 1, 30, 0, 120000, 120000, 1432105, 0, 0, 'Guard Fengus - Cast Frenzy at 30% HP');

INSERT INTO `creature_ai_scripts`
(`id`, `delay`, `priority`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`)
VALUES
(1432105, 0, 0, 15, 8269, 1, 0, 0, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Guard Fengus - Cast Spell Enrage'),
(1432105, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 9413, 0, 0, 0, 0, 0, 0, 0, 0, 'Guard Fengus - Say Text'),
(1432105, 0, 0, 50, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 50, 0, 0, 0, 0, 'Guard Fengus - Call for Help');

INSERT INTO `creature_ai_events`
(`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`)
VALUES
(1432104, 14321, 0, 0, 0, 100, 13, 7000, 12000, 12000, 15000, 1432104, 0, 0, 'Guard Fengus - Cast Knock Away');

INSERT INTO `creature_ai_scripts`
(`id`, `delay`, `priority`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`)
VALUES
(1432104, 0, 0, 15, 10101, 1, 0, 0, 0, 0, 4, 8, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Guard Fengus - Cast Spell Knock Away');

INSERT INTO `creature_ai_events`
(`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`)
VALUES
(1432102, 14321, 0, 0, 0, 100, 13, 5000, 8000, 8000, 12000, 1432102, 0, 0, 'Guard Fengus - Cast Strike');

INSERT INTO `creature_ai_scripts`
(`id`, `delay`, `priority`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`)
VALUES
(1432102, 0, 0, 15, 15580, 1, 0, 0, 0, 0, 1, 8, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Guard Fengus - Cast Spell Strike');

INSERT INTO `creature_ai_events`
(`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`)
VALUES
(1432601, 14326, 0, 4, 0, 100, 0, 0, 0, 0, 0, 1432601, 0, 0, 'Guard Moldar - Cast Shield Charge on Aggro');

INSERT INTO `creature_ai_scripts`
(`id`, `delay`, `priority`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`)
VALUES
(1432601, 0, 0, 15, 15749, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Guard Mol dar - Cast Spell Shield Charge');

INSERT INTO `creature_ai_events`
(`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`)
VALUES
(1432307, 14323, 0, 6, 0, 100, 0, 0, 0, 0, 0, 1432307, 0, 0, 'Guard Slipkik - Set instance data TYPE_GORDOK_TRIBUTE = SPECIAL on Death');

INSERT INTO `creature_ai_scripts`
(`id`, `delay`, `priority`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`)
VALUES
(1432307, 0, 0, 37, 6, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Guard Slip kik - Set Instance Data');

INSERT INTO `creature_ai_events`
(`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`)
VALUES
(1432301, 14323, 0, 4, 0, 100, 0, 0, 0, 0, 0, 1432301, 0, 0, 'Guard Slipkik - Cast Shield Charge on Aggro');

INSERT INTO `creature_ai_scripts`
(`id`, `delay`, `priority`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`)
VALUES
(1432301, 0, 0, 15, 15749, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Guard Slip kik - Cast Spell Shield Charge');

INSERT INTO `creature_ai_events`
(`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`)
VALUES
(1432302, 14323, 0, 0, 0, 100, 13, 5000, 8000, 8000, 12000, 1432302, 0, 0, 'Guard Slipkik - Cast Strike');

INSERT INTO `creature_ai_scripts`
(`id`, `delay`, `priority`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`)
VALUES
(1432302, 0, 0, 15, 15580, 1, 0, 0, 0, 0, 1, 8, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Guard Slip kik - Cast Spell Strike');

INSERT INTO `creature_ai_events`
(`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`)
VALUES
(1432304, 14323, 0, 0, 0, 100, 13, 7000, 12000, 12000, 15000, 1432304, 0, 0, 'Guard Slipkik - Cast Knock Away');

INSERT INTO `creature_ai_scripts`
(`id`, `delay`, `priority`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`)
VALUES
(1432304, 0, 0, 15, 10101, 1, 0, 0, 0, 0, 4, 8, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Guard Slip kik - Cast Spell Knock Away');

INSERT INTO `creature_ai_events`
(`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`)
VALUES
(1432107, 14321, 0, 6, 0, 100, 0, 0, 0, 0, 0, 1432107, 0, 0, 'Guard Fengus - Set instance data TYPE_GORDOK_TRIBUTE = SPECIAL on Death');

INSERT INTO `creature_ai_scripts`
(`id`, `delay`, `priority`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`)
VALUES
(1432107, 0, 0, 37, 6, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Guard Fengus - Set Instance Data');

INSERT INTO `creature_ai_events`
(`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`)
VALUES
(1432305, 14323, 0, 2, 0, 100, 1, 30, 0, 120000, 120000, 1432305, 0, 0, 'Guard Slipkik - Cast Frenzy at 30% HP');

INSERT INTO `creature_ai_scripts`
(`id`, `delay`, `priority`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`)
VALUES
(1432305, 0, 0, 15, 8269, 1, 0, 0, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Guard Slip kik - Cast Spell Enrage'),
(1432305, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 9413, 0, 0, 0, 0, 0, 0, 0, 0, 'Guard Slip kik - Say Text'),
(1432305, 0, 0, 50, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 50, 0, 0, 0, 0, 'Guard Slip kik - Call for Help');

INSERT INTO `creature_ai_events`
(`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`)
VALUES
(1432502, 14325, 0, 0, 0, 100, 13, 12000, 15000, 19000, 25000, 1432502, 0, 0, 'Captain Kromcrush - Cast Retaliation (Ustaag)');

INSERT INTO `creature_ai_scripts`
(`id`, `delay`, `priority`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`)
VALUES
(1432502, 0, 0, 15, 22857, 1, 0, 0, 0, 0, 0, 12, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Captain Kromcrush - Cast Spell Retaliation');

INSERT INTO `creature_ai_events`
(`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`)
VALUES
(1432501, 14325, 0, 0, 0, 100, 13, 2000, 6000, 7000, 10000, 1432501, 0, 0, 'Captain Kromcrush - Cast Mortal Cleave (Ustaag)');

INSERT INTO `creature_ai_scripts`
(`id`, `delay`, `priority`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`)
VALUES
(1432501, 0, 0, 15, 22859, 0, 0, 0, 0, 0, 1, 8, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Captain Kromcrush - Cast Spell Mortal Cleave');

INSERT INTO `creature_ai_events`
(`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`)
VALUES
(1432505, 14325, 0, 2, 11, 100, 4, 30, 0, 0, 0, 1432505, 0, 0, 'Captain Kromcrush - Cast Enrage at 30% HP (Ustaag) - Phase 2');

INSERT INTO `creature_ai_scripts`
(`id`, `delay`, `priority`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`)
VALUES
(1432505, 0, 0, 15, 8599, 1, 0, 0, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Captain Kromcrush - Cast Spell Enrage'),
(1432505, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1191, 0, 0, 0, 0, 0, 0, 0, 0, 'Captain Kromcrush - Say Text');

INSERT INTO `creature_ai_events`
(`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`)
VALUES
(1432508, 14325, 0, 7, 0, 100, 0, 0, 0, 0, 0, 1432508, 0, 0, 'Captain Kromcrush - Set Phase 1 On Evade (Ustaag)');

INSERT INTO `creature_ai_scripts`
(`id`, `delay`, `priority`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`)
VALUES
(1432508, 0, 0, 44, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Captain Kromcrush - Set Phase to 1');

INSERT INTO `creature_ai_events`
(`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`)
VALUES
(1432507, 14325, 0, 11, 0, 100, 1, 0, 0, 0, 0, 1432507, 0, 0, 'Captain Kromcrush - Set Phase 1 On spawn (Ustaag)');

INSERT INTO `creature_ai_scripts`
(`id`, `delay`, `priority`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`)
VALUES
(1432507, 0, 0, 44, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Captain Kromcrush - Set Phase to 1');

INSERT INTO `creature_ai_events`
(`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`)
VALUES
(1432605, 14326, 0, 2, 0, 100, 1, 30, 0, 120000, 120000, 1432605, 0, 0, 'Guard Moldar - Cast Frenzy at 30% HP');

INSERT INTO `creature_ai_scripts`
(`id`, `delay`, `priority`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`)
VALUES
(1432605, 0, 0, 15, 8269, 1, 0, 0, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Guard Mol dar - Cast Spell Enrage'),
(1432605, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 9413, 0, 0, 0, 0, 0, 0, 0, 0, 'Guard Mol dar - Say Text'),
(1432605, 0, 0, 50, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 50, 0, 0, 0, 0, 'Guard Mol dar - Call for Help');

INSERT INTO `creature_ai_events`
(`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`)
VALUES
(1432604, 14326, 0, 0, 0, 100, 13, 7000, 12000, 12000, 15000, 1432604, 0, 0, 'Guard Moldar - Cast Knock Away');

INSERT INTO `creature_ai_scripts`
(`id`, `delay`, `priority`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`)
VALUES
(1432604, 0, 0, 15, 10101, 1, 0, 0, 0, 0, 4, 8, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Guard Mol dar - Cast Spell Knock Away');

INSERT INTO `creature_ai_events`
(`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`)
VALUES
(1432602, 14326, 0, 0, 0, 100, 13, 5000, 8000, 8000, 12000, 1432602, 0, 0, 'Guard Moldar - Cast Strike');

INSERT INTO `creature_ai_scripts`
(`id`, `delay`, `priority`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`)
VALUES
(1432602, 0, 0, 15, 15580, 1, 0, 0, 0, 0, 1, 8, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Guard Mol dar - Cast Spell Strike');

INSERT INTO `creature_ai_events`
(`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`)
VALUES
(1432101, 14321, 0, 4, 0, 100, 0, 0, 0, 0, 0, 1432101, 0, 0, 'Guard Fengus - Cast Shield Charge on Aggro');

INSERT INTO `creature_ai_scripts`
(`id`, `delay`, `priority`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`)
VALUES
(1432101, 0, 0, 15, 15749, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Guard Fengus - Cast Spell Shield Charge');

INSERT INTO `creature_ai_events`
(`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`)
VALUES
(1430801, 14308, 0, 9, 0, 100, 13, 8, 25, 8000, 14000, 1430801, 0, 0, 'Ferra - Cast Charge');

INSERT INTO `creature_ai_scripts`
(`id`, `delay`, `priority`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`)
VALUES
(1430801, 0, 0, 15, 22911, 0, 0, 0, 0, 0, 4, 8, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Ferra - Cast Spell Charge');

INSERT INTO `creature_ai_events`
(`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`)
VALUES
(1432506, 14325, 0, 6, 0, 100, 0, 0, 0, 0, 0, 1432506, 0, 0, 'Captain Kromcrush - Set instance data TYPE_GORDOK_TRIBUTE = SPECIAL on Death');

INSERT INTO `creature_ai_scripts`
(`id`, `delay`, `priority`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`)
VALUES
(1432506, 0, 0, 37, 6, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Captain Kromcrush - Set Instance Data');

INSERT INTO `creature_ai_events`
(`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`)
VALUES
(1432607, 14326, 0, 6, 0, 100, 0, 0, 0, 0, 0, 1432607, 0, 0, 'Guard Mol''dar - Set instance data TYPE_GORDOK_TRIBUTE = SPECIAL on Death');

INSERT INTO `creature_ai_scripts`
(`id`, `delay`, `priority`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`)
VALUES
(1432607, 0, 0, 37, 6, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Guard Mol dar - Set Instance Data');

INSERT INTO `creature_ai_events`
(`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`)
VALUES
(1435301, 14353, 0, 11, 0, 100, 1, 0, 0, 0, 0, 1435301, 0, 0, 'Mizzle the Crafty - Cast 23319 on spawn (Ustaag)');

INSERT INTO `creature_ai_scripts`
(`id`, `delay`, `priority`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`)
VALUES
(1435301, 0, 0, 15, 23319, 2, 0, 0, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Mizzle the Crafty - Cast Spell Dragondog Breath Selection (L3)');

INSERT INTO `creature_ai_events`
(`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`)
VALUES
(1432308, 14323, 0, 23, 0, 100, 0, 22856, 1, 0, 0, 1432308, 0, 0, 'Guard Slipkik - Set instance data DATA_SLIPKIK_FROZEN = SPECIAL');

INSERT INTO `creature_ai_scripts`
(`id`, `delay`, `priority`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`)
VALUES
(1432308, 0, 0, 37, 7, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Guard Slip kik - Set Instance Data');

INSERT INTO `creature_ai_events`
(`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`)
VALUES
(1432108, 14321, 0, 0, 0, 100, 13, 10000, 10000, 10000, 15000, 1432108, 0, 0, 'Guard Fengus - Cast Shield Charge random not top');

INSERT INTO `creature_ai_scripts`
(`id`, `delay`, `priority`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`)
VALUES
(1432108, 0, 0, 15, 15749, 0, 0, 0, 0, 0, 5, 8, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Guard Fengus - Cast Spell Shield Charge');

INSERT INTO `creature_ai_events`
(`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`)
VALUES
(1432310, 14323, 0, 0, 0, 100, 13, 10000, 10000, 10000, 15000, 1432310, 0, 0, 'Guard Slipkik - Cast Shield Charge random not top');

INSERT INTO `creature_ai_scripts`
(`id`, `delay`, `priority`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`)
VALUES
(1432310, 0, 0, 15, 15749, 0, 0, 0, 0, 0, 5, 8, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Guard Slip kik - Cast Spell Shield Charge');

INSERT INTO `creature_ai_events`
(`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`)
VALUES
(1432608, 14326, 0, 0, 0, 100, 13, 10000, 10000, 10000, 15000, 1432608, 0, 0, 'Guard Moldar - Cast Shield Charge random not top');

INSERT INTO `creature_ai_scripts`
(`id`, `delay`, `priority`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`)
VALUES
(1432608, 0, 0, 15, 15749, 0, 0, 0, 0, 0, 5, 8, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Guard Mol dar - Cast Spell Shield Charge');

INSERT INTO `creature_ai_events`
(`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`)
VALUES
(1432509, 14325, 0, 4, 0, 100, 0, 0, 0, 0, 0, 1432509, 0, 0, 'Captain Kromcrush - Zone Combat Pulse on Aggro');

INSERT INTO `creature_ai_scripts`
(`id`, `delay`, `priority`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`)
VALUES
(1432509, 0, 0, 49, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Captain Kromcrush - Combat Pulse');

INSERT INTO `creature_ai_events`
(`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`)
VALUES
(1144101, 11441, 0, 4, 0, 10, 0, 0, 0, 0, 0, 1144101, 0, 0, 'Gordok Brute - Random Say on Aggro');

INSERT INTO `creature_ai_scripts`
(`id`, `delay`, `priority`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`)
VALUES
(1144101, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1925, 1926, 1927, 0, 0, 0, 0, 0, 0, 'Gordok Brute - Say Text');

INSERT INTO `creature_ai_events`
(`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`)
VALUES
(1144102, 11441, 0, 0, 0, 100, 13, 8900, 17900, 6200, 16400, 1144102, 0, 0, 'Gordok Brute - Cast Uppercut');

INSERT INTO `creature_ai_scripts`
(`id`, `delay`, `priority`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`)
VALUES
(1144102, 0, 0, 15, 18072, 0, 0, 0, 0, 0, 4, 8, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Gordok Brute - Cast Spell Uppercut');

INSERT INTO `creature_ai_events`
(`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`)
VALUES
(1144104, 11441, 0, 2, 0, 100, 0, 30, 0, 0, 0, 1144104, 0, 0, 'Gordok Brute - Cast Enrage and Emote at 30% HP');

INSERT INTO `creature_ai_scripts`
(`id`, `delay`, `priority`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`)
VALUES
(1144104, 0, 0, 15, 15716, 1, 0, 0, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Gordok Brute - Cast Spell Enrage'),
(1144104, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1926, 0, 0, 0, 0, 0, 0, 0, 0, 'Gordok Brute - Say Text');

INSERT INTO `creature_ai_events`
(`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`)
VALUES
(1144105, 11441, 0, 2, 0, 100, 0, 15, 0, 0, 0, 1144105, 0, 0, 'Gordok Brute - Cast Backhand at 15% HP');

INSERT INTO `creature_ai_scripts`
(`id`, `delay`, `priority`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`)
VALUES
(1144105, 0, 0, 15, 6253, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Gordok Brute - Cast Spell Backhand');

INSERT INTO `event_scripts`
(`id`, `delay`, `priority`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`)
VALUES
(8428, 0, 0, 9, 99783, 15, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, ''),
(8428, 10, 0, 10, 14502, 9000000, 0, 0, 0, 0, 0, 0, 0, 0, -1, 1, -35.712, 796.486, -29.5359, 1.90495, 0, '');

INSERT INTO `creature_ai_events`
(`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`)
VALUES
(1450201, 14502, 0, 4, 0, 100, 0, 0, 0, 0, 0, 1450201, 0, 0, 'Xorothian Dreadsteed - Cast Berserker Charge on Aggro');

INSERT INTO `creature_ai_scripts`
(`id`, `delay`, `priority`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`)
VALUES
(1450201, 0, 0, 15, 16636, 0, 0, 0, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Xorothian Dreadsteed - Cast Spell Berserker Charge');

-- The shared conditions go only once nothing names them: the other migration that writes them is then not applied either.
DELETE FROM `conditions` WHERE `condition_entry` = 807003 AND NOT EXISTS (SELECT 1 FROM `creature_ai_events` WHERE `condition_id` = 807003) AND NOT EXISTS (SELECT 1 FROM `creature_ai_scripts` WHERE `condition_id` = 807003) AND NOT EXISTS (SELECT 1 FROM `generic_scripts` WHERE `condition_id` = 807003) AND NOT EXISTS (SELECT 1 FROM `gameobject_scripts` WHERE `condition_id` = 807003) AND NOT EXISTS (SELECT 1 FROM `gossip_scripts` WHERE `condition_id` = 807003) AND NOT EXISTS (SELECT 1 FROM `event_scripts` WHERE `condition_id` = 807003) AND NOT EXISTS (SELECT 1 FROM `creature_movement_scripts` WHERE `condition_id` = 807003) AND NOT EXISTS (SELECT 1 FROM `quest_start_scripts` WHERE `condition_id` = 807003) AND NOT EXISTS (SELECT 1 FROM `quest_end_scripts` WHERE `condition_id` = 807003) AND NOT EXISTS (SELECT 1 FROM `spell_scripts` WHERE `condition_id` = 807003) AND NOT EXISTS (SELECT 1 FROM `gossip_menu` WHERE `condition_id` = 807003) AND NOT EXISTS (SELECT 1 FROM `gossip_menu_option` WHERE `condition_id` = 807003) AND NOT EXISTS (SELECT 1 FROM (SELECT * FROM `conditions`) c WHERE c.`type` < 0 AND 807003 IN (c.`value1`, c.`value2`, c.`value3`, c.`value4`));
DELETE FROM `conditions` WHERE `condition_entry` = 532001 AND NOT EXISTS (SELECT 1 FROM `creature_ai_events` WHERE `condition_id` = 532001) AND NOT EXISTS (SELECT 1 FROM `creature_ai_scripts` WHERE `condition_id` = 532001) AND NOT EXISTS (SELECT 1 FROM `generic_scripts` WHERE `condition_id` = 532001) AND NOT EXISTS (SELECT 1 FROM `gameobject_scripts` WHERE `condition_id` = 532001) AND NOT EXISTS (SELECT 1 FROM `gossip_scripts` WHERE `condition_id` = 532001) AND NOT EXISTS (SELECT 1 FROM `event_scripts` WHERE `condition_id` = 532001) AND NOT EXISTS (SELECT 1 FROM `creature_movement_scripts` WHERE `condition_id` = 532001) AND NOT EXISTS (SELECT 1 FROM `quest_start_scripts` WHERE `condition_id` = 532001) AND NOT EXISTS (SELECT 1 FROM `quest_end_scripts` WHERE `condition_id` = 532001) AND NOT EXISTS (SELECT 1 FROM `spell_scripts` WHERE `condition_id` = 532001) AND NOT EXISTS (SELECT 1 FROM `gossip_menu` WHERE `condition_id` = 532001) AND NOT EXISTS (SELECT 1 FROM `gossip_menu_option` WHERE `condition_id` = 532001) AND NOT EXISTS (SELECT 1 FROM (SELECT * FROM `conditions`) c WHERE c.`type` < 0 AND 532001 IN (c.`value1`, c.`value2`, c.`value3`, c.`value4`));
DELETE FROM `conditions` WHERE `condition_entry` = 469110 AND NOT EXISTS (SELECT 1 FROM `creature_ai_events` WHERE `condition_id` = 469110) AND NOT EXISTS (SELECT 1 FROM `creature_ai_scripts` WHERE `condition_id` = 469110) AND NOT EXISTS (SELECT 1 FROM `generic_scripts` WHERE `condition_id` = 469110) AND NOT EXISTS (SELECT 1 FROM `gameobject_scripts` WHERE `condition_id` = 469110) AND NOT EXISTS (SELECT 1 FROM `gossip_scripts` WHERE `condition_id` = 469110) AND NOT EXISTS (SELECT 1 FROM `event_scripts` WHERE `condition_id` = 469110) AND NOT EXISTS (SELECT 1 FROM `creature_movement_scripts` WHERE `condition_id` = 469110) AND NOT EXISTS (SELECT 1 FROM `quest_start_scripts` WHERE `condition_id` = 469110) AND NOT EXISTS (SELECT 1 FROM `quest_end_scripts` WHERE `condition_id` = 469110) AND NOT EXISTS (SELECT 1 FROM `spell_scripts` WHERE `condition_id` = 469110) AND NOT EXISTS (SELECT 1 FROM `gossip_menu` WHERE `condition_id` = 469110) AND NOT EXISTS (SELECT 1 FROM `gossip_menu_option` WHERE `condition_id` = 469110) AND NOT EXISTS (SELECT 1 FROM (SELECT * FROM `conditions`) c WHERE c.`type` < 0 AND 469110 IN (c.`value1`, c.`value2`, c.`value3`, c.`value4`));
DELETE FROM `conditions` WHERE `condition_entry` = 409321 AND NOT EXISTS (SELECT 1 FROM `creature_ai_events` WHERE `condition_id` = 409321) AND NOT EXISTS (SELECT 1 FROM `creature_ai_scripts` WHERE `condition_id` = 409321) AND NOT EXISTS (SELECT 1 FROM `generic_scripts` WHERE `condition_id` = 409321) AND NOT EXISTS (SELECT 1 FROM `gameobject_scripts` WHERE `condition_id` = 409321) AND NOT EXISTS (SELECT 1 FROM `gossip_scripts` WHERE `condition_id` = 409321) AND NOT EXISTS (SELECT 1 FROM `event_scripts` WHERE `condition_id` = 409321) AND NOT EXISTS (SELECT 1 FROM `creature_movement_scripts` WHERE `condition_id` = 409321) AND NOT EXISTS (SELECT 1 FROM `quest_start_scripts` WHERE `condition_id` = 409321) AND NOT EXISTS (SELECT 1 FROM `quest_end_scripts` WHERE `condition_id` = 409321) AND NOT EXISTS (SELECT 1 FROM `spell_scripts` WHERE `condition_id` = 409321) AND NOT EXISTS (SELECT 1 FROM `gossip_menu` WHERE `condition_id` = 409321) AND NOT EXISTS (SELECT 1 FROM `gossip_menu_option` WHERE `condition_id` = 409321) AND NOT EXISTS (SELECT 1 FROM (SELECT * FROM `conditions`) c WHERE c.`type` < 0 AND 409321 IN (c.`value1`, c.`value2`, c.`value3`, c.`value4`));
DELETE FROM `conditions` WHERE `condition_entry` = 349003 AND NOT EXISTS (SELECT 1 FROM `creature_ai_events` WHERE `condition_id` = 349003) AND NOT EXISTS (SELECT 1 FROM `creature_ai_scripts` WHERE `condition_id` = 349003) AND NOT EXISTS (SELECT 1 FROM `generic_scripts` WHERE `condition_id` = 349003) AND NOT EXISTS (SELECT 1 FROM `gameobject_scripts` WHERE `condition_id` = 349003) AND NOT EXISTS (SELECT 1 FROM `gossip_scripts` WHERE `condition_id` = 349003) AND NOT EXISTS (SELECT 1 FROM `event_scripts` WHERE `condition_id` = 349003) AND NOT EXISTS (SELECT 1 FROM `creature_movement_scripts` WHERE `condition_id` = 349003) AND NOT EXISTS (SELECT 1 FROM `quest_start_scripts` WHERE `condition_id` = 349003) AND NOT EXISTS (SELECT 1 FROM `quest_end_scripts` WHERE `condition_id` = 349003) AND NOT EXISTS (SELECT 1 FROM `spell_scripts` WHERE `condition_id` = 349003) AND NOT EXISTS (SELECT 1 FROM `gossip_menu` WHERE `condition_id` = 349003) AND NOT EXISTS (SELECT 1 FROM `gossip_menu_option` WHERE `condition_id` = 349003) AND NOT EXISTS (SELECT 1 FROM (SELECT * FROM `conditions`) c WHERE c.`type` < 0 AND 349003 IN (c.`value1`, c.`value2`, c.`value3`, c.`value4`));
DELETE FROM `conditions` WHERE `condition_entry` = 230050 AND NOT EXISTS (SELECT 1 FROM `creature_ai_events` WHERE `condition_id` = 230050) AND NOT EXISTS (SELECT 1 FROM `creature_ai_scripts` WHERE `condition_id` = 230050) AND NOT EXISTS (SELECT 1 FROM `generic_scripts` WHERE `condition_id` = 230050) AND NOT EXISTS (SELECT 1 FROM `gameobject_scripts` WHERE `condition_id` = 230050) AND NOT EXISTS (SELECT 1 FROM `gossip_scripts` WHERE `condition_id` = 230050) AND NOT EXISTS (SELECT 1 FROM `event_scripts` WHERE `condition_id` = 230050) AND NOT EXISTS (SELECT 1 FROM `creature_movement_scripts` WHERE `condition_id` = 230050) AND NOT EXISTS (SELECT 1 FROM `quest_start_scripts` WHERE `condition_id` = 230050) AND NOT EXISTS (SELECT 1 FROM `quest_end_scripts` WHERE `condition_id` = 230050) AND NOT EXISTS (SELECT 1 FROM `spell_scripts` WHERE `condition_id` = 230050) AND NOT EXISTS (SELECT 1 FROM `gossip_menu` WHERE `condition_id` = 230050) AND NOT EXISTS (SELECT 1 FROM `gossip_menu_option` WHERE `condition_id` = 230050) AND NOT EXISTS (SELECT 1 FROM (SELECT * FROM `conditions`) c WHERE c.`type` < 0 AND 230050 IN (c.`value1`, c.`value2`, c.`value3`, c.`value4`));
DELETE FROM `conditions` WHERE `condition_entry` = 230040 AND NOT EXISTS (SELECT 1 FROM `creature_ai_events` WHERE `condition_id` = 230040) AND NOT EXISTS (SELECT 1 FROM `creature_ai_scripts` WHERE `condition_id` = 230040) AND NOT EXISTS (SELECT 1 FROM `generic_scripts` WHERE `condition_id` = 230040) AND NOT EXISTS (SELECT 1 FROM `gameobject_scripts` WHERE `condition_id` = 230040) AND NOT EXISTS (SELECT 1 FROM `gossip_scripts` WHERE `condition_id` = 230040) AND NOT EXISTS (SELECT 1 FROM `event_scripts` WHERE `condition_id` = 230040) AND NOT EXISTS (SELECT 1 FROM `creature_movement_scripts` WHERE `condition_id` = 230040) AND NOT EXISTS (SELECT 1 FROM `quest_start_scripts` WHERE `condition_id` = 230040) AND NOT EXISTS (SELECT 1 FROM `quest_end_scripts` WHERE `condition_id` = 230040) AND NOT EXISTS (SELECT 1 FROM `spell_scripts` WHERE `condition_id` = 230040) AND NOT EXISTS (SELECT 1 FROM `gossip_menu` WHERE `condition_id` = 230040) AND NOT EXISTS (SELECT 1 FROM `gossip_menu_option` WHERE `condition_id` = 230040) AND NOT EXISTS (SELECT 1 FROM (SELECT * FROM `conditions`) c WHERE c.`type` < 0 AND 230040 IN (c.`value1`, c.`value2`, c.`value3`, c.`value4`));
DELETE FROM `conditions` WHERE `condition_entry` = 229243 AND NOT EXISTS (SELECT 1 FROM `creature_ai_events` WHERE `condition_id` = 229243) AND NOT EXISTS (SELECT 1 FROM `creature_ai_scripts` WHERE `condition_id` = 229243) AND NOT EXISTS (SELECT 1 FROM `generic_scripts` WHERE `condition_id` = 229243) AND NOT EXISTS (SELECT 1 FROM `gameobject_scripts` WHERE `condition_id` = 229243) AND NOT EXISTS (SELECT 1 FROM `gossip_scripts` WHERE `condition_id` = 229243) AND NOT EXISTS (SELECT 1 FROM `event_scripts` WHERE `condition_id` = 229243) AND NOT EXISTS (SELECT 1 FROM `creature_movement_scripts` WHERE `condition_id` = 229243) AND NOT EXISTS (SELECT 1 FROM `quest_start_scripts` WHERE `condition_id` = 229243) AND NOT EXISTS (SELECT 1 FROM `quest_end_scripts` WHERE `condition_id` = 229243) AND NOT EXISTS (SELECT 1 FROM `spell_scripts` WHERE `condition_id` = 229243) AND NOT EXISTS (SELECT 1 FROM `gossip_menu` WHERE `condition_id` = 229243) AND NOT EXISTS (SELECT 1 FROM `gossip_menu_option` WHERE `condition_id` = 229243) AND NOT EXISTS (SELECT 1 FROM (SELECT * FROM `conditions`) c WHERE c.`type` < 0 AND 229243 IN (c.`value1`, c.`value2`, c.`value3`, c.`value4`));
DELETE FROM `conditions` WHERE `condition_entry` = 229242 AND NOT EXISTS (SELECT 1 FROM `creature_ai_events` WHERE `condition_id` = 229242) AND NOT EXISTS (SELECT 1 FROM `creature_ai_scripts` WHERE `condition_id` = 229242) AND NOT EXISTS (SELECT 1 FROM `generic_scripts` WHERE `condition_id` = 229242) AND NOT EXISTS (SELECT 1 FROM `gameobject_scripts` WHERE `condition_id` = 229242) AND NOT EXISTS (SELECT 1 FROM `gossip_scripts` WHERE `condition_id` = 229242) AND NOT EXISTS (SELECT 1 FROM `event_scripts` WHERE `condition_id` = 229242) AND NOT EXISTS (SELECT 1 FROM `creature_movement_scripts` WHERE `condition_id` = 229242) AND NOT EXISTS (SELECT 1 FROM `quest_start_scripts` WHERE `condition_id` = 229242) AND NOT EXISTS (SELECT 1 FROM `quest_end_scripts` WHERE `condition_id` = 229242) AND NOT EXISTS (SELECT 1 FROM `spell_scripts` WHERE `condition_id` = 229242) AND NOT EXISTS (SELECT 1 FROM `gossip_menu` WHERE `condition_id` = 229242) AND NOT EXISTS (SELECT 1 FROM `gossip_menu_option` WHERE `condition_id` = 229242) AND NOT EXISTS (SELECT 1 FROM (SELECT * FROM `conditions`) c WHERE c.`type` < 0 AND 229242 IN (c.`value1`, c.`value2`, c.`value3`, c.`value4`));
DELETE FROM `conditions` WHERE `condition_entry` = 229241 AND NOT EXISTS (SELECT 1 FROM `creature_ai_events` WHERE `condition_id` = 229241) AND NOT EXISTS (SELECT 1 FROM `creature_ai_scripts` WHERE `condition_id` = 229241) AND NOT EXISTS (SELECT 1 FROM `generic_scripts` WHERE `condition_id` = 229241) AND NOT EXISTS (SELECT 1 FROM `gameobject_scripts` WHERE `condition_id` = 229241) AND NOT EXISTS (SELECT 1 FROM `gossip_scripts` WHERE `condition_id` = 229241) AND NOT EXISTS (SELECT 1 FROM `event_scripts` WHERE `condition_id` = 229241) AND NOT EXISTS (SELECT 1 FROM `creature_movement_scripts` WHERE `condition_id` = 229241) AND NOT EXISTS (SELECT 1 FROM `quest_start_scripts` WHERE `condition_id` = 229241) AND NOT EXISTS (SELECT 1 FROM `quest_end_scripts` WHERE `condition_id` = 229241) AND NOT EXISTS (SELECT 1 FROM `spell_scripts` WHERE `condition_id` = 229241) AND NOT EXISTS (SELECT 1 FROM `gossip_menu` WHERE `condition_id` = 229241) AND NOT EXISTS (SELECT 1 FROM `gossip_menu_option` WHERE `condition_id` = 229241) AND NOT EXISTS (SELECT 1 FROM (SELECT * FROM `conditions`) c WHERE c.`type` < 0 AND 229241 IN (c.`value1`, c.`value2`, c.`value3`, c.`value4`));
DELETE FROM `conditions` WHERE `condition_entry` = 229240 AND NOT EXISTS (SELECT 1 FROM `creature_ai_events` WHERE `condition_id` = 229240) AND NOT EXISTS (SELECT 1 FROM `creature_ai_scripts` WHERE `condition_id` = 229240) AND NOT EXISTS (SELECT 1 FROM `generic_scripts` WHERE `condition_id` = 229240) AND NOT EXISTS (SELECT 1 FROM `gameobject_scripts` WHERE `condition_id` = 229240) AND NOT EXISTS (SELECT 1 FROM `gossip_scripts` WHERE `condition_id` = 229240) AND NOT EXISTS (SELECT 1 FROM `event_scripts` WHERE `condition_id` = 229240) AND NOT EXISTS (SELECT 1 FROM `creature_movement_scripts` WHERE `condition_id` = 229240) AND NOT EXISTS (SELECT 1 FROM `quest_start_scripts` WHERE `condition_id` = 229240) AND NOT EXISTS (SELECT 1 FROM `quest_end_scripts` WHERE `condition_id` = 229240) AND NOT EXISTS (SELECT 1 FROM `spell_scripts` WHERE `condition_id` = 229240) AND NOT EXISTS (SELECT 1 FROM `gossip_menu` WHERE `condition_id` = 229240) AND NOT EXISTS (SELECT 1 FROM `gossip_menu_option` WHERE `condition_id` = 229240) AND NOT EXISTS (SELECT 1 FROM (SELECT * FROM `conditions`) c WHERE c.`type` < 0 AND 229240 IN (c.`value1`, c.`value2`, c.`value3`, c.`value4`));
DELETE FROM `conditions` WHERE `condition_entry` = 229237 AND NOT EXISTS (SELECT 1 FROM `creature_ai_events` WHERE `condition_id` = 229237) AND NOT EXISTS (SELECT 1 FROM `creature_ai_scripts` WHERE `condition_id` = 229237) AND NOT EXISTS (SELECT 1 FROM `generic_scripts` WHERE `condition_id` = 229237) AND NOT EXISTS (SELECT 1 FROM `gameobject_scripts` WHERE `condition_id` = 229237) AND NOT EXISTS (SELECT 1 FROM `gossip_scripts` WHERE `condition_id` = 229237) AND NOT EXISTS (SELECT 1 FROM `event_scripts` WHERE `condition_id` = 229237) AND NOT EXISTS (SELECT 1 FROM `creature_movement_scripts` WHERE `condition_id` = 229237) AND NOT EXISTS (SELECT 1 FROM `quest_start_scripts` WHERE `condition_id` = 229237) AND NOT EXISTS (SELECT 1 FROM `quest_end_scripts` WHERE `condition_id` = 229237) AND NOT EXISTS (SELECT 1 FROM `spell_scripts` WHERE `condition_id` = 229237) AND NOT EXISTS (SELECT 1 FROM `gossip_menu` WHERE `condition_id` = 229237) AND NOT EXISTS (SELECT 1 FROM `gossip_menu_option` WHERE `condition_id` = 229237) AND NOT EXISTS (SELECT 1 FROM (SELECT * FROM `conditions`) c WHERE c.`type` < 0 AND 229237 IN (c.`value1`, c.`value2`, c.`value3`, c.`value4`));
DELETE FROM `conditions` WHERE `condition_entry` = 229218 AND NOT EXISTS (SELECT 1 FROM `creature_ai_events` WHERE `condition_id` = 229218) AND NOT EXISTS (SELECT 1 FROM `creature_ai_scripts` WHERE `condition_id` = 229218) AND NOT EXISTS (SELECT 1 FROM `generic_scripts` WHERE `condition_id` = 229218) AND NOT EXISTS (SELECT 1 FROM `gameobject_scripts` WHERE `condition_id` = 229218) AND NOT EXISTS (SELECT 1 FROM `gossip_scripts` WHERE `condition_id` = 229218) AND NOT EXISTS (SELECT 1 FROM `event_scripts` WHERE `condition_id` = 229218) AND NOT EXISTS (SELECT 1 FROM `creature_movement_scripts` WHERE `condition_id` = 229218) AND NOT EXISTS (SELECT 1 FROM `quest_start_scripts` WHERE `condition_id` = 229218) AND NOT EXISTS (SELECT 1 FROM `quest_end_scripts` WHERE `condition_id` = 229218) AND NOT EXISTS (SELECT 1 FROM `spell_scripts` WHERE `condition_id` = 229218) AND NOT EXISTS (SELECT 1 FROM `gossip_menu` WHERE `condition_id` = 229218) AND NOT EXISTS (SELECT 1 FROM `gossip_menu_option` WHERE `condition_id` = 229218) AND NOT EXISTS (SELECT 1 FROM (SELECT * FROM `conditions`) c WHERE c.`type` < 0 AND 229218 IN (c.`value1`, c.`value2`, c.`value3`, c.`value4`));
DELETE FROM `conditions` WHERE `condition_entry` = 229217 AND NOT EXISTS (SELECT 1 FROM `creature_ai_events` WHERE `condition_id` = 229217) AND NOT EXISTS (SELECT 1 FROM `creature_ai_scripts` WHERE `condition_id` = 229217) AND NOT EXISTS (SELECT 1 FROM `generic_scripts` WHERE `condition_id` = 229217) AND NOT EXISTS (SELECT 1 FROM `gameobject_scripts` WHERE `condition_id` = 229217) AND NOT EXISTS (SELECT 1 FROM `gossip_scripts` WHERE `condition_id` = 229217) AND NOT EXISTS (SELECT 1 FROM `event_scripts` WHERE `condition_id` = 229217) AND NOT EXISTS (SELECT 1 FROM `creature_movement_scripts` WHERE `condition_id` = 229217) AND NOT EXISTS (SELECT 1 FROM `quest_start_scripts` WHERE `condition_id` = 229217) AND NOT EXISTS (SELECT 1 FROM `quest_end_scripts` WHERE `condition_id` = 229217) AND NOT EXISTS (SELECT 1 FROM `spell_scripts` WHERE `condition_id` = 229217) AND NOT EXISTS (SELECT 1 FROM `gossip_menu` WHERE `condition_id` = 229217) AND NOT EXISTS (SELECT 1 FROM `gossip_menu_option` WHERE `condition_id` = 229217) AND NOT EXISTS (SELECT 1 FROM (SELECT * FROM `conditions`) c WHERE c.`type` < 0 AND 229217 IN (c.`value1`, c.`value2`, c.`value3`, c.`value4`));
DELETE FROM `conditions` WHERE `condition_entry` = 209012 AND NOT EXISTS (SELECT 1 FROM `creature_ai_events` WHERE `condition_id` = 209012) AND NOT EXISTS (SELECT 1 FROM `creature_ai_scripts` WHERE `condition_id` = 209012) AND NOT EXISTS (SELECT 1 FROM `generic_scripts` WHERE `condition_id` = 209012) AND NOT EXISTS (SELECT 1 FROM `gameobject_scripts` WHERE `condition_id` = 209012) AND NOT EXISTS (SELECT 1 FROM `gossip_scripts` WHERE `condition_id` = 209012) AND NOT EXISTS (SELECT 1 FROM `event_scripts` WHERE `condition_id` = 209012) AND NOT EXISTS (SELECT 1 FROM `creature_movement_scripts` WHERE `condition_id` = 209012) AND NOT EXISTS (SELECT 1 FROM `quest_start_scripts` WHERE `condition_id` = 209012) AND NOT EXISTS (SELECT 1 FROM `quest_end_scripts` WHERE `condition_id` = 209012) AND NOT EXISTS (SELECT 1 FROM `spell_scripts` WHERE `condition_id` = 209012) AND NOT EXISTS (SELECT 1 FROM `gossip_menu` WHERE `condition_id` = 209012) AND NOT EXISTS (SELECT 1 FROM `gossip_menu_option` WHERE `condition_id` = 209012) AND NOT EXISTS (SELECT 1 FROM (SELECT * FROM `conditions`) c WHERE c.`type` < 0 AND 209012 IN (c.`value1`, c.`value2`, c.`value3`, c.`value4`));
DELETE FROM `conditions` WHERE `condition_entry` = 209001 AND NOT EXISTS (SELECT 1 FROM `creature_ai_events` WHERE `condition_id` = 209001) AND NOT EXISTS (SELECT 1 FROM `creature_ai_scripts` WHERE `condition_id` = 209001) AND NOT EXISTS (SELECT 1 FROM `generic_scripts` WHERE `condition_id` = 209001) AND NOT EXISTS (SELECT 1 FROM `gameobject_scripts` WHERE `condition_id` = 209001) AND NOT EXISTS (SELECT 1 FROM `gossip_scripts` WHERE `condition_id` = 209001) AND NOT EXISTS (SELECT 1 FROM `event_scripts` WHERE `condition_id` = 209001) AND NOT EXISTS (SELECT 1 FROM `creature_movement_scripts` WHERE `condition_id` = 209001) AND NOT EXISTS (SELECT 1 FROM `quest_start_scripts` WHERE `condition_id` = 209001) AND NOT EXISTS (SELECT 1 FROM `quest_end_scripts` WHERE `condition_id` = 209001) AND NOT EXISTS (SELECT 1 FROM `spell_scripts` WHERE `condition_id` = 209001) AND NOT EXISTS (SELECT 1 FROM `gossip_menu` WHERE `condition_id` = 209001) AND NOT EXISTS (SELECT 1 FROM `gossip_menu_option` WHERE `condition_id` = 209001) AND NOT EXISTS (SELECT 1 FROM (SELECT * FROM `conditions`) c WHERE c.`type` < 0 AND 209001 IN (c.`value1`, c.`value2`, c.`value3`, c.`value4`));
DELETE FROM `conditions` WHERE `condition_entry` = 189002 AND NOT EXISTS (SELECT 1 FROM `creature_ai_events` WHERE `condition_id` = 189002) AND NOT EXISTS (SELECT 1 FROM `creature_ai_scripts` WHERE `condition_id` = 189002) AND NOT EXISTS (SELECT 1 FROM `generic_scripts` WHERE `condition_id` = 189002) AND NOT EXISTS (SELECT 1 FROM `gameobject_scripts` WHERE `condition_id` = 189002) AND NOT EXISTS (SELECT 1 FROM `gossip_scripts` WHERE `condition_id` = 189002) AND NOT EXISTS (SELECT 1 FROM `event_scripts` WHERE `condition_id` = 189002) AND NOT EXISTS (SELECT 1 FROM `creature_movement_scripts` WHERE `condition_id` = 189002) AND NOT EXISTS (SELECT 1 FROM `quest_start_scripts` WHERE `condition_id` = 189002) AND NOT EXISTS (SELECT 1 FROM `quest_end_scripts` WHERE `condition_id` = 189002) AND NOT EXISTS (SELECT 1 FROM `spell_scripts` WHERE `condition_id` = 189002) AND NOT EXISTS (SELECT 1 FROM `gossip_menu` WHERE `condition_id` = 189002) AND NOT EXISTS (SELECT 1 FROM `gossip_menu_option` WHERE `condition_id` = 189002) AND NOT EXISTS (SELECT 1 FROM (SELECT * FROM `conditions`) c WHERE c.`type` < 0 AND 189002 IN (c.`value1`, c.`value2`, c.`value3`, c.`value4`));
DELETE FROM `conditions` WHERE `condition_entry` = 48002 AND NOT EXISTS (SELECT 1 FROM `creature_ai_events` WHERE `condition_id` = 48002) AND NOT EXISTS (SELECT 1 FROM `creature_ai_scripts` WHERE `condition_id` = 48002) AND NOT EXISTS (SELECT 1 FROM `generic_scripts` WHERE `condition_id` = 48002) AND NOT EXISTS (SELECT 1 FROM `gameobject_scripts` WHERE `condition_id` = 48002) AND NOT EXISTS (SELECT 1 FROM `gossip_scripts` WHERE `condition_id` = 48002) AND NOT EXISTS (SELECT 1 FROM `event_scripts` WHERE `condition_id` = 48002) AND NOT EXISTS (SELECT 1 FROM `creature_movement_scripts` WHERE `condition_id` = 48002) AND NOT EXISTS (SELECT 1 FROM `quest_start_scripts` WHERE `condition_id` = 48002) AND NOT EXISTS (SELECT 1 FROM `quest_end_scripts` WHERE `condition_id` = 48002) AND NOT EXISTS (SELECT 1 FROM `spell_scripts` WHERE `condition_id` = 48002) AND NOT EXISTS (SELECT 1 FROM `gossip_menu` WHERE `condition_id` = 48002) AND NOT EXISTS (SELECT 1 FROM `gossip_menu_option` WHERE `condition_id` = 48002) AND NOT EXISTS (SELECT 1 FROM (SELECT * FROM `conditions`) c WHERE c.`type` < 0 AND 48002 IN (c.`value1`, c.`value2`, c.`value3`, c.`value4`));
DELETE FROM `conditions` WHERE `condition_entry` = 43001 AND NOT EXISTS (SELECT 1 FROM `creature_ai_events` WHERE `condition_id` = 43001) AND NOT EXISTS (SELECT 1 FROM `creature_ai_scripts` WHERE `condition_id` = 43001) AND NOT EXISTS (SELECT 1 FROM `generic_scripts` WHERE `condition_id` = 43001) AND NOT EXISTS (SELECT 1 FROM `gameobject_scripts` WHERE `condition_id` = 43001) AND NOT EXISTS (SELECT 1 FROM `gossip_scripts` WHERE `condition_id` = 43001) AND NOT EXISTS (SELECT 1 FROM `event_scripts` WHERE `condition_id` = 43001) AND NOT EXISTS (SELECT 1 FROM `creature_movement_scripts` WHERE `condition_id` = 43001) AND NOT EXISTS (SELECT 1 FROM `quest_start_scripts` WHERE `condition_id` = 43001) AND NOT EXISTS (SELECT 1 FROM `quest_end_scripts` WHERE `condition_id` = 43001) AND NOT EXISTS (SELECT 1 FROM `spell_scripts` WHERE `condition_id` = 43001) AND NOT EXISTS (SELECT 1 FROM `gossip_menu` WHERE `condition_id` = 43001) AND NOT EXISTS (SELECT 1 FROM `gossip_menu_option` WHERE `condition_id` = 43001) AND NOT EXISTS (SELECT 1 FROM (SELECT * FROM `conditions`) c WHERE c.`type` < 0 AND 43001 IN (c.`value1`, c.`value2`, c.`value3`, c.`value4`));
DELETE FROM `conditions` WHERE `condition_entry` = 33003 AND NOT EXISTS (SELECT 1 FROM `creature_ai_events` WHERE `condition_id` = 33003) AND NOT EXISTS (SELECT 1 FROM `creature_ai_scripts` WHERE `condition_id` = 33003) AND NOT EXISTS (SELECT 1 FROM `generic_scripts` WHERE `condition_id` = 33003) AND NOT EXISTS (SELECT 1 FROM `gameobject_scripts` WHERE `condition_id` = 33003) AND NOT EXISTS (SELECT 1 FROM `gossip_scripts` WHERE `condition_id` = 33003) AND NOT EXISTS (SELECT 1 FROM `event_scripts` WHERE `condition_id` = 33003) AND NOT EXISTS (SELECT 1 FROM `creature_movement_scripts` WHERE `condition_id` = 33003) AND NOT EXISTS (SELECT 1 FROM `quest_start_scripts` WHERE `condition_id` = 33003) AND NOT EXISTS (SELECT 1 FROM `quest_end_scripts` WHERE `condition_id` = 33003) AND NOT EXISTS (SELECT 1 FROM `spell_scripts` WHERE `condition_id` = 33003) AND NOT EXISTS (SELECT 1 FROM `gossip_menu` WHERE `condition_id` = 33003) AND NOT EXISTS (SELECT 1 FROM `gossip_menu_option` WHERE `condition_id` = 33003) AND NOT EXISTS (SELECT 1 FROM (SELECT * FROM `conditions`) c WHERE c.`type` < 0 AND 33003 IN (c.`value1`, c.`value2`, c.`value3`, c.`value4`));
