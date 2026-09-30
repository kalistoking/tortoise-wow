-- Blackfathom Deeps (map 48), instance_blackfathom_deeps, its objects and Velthelaxx: its C++ as rows -- EPIC10 tier 2.
-- Written by the trt repo's scripts/tier2/a09_blackfathom_deeps.py from t1_world; blackfathom_deeps_restore.sql puts
-- back what this replaces. R8: a person applies it, into the world database.
--
-- The C++ keeps its script names: mod-blackfathom-deeps is the switch (AM1, handoff/manager-091).
-- Loaded, the C++ runs as before -- a script found by name comes first. Unloaded
-- (`module unload mod-blackfathom-deeps`, which gives every creature standing a new AI at once),
-- the names find no script and the creatures run these rows (their ai_name).
--
-- Map 48 keeps instance_blackfathom_deeps: unloaded, the generic store (AC7) by the C++ types
-- (10, 11, 12) and two transient counts (13, 14). The C++ saves its three by position ("k s a");
-- an instance saved under one reads its encounters as not started under the other.
-- The waves go home to where they were summoned; the C++ sends them home to Kelris.

UPDATE `creature_template` SET `ai_name` = 'EventAI' WHERE `entry` = 12876;
UPDATE `creature_template` SET `ai_name` = 'EventAI' WHERE `entry` = 62530;

DELETE FROM `conditions` WHERE `condition_entry` IN (48002, 48003, 48004, 48005, 48007, 48008, 48009);
INSERT INTO `conditions`
(`condition_entry`, `type`, `value1`, `value2`, `value3`, `value4`, `flags`)
VALUES
(48002, 34, 11, 3, 0, 0, 0),
(48003, -1, 8506, 48002, 0, 0, 0),
(48004, 34, 12, 0, 0, 0, 0),
(48005, 34, 14, 18, 1, 0, 0),
(48007, 34, 13, 2, 0, 0, 0),
(48008, 34, 13, 3, 0, 0, 0),
(48009, 34, 13, 4, 0, 0, 0);

DELETE FROM `creature_ai_events` WHERE `id` IN (483207, 483208, 483209, 483210, 1287601, 6253001, 6253002, 6253003, 6253004, 6253005, 6253006, 6253007);
INSERT INTO `creature_ai_events`
(`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`)
VALUES
(483207, 4832, 0, 25, 0, 100, 1, 4825, 0, 0, 0, 483207, 0, 0, 'Twilight Lord Kelris - his Aku''mai Snapjaw dead'),
(483208, 4832, 0, 25, 0, 100, 1, 4978, 0, 0, 0, 483207, 0, 0, 'Twilight Lord Kelris - his Aku''mai Servant dead'),
(483209, 4832, 0, 25, 0, 100, 1, 4815, 0, 0, 0, 483207, 0, 0, 'Twilight Lord Kelris - his Murkshallow Snapclaw dead'),
(483210, 4832, 0, 25, 0, 100, 1, 4977, 0, 0, 0, 483207, 0, 0, 'Twilight Lord Kelris - his Murkshallow Softshell dead'),
(1287601, 12876, 0, 6, 0, 100, 0, 0, 0, 0, 0, 1287601, 0, 0, 'Baron Aquanis - dead: slot 12 done'),
(6253001, 62530, 0, 1, 0, 100, 1, 1000, 1000, 5000, 5000, 6253001, 0, 0, 'Velthelaxx the Defiler - channelling at Woji the Toad'),
(6253002, 62530, 0, 4, 0, 100, 0, 0, 0, 0, 0, 6253002, 0, 0, 'Velthelaxx the Defiler - aggro'),
(6253003, 62530, 0, 2, 0, 100, 0, 50, 0, 0, 0, 6253003, 0, 0, 'Velthelaxx the Defiler - half health line'),
(6253004, 62530, 0, 2, 0, 100, 8, 50, 0, 0, 0, 6253004, 0, 0, 'Velthelaxx the Defiler - Howl of Terror at half health, until it takes'),
(6253005, 62530, 0, 2, 0, 100, 8, 20, 0, 0, 0, 6253005, 0, 0, 'Velthelaxx the Defiler - Enrage at a fifth, until it takes'),
(6253006, 62530, 0, 0, 0, 100, 9, 1000, 1000, 16000, 19000, 6253006, 0, 0, 'Velthelaxx the Defiler - Mind Flay'),
(6253007, 62530, 0, 6, 0, 100, 0, 0, 0, 0, 0, 6253007, 0, 0, 'Velthelaxx the Defiler - death line');

DELETE FROM `creature_ai_scripts` WHERE `id` IN (483207, 1287601, 6253001, 6253002, 6253003, 6253004, 6253005, 6253006, 6253007);
INSERT INTO `creature_ai_scripts`
(`id`, `delay`, `priority`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`)
VALUES
(483207, 0, 0, 37, 14, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Twilight Lord Kelris - one more wave mob dead (slot 14)'),
(483207, 0, 1, 37, 11, 3, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 48005, 'Twilight Lord Kelris - the last: the shrine done'),
(483207, 0, 2, 11, 32682, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 48005, 'Twilight Lord Kelris - the last: the Portal of Aku''mai open'),
(1287601, 0, 0, 37, 12, 3, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Baron Aquanis - done'),
(6253001, 0, 0, 15, 51187, 32, 0, 0, 2589822, 0, 9, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Velthelaxx the Defiler - Targeted Arcane Channeling at Woji'),
(6253002, 0, 0, 5, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Velthelaxx the Defiler - the channel stopped'),
(6253002, 0, 1, 14, 51187, 0, 0, 0, 2589822, 0, 9, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Woji the Toad - the channel off'),
(6253002, 0, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 6253001, 0, 0, 0, 0, 0, 0, 0, 0, 'Velthelaxx the Defiler - aggro line'),
(6253003, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 6253002, 0, 0, 0, 0, 0, 0, 0, 0, 'Velthelaxx the Defiler - half health line'),
(6253004, 0, 0, 15, 5484, 0, 0, 0, 0, 0, 1, 8, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Velthelaxx the Defiler - Howl of Terror'),
(6253005, 0, 0, 15, 8269, 0, 0, 0, 0, 0, 0, 12, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Velthelaxx the Defiler - Enrage'),
(6253006, 0, 0, 15, 18807, 0, 0, 0, 0, 0, 1, 8, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Velthelaxx the Defiler - Mind Flay'),
(6253007, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 6253003, 0, 0, 0, 0, 0, 0, 0, 0, 'Velthelaxx the Defiler - death line');

DELETE FROM `generic_scripts` WHERE `id` IN (483210, 483211, 483212, 483213, 483220);
INSERT INTO `generic_scripts`
(`id`, `delay`, `priority`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`)
VALUES
(483220, 0, 0, 15, 7741, 2, 0, 0, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Blackfathom wave - Summoned Demon (visual)'),
(483220, 0, 1, 49, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Blackfathom wave - SetInCombatWithZone'),
(483210, 3, 0, 10, 4825, 0, 0, 0, 27424, 0, 9, 2, 0, 483220, 0, 7, -768.949, -174.413, -25.87, 3.09, 0, 'Twilight Lord Kelris - wave 1: Aku''mai Snapjaw at 0'),
(483210, 3, 1, 10, 4825, 0, 0, 0, 27424, 0, 9, 2, 0, 483220, 0, 7, -768.888, -164.238, -25.87, 3.09, 0, 'Twilight Lord Kelris - wave 1: Aku''mai Snapjaw at 1'),
(483210, 3, 2, 10, 4825, 0, 0, 0, 27424, 0, 9, 2, 0, 483220, 0, 7, -867.859, -153.927, -25.88, 6.27, 0, 'Twilight Lord Kelris - wave 1: Aku''mai Snapjaw at 5'),
(483210, 3, 3, 10, 4825, 0, 0, 0, 27424, 0, 9, 2, 0, 483220, 0, 7, -867.875, -164.089, -25.87, 6.27, 0, 'Twilight Lord Kelris - wave 1: Aku''mai Snapjaw at 4'),
(483211, 3, 0, 10, 4978, 0, 0, 0, 27424, 0, 9, 2, 0, 483220, 0, 7, -768.888, -164.238, -25.87, 3.09, 0, 'Twilight Lord Kelris - wave 2: Aku''mai Servant at 1'),
(483211, 3, 1, 10, 4978, 0, 0, 0, 27424, 0, 9, 2, 0, 483220, 0, 7, -867.875, -164.089, -25.87, 6.27, 0, 'Twilight Lord Kelris - wave 2: Aku''mai Servant at 4'),
(483212, 3, 0, 10, 4815, 0, 0, 0, 27424, 0, 9, 2, 0, 483220, 0, 7, -768.949, -174.413, -25.87, 3.09, 0, 'Twilight Lord Kelris - wave 3: Murkshallow Snapclaw at 0'),
(483212, 3, 1, 10, 4815, 0, 0, 0, 27424, 0, 9, 2, 0, 483220, 0, 7, -768.951, -153.911, -25.88, 3.09, 0, 'Twilight Lord Kelris - wave 3: Murkshallow Snapclaw at 2'),
(483212, 3, 2, 10, 4815, 0, 0, 0, 27424, 0, 9, 2, 0, 483220, 0, 7, -867.782, -174.352, -25.87, 6.27, 0, 'Twilight Lord Kelris - wave 3: Murkshallow Snapclaw at 3'),
(483212, 3, 3, 10, 4815, 0, 0, 0, 27424, 0, 9, 2, 0, 483220, 0, 7, -867.875, -164.089, -25.87, 6.27, 0, 'Twilight Lord Kelris - wave 3: Murkshallow Snapclaw at 4'),
(483213, 3, 0, 10, 4977, 0, 0, 0, 27424, 0, 9, 2, 0, 483220, 0, 7, -768.949, -176.913, -25.87, 3.09, 0, 'Twilight Lord Kelris - wave 4: Murkshallow Softshell at 0'),
(483213, 3, 1, 10, 4977, 0, 0, 0, 27424, 0, 9, 2, 0, 483220, 0, 7, -768.949, -174.413, -25.87, 3.09, 0, 'Twilight Lord Kelris - wave 4: Murkshallow Softshell at 0'),
(483213, 3, 2, 10, 4977, 0, 0, 0, 27424, 0, 9, 2, 0, 483220, 0, 7, -768.888, -164.238, -25.87, 3.09, 0, 'Twilight Lord Kelris - wave 4: Murkshallow Softshell at 1'),
(483213, 3, 3, 10, 4977, 0, 0, 0, 27424, 0, 9, 2, 0, 483220, 0, 7, -768.951, -153.911, -25.88, 3.09, 0, 'Twilight Lord Kelris - wave 4: Murkshallow Softshell at 2'),
(483213, 3, 4, 10, 4977, 0, 0, 0, 27424, 0, 9, 2, 0, 483220, 0, 7, -867.782, -174.352, -25.87, 6.27, 0, 'Twilight Lord Kelris - wave 4: Murkshallow Softshell at 3'),
(483213, 3, 5, 10, 4977, 0, 0, 0, 27424, 0, 9, 2, 0, 483220, 0, 7, -867.875, -164.089, -25.87, 6.27, 0, 'Twilight Lord Kelris - wave 4: Murkshallow Softshell at 4'),
(483213, 3, 6, 10, 4977, 0, 0, 0, 27424, 0, 9, 2, 0, 483220, 0, 7, -867.859, -156.427, -25.88, 6.27, 0, 'Twilight Lord Kelris - wave 4: Murkshallow Softshell at 5'),
(483213, 3, 7, 10, 4977, 0, 0, 0, 27424, 0, 9, 2, 0, 483220, 0, 7, -867.859, -153.927, -25.88, 6.27, 0, 'Twilight Lord Kelris - wave 4: Murkshallow Softshell at 5');

DELETE FROM `gameobject_scripts` WHERE `id` IN (32686, 32930, 32931, 32932, 32933);
INSERT INTO `gameobject_scripts`
(`id`, `delay`, `priority`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`)
VALUES
(32930, 0, 0, 37, 13, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 8506, 'Fire of Aku''mai - one more lit (slot 13)'),
(32930, 0, 1, 37, 11, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 8506, 'Fire of Aku''mai - the shrine in progress'),
(32930, 0, 2, 4, 9, 16, 1, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0, 0, 8506, 'Fire of Aku''mai - not usable again'),
(32930, 0, 3, 39, 483210, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0, 0, 0, 0, 0, 0, 14351, 'Fire of Aku''mai - the 1. fire lit: wave 1'),
(32930, 0, 4, 39, 483211, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0, 0, 0, 0, 0, 0, 48007, 'Fire of Aku''mai - the 2. fire lit: wave 2'),
(32930, 0, 5, 39, 483212, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0, 0, 0, 0, 0, 0, 48008, 'Fire of Aku''mai - the 3. fire lit: wave 3'),
(32930, 0, 6, 39, 483213, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0, 0, 0, 0, 0, 0, 48009, 'Fire of Aku''mai - the 4. fire lit: wave 4'),
(32932, 0, 0, 37, 13, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 8506, 'Fire of Aku''mai - one more lit (slot 13)'),
(32932, 0, 1, 37, 11, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 8506, 'Fire of Aku''mai - the shrine in progress'),
(32932, 0, 2, 4, 9, 16, 1, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0, 0, 8506, 'Fire of Aku''mai - not usable again'),
(32932, 0, 3, 39, 483210, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0, 0, 0, 0, 0, 0, 14351, 'Fire of Aku''mai - the 1. fire lit: wave 1'),
(32932, 0, 4, 39, 483211, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0, 0, 0, 0, 0, 0, 48007, 'Fire of Aku''mai - the 2. fire lit: wave 2'),
(32932, 0, 5, 39, 483212, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0, 0, 0, 0, 0, 0, 48008, 'Fire of Aku''mai - the 3. fire lit: wave 3'),
(32932, 0, 6, 39, 483213, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0, 0, 0, 0, 0, 0, 48009, 'Fire of Aku''mai - the 4. fire lit: wave 4'),
(32933, 0, 0, 37, 13, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 8506, 'Fire of Aku''mai - one more lit (slot 13)'),
(32933, 0, 1, 37, 11, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 8506, 'Fire of Aku''mai - the shrine in progress'),
(32933, 0, 2, 4, 9, 16, 1, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0, 0, 8506, 'Fire of Aku''mai - not usable again'),
(32933, 0, 3, 39, 483210, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0, 0, 0, 0, 0, 0, 14351, 'Fire of Aku''mai - the 1. fire lit: wave 1'),
(32933, 0, 4, 39, 483211, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0, 0, 0, 0, 0, 0, 48007, 'Fire of Aku''mai - the 2. fire lit: wave 2'),
(32933, 0, 5, 39, 483212, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0, 0, 0, 0, 0, 0, 48008, 'Fire of Aku''mai - the 3. fire lit: wave 3'),
(32933, 0, 6, 39, 483213, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0, 0, 0, 0, 0, 0, 48009, 'Fire of Aku''mai - the 4. fire lit: wave 4'),
(32931, 0, 0, 37, 13, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 8506, 'Fire of Aku''mai - one more lit (slot 13)'),
(32931, 0, 1, 37, 11, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 8506, 'Fire of Aku''mai - the shrine in progress'),
(32931, 0, 2, 4, 9, 16, 1, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0, 0, 8506, 'Fire of Aku''mai - not usable again'),
(32931, 0, 3, 39, 483210, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0, 0, 0, 0, 0, 0, 14351, 'Fire of Aku''mai - the 1. fire lit: wave 1'),
(32931, 0, 4, 39, 483211, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0, 0, 0, 0, 0, 0, 48007, 'Fire of Aku''mai - the 2. fire lit: wave 2'),
(32931, 0, 5, 39, 483212, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0, 0, 0, 0, 0, 0, 48008, 'Fire of Aku''mai - the 3. fire lit: wave 3'),
(32931, 0, 6, 39, 483213, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0, 0, 0, 0, 0, 0, 48009, 'Fire of Aku''mai - the 4. fire lit: wave 4'),
(32686, 0, 0, 10, 12876, 0, 0, 0, 0, 0, 0, 0, 0, 0, -1, 7, -782.21, -63.26, -42.43, 2.36, 48004, 'Fathom Stone - Baron Aquanis summoned'),
(32686, 0, 1, 37, 12, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 48004, 'Fathom Stone - Aquanis in progress');

-- A gameobject's state as it spawns (AC3; the table from ac3_gameobject_spawn_state_whole.sql).
DELETE FROM `gameobject_spawn_state` WHERE `guid` = 32682 AND `ord` = 0;
DELETE FROM `gameobject_spawn_state` WHERE `guid` = 32930 AND `ord` = 0;
DELETE FROM `gameobject_spawn_state` WHERE `guid` = 32932 AND `ord` = 0;
DELETE FROM `gameobject_spawn_state` WHERE `guid` = 32933 AND `ord` = 0;
DELETE FROM `gameobject_spawn_state` WHERE `guid` = 32931 AND `ord` = 0;
INSERT INTO `gameobject_spawn_state`
(`guid`, `ord`, `condition_id`, `state`, `flags_set`, `flags_clear`, `despawn`, `script_id`, `comment`)
VALUES
(32682, 0, 48003, 0, 0, 0, 0, 0, 'the Portal of Aku''mai: open once Kelris and the shrine are done'),
(32930, 0, 48002, 0, 16, 0, 0, 0, 'a Fire of Aku''mai: lit and not usable once the shrine is done'),
(32932, 0, 48002, 0, 16, 0, 0, 0, 'a Fire of Aku''mai: lit and not usable once the shrine is done'),
(32933, 0, 48002, 0, 16, 0, 0, 0, 'a Fire of Aku''mai: lit and not usable once the shrine is done'),
(32931, 0, 48002, 0, 16, 0, 0, 0, 'a Fire of Aku''mai: lit and not usable once the shrine is done');

-- The generic store's slots (AC7; the table from ac7_instance_data_slot.sql).
DELETE FROM `instance_data_slot` WHERE `map` = 48 AND `slot` = 10;
DELETE FROM `instance_data_slot` WHERE `map` = 48 AND `slot` = 11;
DELETE FROM `instance_data_slot` WHERE `map` = 48 AND `slot` = 12;
DELETE FROM `instance_data_slot` WHERE `map` = 48 AND `slot` = 13;
DELETE FROM `instance_data_slot` WHERE `map` = 48 AND `slot` = 14;
INSERT INTO `instance_data_slot`
(`map`, `slot`, `flags`, `name`)
VALUES
(48, 10, 1, 'Twilight Lord Kelris (3 done)'),
(48, 11, 1, 'the Fires of Aku''mai (1 lit, 3 the waves dead)'),
(48, 12, 1, 'Baron Aquanis (1 summoned, 3 dead)'),
(48, 13, 4, 'fires lit'),
(48, 14, 4, 'wave mobs dead');

