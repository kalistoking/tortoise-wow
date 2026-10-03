-- Karazhan Crypt (map 800), its instance, runes, the Crypt Watcher and the remains: its C++ as rows -- EPIC10 tier 2.
-- Written by the trt repo's scripts/tier2/a31_karazhan_crypt.py from d6_world; karazhan_crypt_restore.sql puts
-- back what this replaces. R8: a person applies it, into the world database.
--
-- The C++ keeps its script names: mod-karazhan-crypt is the switch (AM1, handoff/manager-091).
-- Loaded, the C++ runs as before -- a script found by name comes first. Unloaded
-- (`module unload mod-karazhan-crypt`, which gives every creature standing a new AI at once),
-- the names find no script and the creatures run these rows (their ai_name).
--
-- Map 800's instance script goes; the generic store keeps nothing, as the C++ saved nothing. The triggers'
-- objects and the crypt gate stay C++ (karazhan_crypt_triggers.cpp). The six runes' autoclose (data2) is 3 h
-- under the rows, the restore puts the 3 s back: a rune used in combat also stays open 3 h (the C++ left that
-- one at 3 s), as it does with the module loaded. The remains' 30 min respawn stays their spawn's own time.

UPDATE `creature_template` SET `ai_name` = 'EventAI' WHERE `entry` = 91920;
UPDATE `creature_template` SET `ai_name` = 'EventAI' WHERE `entry` = 91921;
UPDATE `creature_template` SET `ai_name` = 'EventAI' WHERE `entry` = 91924;
UPDATE `creature_template` SET `ai_name` = 'EventAI' WHERE `entry` = 91928;
UPDATE `creature_template` SET `ai_name` = 'EventAI' WHERE `entry` = 91931;
UPDATE `creature_template` SET `ai_name` = 'EventAI' WHERE `entry` = 92935;
UPDATE `map_template` SET `script_name` = '' WHERE `entry` = 800;

DELETE FROM `conditions` WHERE `condition_entry` IN (800002, 800010, 800011, 800012, 800013, 800014, 800015, 800016, 800020, 800021, 800022, 800023, 800024, 800030, 800031);
INSERT INTO `conditions`
(`condition_entry`, `type`, `value1`, `value2`, `value3`, `value4`, `flags`)
VALUES
(800002, -1, 230000, 999, 0, 0, 0),
(800010, 55, 0, 0, 0, 0, 0),
(800011, 50, 4013143, 800010, 0, 0, 0),
(800012, 50, 4013144, 800010, 0, 0, 0),
(800013, 50, 4013145, 800010, 0, 0, 0),
(800014, 50, 4013147, 800010, 0, 0, 0),
(800015, 50, 4013148, 800010, 0, 0, 0),
(800016, 50, 4013149, 800010, 0, 0, 0),
(800020, -1, 800011, 800012, 800013, 0, 0),
(800021, -1, 800014, 800015, 800016, 0, 0),
(800022, 21, 177304, 20, 0, 0, 3),
(800023, 20, 91928, 100, 0, 0, 3),
(800024, -1, 800022, 800020, 800021, 800023, 0),
(800030, 21, 177311, 30, 0, 0, 2),
(800031, 21, 177301, 30, 0, 0, 2);

-- Conditions another tier-2 migration writes too, under the same entry: whichever comes first.
INSERT IGNORE INTO `conditions`
(`condition_entry`, `type`, `value1`, `value2`, `value3`, `value4`, `flags`)
VALUES
(230000, 62, 0, 0, 0, 0, 1);

DELETE FROM `broadcast_text` WHERE `entry` IN (800101, 800102, 800103, 800104);
INSERT INTO `broadcast_text`
(`entry`, `male_text`, `female_text`, `chat_type`, `sound_id`, `language_id`, `emote_id1`, `emote_id2`, `emote_id3`, `emote_delay1`, `emote_delay2`, `emote_delay3`)
VALUES
(800101, 'Those runes hold the remains of heroes of many good deeds, much better than you adventurer types will ever be.', 'Those runes hold the remains of heroes of many good deeds, much better than you adventurer types will ever be.', 1, 0, 0, 0, 0, 0, 0, 0, 0),
(800102, 'Do my words fall on deaf ears? Or are you just doing this out of spite?', 'Do my words fall on deaf ears? Or are you just doing this out of spite?', 1, 0, 0, 0, 0, 0, 0, 0, 0),
(800103, 'Is this why you''ve come here, to defile sacred graves in search of precious baubles?', 'Is this why you''ve come here, to defile sacred graves in search of precious baubles?', 1, 0, 0, 0, 0, 0, 0, 0, 0),
(800104, 'It seems words alone aren''t enough to deter you. Find me, and meet your untimely end!', 'It seems words alone aren''t enough to deter you. Find me, and meet your untimely end!', 1, 0, 0, 0, 0, 0, 0, 0, 0);

DELETE FROM `creature_ai_events` WHERE `id` IN (9192001, 9192101, 9192102, 9192103, 9192401, 9192402, 9192403, 9192801, 9193101, 9293501, 9293502);
INSERT INTO `creature_ai_events`
(`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`)
VALUES
(9192001, 91920, 0, 6, 0, 100, 0, 0, 0, 0, 0, 9192001, 0, 0, 'Marrowspike - dead: the Tomb of the Unrepentant open for 3 h, his emote, the music'),
(9192801, 91928, 0, 6, 0, 100, 0, 0, 0, 0, 0, 9192801, 0, 0, 'Alarus - dead: Pauper''s Walk open for 3 h, his line, the music'),
(9293501, 92935, 0, 4, 0, 100, 0, 0, 0, 0, 0, 9293501, 0, 0, 'Guard Captain Gort - aggro: "You have come farther than most..."'),
(9293502, 92935, 0, 6, 0, 100, 0, 0, 0, 0, 0, 9293502, 0, 0, 'Guard Captain Gort - dead: "His grips holds me no longer...", the music'),
(9193101, 91931, 800024, 1, 0, 100, 1, 1000, 1000, 1000, 1000, 9193101, 0, 0, 'Crypt Watcher - the six runes open: Alarus'),
(9192401, 91924, 0, 11, 0, 100, 0, 0, 0, 0, 0, 9192401, 0, 0, 'Skeletal Remains - spawned: lying dead'),
(9192402, 91924, 0, 7, 0, 100, 0, 0, 0, 0, 0, 9192402, 0, 0, 'Skeletal Remains - evading: lying dead again'),
(9192403, 91924, 800030, 1, 0, 100, 1, 1000, 1000, 1000, 1000, 9192403, 0, 0, 'Skeletal Remains - its trigger''s sign near: up'),
(9192101, 91921, 0, 11, 0, 100, 0, 0, 0, 0, 0, 9192101, 0, 0, 'Tomb Bat - spawned: lying dead'),
(9192102, 91921, 0, 7, 0, 100, 0, 0, 0, 0, 0, 9192102, 0, 0, 'Tomb Bat - evading: lying dead again'),
(9192103, 91921, 800031, 1, 0, 100, 1, 1000, 1000, 1000, 1000, 9192103, 0, 0, 'Tomb Bat - its trigger''s sign near: up');

DELETE FROM `creature_ai_scripts` WHERE `id` IN (9192001, 9192101, 9192102, 9192103, 9192401, 9192402, 9192403, 9192801, 9193101, 9293501, 9293502);
INSERT INTO `creature_ai_scripts`
(`id`, `delay`, `priority`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`)
VALUES
(9192001, 0, 0, 11, 4013011, 10800, 0, 0, 0, 0, 0, 8, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Marrowspike - the Tomb of the Unrepentant (3 h), unless open'),
(9192001, 0, 1, 0, 2, 0, 0, 0, 0, 0, 0, 0, 66108, 0, 0, 0, 0, 0, 0, 0, 0, 'Marrowspike - "A loud creaking echoes across the crypt..."'),
(9192001, 0, 2, 16, 6762, 8, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Marrowspike - the crypt''s music'),
(9192801, 0, 0, 11, 4013110, 10800, 0, 0, 0, 0, 0, 8, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Alarus - Pauper''s Walk (3 h), unless open'),
(9192801, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 66106, 0, 0, 0, 0, 0, 0, 0, 0, 'Alarus - "Another... corpse... to the pile."'),
(9192801, 0, 2, 16, 6762, 8, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Alarus - the crypt''s music'),
(9293501, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 66105, 0, 0, 0, 0, 0, 0, 0, 0, 'Guard Captain Gort - "You have come farther than most..."'),
(9293502, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 66107, 0, 0, 0, 0, 0, 0, 0, 0, 'Guard Captain Gort - "His grips holds me no longer..."'),
(9293502, 0, 1, 16, 6762, 8, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Guard Captain Gort - the crypt''s music'),
(9193101, 0, 0, 10, 91928, 0, 0, 0, 0, 0, 0, 0, 262144, 8000001, -1, 7, 0, 0, 0, 0, 0, 'Crypt Watcher - Alarus at the watcher'),
(9193101, 0, 1, 76, 177304, 3600, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Crypt Watcher - the sign of Alarus summoned (1 h)'),
(9192401, 0, 0, 4, 143, 36, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Skeletal Remains - lying dead'),
(9192401, 0, 1, 4, 46, 33554432, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Skeletal Remains - not selectable'),
(9192401, 0, 2, 28, 7, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Skeletal Remains - down'),
(9192402, 0, 0, 4, 143, 36, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Skeletal Remains - lying dead'),
(9192402, 0, 1, 4, 46, 33554432, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Skeletal Remains - not selectable'),
(9192402, 0, 2, 28, 7, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Skeletal Remains - down'),
(9192403, 0, 0, 4, 143, 36, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Skeletal Remains - alive'),
(9192403, 0, 1, 4, 46, 33554432, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Skeletal Remains - selectable'),
(9192403, 0, 2, 28, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Skeletal Remains - up'),
(9192101, 0, 0, 4, 143, 36, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Tomb Bat - lying dead'),
(9192101, 0, 1, 4, 46, 33554432, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Tomb Bat - not selectable'),
(9192101, 0, 2, 28, 7, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Tomb Bat - down'),
(9192102, 0, 0, 4, 143, 36, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Tomb Bat - lying dead'),
(9192102, 0, 1, 4, 46, 33554432, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Tomb Bat - not selectable'),
(9192102, 0, 2, 28, 7, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Tomb Bat - down'),
(9192103, 0, 0, 4, 143, 36, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Tomb Bat - alive'),
(9192103, 0, 1, 4, 46, 33554432, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Tomb Bat - selectable'),
(9192103, 0, 2, 28, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Tomb Bat - up');

DELETE FROM `generic_scripts` WHERE `id` IN (8000001);
INSERT INTO `generic_scripts`
(`id`, `delay`, `priority`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`)
VALUES
(8000001, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 800104, 0, 0, 0, 0, 0, 0, 0, 0, 'Alarus - "It seems words alone aren''t enough to deter you..."');

DELETE FROM `gameobject_scripts` WHERE `id` IN (4013143, 4013144, 4013145, 4013147, 4013148, 4013149);
INSERT INTO `gameobject_scripts`
(`id`, `delay`, `priority`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`)
VALUES
(4013143, 0, 0, 1, 16, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 800002, 'Necrotic Rune 177302 - the user kneels'),
(4013143, 0, 1, 0, 1, 0, 0, 0, 91931, 300, 8, 2, 800101, 0, 0, 0, 0, 0, 0, 0, 800002, 'Crypt Watcher - "Those runes hold the remains of heroes o..."'),
(4013144, 0, 0, 1, 16, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 800002, 'Necrotic Rune 177305 - the user kneels'),
(4013145, 0, 0, 1, 16, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 800002, 'Necrotic Rune 177306 - the user kneels'),
(4013145, 0, 1, 0, 1, 0, 0, 0, 91931, 300, 8, 2, 800102, 0, 0, 0, 0, 0, 0, 0, 800002, 'Crypt Watcher - "Do my words fall on deaf ears? Or are yo..."'),
(4013147, 0, 0, 1, 16, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 800002, 'Necrotic Rune 177307 - the user kneels'),
(4013148, 0, 0, 1, 16, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 800002, 'Necrotic Rune 177308 - the user kneels'),
(4013148, 0, 1, 0, 1, 0, 0, 0, 91931, 300, 8, 2, 800103, 0, 0, 0, 0, 0, 0, 0, 800002, 'Crypt Watcher - "Is this why you''ve come here, to defile ..."'),
(4013149, 0, 0, 1, 16, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 800002, 'Necrotic Rune 177309 - the user kneels');

UPDATE `gameobject_template` SET `data2` = 707788800 WHERE `entry` = 177302;
UPDATE `gameobject_template` SET `data2` = 707788800 WHERE `entry` = 177305;
UPDATE `gameobject_template` SET `data2` = 707788800 WHERE `entry` = 177306;
UPDATE `gameobject_template` SET `data2` = 707788800 WHERE `entry` = 177307;
UPDATE `gameobject_template` SET `data2` = 707788800 WHERE `entry` = 177308;
UPDATE `gameobject_template` SET `data2` = 707788800 WHERE `entry` = 177309;
