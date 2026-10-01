-- Sunken Temple (map 109), the Atal'ai statues and Malfurion Stormrage: its C++ as rows -- EPIC10 tier 2.
-- Written by the trt repo's scripts/tier2/a34_sunken_temple.py from t1_world; sunken_temple_restore.sql puts
-- back what this replaces. R8: a person applies it, into the world database.
--
-- The C++ keeps its script names: mod-sunken-temple is the switch (AM1, handoff/manager-091).
-- Loaded, the C++ runs as before -- a script found by name comes first. Unloaded
-- (`module unload mod-sunken-temple`, which gives every creature standing a new AI at once),
-- the names find no script and the creatures run these rows (their ai_name).
--
-- Map 109 keeps instance_sunken_temple (the core). The statues fire their own events once a use: the C++
-- ran the statue twice for a spell-opened lock (a correct statue also sprang a trap); the rows run it once.
-- Malfurion is hidden by an invisible model and not selectable for his first 3 s, not by visibility; his
-- lines fall on whole seconds (the C++: 1.5 s after the roar, 2 s after the bow).

UPDATE `creature_template` SET `ai_name` = 'EventAI' WHERE `entry` = 15362;

DELETE FROM `conditions` WHERE `condition_entry` IN (109012, 109013, 109020, 10109000, 10109010);
INSERT INTO `conditions`
(`condition_entry`, `type`, `value1`, `value2`, `value3`, `value4`, `flags`)
VALUES
(10109000, -1, 230000, 230064, 0, 0, 0),
(109012, 22, 8733, 0, 0, 0, 0),
(109013, 20, 15362, 50, 0, 0, 1),
(10109010, -1, 45, 109012, 109013, 0, 0),
(109020, 33, 109, 0, 0, 0, 0);

-- Conditions another tier-2 migration writes too, under the same entry: whichever comes first.
INSERT IGNORE INTO `conditions`
(`condition_entry`, `type`, `value1`, `value2`, `value3`, `value4`, `flags`)
VALUES
(230000, 62, 0, 0, 0, 0, 1),
(230064, 34, 4, 3, 0, 0, 1);

DELETE FROM `creature_ai_events` WHERE `id` IN (1536201, 1536202);
INSERT INTO `creature_ai_events`
(`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`)
VALUES
(1536201, 15362, 0, 11, 0, 100, 0, 0, 0, 0, 0, 1536201, 0, 0, 'Malfurion Stormrage - spawned: no quest, no gossip'),
(1536202, 15362, 109020, 11, 0, 100, 0, 0, 0, 0, 0, 1536202, 0, 0, 'Malfurion Stormrage - in the temple: unseen, the walls tremble, then he appears');

DELETE FROM `creature_ai_scripts` WHERE `id` IN (1536201, 1536202);
INSERT INTO `creature_ai_scripts`
(`id`, `delay`, `priority`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`)
VALUES
(1536201, 0, 0, 4, 147, 3, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Malfurion Stormrage - no quest, no gossip'),
(1536202, 0, 0, 23, 11686, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Malfurion Stormrage - unseen (an invisible model)'),
(1536202, 0, 1, 4, 46, 33554432, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Malfurion Stormrage - not selectable'),
(1536202, 0, 2, 0, 2, 0, 0, 0, 0, 0, 0, 0, 11191, 0, 0, 0, 0, 0, 0, 0, 0, 'Malfurion Stormrage - the walls tremble'),
(1536202, 0, 3, 39, 1090002, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0, 0, 0, 0, 0, 0, 0, 'Malfurion Stormrage - he appears and speaks');

DELETE FROM `generic_scripts` WHERE `id` IN (1090001, 1090002);
INSERT INTO `generic_scripts`
(`id`, `delay`, `priority`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`)
VALUES
(1090001, 0, 0, 10, 15362, 0, 0, 0, 0, 0, 0, 0, 0, 0, -1, 5, -662.106, -11.16895, -90.8351, 1.52, 0, 'Shade of Eranikus trigger - Malfurion Stormrage'),
(1090002, 3, 0, 23, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Malfurion Stormrage - seen'),
(1090002, 3, 1, 4, 46, 33554432, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Malfurion Stormrage - selectable'),
(1090002, 3, 2, 1, 15, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Malfurion Stormrage - roars'),
(1090002, 3, 3, 15, 20761, 2, 0, 0, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Malfurion Stormrage - the resurrection visual'),
(1090002, 4, 4, 1, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Malfurion Stormrage - bows'),
(1090002, 6, 5, 0, 0, 0, 0, 0, 0, 0, 0, 0, 11193, 0, 0, 0, 0, 0, 0, 0, 0, 'Malfurion Stormrage - his first line'),
(1090002, 16, 6, 0, 0, 0, 0, 0, 0, 0, 0, 0, 11194, 0, 0, 0, 0, 0, 0, 0, 0, 'Malfurion Stormrage - his second line'),
(1090002, 26, 7, 0, 0, 0, 0, 0, 0, 0, 0, 0, 11195, 0, 0, 0, 0, 0, 0, 0, 0, 'Malfurion Stormrage - his third line'),
(1090002, 34, 8, 0, 0, 0, 0, 0, 0, 0, 0, 0, 11196, 0, 0, 0, 0, 0, 0, 0, 0, 'Malfurion Stormrage - his fourth line'),
(1090002, 39, 9, 4, 147, 3, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Malfurion Stormrage - his quest and gossip');

DELETE FROM `event_scripts` WHERE `id` IN (3094, 3095, 3097, 3098, 3099, 3100);
INSERT INTO `event_scripts`
(`id`, `delay`, `priority`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`)
VALUES
(3094, 0, 0, 38, 148830, 0, 1, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0, 0, 10109000, 'Atal''ai Statue 148830 - the instance gets the statue'),
(3094, 0, 1, 37, 4, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 10109000, 'Atal''ai Statue 148830 - the statue event in progress (4): order, light or trap'),
(3095, 0, 0, 38, 148831, 0, 1, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0, 0, 10109000, 'Atal''ai Statue 148831 - the instance gets the statue'),
(3095, 0, 1, 37, 4, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 10109000, 'Atal''ai Statue 148831 - the statue event in progress (4): order, light or trap'),
(3097, 0, 0, 38, 148832, 0, 1, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0, 0, 10109000, 'Atal''ai Statue 148832 - the instance gets the statue'),
(3097, 0, 1, 37, 4, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 10109000, 'Atal''ai Statue 148832 - the statue event in progress (4): order, light or trap'),
(3098, 0, 0, 38, 148833, 0, 1, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0, 0, 10109000, 'Atal''ai Statue 148833 - the instance gets the statue'),
(3098, 0, 1, 37, 4, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 10109000, 'Atal''ai Statue 148833 - the statue event in progress (4): order, light or trap'),
(3099, 0, 0, 38, 148834, 0, 1, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0, 0, 10109000, 'Atal''ai Statue 148834 - the instance gets the statue'),
(3099, 0, 1, 37, 4, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 10109000, 'Atal''ai Statue 148834 - the statue event in progress (4): order, light or trap'),
(3100, 0, 0, 38, 148835, 0, 1, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0, 0, 10109000, 'Atal''ai Statue 148835 - the instance gets the statue'),
(3100, 0, 1, 37, 4, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 10109000, 'Atal''ai Statue 148835 - the statue event in progress (4): order, light or trap');

DELETE FROM `areatrigger_generic_script` WHERE `trigger_id` = 4016 AND `script_id` = 1090001;
INSERT INTO `areatrigger_generic_script`
(`trigger_id`, `script_id`, `condition_id`, `flags`, `comment`)
VALUES
(4016, 1090001, 10109010, 1, 'Shade of Eranikus: Malfurion Stormrage for a player on the scepter quest line, alive');

