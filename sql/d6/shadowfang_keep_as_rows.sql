-- Shadowfang Keep (map 33), instance_shadowfang_keep: its C++ as rows -- EPIC10 tier 2.
-- Written by the trt repo's scripts/tier2/a32_shadowfang_keep.py from t1_world; shadowfang_keep_restore.sql puts
-- back what this replaces. R8: a person applies it, into the world database.
--
-- The C++ keeps its script names: mod-shadowfang-keep is the switch (AM1, handoff/manager-091).
-- Loaded, the C++ runs as before -- a script found by name comes first. Unloaded
-- (`module unload mod-shadowfang-keep`, which gives every creature standing a new AI at once),
-- the names find no script and the creatures run these rows (their ai_name).
--
-- Map 33 keeps instance_shadowfang_keep: with mod-shadowfang-keep unloaded the map gets the generic
-- store (AC7), and the rows that set the C++ types 1-6 write it under the same numbers.
-- Needs the core of trt/module-structure with gameobject_spawn_state (AC3) and its SQL applied.


DELETE FROM `conditions` WHERE `condition_entry` IN (33003, 33004, 33005);
INSERT INTO `conditions`
(`condition_entry`, `type`, `value1`, `value2`, `value3`, `value4`, `flags`)
VALUES
(33003, 34, 4, 3, 0, 0, 0),
(33004, 34, 5, 3, 0, 0, 0),
(33005, 34, 7, 4, 1, 0, 0);

-- Conditions another tier-2 migration writes too, under the same entry: whichever comes first.
INSERT IGNORE INTO `conditions`
(`condition_entry`, `type`, `value1`, `value2`, `value3`, `value4`, `flags`)
VALUES
(532001, 34, 1, 3, 0, 0, 0),
(532003, 34, 3, 3, 0, 0, 0);

DELETE FROM `creature_ai_events` WHERE `id` IN (444408, 1000001);
INSERT INTO `creature_ai_events`
(`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`)
VALUES
(1000001, 10000, 33004, 11, 0, 100, 0, 0, 0, 0, 0, 1000001, 0, 0, 'Arugal - gone once the intro is done'),
(444408, 4444, 33004, 11, 0, 100, 0, 0, 0, 0, 0, 444408, 0, 0, 'Deathstalker Vincent - lies dead once the intro is done');

DELETE FROM `creature_ai_scripts` WHERE `id` IN (444408, 1000001);
INSERT INTO `creature_ai_scripts`
(`id`, `delay`, `priority`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`)
VALUES
(1000001, 0, 0, 18, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Arugal - despawned: the intro is done'),
(444408, 0, 0, 28, 7, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Deathstalker Vincent - dead');

-- Steps added to scripts the migration does not own: each found by id, command, comments.
DELETE FROM `creature_ai_scripts` WHERE `id` = 392705 AND `command` = 11 AND `comments` = 'Wolf Master Nandos - open Arugal''s Door (A32)';
INSERT INTO `creature_ai_scripts`
(`id`, `delay`, `priority`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`)
VALUES
(392705, 0, 1, 11, 33241, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Wolf Master Nandos - open Arugal''s Door (A32)');

DELETE FROM `creature_ai_scripts` WHERE `id` = 462704 AND `command` = 37 AND `comments` = 'Arugal''s Voidwalker - one more dead, slot 7 (A32)';
INSERT INTO `creature_ai_scripts`
(`id`, `delay`, `priority`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`)
VALUES
(462704, 0, 1, 37, 7, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Arugal''s Voidwalker - one more dead, slot 7 (A32)');

DELETE FROM `creature_ai_scripts` WHERE `id` = 462704 AND `command` = 11 AND `comments` = 'Arugal''s Voidwalker - the fourth opens the Sorcerer''s Door (A32)';
INSERT INTO `creature_ai_scripts`
(`id`, `delay`, `priority`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`)
VALUES
(462704, 0, 2, 11, 33785, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 33005, 'Arugal''s Voidwalker - the fourth opens the Sorcerer''s Door (A32)');

-- A gameobject's state as it spawns (AC3; the table from ac3_gameobject_spawn_state_whole.sql).
DELETE FROM `gameobject_spawn_state` WHERE `guid` = 20835 AND `ord` = 0;
DELETE FROM `gameobject_spawn_state` WHERE `guid` = 33785 AND `ord` = 0;
DELETE FROM `gameobject_spawn_state` WHERE `guid` = 33241 AND `ord` = 0;
INSERT INTO `gameobject_spawn_state`
(`guid`, `ord`, `condition_id`, `state`, `flags_set`, `flags_clear`, `despawn`, `script_id`, `comment`)
VALUES
(20835, 0, 532001, 0, 0, 0, 0, 0, 'Courtyard Door: open once the prisoners are freed (1 = 3)'),
(33785, 0, 532003, 0, 0, 0, 0, 0, 'Sorcerer''s Door: open once Fenrus is dead (3 = 3)'),
(33241, 0, 33003, 0, 0, 0, 0, 0, 'Arugal''s Door: open once Nandos is dead (4 = 3)');

