-- Emerald Sanctum (map 807), its trash and Erennius: its C++ as rows -- EPIC10 tier 2.
-- Written by the trt repo's scripts/tier2/a05_emerald_sanctum.py from t1_world; emerald_sanctum_restore.sql puts
-- back what this replaces. R8: a person applies it, into the world database.
--
-- The C++ keeps its script names: mod-emerald-sanctum is the switch (AM1, handoff/manager-091).
-- Loaded, the C++ runs as before -- a script found by name comes first. Unloaded
-- (`module unload mod-emerald-sanctum`, which gives every creature standing a new AI at once),
-- the names find no script and the creatures run these rows (their ai_name).
--
-- Map 807 keeps instance_emerald_sanctum and Solnius (the core). Erennius's timers for the Wall and
-- the Binding run from his aggro, not only while Solnius fights; his curse is due 81-92 s into the
-- fight once under half health (the C++ counted those seconds only under half health).


DELETE FROM `conditions` WHERE `condition_entry` IN (807002, 807003);
INSERT INTO `conditions`
(`condition_entry`, `type`, `value1`, `value2`, `value3`, `value4`, `flags`)
VALUES
(807002, 34, 1, 1, 0, 0, 0),
(807003, 41, 49, 2, 0, 0, 2);

DELETE FROM `broadcast_text` WHERE `entry` IN (6074750);
INSERT INTO `broadcast_text`
(`entry`, `male_text`, `female_text`, `chat_type`, `sound_id`, `language_id`, `emote_id1`, `emote_id2`, `emote_id3`, `emote_delay1`, `emote_delay2`, `emote_delay3`)
VALUES
(6074750, 'You will not disturb the Awakener...', 'You will not disturb the Awakener...', 1, 60376, 0, 0, 0, 0, 0, 0, 0);

DELETE FROM `creature_ai_events` WHERE `id` IN (6074201, 6074202, 6074301, 6074302, 6074401, 6074402, 6074403, 6074501, 6074502, 6074505, 6074601, 6074602, 6074603, 6074701, 6074702, 6074703, 6074704, 6074705, 6074706, 6074707, 6074708, 6074709, 6074710, 6074711, 6074712, 6121201, 6121202);
INSERT INTO `creature_ai_events`
(`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`)
VALUES
(6074201, 60742, 84, 0, 0, 100, 1, 1000, 1000, 1000, 1000, 6074201, 0, 0, 'Sanctum Dreamer - a victim it cannot reach summoned'),
(6074202, 60742, 0, 0, 0, 100, 9, 10000, 10000, 10000, 10000, 6074202, 0, 0, 'Sanctum Dreamer - Dreamstate'),
(6074301, 60743, 84, 0, 0, 100, 1, 1000, 1000, 1000, 1000, 6074301, 0, 0, 'Sanctum Dragonkin - a victim it cannot reach summoned'),
(6074302, 60743, 0, 0, 0, 100, 9, 10000, 10000, 10000, 10000, 6074302, 0, 0, 'Sanctum Dragonkin - Reflection'),
(6074401, 60744, 84, 0, 0, 100, 1, 1000, 1000, 1000, 1000, 6074401, 0, 0, 'Sanctum Wyrm - a victim it cannot reach summoned'),
(6074402, 60744, 0, 0, 0, 100, 9, 20000, 20000, 20000, 20000, 6074402, 0, 0, 'Sanctum Wyrm - Acid Breath'),
(6074403, 60744, 0, 0, 0, 100, 9, 15000, 15000, 15000, 15000, 6074403, 0, 0, 'Sanctum Wyrm - Poison Bolt Volley'),
(6121201, 61212, 84, 0, 0, 100, 1, 1000, 1000, 1000, 1000, 6121201, 0, 0, 'Sanctum Supressor - a victim it cannot reach summoned'),
(6121202, 61212, 0, 0, 0, 100, 9, 15000, 15000, 14000, 14000, 6121202, 0, 0, 'Sanctum Supressor - Emerald Suppression'),
(6074501, 60745, 84, 0, 0, 100, 1, 1000, 1000, 1000, 1000, 6074501, 0, 0, 'Sanctum Wyrmkin - a victim it cannot reach summoned'),
(6074502, 60745, 0, 0, 0, 100, 9, 7000, 7000, 7000, 7000, 6074502, 0, 0, 'Sanctum Wyrmkin - Acid Spit'),
(6074601, 60746, 84, 0, 0, 100, 1, 1000, 1000, 1000, 1000, 6074601, 0, 0, 'Sanctum Scalebane - a victim it cannot reach summoned'),
(6074602, 60746, 0, 0, 0, 100, 9, 6000, 6000, 6000, 6000, 6074602, 0, 0, 'Sanctum Scalebane - Cleave'),
(6074603, 60746, 0, 0, 0, 100, 9, 25000, 25000, 25000, 25000, 6074603, 0, 0, 'Sanctum Scalebane - Scalebane Intimidation'),
(6074505, 60745, 0, 0, 0, 100, 1, 25000, 25000, 21000, 21000, 6074505, 0, 0, 'Sanctum Wyrmkin - Wyrmkin''s Venom on the players within 5 yd'),
(6074701, 60747, 0, 4, 0, 100, 0, 0, 0, 0, 0, 6074701, 0, 0, 'Erennius - aggro: his yell, slot 8 in progress'),
(6074702, 60747, 0, 11, 0, 100, 0, 0, 0, 0, 0, 6074702, 0, 0, 'Erennius - not started, at spawn'),
(6074703, 60747, 0, 7, 0, 100, 0, 0, 0, 0, 0, 6074703, 0, 0, 'Erennius - not started, at evade'),
(6074704, 60747, 0, 5, 0, 100, 1, 3000, 3000, 0, 0, 6074704, 0, 0, 'Erennius - the kill yell, at most every 3 s'),
(6074705, 60747, 0, 6, 0, 100, 0, 0, 0, 0, 0, 6074705, 0, 0, 'Erennius - dead: his yell, slot 8 done'),
(6074706, 60747, 84, 0, 0, 100, 1, 1000, 1000, 1000, 1000, 6074706, 0, 0, 'Erennius - a victim it cannot reach summoned'),
(6074707, 60747, 0, 0, 0, 100, 9, 7000, 7000, 7000, 7000, 6074707, 0, 0, 'Erennius - Call of Nightmare'),
(6074708, 60747, 0, 0, 0, 100, 9, 9000, 13000, 9000, 13000, 6074708, 0, 0, 'Erennius - Poison Bolt Volley'),
(6074709, 60747, 0, 0, 0, 100, 9, 37000, 37000, 30000, 33000, 6074709, 0, 0, 'Erennius - Howl of Erennius'),
(6074710, 60747, 807002, 0, 0, 100, 9, 35000, 35000, 35000, 35000, 6074710, 0, 0, 'Erennius - Wall of Erennius, Solnius fighting'),
(6074711, 60747, 807002, 0, 0, 100, 9, 70000, 70000, 70000, 70000, 6074711, 0, 0, 'Erennius - Green Dragon Binding on Solnius, Solnius fighting'),
(6074712, 60747, 807003, 0, 0, 100, 8, 81000, 92000, 0, 0, 6074712, 0, 0, 'Erennius - Curse of Erennius once, under half health');

DELETE FROM `creature_ai_scripts` WHERE `id` IN (6074201, 6074202, 6074301, 6074302, 6074401, 6074402, 6074403, 6074501, 6074502, 6074505, 6074601, 6074602, 6074603, 6074701, 6074702, 6074703, 6074704, 6074705, 6074706, 6074707, 6074708, 6074709, 6074710, 6074711, 6074712, 6121201, 6121202);
INSERT INTO `creature_ai_scripts`
(`id`, `delay`, `priority`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`)
VALUES
(6074201, 0, 0, 15, 26229, 2, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Sanctum Dreamer - Summon Player on its victim'),
(6074202, 0, 0, 15, 56500, 0, 0, 0, 2, 0, 4, 8, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Sanctum Dreamer - Dreamstate'),
(6074301, 0, 0, 15, 26229, 2, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Sanctum Dragonkin - Summon Player on its victim'),
(6074302, 0, 0, 15, 27564, 0, 0, 0, 0, 0, 0, 12, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Sanctum Dragonkin - Reflection'),
(6074401, 0, 0, 15, 26229, 2, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Sanctum Wyrm - Summon Player on its victim'),
(6074402, 0, 0, 15, 24839, 0, 0, 0, 0, 0, 1, 8, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Sanctum Wyrm - Acid Breath'),
(6074403, 0, 0, 15, 24099, 0, 0, 0, 0, 0, 1, 8, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Sanctum Wyrm - Poison Bolt Volley'),
(6121201, 0, 0, 15, 26229, 2, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Sanctum Supressor - Summon Player on its victim'),
(6121202, 0, 0, 15, 56501, 0, 0, 0, 2, 0, 4, 8, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Sanctum Supressor - Emerald Suppression'),
(6074501, 0, 0, 15, 26229, 2, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Sanctum Wyrmkin - Summon Player on its victim'),
(6074502, 0, 0, 15, 26050, 0, 0, 0, 0, 0, 1, 8, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Sanctum Wyrmkin - Acid Spit'),
(6074601, 0, 0, 15, 26229, 2, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Sanctum Scalebane - Summon Player on its victim'),
(6074602, 0, 0, 15, 19983, 0, 0, 0, 0, 0, 1, 8, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Sanctum Scalebane - Cleave'),
(6074603, 0, 0, 15, 56504, 0, 0, 0, 0, 0, 1, 8, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Sanctum Scalebane - Scalebane Intimidation'),
(6074505, 0, 0, 68, 6074530, 3, 0, 5, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Sanctum Wyrmkin - the venom, for each player within 5 yd'),
(6074701, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 6074750, 0, 0, 0, 0, 0, 0, 0, 0, 'Erennius - "You will not disturb the Awakener..."'),
(6074701, 0, 1, 37, 8, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Erennius - in progress'),
(6074702, 0, 0, 37, 8, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Erennius - not started'),
(6074703, 0, 0, 37, 8, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Erennius - not started'),
(6074704, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 30172, 0, 0, 0, 0, 0, 0, 0, 0, 'Erennius - "Your efforts will disturb everything... Begone!"'),
(6074704, 0, 1, 16, 60377, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Erennius - its sound'),
(6074705, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 30173, 0, 0, 0, 0, 0, 0, 0, 0, 'Erennius - "The shadow must not prevail..."'),
(6074705, 0, 1, 16, 60378, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Erennius - its sound'),
(6074705, 0, 2, 37, 8, 3, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Erennius - done'),
(6074706, 0, 0, 15, 26229, 2, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Erennius - Summon Player on its victim'),
(6074707, 0, 0, 15, 46079, 0, 0, 0, 0, 0, 4, 8, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Erennius - Call of Nightmare'),
(6074708, 0, 0, 15, 24099, 0, 0, 0, 0, 0, 1, 8, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Erennius - Poison Bolt Volley'),
(6074709, 0, 0, 15, 56506, 0, 0, 0, 0, 0, 1, 8, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Erennius - Howl of Erennius'),
(6074710, 0, 0, 15, 46080, 0, 0, 0, 0, 0, 1, 8, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Erennius - Wall of Erennius, Solnius fighting'),
(6074711, 0, 0, 15, 46082, 0, 0, 0, 2570721, 0, 9, 8, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Erennius - Green Dragon Binding on Solnius, Solnius fighting'),
(6074712, 0, 0, 15, 56505, 0, 0, 0, 0, 0, 1, 8, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Erennius - Curse of Erennius');

DELETE FROM `generic_scripts` WHERE `id` IN (6074530);
INSERT INTO `generic_scripts`
(`id`, `delay`, `priority`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`)
VALUES
(6074530, 0, 0, 15, 56503, 0, 0, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Sanctum Wyrmkin - Wyrmkin''s Venom');

