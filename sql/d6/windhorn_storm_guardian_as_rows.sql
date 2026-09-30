-- Windhorn Canyon (map 820), the Storm Guardian: its C++ as rows -- EPIC10 tier 1, handoff/manager-084.
-- Written by the trt repo's scripts/tier1_rows.py from t1_world; windhorn_storm_guardian_restore.sql puts
-- back what this replaces. R8: a person applies it, into the world database.
--
-- The C++ keeps its script names: mod-windhorn-canyon is the switch (AM1, handoff/manager-091).
-- Loaded, the C++ runs as before -- a script found by name comes first. Unloaded
-- (`module unload mod-windhorn-canyon`, which gives every creature standing a new AI at once),
-- the names find no script and the creatures run these rows (their ai_name).
--
-- The Storm Guardian summons three Storm Residues as it dies, as npc_windhorn_storm_guardian did:
-- a triangle around the corpse, each attacking. Near enough, not the same -- AC4 makes it exact:
-- at contact distance (half a yard and both radii) rather than 1.5 yd, since a row summons beside
-- its summoner only with x = y = z = 0 and an angle; and they attack the killer, where the C++
-- took a random attacker (the killer when there was none). Apply after windhorn_canyon_as_rows.sql.
-- Load: .reload creature_template 62865 (or a restart), .reload creature_ai_events,
-- .reload creature_ai_scripts.

UPDATE `creature_template` SET `ai_name` = 'EventAI' WHERE `entry` = 62865;

DELETE FROM `creature_ai_events` WHERE `id` IN (6286501, 6286502, 6286503);
INSERT INTO `creature_ai_events`
(`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`)
VALUES
(6286501, 62865, 0, 6, 0, 100, 0, 0, 0, 0, 0, 6286501, 0, 0, 'Storm Guardian - death: a Storm Residue, 0 deg'),
(6286502, 62865, 0, 6, 0, 100, 0, 0, 0, 0, 0, 6286502, 0, 0, 'Storm Guardian - death: a Storm Residue, 120 deg'),
(6286503, 62865, 0, 6, 0, 100, 0, 0, 0, 0, 0, 6286503, 0, 0, 'Storm Guardian - death: a Storm Residue, 240 deg');

DELETE FROM `creature_ai_scripts` WHERE `id` IN (6286501, 6286502, 6286503);
INSERT INTO `creature_ai_scripts`
(`id`, `delay`, `priority`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`)
VALUES
(6286501, 0, 0, 10, 62866, 300000, 0, 0, 0, 0, 0, 0, 2, 0, 0, 1, 0, 0, 0, 0.0, 0, 'Storm Guardian - a Storm Residue, 0 deg'),
(6286502, 0, 0, 10, 62866, 300000, 0, 0, 0, 0, 0, 0, 2, 0, 0, 1, 0, 0, 0, 2.0944, 0, 'Storm Guardian - a Storm Residue, 120 deg'),
(6286503, 0, 0, 10, 62866, 300000, 0, 0, 0, 0, 0, 0, 2, 0, 0, 1, 0, 0, 0, 4.1888, 0, 'Storm Guardian - a Storm Residue, 240 deg');

