-- Temple of Ahn'Qiraj (map 531), Huhuran, the mindslayers and Ouro's and Viscidus's helpers: its C++ as rows -- EPIC10 tier 2.
-- Written by the trt repo's scripts/tier2/a29_temple_of_ahnqiraj.py from d6_world; temple_of_ahnqiraj_restore.sql puts
-- back what this replaces. R8: a person applies it, into the world database.
--
-- The C++ keeps its script names: mod-temple-of-ahnqiraj is the switch (AM1, handoff/manager-091).
-- Loaded, the C++ runs as before -- a script found by name comes first. Unloaded
-- (`module unload mod-temple-of-ahnqiraj`, which gives every creature standing a new AI at once),
-- the names find no script and the creatures run these rows (their ai_name).
--
-- Map 531 keeps instance_temple_of_ahnqiraj, the bug trio, C'Thun, Fankriss, Ouro, Sartura and her guards, the
-- Vekniss Guardians, Skeram, the twins and their bugs, Viscidus, the sentinels and the spell scripts (the core).
-- Huhuran's berserk emote comes with the cast (the C++ said it a tick late: its check read a failed cast as
-- taken). The mindslayer's Mind Blast goes at its victim (the C++: the top of its threat in sight, a player).
-- The Dirt Mound follows players it sees, as the C++, but does not leave one dead or immune to nature early.
-- The Viscidus Trigger's toxin waits on Viscidus within 200 yd: the C++ cast it in C'Thun's stomach as well.
-- The mindslayers', mounds' and scarabs' own EventAI rules, dead under the C++ and unlike it, are taken away.

UPDATE `creature_template` SET `ai_name` = 'EventAI' WHERE `entry` = 15246;
UPDATE `creature_template` SET `ai_name` = 'EventAI' WHERE `entry` = 15509;
UPDATE `creature_template` SET `ai_name` = 'EventAI' WHERE `entry` = 15667;
UPDATE `creature_template` SET `ai_name` = 'EventAI' WHERE `entry` = 15922;
UPDATE `creature_template` SET `ai_name` = 'EventAI' WHERE `entry` = 15957;
UPDATE `creature_template` SET `ai_name` = 'EventAI' WHERE `entry` = 15962;

DELETE FROM `conditions` WHERE `condition_entry` IN (531001, 531002);
INSERT INTO `conditions`
(`condition_entry`, `type`, `value1`, `value2`, `value3`, `value4`, `flags`)
VALUES
(531001, 1, 26068, 0, 0, 0, 3),
(531002, 20, 15299, 200, 0, 0, 2);

DELETE FROM `broadcast_text` WHERE `entry` IN (531101);
INSERT INTO `broadcast_text`
(`entry`, `male_text`, `female_text`, `chat_type`, `sound_id`, `language_id`, `emote_id1`, `emote_id2`, `emote_id3`, `emote_delay1`, `emote_delay2`, `emote_delay3`)
VALUES
(531101, '%s goes into a berserker rage!', '%s goes into a berserker rage!', 2, 0, 0, 0, 0, 0, 0, 0, 0);

-- Existing rows taken away: the restore puts them back.
DELETE FROM `creature_ai_events` WHERE `id` = 1524601;
DELETE FROM `creature_ai_scripts` WHERE `id` = 1524601;
DELETE FROM `creature_ai_events` WHERE `id` = 1524602;
DELETE FROM `creature_ai_scripts` WHERE `id` = 1524602;
DELETE FROM `creature_ai_events` WHERE `id` = 1524603;
DELETE FROM `creature_ai_scripts` WHERE `id` = 1524603;
DELETE FROM `creature_ai_events` WHERE `id` = 1524604;
DELETE FROM `creature_ai_scripts` WHERE `id` = 1524604;
DELETE FROM `creature_ai_events` WHERE `id` = 1571201;
DELETE FROM `creature_ai_scripts` WHERE `id` = 1571201;
DELETE FROM `creature_ai_events` WHERE `id` = 1571202;
DELETE FROM `creature_ai_scripts` WHERE `id` = 1571202;
DELETE FROM `creature_ai_events` WHERE `id` = 1571801;
DELETE FROM `creature_ai_scripts` WHERE `id` = 1571801;
DELETE FROM `creature_ai_events` WHERE `id` = 1571802;
DELETE FROM `creature_ai_scripts` WHERE `id` = 1571802;
DELETE FROM `creature_ai_events` WHERE `id` = 1571803;
DELETE FROM `creature_ai_scripts` WHERE `id` = 1571803;
DELETE FROM `creature_ai_events` WHERE `id` IN (1524611, 1524612, 1524613, 1524614, 1550901, 1550902, 1550903, 1550904, 1550911, 1550912, 1550913, 1550914, 1550915, 1566701, 1571211, 1571212, 1571213, 1571811, 1571812, 1592201, 1595701, 1595702, 1595703, 1596201, 1596202, 1596203);
INSERT INTO `creature_ai_events`
(`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`)
VALUES
(1550901, 15509, 0, 10, 0, 100, 1, 1, 80, 1000, 1000, 1550901, 0, 0, 'Princess Huhuran - a player within 80 yd: the fight'),
(1550902, 15509, 0, 4, 0, 100, 0, 0, 0, 0, 0, 1550902, 0, 0, 'Princess Huhuran - aggro: in progress (3)'),
(1550903, 15509, 0, 21, 0, 100, 0, 0, 0, 0, 0, 1550903, 0, 0, 'Princess Huhuran - home: failed (3)'),
(1550904, 15509, 0, 6, 0, 100, 0, 0, 0, 0, 0, 1550904, 0, 0, 'Princess Huhuran - dead: done (3), her door'),
(1550911, 15509, 531001, 0, 0, 100, 9, 10000, 20000, 10000, 20000, 1550911, 0, 0, 'Princess Huhuran - Frenzy while she has none, with its emote'),
(1550912, 15509, 531001, 0, 0, 100, 9, 18000, 28000, 15000, 32000, 1550912, 0, 0, 'Princess Huhuran - Wyvern Sting until berserk'),
(1550913, 15509, 0, 0, 0, 100, 9, 8000, 8000, 5000, 10000, 1550913, 0, 0, 'Princess Huhuran - Acid Spit'),
(1550914, 15509, 0, 0, 0, 100, 9, 10000, 20000, 12000, 24000, 1550914, 0, 0, 'Princess Huhuran - Noxious Poison at a random attacker'),
(1550915, 15509, 0, 2, 0, 100, 8, 29, 0, 0, 0, 1550915, 0, 0, 'Princess Huhuran - under 30 %: her frenzy gone, Berserk and its emote'),
(1524611, 15246, 0, 0, 0, 100, 9, 5000, 20000, 10000, 30000, 1524611, 0, 0, 'Qiraji Mindslayer - Mind Flay at a random player in sight'),
(1524612, 15246, 0, 0, 0, 100, 9, 12000, 32000, 17000, 44000, 1524612, 0, 0, 'Qiraji Mindslayer - Mind Blast at its victim'),
(1524613, 15246, 0, 0, 0, 100, 9, 5000, 60000, 15000, 60000, 1524613, 0, 0, 'Qiraji Mindslayer - Cause Insanity at a random player in sight'),
(1524614, 15246, 0, 6, 0, 100, 0, 0, 0, 0, 0, 1524614, 0, 0, 'Qiraji Mindslayer - dead: Mana Burn at the nearest living player'),
(1596201, 15962, 0, 11, 0, 100, 0, 0, 0, 0, 0, 1596201, 0, 0, 'Vekniss Hatchling - hatching: held back'),
(1596202, 15962, 0, 1, 0, 100, 0, 2500, 2500, 0, 0, 1596202, 0, 0, 'Vekniss Hatchling - 2.5 s on: the zone, the nearest player within 200 yd'),
(1596203, 15962, 0, 4, 0, 100, 0, 0, 0, 0, 0, 1596203, 0, 0, 'Vekniss Hatchling - fought first: at once, the zone'),
(1595701, 15957, 0, 11, 0, 100, 0, 0, 0, 0, 0, 1595701, 0, 0, 'Ouro Spawner - its mound'),
(1595702, 15957, 0, 10, 0, 100, 8, 1, 25, 0, 0, 1595702, 0, 0, 'Ouro Spawner - a player within 25 yd: Summon Ouro'),
(1595703, 15957, 0, 17, 0, 100, 0, 15517, 0, 0, 0, 1595703, 0, 0, 'Ouro Spawner - Ouro summoned: born into the zone, the spawner gone'),
(1571211, 15712, 0, 11, 0, 100, 0, 0, 0, 0, 0, 1571211, 0, 0, 'Dirt Mound - its mound, held back, wandering'),
(1571212, 15712, 0, 10, 0, 100, 1, 1, 100, 0, 10000, 1571212, 0, 0, 'Dirt Mound - a player seen: followed, another every 0-10 s'),
(1571213, 15712, 0, 11, 0, 100, 0, 0, 0, 0, 0, 1571213, 0, 0, 'Dirt Mound - 30 s on: its scarabs, gone'),
(1571811, 15718, 0, 11, 0, 100, 0, 0, 0, 0, 0, 1571811, 0, 0, 'Ouro Scarab - gone 45 s on'),
(1571812, 15718, 0, 10, 0, 17, 1, 1, 100, 0, 0, 1571812, 0, 0, 'Ouro Scarab - a player in sight: one chance in six it attacks'),
(1566701, 15667, 0, 11, 0, 100, 0, 0, 0, 0, 0, 1566701, 0, 0, 'Glob of Viscidus - never fights; its speed 4 s on'),
(1592201, 15922, 531002, 11, 0, 100, 0, 0, 0, 0, 0, 1592201, 0, 0, 'Viscidus Trigger - 3 s on: hostile, unattackable, the toxin cloud');

DELETE FROM `creature_ai_scripts` WHERE `id` IN (1524611, 1524612, 1524613, 1524614, 1550901, 1550902, 1550903, 1550904, 1550911, 1550912, 1550913, 1550914, 1550915, 1566701, 1571211, 1571212, 1571213, 1571811, 1571812, 1592201, 1595701, 1595702, 1595703, 1596201, 1596202, 1596203);
INSERT INTO `creature_ai_scripts`
(`id`, `delay`, `priority`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`)
VALUES
(1550901, 0, 0, 26, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Princess Huhuran - at the player seen'),
(1550902, 0, 0, 37, 3, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Princess Huhuran - in progress'),
(1550903, 0, 0, 37, 3, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Princess Huhuran - failed'),
(1550904, 0, 0, 37, 3, 3, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Princess Huhuran - done'),
(1550911, 0, 0, 15, 26051, 32, 0, 0, 0, 0, 0, 12, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Princess Huhuran - Frenzy while she has none, with its emote'),
(1550911, 0, 1, 0, 2, 0, 0, 0, 0, 0, 0, 0, 7797, 0, 0, 0, 0, 0, 0, 0, 0, 'Princess Huhuran - her frenzy emote'),
(1550912, 0, 0, 15, 26180, 0, 0, 0, 0, 0, 1, 8, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Princess Huhuran - Wyvern Sting until berserk'),
(1550913, 0, 0, 15, 26050, 0, 0, 0, 0, 0, 1, 8, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Princess Huhuran - Acid Spit'),
(1550914, 0, 0, 15, 26053, 0, 0, 0, 0, 0, 4, 8, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Princess Huhuran - Noxious Poison at a random attacker'),
(1550915, 0, 0, 14, 26051, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Princess Huhuran - her frenzy gone'),
(1550915, 0, 1, 15, 26068, 32, 0, 0, 0, 0, 0, 12, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Princess Huhuran - Berserk'),
(1550915, 0, 2, 0, 2, 0, 0, 0, 0, 0, 0, 0, 531101, 0, 0, 0, 0, 0, 0, 0, 0, 'Princess Huhuran - her berserk emote'),
(1524611, 0, 0, 15, 26044, 0, 0, 0, 3, 0, 4, 8, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Qiraji Mindslayer - Mind Flay at a random player in sight'),
(1524612, 0, 0, 15, 26048, 0, 0, 0, 0, 0, 1, 8, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Qiraji Mindslayer - Mind Blast at its victim'),
(1524613, 0, 0, 15, 26079, 0, 0, 0, 3, 0, 4, 8, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Qiraji Mindslayer - Cause Insanity at a random player in sight'),
(1524614, 0, 0, 15, 26049, 3, 0, 0, 1000, 0, 23, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Qiraji Mindslayer - Mana Burn'),
(1596201, 0, 0, 4, 46, 512, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Vekniss Hatchling - starts no fight (immune to creatures)'),
(1596202, 0, 0, 4, 46, 512, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Vekniss Hatchling - let go'),
(1596202, 0, 1, 49, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Vekniss Hatchling - the zone into the fight'),
(1596202, 0, 2, 26, 0, 0, 0, 0, 200, 0, 23, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Vekniss Hatchling - at the nearest player'),
(1596203, 0, 0, 4, 46, 512, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Vekniss Hatchling - let go'),
(1596203, 0, 1, 49, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Vekniss Hatchling - the zone into the fight'),
(1596203, 0, 2, 26, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Vekniss Hatchling - at its attacker'),
(1595701, 0, 0, 15, 26092, 0, 0, 0, 0, 0, 0, 12, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Ouro Spawner - Dirtmound Passive'),
(1595702, 0, 0, 15, 26061, 0, 0, 0, 0, 0, 0, 12, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Ouro Spawner - Summon Ouro'),
(1595703, 0, 0, 15, 26262, 0, 0, 0, 0, 0, 0, 6, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Ouro - Birth, on himself'),
(1595703, 0, 1, 49, 1, 0, 0, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Ouro - the zone into the fight'),
(1595703, 0, 2, 18, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Ouro Spawner - gone'),
(1571211, 0, 0, 59, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Dirt Mound - passive'),
(1571211, 0, 1, 15, 26092, 0, 0, 0, 0, 0, 0, 12, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Dirt Mound - Dirtmound Passive'),
(1571211, 0, 2, 20, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Dirt Mound - wandering'),
(1571212, 0, 0, 20, 14, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Dirt Mound - following the player seen'),
(1571213, 0, 0, 39, 5310001, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0, 0, 0, 0, 0, 0, 0, 'Dirt Mound - what comes later'),
(1571811, 0, 0, 39, 5310002, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0, 0, 0, 0, 0, 0, 0, 'Ouro Scarab - what comes later'),
(1571812, 0, 0, 26, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Ouro Scarab - at the player seen'),
(1566701, 0, 0, 59, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Glob of Viscidus - passive'),
(1566701, 0, 1, 43, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Glob of Viscidus - no chase'),
(1566701, 0, 2, 42, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Glob of Viscidus - no melee'),
(1566701, 0, 3, 39, 5310003, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0, 0, 0, 0, 0, 0, 0, 'Glob of Viscidus - what comes later'),
(1592201, 0, 0, 59, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Viscidus Trigger - passive'),
(1592201, 0, 1, 39, 5310004, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0, 0, 0, 0, 0, 0, 0, 'Viscidus Trigger - what comes later');

DELETE FROM `generic_scripts` WHERE `id` IN (5310001, 5310002, 5310003, 5310004);
INSERT INTO `generic_scripts`
(`id`, `delay`, `priority`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`)
VALUES
(5310001, 30, 0, 15, 26060, 2, 0, 0, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Dirt Mound - Summon Ouro Scarabs'),
(5310001, 30, 1, 18, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Dirt Mound - gone'),
(5310002, 45, 0, 18, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Ouro Scarab - gone'),
(5310003, 4, 0, 15, 26633, 2, 0, 0, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Glob of Viscidus - Glob Speed'),
(5310004, 3, 0, 22, 14, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Viscidus Trigger - hostile'),
(5310004, 3, 1, 4, 46, 128, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Viscidus Trigger - not attackable'),
(5310004, 3, 2, 15, 25989, 2, 0, 0, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Viscidus Trigger - Toxin Cloud'),
(5310004, 3, 3, 15, 26575, 2, 0, 0, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Viscidus Trigger - Toxin');

