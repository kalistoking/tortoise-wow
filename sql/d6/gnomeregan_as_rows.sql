-- Gnomeregan (map 90), the Matrix Punchographs: its C++ as rows -- EPIC10 tier 2.
-- Written by the trt repo's scripts/tier2/a13_gnomeregan.py from t1_world; gnomeregan_restore.sql puts
-- back what this replaces. R8: a person applies it, into the world database.
--
-- The C++ keeps its script names: mod-gnomeregan is the switch (AM1, handoff/manager-091).
-- Loaded, the C++ runs as before -- a script found by name comes first. Unloaded
-- (`module unload mod-gnomeregan`, which gives every creature standing a new AI at once),
-- the names find no script and the creatures run these rows (their ai_name).
--
-- Map 90 keeps instance_gnomeregan, Emi Shortfuse, Kernobee and Thermaplugg (the core). The C++ sent
-- each punchograph's card text (1753-1756) and then its own text over it: only its own shows, as here.


DELETE FROM `conditions` WHERE `condition_entry` IN (901301, 901302, 901305, 901306, 901311, 901312, 901315, 901316, 901319, 901320, 901323, 901324, 901330, 901331);
INSERT INTO `conditions`
(`condition_entry`, `type`, `value1`, `value2`, `value3`, `value4`, `flags`)
VALUES
(901301, 9, 2930, 1, 0, 0, 0),
(901302, 9, 2930, 1, 0, 0, 1),
(901305, 17, 3959, 1, 0, 0, 0),
(901306, -1, 37, 43, 901305, 0, 0),
(901311, 2, 9280, 1, 0, 0, 1),
(901312, -1, 901301, 38, 901311, 0, 0),
(901315, 2, 9282, 1, 0, 0, 1),
(901316, -1, 901301, 39, 901315, 0, 0),
(901319, 2, 9281, 1, 0, 0, 1),
(901320, -1, 901301, 40, 901319, 0, 0),
(901323, 2, 9316, 1, 0, 0, 1),
(901324, -1, 901301, 41, 901323, 0, 0),
(901330, -1, 901324, 901306, 0, 0, 0),
(901331, -1, 901302, 901306, 0, 0, 0);

DELETE FROM `gossip_scripts` WHERE `id` IN (1423451, 1424751, 1424761, 1426961, 1426962);
INSERT INTO `gossip_scripts`
(`id`, `delay`, `priority`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`)
VALUES
(1423451, 0, 0, 15, 11512, 0, 0, 0, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Matrix Punchograph 142345 - the next access card (11512)'),
(1424751, 0, 0, 15, 11525, 0, 0, 0, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Matrix Punchograph 142475 - the next access card (11525)'),
(1424761, 0, 0, 15, 11528, 0, 0, 0, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Matrix Punchograph 142476 - the next access card (11528)'),
(1426961, 0, 0, 15, 11545, 0, 0, 0, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Matrix Punchograph 142696 - the next access card (11545)'),
(1426962, 0, 0, 15, 4031, 0, 0, 0, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Matrix Punchograph 3005-D - Schematic: Discombobulator Ray');

DELETE FROM `gossip_menu` WHERE `entry` = 1423450 AND `text_id` = 1643;
INSERT INTO `gossip_menu`
(`entry`, `text_id`, `script_id`, `condition_id`)
VALUES
(1423450, 1643, 0, 0);

DELETE FROM `gossip_menu_option` WHERE `menu_id` = 1423450 AND `id` = 0;
INSERT INTO `gossip_menu_option`
(`menu_id`, `id`, `option_icon`, `option_text`, `option_broadcast_text`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `box_broadcast_text`, `condition_id`)
VALUES
(1423450, 0, 0, 'Acquire Higher Level Access Card', 0, 1, 1, -1, 0, 1423451, 0, 0, NULL, 0, 901312);

DELETE FROM `gossip_menu` WHERE `entry` = 1424750 AND `text_id` = 1647;
INSERT INTO `gossip_menu`
(`entry`, `text_id`, `script_id`, `condition_id`)
VALUES
(1424750, 1647, 0, 0);

DELETE FROM `gossip_menu_option` WHERE `menu_id` = 1424750 AND `id` = 0;
INSERT INTO `gossip_menu_option`
(`menu_id`, `id`, `option_icon`, `option_text`, `option_broadcast_text`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `box_broadcast_text`, `condition_id`)
VALUES
(1424750, 0, 0, 'Acquire Higher Level Access Card', 0, 1, 1, -1, 0, 1424751, 0, 0, NULL, 0, 901316);

DELETE FROM `gossip_menu` WHERE `entry` = 1424760 AND `text_id` = 1649;
INSERT INTO `gossip_menu`
(`entry`, `text_id`, `script_id`, `condition_id`)
VALUES
(1424760, 1649, 0, 0);

DELETE FROM `gossip_menu_option` WHERE `menu_id` = 1424760 AND `id` = 0;
INSERT INTO `gossip_menu_option`
(`menu_id`, `id`, `option_icon`, `option_text`, `option_broadcast_text`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `box_broadcast_text`, `condition_id`)
VALUES
(1424760, 0, 0, 'Acquire Higher Level Access Card', 0, 1, 1, -1, 0, 1424761, 0, 0, NULL, 0, 901320);

DELETE FROM `gossip_menu` WHERE `entry` = 1426960 AND `text_id` = 1651;
INSERT INTO `gossip_menu`
(`entry`, `text_id`, `script_id`, `condition_id`)
VALUES
(1426960, 1651, 0, 0);

DELETE FROM `gossip_menu_option` WHERE `menu_id` = 1426960 AND `id` = 0;
INSERT INTO `gossip_menu_option`
(`menu_id`, `id`, `option_icon`, `option_text`, `option_broadcast_text`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `box_broadcast_text`, `condition_id`)
VALUES
(1426960, 0, 0, 'Acquire Higher Level Access Card', 0, 1, 1, -1, 0, 1426961, 0, 0, NULL, 0, 901324);

DELETE FROM `gossip_menu_option` WHERE `menu_id` = 1426960 AND `id` = 1;
INSERT INTO `gossip_menu_option`
(`menu_id`, `id`, `option_icon`, `option_text`, `option_broadcast_text`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `box_broadcast_text`, `condition_id`)
VALUES
(1426960, 1, 0, 'Use engineering to access hidden schematics!', 0, 1, 1, -1, 0, 1426962, 0, 0, NULL, 0, 901330);

DELETE FROM `gossip_menu_option` WHERE `menu_id` = 1426960 AND `id` = 2;
INSERT INTO `gossip_menu_option`
(`menu_id`, `id`, `option_icon`, `option_text`, `option_broadcast_text`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `box_broadcast_text`, `condition_id`)
VALUES
(1426960, 2, 0, 'Use engineering to access hidden schematics!', 0, 1, 1, -1, 0, 1426962, 0, 0, NULL, 0, 901331);

UPDATE `gameobject_template` SET `data3` = 1423450 WHERE `entry` = 142345;
UPDATE `gameobject_template` SET `data3` = 1424750 WHERE `entry` = 142475;
UPDATE `gameobject_template` SET `data3` = 1424760 WHERE `entry` = 142476;
UPDATE `gameobject_template` SET `data3` = 1426960 WHERE `entry` = 142696;
