-- Onyxia's Lair (map 249), its instance and the Onyxian Whelp: its C++ as rows -- EPIC10 tier 2.
-- Written by the trt repo's scripts/tier2/a33_onyxias_lair.py from d6_world; onyxias_lair_restore.sql puts
-- back what this replaces. R8: a person applies it, into the world database.
--
-- The C++ keeps its script names: mod-onyxias-lair is the switch (AM1, handoff/manager-091).
-- Loaded, the C++ runs as before -- a script found by name comes first. Unloaded
-- (`module unload mod-onyxias-lair`, which gives every creature standing a new AI at once),
-- the names find no script and the creatures run these rows (their ai_name).
--
-- Map 249 keeps Onyxia (the core); unloaded, its instance is the generic store, slot 0 hers.

UPDATE `creature_template` SET `ai_name` = 'EventAI' WHERE `entry` = 11262;

DELETE FROM `creature_ai_events` WHERE `id` IN (1126201);
INSERT INTO `creature_ai_events`
(`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`)
VALUES
(1126201, 11262, 0, 4, 0, 100, 0, 0, 0, 0, 0, 1126201, 0, 0, 'Onyxian Whelp - the zone pulled as it aggroes');

DELETE FROM `creature_ai_scripts` WHERE `id` IN (1126201);
INSERT INTO `creature_ai_scripts`
(`id`, `delay`, `priority`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`)
VALUES
(1126201, 0, 0, 49, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Onyxian Whelp - SetInCombatWithZone');

-- The generic store's slots (AC7; the table from ac7_instance_data_slot.sql).
DELETE FROM `instance_data_slot` WHERE `map` = 249 AND `slot` = 0;
INSERT INTO `instance_data_slot`
(`map`, `slot`, `flags`, `name`)
VALUES
(249, 0, 3, 'Onyxia (1 in progress, 3 dead)');

