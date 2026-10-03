-- Razorfen Kraul (map 47), instance_razorfen_kraul and razorfen_defender: its C++ as rows -- EPIC10 tier 2.
-- Written by the trt repo's scripts/tier2/a08_razorfen_kraul.py from d6_world; razorfen_kraul_restore.sql puts
-- back what this replaces. R8: a person applies it, into the world database.
--
-- The C++ keeps its script names: mod-razorfen-kraul is the switch (AM1, handoff/manager-091).
-- Loaded, the C++ runs as before -- a script found by name comes first. Unloaded
-- (`module unload mod-razorfen-kraul`, which gives every creature standing a new AI at once),
-- the names find no script and the creatures run these rows (their ai_name).
--
-- Map 47 keeps instance_razorfen_kraul: unloaded, the generic store (AC7) -- slot 1 as the keepers
-- set it, slot 2 their count. Willix and the gopher stay C++ (razorfen_kraul_quests.cpp).

UPDATE `creature_template` SET `ai_name` = 'EventAI' WHERE `entry` = 4442;

DELETE FROM `conditions` WHERE `condition_entry` IN (47001);
INSERT INTO `conditions`
(`condition_entry`, `type`, `value1`, `value2`, `value3`, `value4`, `flags`)
VALUES
(47001, 34, 2, 2, 1, 0, 0);

DELETE FROM `creature_ai_events` WHERE `id` IN (444201, 444203, 444205, 444206);
INSERT INTO `creature_ai_events`
(`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`)
VALUES
(444201, 4442, 0, 11, 0, 100, 0, 0, 0, 0, 0, 444201, 0, 0, 'Razorfen Defender - Defensive Stance, at spawn'),
(444206, 4442, 0, 7, 0, 100, 0, 0, 0, 0, 0, 444206, 0, 0, 'Razorfen Defender - Defensive Stance, at evade'),
(444203, 4442, 0, 4, 0, 100, 0, 0, 0, 0, 0, 444203, 0, 0, 'Razorfen Defender - the zone pulled as it aggroes'),
(444205, 4442, 0, 0, 0, 100, 9, 1000, 1000, 6000, 9000, 444205, 0, 0, 'Razorfen Defender - Improved Blocking');

DELETE FROM `creature_ai_scripts` WHERE `id` IN (444201, 444203, 444205, 444206);
INSERT INTO `creature_ai_scripts`
(`id`, `delay`, `priority`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`)
VALUES
(444201, 0, 0, 15, 7164, 2, 0, 0, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Razorfen Defender - Defensive Stance'),
(444206, 0, 0, 15, 7164, 2, 0, 0, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Razorfen Defender - Defensive Stance'),
(444203, 0, 0, 49, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Razorfen Defender - SetInCombatWithZone'),
(444205, 0, 0, 15, 3248, 2, 0, 0, 0, 0, 0, 12, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Razorfen Defender - Improved Blocking');

-- Steps added to scripts the migration does not own: each found by id, command, comments.
DELETE FROM `creature_ai_scripts` WHERE `id` = 462501 AND `command` = 37 AND `comments` = 'Death''s Head Ward Keeper - one more dead, slot 2 (A8)';
INSERT INTO `creature_ai_scripts`
(`id`, `delay`, `priority`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`)
VALUES
(462501, 0, 1, 37, 2, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Death''s Head Ward Keeper - one more dead, slot 2 (A8)');

DELETE FROM `creature_ai_scripts` WHERE `id` = 462501 AND `command` = 11 AND `comments` = 'Death''s Head Ward Keeper - the second opens Agathelos''s ward (A8)';
INSERT INTO `creature_ai_scripts`
(`id`, `delay`, `priority`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`)
VALUES
(462501, 0, 2, 11, 35698, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 47001, 'Death''s Head Ward Keeper - the second opens Agathelos''s ward (A8)');

DELETE FROM `creature_ai_scripts` WHERE `id` = 462501 AND `command` = 25 AND `comments` = 'Agathelos the Raging - running, the ward open (A8)';
INSERT INTO `creature_ai_scripts`
(`id`, `delay`, `priority`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`)
VALUES
(462501, 0, 3, 25, 1, 0, 0, 0, 87486, 0, 9, 2, 0, 0, 0, 0, 0, 0, 0, 0, 47001, 'Agathelos the Raging - running, the ward open (A8)');

DELETE FROM `creature_ai_scripts` WHERE `id` = 462501 AND `command` = 20 AND `comments` = 'Agathelos the Raging - off along his path, the ward open (A8)';
INSERT INTO `creature_ai_scripts`
(`id`, `delay`, `priority`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`)
VALUES
(462501, 0, 4, 20, 2, 0, 0, 0, 87486, 0, 9, 2, 0, 0, 0, 0, 0, 0, 0, 0, 47001, 'Agathelos the Raging - off along his path, the ward open (A8)');

UPDATE `creature_ai_events` SET `event_type` = 0, `event_flags` = 13, `event_param1` = 6600, `event_param2` = 6600, `event_param3` = 8100, `event_param4` = 8100 WHERE `id` = 444202;
-- A gameobject's state as it spawns (AC3; the table from ac3_gameobject_spawn_state_whole.sql).
DELETE FROM `gameobject_spawn_state` WHERE `guid` = 35698 AND `ord` = 0;
INSERT INTO `gameobject_spawn_state`
(`guid`, `ord`, `condition_id`, `state`, `flags_set`, `flags_clear`, `despawn`, `script_id`, `comment`)
VALUES
(35698, 0, 47001, 0, 0, 0, 0, 0, 'Agathelos''s ward: open once both keepers are dead');

