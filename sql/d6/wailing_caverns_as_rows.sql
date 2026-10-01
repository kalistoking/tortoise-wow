-- Wailing Caverns (map 43), instance_wailing_caverns and the Evolving Ectoplasm: its C++ as rows -- EPIC10 tier 2.
-- Written by the trt repo's scripts/tier2/a36_wailing_caverns.py from t1_world; wailing_caverns_restore.sql puts
-- back what this replaces. R8: a person applies it, into the world database.
--
-- The C++ keeps its script names: mod-wailing-caverns is the switch (AM1, handoff/manager-091).
-- Loaded, the C++ runs as before -- a script found by name comes first. Unloaded
-- (`module unload mod-wailing-caverns`, which gives every creature standing a new AI at once),
-- the names find no script and the creatures run these rows (their ai_name).
--
-- Map 43 keeps instance_wailing_caverns: with mod-wailing-caverns unloaded a map made then gets the
-- generic store (AC7), and these rows run only on such a map (condition 43001, 63 reversed) -- a map made
-- with the C++ keeps it, the module unloaded or not. The lords' and Mutanus's own rules write slots 0-5.
-- Mutanus despawns the living only (the C++ the looted corpses too), and the whole of the dungeon within
-- 1000 yd of him. The Disciple stays C++ (wailing_caverns_disciple.cpp).
-- Needs the core of trt/module-structure with conditions 62/63 and the SQL of AC3, AC7 and AC9 applied.

UPDATE `creature_template` SET `ai_name` = 'EventAI' WHERE `entry` = 3640;

DELETE FROM `conditions` WHERE `condition_entry` IN (43001, 43008, 43012, 43013, 43014, 43015, 43016, 43017, 43018, 43024, 43025, 43026, 43027, 43028, 10043021, 10043022, 10043023);
INSERT INTO `conditions`
(`condition_entry`, `type`, `value1`, `value2`, `value3`, `value4`, `flags`)
VALUES
(43001, 63, 0, 0, 0, 0, 1),
(43008, 34, 7, 0, 0, 0, 0),
(43012, 28, 1, 0, 0, 0, 1),
(43013, 16, 3678, 0, 0, 0, 0),
(43014, 16, 3679, 0, 0, 0, 0),
(43015, 16, 3653, 0, 0, 0, 0),
(43016, 16, 2914, 0, 0, 0, 0),
(43017, 16, 3835, 0, 0, 0, 0),
(43018, 9, 7944, 2, 0, 0, 0),
(10043021, -1, 532004, 209022, 43001, 0, 0),
(10043022, -1, 230042, 1000, 43001, 0, 0),
(10043023, -1, 230042, 43001, 0, 0, 0),
(43024, -2, 43013, 43014, 43015, 43016, 0),
(43025, -2, 43024, 43017, 0, 0, 1),
(43026, -1, 116, 43012, 43025, 0, 0),
(43027, -1, 43008, 43001, 0, 0, 0),
(43028, -1, 43018, 43008, 43001, 0, 0);

-- Conditions another tier-2 migration writes too, under the same entry: whichever comes first.
INSERT IGNORE INTO `conditions`
(`condition_entry`, `type`, `value1`, `value2`, `value3`, `value4`, `flags`)
VALUES
(532000, 34, 0, 3, 0, 0, 0),
(532001, 34, 1, 3, 0, 0, 0),
(532003, 34, 3, 3, 0, 0, 0),
(209022, 34, 4, 0, 0, 0, 0),
(230042, 34, 6, 0, 0, 0, 0),
(532004, -1, 532000, 532001, 3704, 532003, 0);

DELETE FROM `creature_ai_events` WHERE `id` IN (364001, 364002, 364003, 364004);
INSERT INTO `creature_ai_events`
(`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`)
VALUES
(364001, 3640, 0, 8, 2, 100, 1, 0, 16, 0, 0, 364001, 0, 0, 'Evolving Ectoplasm - hit by frost: immune to it for 10 s'),
(364002, 3640, 0, 8, 2, 100, 1, 0, 4, 0, 0, 364002, 0, 0, 'Evolving Ectoplasm - hit by fire: immune to it for 10 s'),
(364003, 3640, 0, 8, 2, 100, 1, 0, 8, 0, 0, 364003, 0, 0, 'Evolving Ectoplasm - hit by nature: immune to it for 10 s'),
(364004, 3640, 0, 8, 2, 100, 1, 0, 32, 0, 0, 364004, 0, 0, 'Evolving Ectoplasm - hit by shadow: immune to it for 10 s');

DELETE FROM `creature_ai_scripts` WHERE `id` IN (364001, 364002, 364003, 364004);
INSERT INTO `creature_ai_scripts`
(`id`, `delay`, `priority`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`)
VALUES
(364001, 0, 0, 44, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Evolving Ectoplasm - immune (phase 1)'),
(364001, 0, 1, 15, 7940, 32, 0, 0, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Evolving Ectoplasm - Frost Immunity'),
(364001, 0, 2, 39, 364050, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0, 0, 0, 0, 0, 0, 0, 'Evolving Ectoplasm - the immunity ends in 10 s'),
(364002, 0, 0, 44, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Evolving Ectoplasm - immune (phase 1)'),
(364002, 0, 1, 15, 7942, 32, 0, 0, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Evolving Ectoplasm - Fire Immunity'),
(364002, 0, 2, 39, 364050, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0, 0, 0, 0, 0, 0, 0, 'Evolving Ectoplasm - the immunity ends in 10 s'),
(364003, 0, 0, 44, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Evolving Ectoplasm - immune (phase 1)'),
(364003, 0, 1, 15, 7941, 32, 0, 0, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Evolving Ectoplasm - Nature Immunity'),
(364003, 0, 2, 39, 364050, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0, 0, 0, 0, 0, 0, 0, 'Evolving Ectoplasm - the immunity ends in 10 s'),
(364004, 0, 0, 44, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Evolving Ectoplasm - immune (phase 1)'),
(364004, 0, 1, 15, 7743, 32, 0, 0, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Evolving Ectoplasm - Shadow Immunity'),
(364004, 0, 2, 39, 364050, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0, 0, 0, 0, 0, 0, 0, 'Evolving Ectoplasm - the immunity ends in 10 s');

DELETE FROM `generic_scripts` WHERE `id` IN (364050, 367850, 367851, 367852, 367853);
INSERT INTO `generic_scripts`
(`id`, `delay`, `priority`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`)
VALUES
(367850, 0, 0, 0, 6, 0, 0, 0, 38148, 0, 9, 18, 2102, 0, 0, 0, 0, 0, 0, 0, 10043022, 'Lord Serpentis - "Intruders have assaulted our lair..." (6 = 0)'),
(367850, 0, 1, 37, 6, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 10043023, 'Wailing Caverns - Serpentis has warned (6 = 1)'),
(367851, 0, 0, 0, 6, 0, 0, 0, 18675, 0, 9, 18, 2101, 0, 0, 0, 0, 0, 0, 0, 10043021, 'Disciple of Naralex - "At last! Naralex can be awakened!..." (0-3 = 3, 4 = 0)'),
(367851, 0, 1, 37, 4, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 10043021, 'Wailing Caverns - the event offered (4 = 4)'),
(367852, 0, 0, 18, 0, 0, 0, 0, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, 43026, 'Wailing Caverns - one of the nightmare''s creatures despawns: alive, not the druids, Kresh, a critter or a player''s'),
(367853, 0, 0, 37, 7, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Wailing Caverns - the Darkmoon Faire chest shown (7 = 1)'),
(367853, 0, 1, 82, 18926, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Wailing Caverns - the Darkmoon Faire chest spawns'),
(364050, 10, 0, 14, 7940, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Evolving Ectoplasm - Frost Immunity ends'),
(364050, 10, 1, 14, 7942, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Evolving Ectoplasm - Fire Immunity ends'),
(364050, 10, 2, 14, 7941, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Evolving Ectoplasm - Nature Immunity ends'),
(364050, 10, 3, 14, 7743, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Evolving Ectoplasm - Shadow Immunity ends'),
(364050, 10, 4, 44, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Evolving Ectoplasm - immune no more (phase 0)');

DELETE FROM `gossip_menu` WHERE `entry` = 201 AND `text_id` = 699;
INSERT INTO `gossip_menu`
(`entry`, `text_id`, `script_id`, `condition_id`)
VALUES
(201, 699, 0, 3678);

DELETE FROM `gossip_menu_option` WHERE `menu_id` = 201 AND `id` = 0;
INSERT INTO `gossip_menu_option`
(`menu_id`, `id`, `option_icon`, `option_text`, `option_broadcast_text`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `box_broadcast_text`, `condition_id`)
VALUES
(201, 0, 0, 'Let the event begin!', 2662, 1, 1, -1, 0, 202, 0, 0, NULL, 0, 3678);

DELETE FROM `map_player_script` WHERE `map_id` = 43 AND `event` = 0 AND `script_id` = 367853;
INSERT INTO `map_player_script`
(`map_id`, `event`, `script_id`, `condition_id`, `flags`, `comment`)
VALUES
(43, 0, 367853, 43028, 0, 'Wailing Caverns: Fortune Awaits complete shows the Darkmoon Faire chest');

-- Steps added to scripts the migration does not own: each found by id, command, comments.
DELETE FROM `creature_ai_scripts` WHERE `id` = 367105 AND `command` = 39 AND `comments` = 'Lady Anacondra - dead: Serpentis warns, the first time (A36)';
INSERT INTO `creature_ai_scripts`
(`id`, `delay`, `priority`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`)
VALUES
(367105, 0, 1, 39, 367850, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0, 0, 0, 0, 0, 0, 0, 'Lady Anacondra - dead: Serpentis warns, the first time (A36)');

DELETE FROM `creature_ai_scripts` WHERE `id` = 367105 AND `command` = 39 AND `comments` = 'Lady Anacondra - dead: the event offered once the four are (A36)';
INSERT INTO `creature_ai_scripts`
(`id`, `delay`, `priority`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`)
VALUES
(367105, 0, 2, 39, 367851, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0, 0, 0, 0, 0, 0, 0, 'Lady Anacondra - dead: the event offered once the four are (A36)');

DELETE FROM `creature_ai_scripts` WHERE `id` = 366907 AND `command` = 39 AND `comments` = 'Lord Cobrahn - dead: Serpentis warns, the first time (A36)';
INSERT INTO `creature_ai_scripts`
(`id`, `delay`, `priority`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`)
VALUES
(366907, 0, 1, 39, 367850, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0, 0, 0, 0, 0, 0, 0, 'Lord Cobrahn - dead: Serpentis warns, the first time (A36)');

DELETE FROM `creature_ai_scripts` WHERE `id` = 366907 AND `command` = 39 AND `comments` = 'Lord Cobrahn - dead: the event offered once the four are (A36)';
INSERT INTO `creature_ai_scripts`
(`id`, `delay`, `priority`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`)
VALUES
(366907, 0, 2, 39, 367851, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0, 0, 0, 0, 0, 0, 0, 'Lord Cobrahn - dead: the event offered once the four are (A36)');

DELETE FROM `creature_ai_scripts` WHERE `id` = 367004 AND `command` = 39 AND `comments` = 'Lord Pythas - dead: Serpentis warns, the first time (A36)';
INSERT INTO `creature_ai_scripts`
(`id`, `delay`, `priority`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`)
VALUES
(367004, 0, 1, 39, 367850, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0, 0, 0, 0, 0, 0, 0, 'Lord Pythas - dead: Serpentis warns, the first time (A36)');

DELETE FROM `creature_ai_scripts` WHERE `id` = 367004 AND `command` = 39 AND `comments` = 'Lord Pythas - dead: the event offered once the four are (A36)';
INSERT INTO `creature_ai_scripts`
(`id`, `delay`, `priority`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`)
VALUES
(367004, 0, 2, 39, 367851, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0, 0, 0, 0, 0, 0, 0, 'Lord Pythas - dead: the event offered once the four are (A36)');

DELETE FROM `creature_ai_scripts` WHERE `id` = 367304 AND `command` = 39 AND `comments` = 'Lord Serpentis - dead: the event offered once the four are (A36)';
INSERT INTO `creature_ai_scripts`
(`id`, `delay`, `priority`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`)
VALUES
(367304, 0, 2, 39, 367851, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0, 0, 0, 0, 0, 0, 0, 'Lord Serpentis - dead: the event offered once the four are (A36)');

DELETE FROM `creature_ai_scripts` WHERE `id` = 367104 AND `command` = 18 AND `comments` = 'Lady Anacondra - out of combat: the Druid of the Fang within 5 yd vanishes (A36)';
INSERT INTO `creature_ai_scripts`
(`id`, `delay`, `priority`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`)
VALUES
(367104, 0, 1, 18, 0, 0, 0, 0, 3840, 5, 8, 18, 0, 0, 0, 0, 0, 0, 0, 0, 43001, 'Lady Anacondra - out of combat: the Druid of the Fang within 5 yd vanishes (A36)');

DELETE FROM `creature_ai_scripts` WHERE `id` = 1720976 AND `command` = 68 AND `comments` = 'Mutanus the Devourer - dead: every creature of the dungeon''s nightmare despawns (A36)';
INSERT INTO `creature_ai_scripts`
(`id`, `delay`, `priority`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`)
VALUES
(1720976, 0, 1, 68, 367852, 2, 0, 1000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 43001, 'Mutanus the Devourer - dead: every creature of the dungeon''s nightmare despawns (A36)');

-- A gameobject's state as it spawns (AC3; the table from ac3_gameobject_spawn_state_whole.sql).
DELETE FROM `gameobject_spawn_state` WHERE `guid` = 18926 AND `ord` = 0;
INSERT INTO `gameobject_spawn_state`
(`guid`, `ord`, `condition_id`, `state`, `flags_set`, `flags_clear`, `despawn`, `script_id`, `comment`)
VALUES
(18926, 0, 43027, -1, 0, 0, 1, 0, 'Darkmoon Faire chest: not until a player with Fortune Awaits complete enters (7 = 0)');

-- The generic store's slots (AC7; the table from ac7_instance_data_slot.sql).
DELETE FROM `instance_data_slot` WHERE `map` = 43 AND `slot` = 0;
DELETE FROM `instance_data_slot` WHERE `map` = 43 AND `slot` = 1;
DELETE FROM `instance_data_slot` WHERE `map` = 43 AND `slot` = 2;
DELETE FROM `instance_data_slot` WHERE `map` = 43 AND `slot` = 3;
DELETE FROM `instance_data_slot` WHERE `map` = 43 AND `slot` = 4;
DELETE FROM `instance_data_slot` WHERE `map` = 43 AND `slot` = 5;
DELETE FROM `instance_data_slot` WHERE `map` = 43 AND `slot` = 6;
DELETE FROM `instance_data_slot` WHERE `map` = 43 AND `slot` = 7;
INSERT INTO `instance_data_slot`
(`map`, `slot`, `flags`, `name`)
VALUES
(43, 0, 1, 'Lady Anacondra (3 dead, 4 out of combat)'),
(43, 1, 1, 'Lord Cobrahn (3 dead)'),
(43, 2, 1, 'Lord Pythas (3 dead)'),
(43, 3, 1, 'Lord Serpentis (3 dead)'),
(43, 4, 1, 'Disciple of Naralex (4 the event offered, 1 under way, 3 done)'),
(43, 5, 1, 'Mutanus the Devourer (3 dead)'),
(43, 6, 4, 'Serpentis has warned of the intruders'),
(43, 7, 4, 'the Darkmoon Faire chest shown');

