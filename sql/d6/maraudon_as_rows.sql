-- Maraudon (map 349), instance_maraudon and four bosses: its C++ as rows -- EPIC10 tier 2.
-- Written by the trt repo's scripts/tier2/a07_maraudon.py from t1_world; maraudon_restore.sql puts
-- back what this replaces. R8: a person applies it, into the world database.
--
-- The C++ keeps its script names: mod-maraudon is the switch (AM1, handoff/manager-091).
-- Loaded, the C++ runs as before -- a script found by name comes first. Unloaded
-- (`module unload mod-maraudon`, which gives every creature standing a new AI at once),
-- the names find no script and the creatures run these rows (their ai_name).
--
-- Map 349 keeps instance_maraudon: with mod-maraudon unloaded the map gets the generic store (AC7),
-- under the C++'s types (0 the spewer, 1 Celebras). Celebras the Redeemed keeps his C++ escort in
-- the core (celebras_spirit.cpp). Needs gameobject_spawn_state (AC3) and TEMP_SUMMON's polar
-- position (AC4) in the core.

UPDATE `creature_template` SET `ai_name` = 'EventAI' WHERE `entry` = 12201;
UPDATE `creature_template` SET `ai_name` = 'EventAI' WHERE `entry` = 12203;
UPDATE `creature_template` SET `ai_name` = 'EventAI' WHERE `entry` = 12225;
UPDATE `creature_template` SET `ai_name` = 'EventAI' WHERE `entry` = 13282;

DELETE FROM `conditions` WHERE `condition_entry` IN (349002, 349003);
INSERT INTO `conditions`
(`condition_entry`, `type`, `value1`, `value2`, `value3`, `value4`, `flags`)
VALUES
(349002, 34, 0, 3, 0, 0, 1),
(349003, 34, 1, 3, 0, 0, 1);

-- Conditions another tier-2 migration writes too, under the same entry: whichever comes first.
INSERT IGNORE INTO `conditions`
(`condition_entry`, `type`, `value1`, `value2`, `value3`, `value4`, `flags`)
VALUES
(532000, 34, 0, 3, 0, 0, 0);

DELETE FROM `creature_ai_events` WHERE `id` IN (1220101, 1220102, 1220103, 1220104, 1220105, 1220301, 1220302, 1220303, 1222501, 1222502, 1222503, 1222504, 1222505, 1328201, 1328202, 1328203, 1328204, 1353304);
INSERT INTO `creature_ai_events`
(`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`)
VALUES
(1353304, 13533, 532000, 11, 0, 100, 0, 0, 0, 0, 0, 1353304, 0, 0, 'Spewed Larva - gone as it spawns once the spewer is disarmed'),
(1222501, 12225, 349003, 11, 0, 100, 0, 0, 0, 0, 0, 1222501, 0, 0, 'Celebras the Cursed - the Redeemed hidden while he lives'),
(1222502, 12225, 0, 6, 0, 100, 0, 0, 0, 0, 0, 1222502, 0, 0, 'Celebras the Cursed - done; the Redeemed appears'),
(1222503, 12225, 0, 0, 0, 100, 1, 8000, 8000, 8000, 8000, 1222503, 0, 0, 'Celebras the Cursed - Wrath on a random attacker'),
(1222504, 12225, 0, 0, 0, 100, 1, 2000, 2000, 20000, 20000, 1222504, 0, 0, 'Celebras the Cursed - Entangling Roots on its victim'),
(1222505, 12225, 0, 0, 0, 100, 1, 30000, 30000, 20000, 20000, 1222505, 0, 0, 'Celebras the Cursed - Corrupt Forces'),
(1220301, 12203, 0, 0, 0, 100, 1, 8000, 8000, 15000, 15000, 1220301, 0, 0, 'Landslide - Knock Away on its victim'),
(1220302, 12203, 0, 0, 0, 100, 1, 2000, 2000, 8000, 8000, 1220302, 0, 0, 'Landslide - Trample'),
(1220303, 12203, 0, 2, 0, 100, 1, 49, 0, 60000, 60000, 1220303, 0, 0, 'Landslide - Landslide under half health, every minute'),
(1328201, 13282, 0, 0, 2, 100, 9, 7000, 7000, 9000, 9000, 1328201, 0, 0, 'Noxxion - Toxic Volley on its victim'),
(1328202, 13282, 0, 0, 2, 100, 9, 16000, 16000, 12000, 12000, 1328202, 0, 0, 'Noxxion - Uppercut on its victim'),
(1328203, 13282, 0, 0, 2, 100, 1, 19000, 19000, 40000, 40000, 1328203, 0, 0, 'Noxxion - his spawn, and he stands aside'),
(1328204, 13282, 0, 6, 0, 100, 0, 0, 0, 0, 0, 1328204, 0, 0, 'Noxxion - himself again as he dies'),
(1220101, 12201, 0, 0, 0, 100, 1, 8000, 8000, 14000, 14000, 1220101, 0, 0, 'Princess Theradras - Dust Field'),
(1220102, 12201, 0, 0, 0, 100, 1, 2000, 2000, 10000, 10000, 1220102, 0, 0, 'Princess Theradras - Boulder on a random attacker'),
(1220103, 12201, 0, 0, 0, 100, 1, 23000, 23000, 20000, 20000, 1220103, 0, 0, 'Princess Theradras - Repulsive Gaze on its victim'),
(1220104, 12201, 0, 0, 0, 100, 1, 5000, 5000, 18000, 18000, 1220104, 0, 0, 'Princess Theradras - Thrash'),
(1220105, 12201, 0, 6, 0, 100, 0, 0, 0, 0, 0, 1220105, 0, 0, 'Princess Theradras - Zaetar''s Spirit');

DELETE FROM `creature_ai_scripts` WHERE `id` IN (1220101, 1220102, 1220103, 1220104, 1220105, 1220301, 1220302, 1220303, 1222501, 1222502, 1222503, 1222504, 1222505, 1328201, 1328202, 1328203, 1328204, 1353304);
INSERT INTO `creature_ai_scripts`
(`id`, `delay`, `priority`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`)
VALUES
(1353304, 0, 0, 18, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Spewed Larva - no spewer, no larva'),
(1222501, 0, 0, 18, 0, 0, 0, 0, 55105, 0, 9, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Celebras the Redeemed - not there yet'),
(1222502, 0, 0, 37, 1, 3, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Celebras the Cursed - slot 1 done'),
(1222502, 0, 1, 71, 0, 0, 0, 0, 55105, 0, 9, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Celebras the Redeemed - there now'),
(1222503, 0, 0, 15, 21807, 0, 0, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Celebras the Cursed - Wrath on a random attacker'),
(1222504, 0, 0, 15, 12747, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Celebras the Cursed - Entangling Roots on its victim'),
(1222505, 0, 0, 5, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Celebras the Cursed - casting stopped for Corrupt Forces'),
(1222505, 0, 1, 15, 21968, 0, 0, 0, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Celebras the Cursed - Corrupt Forces'),
(1220301, 0, 0, 15, 18670, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Landslide - Knock Away on its victim'),
(1220302, 0, 0, 15, 5568, 0, 0, 0, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Landslide - Trample'),
(1220303, 0, 0, 5, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Landslide - casting stopped for Landslide'),
(1220303, 0, 1, 15, 21808, 0, 0, 0, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Landslide - Landslide'),
(1328201, 0, 0, 15, 21687, 0, 0, 0, 0, 0, 1, 8, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Noxxion - Toxic Volley on its victim'),
(1328202, 0, 0, 15, 22916, 0, 0, 0, 0, 0, 1, 8, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Noxxion - Uppercut on its victim'),
(1328203, 0, 0, 5, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Noxxion - casting stopped'),
(1328203, 0, 1, 44, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Noxxion - aside (phase 1)'),
(1328203, 0, 2, 22, 35, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Noxxion - friendly while aside'),
(1328203, 0, 3, 4, 46, 33554432, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Noxxion - not selectable while aside'),
(1328203, 0, 4, 23, 11686, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Noxxion - his other shape while aside'),
(1328203, 0, 5, 10, 13456, 90000, 0, 0, 0, 0, 0, 0, 327680, 0, 1, 2, 8.0, 0, 0, 0.0, 0, 'Noxxion - a Noxxion''s Spawn at 8 yd, 0 deg'),
(1328203, 0, 6, 10, 13456, 90000, 0, 0, 0, 0, 0, 0, 327680, 0, 1, 2, 8.0, 0, 0, 1.2566, 0, 'Noxxion - a Noxxion''s Spawn at 8 yd, 72 deg'),
(1328203, 0, 7, 10, 13456, 90000, 0, 0, 0, 0, 0, 0, 327680, 0, 1, 2, 8.0, 0, 0, 2.5133, 0, 'Noxxion - a Noxxion''s Spawn at 8 yd, 144 deg'),
(1328203, 0, 8, 10, 13456, 90000, 0, 0, 0, 0, 0, 0, 327680, 0, 1, 2, 8.0, 0, 0, 3.7699, 0, 'Noxxion - a Noxxion''s Spawn at 8 yd, 216 deg'),
(1328203, 0, 9, 10, 13456, 90000, 0, 0, 0, 0, 0, 0, 327680, 0, 1, 2, 8.0, 0, 0, 5.0265, 0, 'Noxxion - a Noxxion''s Spawn at 8 yd, 288 deg'),
(1328203, 0, 10, 39, 1328203, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0, 0, 0, 0, 0, 0, 0, 'Noxxion - back in 15 s'),
(1328204, 0, 0, 23, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Noxxion - demorph'),
(1328204, 0, 1, 22, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Noxxion - his own faction'),
(1328204, 0, 2, 4, 46, 33554432, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Noxxion - selectable'),
(1220101, 0, 0, 15, 21909, 0, 0, 0, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Princess Theradras - Dust Field'),
(1220102, 0, 0, 15, 21832, 0, 0, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Princess Theradras - Boulder on a random attacker'),
(1220103, 0, 0, 15, 21869, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Princess Theradras - Repulsive Gaze on its victim'),
(1220104, 0, 0, 15, 3391, 0, 0, 0, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Princess Theradras - Thrash'),
(1220105, 0, 0, 10, 12238, 600000, 0, 0, 0, 0, 0, 0, 0, 0, -1, 3, 28.067, 61.875, -123.405, 4.67, 0, 'Princess Theradras - Zaetar''s Spirit for 10 min');

DELETE FROM `generic_scripts` WHERE `id` IN (1328203, 1353303);
INSERT INTO `generic_scripts`
(`id`, `delay`, `priority`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`)
VALUES
(1353303, 4, 0, 71, 0, 0, 0, 0, 54127, 0, 9, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Spewed Larva - spewed again, 4 s on'),
(1328203, 15, 0, 22, 14, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Noxxion - hostile again, 15 s on'),
(1328203, 15, 1, 4, 46, 33554432, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Noxxion - selectable again'),
(1328203, 15, 2, 23, 11172, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Noxxion - his own shape again'),
(1328203, 15, 3, 44, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Noxxion - back in the fight (phase 0)');

-- Steps added to scripts the migration does not own: each found by id, command, comments.
DELETE FROM `creature_ai_scripts` WHERE `id` = 1353302 AND `command` = 39 AND `comments` = 'Spewed Larva - back in 4 s while the spewer works (A7)';
INSERT INTO `creature_ai_scripts`
(`id`, `delay`, `priority`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`)
VALUES
(1353302, 0, 1, 39, 1353303, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0, 0, 0, 0, 0, 0, 349002, 'Spewed Larva - back in 4 s while the spewer works (A7)');

-- A gameobject's state as it spawns (AC3; the table from ac3_gameobject_spawn_state_whole.sql).
DELETE FROM `gameobject_spawn_state` WHERE `guid` = 32892 AND `ord` = 0;
INSERT INTO `gameobject_spawn_state`
(`guid`, `ord`, `condition_id`, `state`, `flags_set`, `flags_clear`, `despawn`, `script_id`, `comment`)
VALUES
(32892, 0, 532000, 2, 0, 0, 0, 0, 'Larva Spewer: destroyed once disarmed (0 = 3)');

