-- Uldaman (map 70), Ironaya, the Jadespine Basilisk, Annora and the Lore Keeper: its C++ as rows -- EPIC10 tier 2.
-- Written by the trt repo's scripts/tier2/a11_uldaman.py from t1_world; uldaman_restore.sql puts
-- back what this replaces. R8: a person applies it, into the world database.
--
-- The C++ keeps its script names: mod-uldaman is the switch (AM1, handoff/manager-091).
-- Loaded, the C++ runs as before -- a script found by name comes first. Unloaded
-- (`module unload mod-uldaman`, which gives every creature standing a new AI at once),
-- the names find no script and the creatures run these rows (their ai_name).
--
-- Map 70 keeps instance_uldaman and Archaedas (the core). Ironaya's rows attack whom she sees
-- first once the instance wakes her; the C++ sent her at the one who used the keystone.
-- Ironaya's Arcing Smash starts 3-13 s in: the C++ never set its first timer.
-- The Lore Keeper's greeting now lists his quests too; the C++ sent the menu without them.

UPDATE `creature_template` SET `ai_name` = 'EventAI' WHERE `entry` = 4863;
UPDATE `creature_template` SET `gossip_menu_id` = 717200 WHERE `entry` = 7172;
UPDATE `creature_template` SET `ai_name` = 'EventAI' WHERE `entry` = 7228;
UPDATE `creature_template` SET `ai_name` = 'EventAI' WHERE `entry` = 11073;

DELETE FROM `conditions` WHERE `condition_entry` IN (70001, 70002, 70003, 70004, 70005);
INSERT INTO `conditions`
(`condition_entry`, `type`, `value1`, `value2`, `value3`, `value4`, `flags`)
VALUES
(70001, 33, 70, 0, 0, 0, 0),
(70002, 54, -160, 196, -50, 30, 0),
(70003, 20, 7078, 30, 0, 1, 1),
(70004, -1, 70001, 70002, 70003, 0, 0),
(70005, 9, 2278, 1, 0, 0, 0);

DELETE FROM `creature_ai_events` WHERE `id` IN (486301, 707802, 722801, 722802, 722803, 722804, 1107301);
INSERT INTO `creature_ai_events`
(`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`)
VALUES
(722801, 7228, 0, 4, 0, 100, 0, 0, 0, 0, 0, 722801, 0, 0, 'Ironaya - aggro'),
(722802, 7228, 0, 2, 0, 100, 0, 49, 0, 0, 0, 722802, 0, 0, 'Ironaya - Knock Away once, under half health'),
(722803, 7228, 0, 0, 0, 100, 9, 3000, 13000, 13000, 13000, 722803, 0, 0, 'Ironaya - Arcing Smash'),
(722804, 7228, 0, 2, 0, 100, 0, 24, 0, 0, 0, 722804, 0, 0, 'Ironaya - War Stomp once, under a quarter'),
(486301, 4863, 0, 0, 0, 100, 1, 2000, 2000, 28000, 28000, 486301, 0, 0, 'Jadespine Basilisk - Crystalline Slumber'),
(707802, 7078, 0, 6, 0, 100, 0, 0, 0, 0, 0, 707802, 0, 0, 'Cleft Scorpid - the last by Annora dead: Annora comes'),
(1107301, 11073, 0, 11, 0, 100, 0, 0, 0, 0, 0, 1107301, 0, 0, 'Annora - out from her hiding place');

DELETE FROM `creature_ai_scripts` WHERE `id` IN (486301, 707802, 722801, 722802, 722803, 722804, 1107301);
INSERT INTO `creature_ai_scripts`
(`id`, `delay`, `priority`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`)
VALUES
(722801, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 3261, 0, 0, 0, 0, 0, 0, 0, 0, 'Ironaya - aggro yell'),
(722801, 0, 1, 49, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Ironaya - SetInCombatWithZone'),
(722802, 0, 0, 15, 10101, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Ironaya - Knock Away'),
(722802, 0, 1, 29, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, -100, 0, 0, 0, 0, 'Ironaya - her victim''s threat gone'),
(722803, 0, 0, 15, 8374, 0, 0, 0, 0, 0, 0, 12, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Ironaya - Arcing Smash'),
(722804, 0, 0, 15, 11876, 0, 0, 0, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Ironaya - War Stomp'),
(486301, 0, 0, 15, 3636, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Jadespine Basilisk - Crystalline Slumber'),
(486301, 0, 1, 29, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, -100, 0, 0, 0, 0, 'Jadespine Basilisk - the sleeper''s threat gone'),
(707802, 0, 0, 91, 52882, 0, 0, 0, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, 70004, 'Cleft Scorpid - Annora spawned (the last by her dead)'),
(1107301, 0, 0, 3, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, -164.3657, 210.7687, -49.572, 0, 0, 'Annora - out from her hiding place');

DELETE FROM `gossip_scripts` WHERE `id` IN (717215);
INSERT INTO `gossip_scripts`
(`id`, `delay`, `priority`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`)
VALUES
(717215, 0, 0, 7, 2278, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Lore Keeper of Norgannon - The Earthen Discs explored');

DELETE FROM `gossip_menu_option` WHERE `menu_id` = 717200 AND `id` = 0;
INSERT INTO `gossip_menu_option`
(`menu_id`, `id`, `option_icon`, `option_text`, `option_broadcast_text`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `box_broadcast_text`, `condition_id`)
VALUES
(717200, 0, 0, 'Who are the Earthen?', 0, 1, 1, 717201, 0, 0, 0, 0, NULL, 0, 70005);

DELETE FROM `gossip_menu` WHERE `entry` = 717201 AND `text_id` = 1080;
INSERT INTO `gossip_menu`
(`entry`, `text_id`, `script_id`, `condition_id`)
VALUES
(717201, 1080, 0, 0);

DELETE FROM `gossip_menu_option` WHERE `menu_id` = 717201 AND `id` = 0;
INSERT INTO `gossip_menu_option`
(`menu_id`, `id`, `option_icon`, `option_text`, `option_broadcast_text`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `box_broadcast_text`, `condition_id`)
VALUES
(717201, 0, 0, 'What is a "subterranean being matrix"?', 0, 1, 1, 717202, 0, 0, 0, 0, NULL, 0, 0);

DELETE FROM `gossip_menu` WHERE `entry` = 717202 AND `text_id` = 1081;
INSERT INTO `gossip_menu`
(`entry`, `text_id`, `script_id`, `condition_id`)
VALUES
(717202, 1081, 0, 0);

DELETE FROM `gossip_menu_option` WHERE `menu_id` = 717202 AND `id` = 0;
INSERT INTO `gossip_menu_option`
(`menu_id`, `id`, `option_icon`, `option_text`, `option_broadcast_text`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `box_broadcast_text`, `condition_id`)
VALUES
(717202, 0, 0, 'What are the anomalies you speak of?', 0, 1, 1, 717203, 0, 0, 0, 0, NULL, 0, 0);

DELETE FROM `gossip_menu` WHERE `entry` = 717203 AND `text_id` = 1082;
INSERT INTO `gossip_menu`
(`entry`, `text_id`, `script_id`, `condition_id`)
VALUES
(717203, 1082, 0, 0);

DELETE FROM `gossip_menu_option` WHERE `menu_id` = 717203 AND `id` = 0;
INSERT INTO `gossip_menu_option`
(`menu_id`, `id`, `option_icon`, `option_text`, `option_broadcast_text`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `box_broadcast_text`, `condition_id`)
VALUES
(717203, 0, 0, 'What is a resilient foundation of construction?', 0, 1, 1, 717204, 0, 0, 0, 0, NULL, 0, 0);

DELETE FROM `gossip_menu` WHERE `entry` = 717204 AND `text_id` = 1083;
INSERT INTO `gossip_menu`
(`entry`, `text_id`, `script_id`, `condition_id`)
VALUES
(717204, 1083, 0, 0);

DELETE FROM `gossip_menu_option` WHERE `menu_id` = 717204 AND `id` = 0;
INSERT INTO `gossip_menu_option`
(`menu_id`, `id`, `option_icon`, `option_text`, `option_broadcast_text`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `box_broadcast_text`, `condition_id`)
VALUES
(717204, 0, 0, 'So... the Earthen were made out of stone?', 0, 1, 1, 717205, 0, 0, 0, 0, NULL, 0, 0);

DELETE FROM `gossip_menu` WHERE `entry` = 717205 AND `text_id` = 1084;
INSERT INTO `gossip_menu`
(`entry`, `text_id`, `script_id`, `condition_id`)
VALUES
(717205, 1084, 0, 0);

DELETE FROM `gossip_menu_option` WHERE `menu_id` = 717205 AND `id` = 0;
INSERT INTO `gossip_menu_option`
(`menu_id`, `id`, `option_icon`, `option_text`, `option_broadcast_text`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `box_broadcast_text`, `condition_id`)
VALUES
(717205, 0, 0, 'Anything else I should know about the Earthen?', 0, 1, 1, 717206, 0, 0, 0, 0, NULL, 0, 0);

DELETE FROM `gossip_menu` WHERE `entry` = 717206 AND `text_id` = 1085;
INSERT INTO `gossip_menu`
(`entry`, `text_id`, `script_id`, `condition_id`)
VALUES
(717206, 1085, 0, 0);

DELETE FROM `gossip_menu_option` WHERE `menu_id` = 717206 AND `id` = 0;
INSERT INTO `gossip_menu_option`
(`menu_id`, `id`, `option_icon`, `option_text`, `option_broadcast_text`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `box_broadcast_text`, `condition_id`)
VALUES
(717206, 0, 0, 'I think I understand the Creators'' design intent for the Earthen now. What are the Earthen''s anomalies that you spoke of earlier?', 0, 1, 1, 717207, 0, 0, 0, 0, NULL, 0, 0);

DELETE FROM `gossip_menu` WHERE `entry` = 717207 AND `text_id` = 1086;
INSERT INTO `gossip_menu`
(`entry`, `text_id`, `script_id`, `condition_id`)
VALUES
(717207, 1086, 0, 0);

DELETE FROM `gossip_menu_option` WHERE `menu_id` = 717207 AND `id` = 0;
INSERT INTO `gossip_menu_option`
(`menu_id`, `id`, `option_icon`, `option_text`, `option_broadcast_text`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `box_broadcast_text`, `condition_id`)
VALUES
(717207, 0, 0, 'What high-stress environments would cause the Earthen to destabilize?', 0, 1, 1, 717208, 0, 0, 0, 0, NULL, 0, 0);

DELETE FROM `gossip_menu` WHERE `entry` = 717208 AND `text_id` = 1087;
INSERT INTO `gossip_menu`
(`entry`, `text_id`, `script_id`, `condition_id`)
VALUES
(717208, 1087, 0, 0);

DELETE FROM `gossip_menu_option` WHERE `menu_id` = 717208 AND `id` = 0;
INSERT INTO `gossip_menu_option`
(`menu_id`, `id`, `option_icon`, `option_text`, `option_broadcast_text`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `box_broadcast_text`, `condition_id`)
VALUES
(717208, 0, 0, 'What happens when the Earthen destabilize?', 0, 1, 1, 717209, 0, 0, 0, 0, NULL, 0, 0);

DELETE FROM `gossip_menu` WHERE `entry` = 717209 AND `text_id` = 1088;
INSERT INTO `gossip_menu`
(`entry`, `text_id`, `script_id`, `condition_id`)
VALUES
(717209, 1088, 0, 0);

DELETE FROM `gossip_menu_option` WHERE `menu_id` = 717209 AND `id` = 0;
INSERT INTO `gossip_menu_option`
(`menu_id`, `id`, `option_icon`, `option_text`, `option_broadcast_text`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `box_broadcast_text`, `condition_id`)
VALUES
(717209, 0, 0, 'Troggs?! Are the troggs you mention the same as the ones in the world today?', 0, 1, 1, 717210, 0, 0, 0, 0, NULL, 0, 0);

DELETE FROM `gossip_menu` WHERE `entry` = 717210 AND `text_id` = 1089;
INSERT INTO `gossip_menu`
(`entry`, `text_id`, `script_id`, `condition_id`)
VALUES
(717210, 1089, 0, 0);

DELETE FROM `gossip_menu_option` WHERE `menu_id` = 717210 AND `id` = 0;
INSERT INTO `gossip_menu_option`
(`menu_id`, `id`, `option_icon`, `option_text`, `option_broadcast_text`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `box_broadcast_text`, `condition_id`)
VALUES
(717210, 0, 0, 'You mentioned two results when the Earthen destabilize. What is the second?', 0, 1, 1, 717211, 0, 0, 0, 0, NULL, 0, 0);

DELETE FROM `gossip_menu` WHERE `entry` = 717211 AND `text_id` = 1090;
INSERT INTO `gossip_menu`
(`entry`, `text_id`, `script_id`, `condition_id`)
VALUES
(717211, 1090, 0, 0);

DELETE FROM `gossip_menu_option` WHERE `menu_id` = 717211 AND `id` = 0;
INSERT INTO `gossip_menu_option`
(`menu_id`, `id`, `option_icon`, `option_text`, `option_broadcast_text`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `box_broadcast_text`, `condition_id`)
VALUES
(717211, 0, 0, 'Dwarves!!! Now you''re telling me that dwarves originally came from the Earthen?!', 0, 1, 1, 717212, 0, 0, 0, 0, NULL, 0, 0);

DELETE FROM `gossip_menu` WHERE `entry` = 717212 AND `text_id` = 1091;
INSERT INTO `gossip_menu`
(`entry`, `text_id`, `script_id`, `condition_id`)
VALUES
(717212, 1091, 0, 0);

DELETE FROM `gossip_menu_option` WHERE `menu_id` = 717212 AND `id` = 0;
INSERT INTO `gossip_menu_option`
(`menu_id`, `id`, `option_icon`, `option_text`, `option_broadcast_text`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `box_broadcast_text`, `condition_id`)
VALUES
(717212, 0, 0, 'These dwarves are the same ones today, yes? Do the dwarves maintain any other links to the Earthen?', 0, 1, 1, 717213, 0, 0, 0, 0, NULL, 0, 0);

DELETE FROM `gossip_menu` WHERE `entry` = 717213 AND `text_id` = 1092;
INSERT INTO `gossip_menu`
(`entry`, `text_id`, `script_id`, `condition_id`)
VALUES
(717213, 1092, 0, 0);

DELETE FROM `gossip_menu_option` WHERE `menu_id` = 717213 AND `id` = 0;
INSERT INTO `gossip_menu_option`
(`menu_id`, `id`, `option_icon`, `option_text`, `option_broadcast_text`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `box_broadcast_text`, `condition_id`)
VALUES
(717213, 0, 0, 'Who are the Creators?', 0, 1, 1, 717214, 0, 0, 0, 0, NULL, 0, 0);

DELETE FROM `gossip_menu` WHERE `entry` = 717214 AND `text_id` = 1093;
INSERT INTO `gossip_menu`
(`entry`, `text_id`, `script_id`, `condition_id`)
VALUES
(717214, 1093, 0, 0);

DELETE FROM `gossip_menu_option` WHERE `menu_id` = 717214 AND `id` = 0;
INSERT INTO `gossip_menu_option`
(`menu_id`, `id`, `option_icon`, `option_text`, `option_broadcast_text`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `box_broadcast_text`, `condition_id`)
VALUES
(717214, 0, 0, 'This is a lot to think about.', 0, 1, 1, 717215, 0, 0, 0, 0, NULL, 0, 0);

DELETE FROM `gossip_menu` WHERE `entry` = 717215 AND `text_id` = 1094;
INSERT INTO `gossip_menu`
(`entry`, `text_id`, `script_id`, `condition_id`)
VALUES
(717215, 1094, 0, 0);

DELETE FROM `gossip_menu_option` WHERE `menu_id` = 717215 AND `id` = 0;
INSERT INTO `gossip_menu_option`
(`menu_id`, `id`, `option_icon`, `option_text`, `option_broadcast_text`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `box_broadcast_text`, `condition_id`)
VALUES
(717215, 0, 0, 'I will access the discs now.', 0, 1, 1, -1, 0, 717215, 0, 0, NULL, 0, 0);

UPDATE `creature` SET `spawn_flags` = 2 WHERE `guid` = 52882;
