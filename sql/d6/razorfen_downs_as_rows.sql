-- Razorfen Downs (map 129), the gong, its waves, Lady Falther'ess and Henry Stern: its C++ as rows -- EPIC10 tier 2.
-- Written by the trt repo's scripts/tier2/a35_razorfen_downs.py from t1_world; razorfen_downs_restore.sql puts
-- back what this replaces. R8: a person applies it, into the world database.
--
-- The C++ keeps its script names: mod-razorfen-downs is the switch (AM1, handoff/manager-091).
-- Loaded, the C++ runs as before -- a script found by name comes first. Unloaded
-- (`module unload mod-razorfen-downs`, which gives every creature standing a new AI at once),
-- the names find no script and the creatures run these rows (their ai_name).
--
-- Map 129 keeps instance_razorfen_downs's numbers in the generic store: slot 1 the gong count. The gong
-- shows its own use too (the C++ held it back); the summons spread in a circle round each point, where the
-- C++ added a whole-yard square. Belnistrasz stays C++ (razorfen_downs_escort.cpp).

UPDATE `creature_template` SET `ai_name` = 'EventAI' WHERE `entry` = 7349;
UPDATE `creature_template` SET `ai_name` = 'EventAI' WHERE `entry` = 7351;
UPDATE `creature_template` SET `gossip_menu_id` = 869600 WHERE `entry` = 8696;
UPDATE `creature_template` SET `ai_name` = 'EventAI' WHERE `entry` = 14686;

DELETE FROM `conditions` WHERE `condition_entry` IN (129009, 129010, 129014, 129015, 129030, 129031, 129032, 129033, 129034, 129035);
INSERT INTO `conditions`
(`condition_entry`, `type`, `value1`, `value2`, `value3`, `value4`, `flags`)
VALUES
(129009, 34, 1, 9, 0, 0, 0),
(129010, 34, 1, 10, 0, 0, 0),
(129014, 34, 1, 14, 0, 0, 0),
(129015, 34, 1, 15, 0, 0, 0),
(129030, 7, 185, 175, 0, 0, 0),
(129031, 17, 13028, 1, 0, 0, 0),
(129032, -1, 129030, 129031, 0, 0, 0),
(129033, 7, 171, 180, 0, 0, 0),
(129034, 17, 3451, 1, 0, 0, 0),
(129035, -1, 129033, 129034, 0, 0, 0);

-- Conditions another tier-2 migration writes too, under the same entry: whichever comes first.
INSERT IGNORE INTO `conditions`
(`condition_entry`, `type`, `value1`, `value2`, `value3`, `value4`, `flags`)
VALUES
(129001, 34, 1, 1, 0, 0, 0);

DELETE FROM `creature_ai_events` WHERE `id` IN (734901, 735101, 1468601);
INSERT INTO `creature_ai_events`
(`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`)
VALUES
(734901, 7349, 0, 6, 0, 100, 0, 0, 0, 0, 0, 734901, 0, 0, 'Tomb Fiend - dead: the gong count'),
(735101, 7351, 0, 6, 0, 100, 0, 0, 0, 0, 0, 735101, 0, 0, 'Tomb Reaver - dead: the gong count'),
(1468601, 14686, 0, 0, 0, 100, 9, 8000, 8000, 8000, 8000, 1468601, 0, 0, 'Lady Falther''ess - Mind Blast');

DELETE FROM `creature_ai_scripts` WHERE `id` IN (734901, 735101, 1468601);
INSERT INTO `creature_ai_scripts`
(`id`, `delay`, `priority`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`)
VALUES
(734901, 0, 0, 37, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Tomb Fiend - one more (slot 1)'),
(734901, 0, 1, 39, 734950, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0, 0, 0, 0, 0, 0, 0, 'Tomb Fiend - the gong waves read the count'),
(735101, 0, 0, 37, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Tomb Reaver - one more (slot 1)'),
(735101, 0, 1, 39, 734950, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0, 0, 0, 0, 0, 0, 0, 'Tomb Reaver - the gong waves read the count'),
(1468601, 0, 0, 15, 8105, 0, 0, 0, 0, 0, 1, 8, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Lady Falther''ess - Mind Blast');

DELETE FROM `generic_scripts` WHERE `id` IN (734950, 734951);
INSERT INTO `generic_scripts`
(`id`, `delay`, `priority`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`)
VALUES
(734950, 0, 0, 4, 9, 16, 2, 0, 32045, 0, 12, 2, 0, 0, 0, 0, 0, 0, 0, 0, 129009, 'Gong - usable again (9)'),
(734950, 0, 1, 4, 9, 16, 2, 0, 32045, 0, 12, 2, 0, 0, 0, 0, 0, 0, 0, 0, 129014, 'Gong - usable again (14)'),
(734950, 0, 2, 4, 9, 16, 1, 0, 32045, 0, 12, 2, 0, 0, 0, 0, 0, 0, 0, 0, 129001, 'Gong - locked (1)'),
(734950, 0, 3, 10, 7349, 0, 0, 0, 0, 0, 0, 0, 1, 734951, -1, 7, 2502.635, 844.14, 46.896, 0.633, 129001, 'Gong waves - a Tomb Fiend at (2503, 844)'),
(734950, 0, 4, 10, 7349, 0, 0, 0, 0, 0, 0, 0, 196609, 734951, -1, 7, 2502.635, 844.14, 46.896, 5, 129001, 'Gong waves - a Tomb Fiend near (2503, 844)'),
(734950, 0, 5, 10, 7349, 0, 0, 0, 0, 0, 0, 0, 196609, 734951, -1, 7, 2502.635, 844.14, 46.896, 5, 129001, 'Gong waves - a Tomb Fiend near (2503, 844)'),
(734950, 0, 6, 10, 7349, 0, 0, 0, 0, 0, 0, 0, 196609, 734951, -1, 7, 2502.635, 844.14, 46.896, 5, 129001, 'Gong waves - a Tomb Fiend near (2503, 844)'),
(734950, 0, 7, 10, 7349, 0, 0, 0, 0, 0, 0, 0, 196609, 734951, -1, 7, 2546.33, 887.455, 47.69, 5, 129001, 'Gong waves - a Tomb Fiend near (2546, 887)'),
(734950, 0, 8, 10, 7349, 0, 0, 0, 0, 0, 0, 0, 196609, 734951, -1, 7, 2546.33, 887.455, 47.69, 5, 129001, 'Gong waves - a Tomb Fiend near (2546, 887)'),
(734950, 0, 9, 10, 7349, 0, 0, 0, 0, 0, 0, 0, 196609, 734951, -1, 7, 2546.33, 887.455, 47.69, 5, 129001, 'Gong waves - a Tomb Fiend near (2546, 887)'),
(734950, 0, 10, 10, 7349, 0, 0, 0, 0, 0, 0, 0, 196609, 734951, -1, 7, 2546.33, 887.455, 47.69, 5, 129001, 'Gong waves - a Tomb Fiend near (2546, 887)'),
(734950, 0, 11, 4, 9, 16, 1, 0, 32045, 0, 12, 2, 0, 0, 0, 0, 0, 0, 0, 0, 129010, 'Gong - locked (10)'),
(734950, 0, 12, 10, 7351, 0, 0, 0, 0, 0, 0, 0, 1, 734951, -1, 7, 2502.635, 844.14, 46.896, 0.633, 129010, 'Gong waves - a Tomb Reaver at (2503, 844)'),
(734950, 0, 13, 10, 7351, 0, 0, 0, 0, 0, 0, 0, 196609, 734951, -1, 7, 2502.635, 844.14, 46.896, 5, 129010, 'Gong waves - a Tomb Reaver near (2503, 844)'),
(734950, 0, 14, 10, 7351, 0, 0, 0, 0, 0, 0, 0, 196609, 734951, -1, 7, 2546.33, 887.455, 47.69, 5, 129010, 'Gong waves - a Tomb Reaver near (2546, 887)'),
(734950, 0, 15, 10, 7351, 0, 0, 0, 0, 0, 0, 0, 196609, 734951, -1, 7, 2546.33, 887.455, 47.69, 5, 129010, 'Gong waves - a Tomb Reaver near (2546, 887)'),
(734950, 0, 16, 4, 9, 16, 1, 0, 32045, 0, 12, 2, 0, 0, 0, 0, 0, 0, 0, 0, 129015, 'Gong - locked (15)'),
(734950, 0, 17, 10, 7355, 0, 0, 0, 0, 0, 0, 0, 1, 734951, -1, 7, 2502.635, 844.14, 46.896, 0.633, 129015, 'Gong waves - Tuten''kash at (2503, 844)'),
(734951, 0, 0, 3, 3, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2533.479, 870.02, 47.678, 5, 0, 'Gong wave - runs to the gong');

DELETE FROM `gameobject_scripts` WHERE `id` IN (32045);
INSERT INTO `gameobject_scripts`
(`id`, `delay`, `priority`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`)
VALUES
(32045, 0, 0, 37, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Gong - one more (slot 1)'),
(32045, 0, 1, 39, 734950, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0, 0, 0, 0, 0, 0, 0, 'Gong - the gong waves read the count');

DELETE FROM `gossip_scripts` WHERE `id` IN (869601, 869602);
INSERT INTO `gossip_scripts`
(`id`, `delay`, `priority`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`)
VALUES
(869601, 0, 0, 15, 13029, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Henry Stern - the cooking recipe: the recipe on the player'),
(869602, 0, 0, 15, 13030, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Henry Stern - the alchemy recipe: the recipe on the player');

DELETE FROM `gossip_menu` WHERE `entry` = 869601 AND `text_id` = 2114;
INSERT INTO `gossip_menu`
(`entry`, `text_id`, `script_id`, `condition_id`)
VALUES
(869601, 2114, 0, 0);

DELETE FROM `gossip_menu_option` WHERE `menu_id` = 869600 AND `id` = 0;
INSERT INTO `gossip_menu_option`
(`menu_id`, `id`, `option_icon`, `option_text`, `option_broadcast_text`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `box_broadcast_text`, `condition_id`)
VALUES
(869600, 0, 0, 'Teach me the cooking recipe', 0, 1, 1, 869601, 0, 869601, 0, 0, NULL, 0, 129032);

DELETE FROM `gossip_menu` WHERE `entry` = 869602 AND `text_id` = 2115;
INSERT INTO `gossip_menu`
(`entry`, `text_id`, `script_id`, `condition_id`)
VALUES
(869602, 2115, 0, 0);

DELETE FROM `gossip_menu_option` WHERE `menu_id` = 869600 AND `id` = 1;
INSERT INTO `gossip_menu_option`
(`menu_id`, `id`, `option_icon`, `option_text`, `option_broadcast_text`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `box_broadcast_text`, `condition_id`)
VALUES
(869600, 1, 0, 'Teach me the alchemy recipe', 0, 1, 1, 869602, 0, 869602, 0, 0, NULL, 0, 129035);

-- The generic store's slots (AC7; the table from ac7_instance_data_slot.sql).
DELETE FROM `instance_data_slot` WHERE `map` = 129 AND `slot` = 1;
INSERT INTO `instance_data_slot`
(`map`, `slot`, `flags`, `name`)
VALUES
(129, 1, 4, 'the gong: waves rung and their dead (1, 9, 10, 14, 15)');

