-- Blackwing Lair (map 469), the three drakes, Broodlord, the Death Talons and whelps: its C++ as rows -- EPIC10 tier 2.
-- Written by the trt repo's scripts/tier2/a28_blackwing_lair.py from t1_world; blackwing_lair_restore.sql puts
-- back what this replaces. R8: a person applies it, into the world database.
--
-- The C++ keeps its script names: mod-blackwing-lair is the switch (AM1, handoff/manager-091).
-- Loaded, the C++ runs as before -- a script found by name comes first. Unloaded
-- (`module unload mod-blackwing-lair`, which gives every creature standing a new AI at once),
-- the names find no script and the creatures run these rows (their ai_name).
--
-- Map 469 keeps instance_blackwing_lair, Razorgore, Vaelastrasz with his Captain and Seethers, Chromaggus,
-- Victor Nefarius and Nefarian (the core). Broodlord has no height leash (the C++ evaded below z 448.6);
-- Firemaw does not Thrash (the C++ tried only while casting). A Death Talon picks its brood power and
-- vulnerability again as it evades (the C++ kept them till death) and does not get them back if dispelled.
-- The Death Talons' own EventAI rules, dead under the C++, are taken away.

UPDATE `creature_template` SET `ai_name` = 'EventAI' WHERE `entry` = 11981;
UPDATE `creature_template` SET `ai_name` = 'EventAI' WHERE `entry` = 11983;
UPDATE `creature_template` SET `ai_name` = 'EventAI' WHERE `entry` = 12017;
UPDATE `creature_template` SET `ai_name` = 'EventAI' WHERE `entry` = 12460;
UPDATE `creature_template` SET `ai_name` = 'EventAI' WHERE `entry` = 12461;
UPDATE `creature_template` SET `ai_name` = 'EventAI' WHERE `entry` = 14022;
UPDATE `creature_template` SET `ai_name` = 'EventAI' WHERE `entry` = 14023;
UPDATE `creature_template` SET `ai_name` = 'EventAI' WHERE `entry` = 14024;
UPDATE `creature_template` SET `ai_name` = 'EventAI' WHERE `entry` = 14025;
UPDATE `creature_template` SET `ai_name` = 'EventAI' WHERE `entry` = 14601;

DELETE FROM `conditions` WHERE `condition_entry` IN (469000);
INSERT INTO `conditions`
(`condition_entry`, `type`, `value1`, `value2`, `value3`, `value4`, `flags`)
VALUES
(469000, 34, 8, 3, 0, 0, 1);

DELETE FROM `broadcast_text` WHERE `entry` IN (469101);
INSERT INTO `broadcast_text`
(`entry`, `male_text`, `female_text`, `chat_type`, `sound_id`, `language_id`, `emote_id1`, `emote_id2`, `emote_id3`, `emote_delay1`, `emote_delay2`, `emote_delay3`)
VALUES
(469101, 'None of your kind should be here! You''ve doomed only yourselves!', 'None of your kind should be here! You''ve doomed only yourselves!', 1, 8286, 0, 0, 0, 0, 0, 0, 0);

-- Existing rows taken away: the restore puts them back.
DELETE FROM `creature_ai_scripts` WHERE `id` = 1246001;
DELETE FROM `creature_ai_scripts` WHERE `id` = 1246002;
DELETE FROM `creature_ai_scripts` WHERE `id` = 1246003;
DELETE FROM `creature_ai_scripts` WHERE `id` = 1246004;
DELETE FROM `creature_ai_scripts` WHERE `id` = 1246005;
DELETE FROM `creature_ai_scripts` WHERE `id` = 1246006;
DELETE FROM `creature_ai_scripts` WHERE `id` = 1246007;
DELETE FROM `creature_ai_scripts` WHERE `id` = 1246008;
DELETE FROM `creature_ai_scripts` WHERE `id` = 1246009;
DELETE FROM `creature_ai_scripts` WHERE `id` = 1246010;
DELETE FROM `creature_ai_scripts` WHERE `id` = 1246011;
DELETE FROM `creature_ai_scripts` WHERE `id` = 1246012;
DELETE FROM `creature_ai_scripts` WHERE `id` = 1246013;
DELETE FROM `creature_ai_scripts` WHERE `id` = 1246014;
DELETE FROM `creature_ai_scripts` WHERE `id` = 1246015;
DELETE FROM `creature_ai_scripts` WHERE `id` = 1246016;
DELETE FROM `creature_ai_scripts` WHERE `id` = 1246017;
DELETE FROM `creature_ai_scripts` WHERE `id` = 1246018;
DELETE FROM `creature_ai_scripts` WHERE `id` = 1246101;
DELETE FROM `creature_ai_scripts` WHERE `id` = 1246102;
DELETE FROM `creature_ai_scripts` WHERE `id` = 1246103;
DELETE FROM `creature_ai_scripts` WHERE `id` = 1246104;
DELETE FROM `creature_ai_scripts` WHERE `id` = 1246105;
DELETE FROM `creature_ai_scripts` WHERE `id` = 1246106;
DELETE FROM `creature_ai_scripts` WHERE `id` = 1246107;
DELETE FROM `creature_ai_scripts` WHERE `id` = 1246108;
DELETE FROM `creature_ai_scripts` WHERE `id` = 1246109;
DELETE FROM `creature_ai_scripts` WHERE `id` = 1246110;
DELETE FROM `creature_ai_scripts` WHERE `id` = 1246111;
DELETE FROM `creature_ai_scripts` WHERE `id` = 1246112;
DELETE FROM `creature_ai_scripts` WHERE `id` = 1246113;
DELETE FROM `creature_ai_events` WHERE `creature_id` = 12460;
DELETE FROM `creature_ai_events` WHERE `creature_id` = 12461;
DELETE FROM `creature_ai_events` WHERE `id` IN (1198101, 1198102, 1198103, 1198106, 1198107, 1198191, 1198192, 1198193, 1198301, 1198302, 1198303, 1198304, 1198391, 1198392, 1198393, 1201701, 1201702, 1201703, 1201704, 1201705, 1201791, 1201792, 1201793, 1201794, 1201795, 1246051, 1246052, 1246053, 1246054, 1246055, 1246151, 1246152, 1246153, 1246154, 1460101, 1460102, 1460103, 1460104, 1460106, 1460191, 1460192, 1460193);
INSERT INTO `creature_ai_events`
(`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`)
VALUES
(1198391, 11983, 0, 4, 0, 100, 0, 0, 0, 0, 0, 1198391, 0, 0, 'Firemaw - aggro: in progress (3), the zone into the fight'),
(1198392, 11983, 0, 21, 0, 100, 0, 0, 0, 0, 0, 1198392, 0, 0, 'Firemaw - home: failed (3)'),
(1198393, 11983, 0, 6, 0, 100, 0, 0, 0, 0, 0, 1198393, 0, 0, 'Firemaw - dead: done (3)'),
(1198301, 11983, 0, 0, 0, 100, 9, 16000, 16000, 16000, 16000, 1198301, 0, 0, 'Firemaw - Shadow Flame'),
(1198302, 11983, 0, 0, 0, 100, 9, 30000, 30000, 30000, 30000, 1198302, 0, 0, 'Firemaw - Wing Buffet'),
(1198303, 11983, 0, 36, 0, 100, 1, 23339, 0, 0, 0, 1198303, 0, 0, 'Firemaw - Wing Buffet hit a player: his threat halved'),
(1198304, 11983, 0, 0, 0, 100, 9, 2000, 2000, 1800, 3000, 1198304, 0, 0, 'Firemaw - Flame Buffet'),
(1460191, 14601, 0, 4, 0, 100, 0, 0, 0, 0, 0, 1460191, 0, 0, 'Ebonroc - aggro: in progress (4), the zone into the fight'),
(1460192, 14601, 0, 21, 0, 100, 0, 0, 0, 0, 0, 1460192, 0, 0, 'Ebonroc - home: failed (4)'),
(1460193, 14601, 0, 6, 0, 100, 0, 0, 0, 0, 0, 1460193, 0, 0, 'Ebonroc - dead: done (4)'),
(1460101, 14601, 0, 0, 0, 100, 9, 16000, 16000, 16000, 16000, 1460101, 0, 0, 'Ebonroc - Shadow Flame'),
(1460102, 14601, 0, 0, 0, 100, 9, 30000, 30000, 30000, 30000, 1460102, 0, 0, 'Ebonroc - Wing Buffet'),
(1460103, 14601, 0, 36, 0, 100, 1, 23339, 0, 0, 0, 1460103, 0, 0, 'Ebonroc - Wing Buffet hit a player: his threat halved'),
(1460104, 14601, 0, 0, 0, 100, 9, 8000, 8000, 8000, 8000, 1460104, 0, 0, 'Ebonroc - Shadow of Ebonroc'),
(1460106, 14601, 0, 0, 0, 33, 1, 2000, 2000, 2000, 2000, 1460106, 0, 0, 'Ebonroc - Thrash, one swing in three'),
(1198191, 11981, 0, 4, 0, 100, 0, 0, 0, 0, 0, 1198191, 0, 0, 'Flamegor - aggro: in progress (5), the zone into the fight'),
(1198192, 11981, 0, 21, 0, 100, 0, 0, 0, 0, 0, 1198192, 0, 0, 'Flamegor - home: failed (5)'),
(1198193, 11981, 0, 6, 0, 100, 0, 0, 0, 0, 0, 1198193, 0, 0, 'Flamegor - dead: done (5)'),
(1198101, 11981, 0, 0, 0, 100, 9, 16000, 16000, 16000, 16000, 1198101, 0, 0, 'Flamegor - Shadow Flame'),
(1198102, 11981, 0, 0, 0, 100, 9, 30000, 30000, 30000, 30000, 1198102, 0, 0, 'Flamegor - Wing Buffet'),
(1198103, 11981, 0, 36, 0, 100, 1, 23339, 0, 0, 0, 1198103, 0, 0, 'Flamegor - Wing Buffet hit a player: his threat halved'),
(1198106, 11981, 0, 0, 0, 33, 1, 2000, 2000, 2000, 2000, 1198106, 0, 0, 'Flamegor - Thrash, one swing in three'),
(1198107, 11981, 0, 0, 0, 100, 9, 10000, 10000, 10000, 10000, 1198107, 0, 0, 'Flamegor - Frenzy, with its emote'),
(1201791, 12017, 0, 4, 0, 100, 0, 0, 0, 0, 0, 1201791, 0, 0, 'Broodlord Lashlayer - aggro: in progress (2), his trash asleep, his line'),
(1201792, 12017, 0, 21, 0, 100, 0, 0, 0, 0, 0, 1201792, 0, 0, 'Broodlord Lashlayer - home: failed (2), his trash awake'),
(1201793, 12017, 0, 6, 0, 100, 0, 0, 0, 0, 0, 1201793, 0, 0, 'Broodlord Lashlayer - dead: done (2), his trash awake'),
(1201794, 12017, 0, 10, 0, 100, 1, 1, 40, 1000, 1000, 1201794, 0, 0, 'Broodlord Lashlayer - a player within 40 yd: the zone into the fight'),
(1201795, 12017, 0, 0, 0, 100, 1, 2000, 2000, 2000, 2000, 1201795, 0, 0, 'Broodlord Lashlayer - the zone pulled in every 2 s'),
(1201701, 12017, 0, 0, 0, 100, 9, 8000, 8000, 13000, 20000, 1201701, 0, 0, 'Broodlord Lashlayer - Cleave'),
(1201702, 12017, 0, 0, 0, 100, 9, 20000, 20000, 20000, 35000, 1201702, 0, 0, 'Broodlord Lashlayer - Blast Wave'),
(1201703, 12017, 0, 0, 0, 100, 9, 25000, 25000, 20000, 30000, 1201703, 0, 0, 'Broodlord Lashlayer - Mortal Strike'),
(1201704, 12017, 0, 0, 0, 100, 9, 20000, 25000, 12000, 25000, 1201704, 0, 0, 'Broodlord Lashlayer - Knock Away'),
(1201705, 12017, 0, 36, 0, 100, 1, 18670, 0, 0, 0, 1201705, 0, 0, 'Broodlord Lashlayer - Knock Away hit a player: his threat halved'),
(1246051, 12460, 0, 11, 0, 100, 0, 0, 0, 0, 0, 1246051, 0, 0, 'Death Talon Wyrmguard - its brood power and vulnerability'),
(1246052, 12460, 0, 7, 0, 100, 0, 0, 0, 0, 0, 1246052, 0, 0, 'Death Talon Wyrmguard - its brood power and vulnerability'),
(1246053, 12460, 0, 0, 0, 100, 9, 5000, 9000, 5000, 9000, 1246053, 0, 0, 'Death Talon Wyrmguard - Cleave'),
(1246054, 12460, 0, 0, 0, 100, 9, 8000, 8000, 8000, 14000, 1246054, 0, 0, 'Death Talon Wyrmguard - War Stomp'),
(1246055, 12460, 0, 4, 0, 100, 0, 0, 0, 0, 0, 1246055, 0, 0, 'Death Talon Wyrmguard - aggro: calls for help'),
(1246151, 12461, 0, 11, 0, 100, 0, 0, 0, 0, 0, 1246151, 0, 0, 'Death Talon Overseer - its brood power and vulnerability'),
(1246152, 12461, 0, 7, 0, 100, 0, 0, 0, 0, 0, 1246152, 0, 0, 'Death Talon Overseer - its brood power and vulnerability'),
(1246153, 12461, 0, 0, 0, 100, 9, 5000, 9000, 5000, 9000, 1246153, 0, 0, 'Death Talon Overseer - Cleave'),
(1246154, 12461, 0, 0, 0, 100, 9, 8000, 8000, 10000, 10000, 1246154, 0, 0, 'Death Talon Overseer - Fire Blast at a random attacker');

DELETE FROM `creature_ai_scripts` WHERE `id` IN (1198101, 1198102, 1198103, 1198106, 1198107, 1198191, 1198192, 1198193, 1198301, 1198302, 1198303, 1198304, 1198391, 1198392, 1198393, 1201701, 1201702, 1201703, 1201704, 1201705, 1201791, 1201792, 1201793, 1201794, 1201795, 1246051, 1246052, 1246053, 1246054, 1246055, 1246151, 1246152, 1246153, 1246154, 1460101, 1460102, 1460103, 1460104, 1460106, 1460191, 1460192, 1460193);
INSERT INTO `creature_ai_scripts`
(`id`, `delay`, `priority`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`)
VALUES
(1198391, 0, 0, 37, 3, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Firemaw - in progress'),
(1198391, 0, 1, 49, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Firemaw - the zone into the fight'),
(1198392, 0, 0, 37, 3, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Firemaw - failed'),
(1198393, 0, 0, 37, 3, 3, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Firemaw - done'),
(1198301, 0, 0, 15, 22539, 0, 0, 0, 0, 0, 0, 12, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Firemaw - Shadow Flame'),
(1198302, 0, 0, 15, 23339, 0, 0, 0, 0, 0, 1, 8, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Firemaw - Wing Buffet'),
(1198303, 0, 0, 29, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, -50, 0, 0, 0, 0, 'Firemaw - the hit player''s threat halved'),
(1198304, 0, 0, 15, 23341, 0, 0, 0, 0, 0, 0, 12, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Firemaw - Flame Buffet'),
(1460191, 0, 0, 37, 4, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Ebonroc - in progress'),
(1460191, 0, 1, 49, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Ebonroc - the zone into the fight'),
(1460192, 0, 0, 37, 4, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Ebonroc - failed'),
(1460193, 0, 0, 37, 4, 3, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Ebonroc - done'),
(1460101, 0, 0, 15, 22539, 0, 0, 0, 0, 0, 0, 12, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Ebonroc - Shadow Flame'),
(1460102, 0, 0, 15, 23339, 0, 0, 0, 0, 0, 1, 8, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Ebonroc - Wing Buffet'),
(1460103, 0, 0, 29, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, -50, 0, 0, 0, 0, 'Ebonroc - the hit player''s threat halved'),
(1460104, 0, 0, 15, 23340, 32, 0, 0, 0, 0, 1, 8, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Ebonroc - Shadow of Ebonroc'),
(1460106, 0, 0, 15, 3391, 0, 0, 0, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Ebonroc - Thrash, one swing in three'),
(1198191, 0, 0, 37, 5, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Flamegor - in progress'),
(1198191, 0, 1, 49, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Flamegor - the zone into the fight'),
(1198192, 0, 0, 37, 5, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Flamegor - failed'),
(1198193, 0, 0, 37, 5, 3, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Flamegor - done'),
(1198101, 0, 0, 15, 22539, 0, 0, 0, 0, 0, 0, 12, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Flamegor - Shadow Flame'),
(1198102, 0, 0, 15, 23339, 0, 0, 0, 0, 0, 1, 8, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Flamegor - Wing Buffet'),
(1198103, 0, 0, 29, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, -50, 0, 0, 0, 0, 'Flamegor - the hit player''s threat halved'),
(1198106, 0, 0, 15, 3391, 0, 0, 0, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Flamegor - Thrash, one swing in three'),
(1198107, 0, 0, 15, 23342, 0, 0, 0, 0, 0, 0, 12, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Flamegor - Frenzy, with its emote'),
(1198107, 0, 1, 0, 2, 0, 0, 0, 0, 0, 0, 0, 1191, 0, 0, 0, 0, 0, 0, 0, 0, 'Flamegor - "%s goes into a frenzy!"'),
(1201791, 0, 0, 37, 2, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Broodlord - in progress'),
(1201791, 0, 1, 68, 4690001, 2, 12459, 300, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Broodlord Lashlayer - his trash asleep (12459)'),
(1201791, 0, 2, 68, 4690001, 2, 13996, 300, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Broodlord Lashlayer - his trash asleep (13996)'),
(1201791, 0, 3, 68, 4690001, 2, 12457, 300, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Broodlord Lashlayer - his trash asleep (12457)'),
(1201791, 0, 4, 68, 4690001, 2, 12461, 300, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Broodlord Lashlayer - his trash asleep (12461)'),
(1201791, 0, 5, 0, 1, 0, 0, 0, 0, 0, 0, 0, 469101, 0, 0, 0, 0, 0, 0, 0, 0, 'Broodlord Lashlayer - his aggro line'),
(1201791, 0, 6, 49, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Broodlord - the zone'),
(1201792, 0, 0, 37, 2, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Broodlord - failed'),
(1201792, 0, 1, 68, 4690002, 2, 12459, 300, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Broodlord Lashlayer - his trash awake (12459)'),
(1201792, 0, 2, 68, 4690002, 2, 13996, 300, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Broodlord Lashlayer - his trash awake (13996)'),
(1201792, 0, 3, 68, 4690002, 2, 12457, 300, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Broodlord Lashlayer - his trash awake (12457)'),
(1201792, 0, 4, 68, 4690002, 2, 12461, 300, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Broodlord Lashlayer - his trash awake (12461)'),
(1201793, 0, 0, 37, 2, 3, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Broodlord - done'),
(1201793, 0, 1, 68, 4690002, 2, 12459, 300, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Broodlord Lashlayer - his trash awake (12459)'),
(1201793, 0, 2, 68, 4690002, 2, 13996, 300, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Broodlord Lashlayer - his trash awake (13996)'),
(1201793, 0, 3, 68, 4690002, 2, 12457, 300, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Broodlord Lashlayer - his trash awake (12457)'),
(1201793, 0, 4, 68, 4690002, 2, 12461, 300, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Broodlord Lashlayer - his trash awake (12461)'),
(1201794, 0, 0, 49, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Broodlord - the zone'),
(1201795, 0, 0, 49, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Broodlord - the zone'),
(1201701, 0, 0, 15, 15284, 0, 0, 0, 0, 0, 1, 8, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Broodlord Lashlayer - Cleave'),
(1201702, 0, 0, 15, 23331, 0, 0, 0, 0, 0, 0, 12, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Broodlord Lashlayer - Blast Wave'),
(1201703, 0, 0, 15, 24573, 0, 0, 0, 0, 0, 1, 8, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Broodlord Lashlayer - Mortal Strike'),
(1201704, 0, 0, 15, 18670, 0, 0, 0, 0, 0, 1, 8, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Broodlord Lashlayer - Knock Away'),
(1201705, 0, 0, 29, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, -50, 0, 0, 0, 0, 'Broodlord Lashlayer - the hit player''s threat halved'),
(1246051, 0, 0, 39, 4690008, 4690009, 0, 0, 0, 0, 0, 0, 60, 40, 0, 0, 0, 0, 0, 0, 0, 'Death Talon - brood power, one of five'),
(1246051, 0, 1, 39, 4690015, 4690016, 0, 0, 0, 0, 0, 0, 60, 40, 0, 0, 0, 0, 0, 0, 0, 'Death Talon - vulnerability, one of five'),
(1246052, 0, 0, 39, 4690008, 4690009, 0, 0, 0, 0, 0, 0, 60, 40, 0, 0, 0, 0, 0, 0, 0, 'Death Talon - brood power, one of five'),
(1246052, 0, 1, 39, 4690015, 4690016, 0, 0, 0, 0, 0, 0, 60, 40, 0, 0, 0, 0, 0, 0, 0, 'Death Talon - vulnerability, one of five'),
(1246053, 0, 0, 15, 15284, 0, 0, 0, 0, 0, 1, 8, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Death Talon Wyrmguard - Cleave'),
(1246054, 0, 0, 15, 24375, 0, 0, 0, 0, 0, 0, 12, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Death Talon Wyrmguard - War Stomp'),
(1246055, 0, 0, 50, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 15, 0, 0, 0, 0, 'Death Talon Wyrmguard - calls for help'),
(1246151, 0, 0, 39, 4690022, 4690023, 0, 0, 0, 0, 0, 0, 60, 40, 0, 0, 0, 0, 0, 0, 0, 'Death Talon - vulnerability, one of five'),
(1246152, 0, 0, 39, 4690022, 4690023, 0, 0, 0, 0, 0, 0, 60, 40, 0, 0, 0, 0, 0, 0, 0, 'Death Talon - vulnerability, one of five'),
(1246153, 0, 0, 15, 15284, 0, 0, 0, 0, 0, 1, 8, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Death Talon Overseer - Cleave'),
(1246154, 0, 0, 15, 20623, 0, 0, 0, 0, 0, 4, 8, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Death Talon Overseer - Fire Blast at a random attacker');

DELETE FROM `generic_scripts` WHERE `id` IN (4690001, 4690002, 4690003, 4690004, 4690005, 4690006, 4690007, 4690008, 4690009, 4690010, 4690011, 4690012, 4690013, 4690014, 4690015, 4690016, 4690017, 4690018, 4690019, 4690020, 4690021, 4690022, 4690023, 4690024);
INSERT INTO `generic_scripts`
(`id`, `delay`, `priority`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`)
VALUES
(4690001, 0, 0, 4, 46, 33554946, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Broodlord''s trash - put to sleep'),
(4690002, 0, 0, 4, 46, 33554946, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Broodlord''s trash - awake'),
(4690003, 0, 0, 74, 22285, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Death Talon - brood power 22285'),
(4690004, 0, 0, 74, 22287, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Death Talon - brood power 22287'),
(4690005, 0, 0, 74, 22286, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Death Talon - brood power 22286'),
(4690006, 0, 0, 74, 22283, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Death Talon - brood power 22283'),
(4690007, 0, 0, 74, 22288, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Death Talon - brood power 22288'),
(4690008, 0, 0, 39, 4690003, 4690004, 4690005, 0, 0, 0, 0, 0, 33, 33, 34, 0, 0, 0, 0, 0, 0, 'Death Talon - brood power, one of three'),
(4690009, 0, 0, 39, 4690006, 4690007, 0, 0, 0, 0, 0, 0, 50, 50, 0, 0, 0, 0, 0, 0, 0, 'Death Talon - brood power, one of two'),
(4690010, 0, 0, 74, 22277, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Death Talon - vulnerability 22277'),
(4690011, 0, 0, 74, 22278, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Death Talon - vulnerability 22278'),
(4690012, 0, 0, 74, 22279, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Death Talon - vulnerability 22279'),
(4690013, 0, 0, 74, 22280, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Death Talon - vulnerability 22280'),
(4690014, 0, 0, 74, 22281, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Death Talon - vulnerability 22281'),
(4690015, 0, 0, 39, 4690010, 4690011, 4690012, 0, 0, 0, 0, 0, 33, 33, 34, 0, 0, 0, 0, 0, 0, 'Death Talon - vulnerability, one of three'),
(4690016, 0, 0, 39, 4690013, 4690014, 0, 0, 0, 0, 0, 0, 50, 50, 0, 0, 0, 0, 0, 0, 0, 'Death Talon - vulnerability, one of two'),
(4690017, 0, 0, 74, 22277, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Death Talon - vulnerability 22277'),
(4690018, 0, 0, 74, 22278, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Death Talon - vulnerability 22278'),
(4690019, 0, 0, 74, 22279, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Death Talon - vulnerability 22279'),
(4690020, 0, 0, 74, 22280, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Death Talon - vulnerability 22280'),
(4690021, 0, 0, 74, 22281, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Death Talon - vulnerability 22281'),
(4690022, 0, 0, 39, 4690017, 4690018, 4690019, 0, 0, 0, 0, 0, 33, 33, 34, 0, 0, 0, 0, 0, 0, 'Death Talon - vulnerability, one of three'),
(4690023, 0, 0, 39, 4690020, 4690021, 0, 0, 0, 0, 0, 0, 50, 50, 0, 0, 0, 0, 0, 0, 0, 'Death Talon - vulnerability, one of two'),
(4690024, 0, 0, 37, 8, 3, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Vael room - its event done (8 = 3): the technicians run');

DELETE FROM `areatrigger_generic_script` WHERE `trigger_id` = 3626 AND `script_id` = 4690024;
INSERT INTO `areatrigger_generic_script`
(`trigger_id`, `script_id`, `condition_id`, `flags`, `comment`)
VALUES
(3626, 4690024, 469000, 2, 'Vaelastrasz''s room: its event done as the first player walks in, no game master');

