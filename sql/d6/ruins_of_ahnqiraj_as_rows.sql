-- Ruins of Ahn'Qiraj (map 509), Kurinnaxx, Moam and the trash: its C++ as rows -- EPIC10 tier 2.
-- Written by the trt repo's scripts/tier2/a24_ruins_of_ahnqiraj.py from t1_world; ruins_of_ahnqiraj_restore.sql puts
-- back what this replaces. R8: a person applies it, into the world database.
--
-- The C++ keeps its script names: mod-ruins-of-ahnqiraj is the switch (AM1, handoff/manager-091).
-- Loaded, the C++ runs as before -- a script found by name comes first. Unloaded
-- (`module unload mod-ruins-of-ahnqiraj`, which gives every creature standing a new AI at once),
-- the names find no script and the creatures run these rows (their ai_name).
--
-- Map 509 keeps instance_ruins_of_ahnqiraj, Ayamiss, Buru, Ossirian, the Anubisath Guardian, the tornadoes, the
-- Flesh Hunter and the two spell scripts (the core). Ossirian's yell as Kurinnaxx dies comes from Ossirian only
-- when he is loaded (the C++ said it in his name regardless). Moam's mana empties at every aggro (the C++: the
-- first). Tuubid's soldiers go at the mark while they fight, whoever leads them; Tuubid's Sunder Armor goes at
-- his victim (the C++ aimed it at himself). The trash's own EventAI rules that differ from the C++ are taken
-- away; the Obsidian Destroyer's mana emptying and the Silicate Feeder's death cloud stay, being the C++'s own.

UPDATE `creature_template` SET `ai_name` = 'EventAI' WHERE `entry` = 15320;
UPDATE `creature_template` SET `ai_name` = 'EventAI' WHERE `entry` = 15324;
UPDATE `creature_template` SET `ai_name` = 'EventAI' WHERE `entry` = 15327;
UPDATE `creature_template` SET `ai_name` = 'EventAI' WHERE `entry` = 15333;
UPDATE `creature_template` SET `ai_name` = 'EventAI' WHERE `entry` = 15340;
UPDATE `creature_template` SET `ai_name` = 'EventAI' WHERE `entry` = 15343;
UPDATE `creature_template` SET `ai_name` = 'EventAI' WHERE `entry` = 15344;
UPDATE `creature_template` SET `ai_name` = 'EventAI' WHERE `entry` = 15348;
UPDATE `creature_template` SET `ai_name` = 'EventAI' WHERE `entry` = 15392;

DELETE FROM `conditions` WHERE `condition_entry` IN (509000);
INSERT INTO `conditions`
(`condition_entry`, `type`, `value1`, `value2`, `value3`, `value4`, `flags`)
VALUES
(509000, 34, 8, 1, 1, 0, 0);

DELETE FROM `broadcast_text` WHERE `entry` IN (509101, 509102, 509103);
INSERT INTO `broadcast_text`
(`entry`, `male_text`, `female_text`, `chat_type`, `sound_id`, `language_id`, `emote_id1`, `emote_id2`, `emote_id3`, `emote_delay1`, `emote_delay2`, `emote_delay3`)
VALUES
(509101, '%s senses your fear.', '%s senses your fear.', 2, 0, 0, 0, 0, 0, 0, 0, 0),
(509102, '%s drains your mana and turns to stone.', '%s drains your mana and turns to stone.', 2, 0, 0, 0, 0, 0, 0, 0, 0),
(509103, '%s bristles with energy!', '%s bristles with energy!', 2, 0, 0, 0, 0, 0, 0, 0, 0);

-- Existing rows taken away: the restore puts them back.
DELETE FROM `creature_ai_events` WHERE `id` = 1533802;
DELETE FROM `creature_ai_scripts` WHERE `id` = 1533802;
DELETE FROM `creature_ai_events` WHERE `id` = 1532401;
DELETE FROM `creature_ai_scripts` WHERE `id` = 1532401;
DELETE FROM `creature_ai_events` WHERE `id` = 1532402;
DELETE FROM `creature_ai_scripts` WHERE `id` = 1532402;
DELETE FROM `creature_ai_events` WHERE `id` = 1532403;
DELETE FROM `creature_ai_scripts` WHERE `id` = 1532403;
DELETE FROM `creature_ai_events` WHERE `id` = 1532701;
DELETE FROM `creature_ai_scripts` WHERE `id` = 1532701;
DELETE FROM `creature_ai_events` WHERE `id` = 1532702;
DELETE FROM `creature_ai_scripts` WHERE `id` = 1532702;
DELETE FROM `creature_ai_events` WHERE `id` = 1532703;
DELETE FROM `creature_ai_scripts` WHERE `id` = 1532703;
DELETE FROM `creature_ai_events` WHERE `id` = 1532704;
DELETE FROM `creature_ai_scripts` WHERE `id` = 1532704;
DELETE FROM `creature_ai_events` WHERE `id` = 1538701;
DELETE FROM `creature_ai_scripts` WHERE `id` = 1538701;
DELETE FROM `creature_ai_events` WHERE `id` = 1538703;
DELETE FROM `creature_ai_scripts` WHERE `id` = 1538703;
DELETE FROM `creature_ai_events` WHERE `id` IN (1532001, 1532002, 1532003, 1532411, 1532412, 1532413, 1532414, 1532415, 1532416, 1532417, 1532711, 1533311, 1533312, 1533313, 1533811, 1533812, 1533813, 1533814, 1534001, 1534002, 1534003, 1534004, 1534005, 1534006, 1534011, 1534012, 1534301, 1534302, 1534303, 1534411, 1534801, 1534802, 1534803, 1534804, 1534811, 1534812, 1534813, 1534814, 1538711, 1538712, 1538713, 1538714, 1539201, 1539202, 1539203);
INSERT INTO `creature_ai_events`
(`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`)
VALUES
(1534801, 15348, 0, 11, 0, 100, 0, 0, 0, 0, 0, 1534801, 0, 0, 'Kurinnaxx - spawned: not started (0)'),
(1534802, 15348, 0, 4, 0, 100, 0, 0, 0, 0, 0, 1534802, 0, 0, 'Kurinnaxx - aggro: in progress (0)'),
(1534803, 15348, 0, 6, 0, 100, 0, 0, 0, 0, 0, 1534803, 0, 0, 'Kurinnaxx - dead: done (0), Ossirian heard over the zone'),
(1534804, 15348, 0, 2, 0, 100, 8, 29, 0, 0, 0, 1534804, 0, 0, 'Kurinnaxx - Enrage under 30 %, with its emote'),
(1534811, 15348, 0, 0, 0, 100, 9, 8000, 10000, 8000, 10000, 1534811, 0, 0, 'Kurinnaxx - Mortal Wound'),
(1534812, 15348, 0, 0, 0, 100, 9, 10000, 15000, 12000, 15000, 1534812, 0, 0, 'Kurinnaxx - Wide Slash'),
(1534813, 15348, 0, 0, 0, 100, 9, 1000, 5000, 12000, 17000, 1534813, 0, 0, 'Kurinnaxx - Thrash'),
(1534814, 15348, 0, 0, 0, 100, 1, 7000, 7000, 5100, 7000, 1534814, 0, 0, 'Kurinnaxx - a Sand Trap at a random player, cleared 5 s on'),
(1534001, 15340, 0, 7, 0, 100, 0, 0, 0, 0, 0, 1534001, 0, 0, 'Moam - evading: not started (4)'),
(1534002, 15340, 0, 4, 0, 100, 0, 0, 0, 0, 0, 1534002, 0, 0, 'Moam - aggro: in progress (4), his mana emptied, his emote'),
(1534003, 15340, 0, 6, 0, 100, 0, 0, 0, 0, 0, 1534003, 0, 0, 'Moam - dead: done (4), his spoils'),
(1534004, 15340, 0, 10, 0, 100, 1, 1, 60, 1000, 1000, 1534004, 0, 0, 'Moam - a player within 60 yd: the fight'),
(1534005, 15340, 0, 0, 0, 100, 9, 90000, 90000, 90000, 90000, 1534005, 0, 0, 'Moam - every 90 s: stone, three Mana Fiends, his emote'),
(1534006, 15340, 0, 3, 0, 100, 1, 100, 100, 1000, 1000, 1534006, 0, 0, 'Moam - full of mana: out of the stone, Arcane Eruption, his emote'),
(1534011, 15340, 0, 0, 0, 100, 9, 6000, 6000, 15000, 15000, 1534011, 0, 0, 'Moam - Trample'),
(1534012, 15340, 0, 0, 0, 100, 1, 5000, 5000, 7000, 7000, 1534012, 0, 0, 'Moam - Drain Mana'),
(1533811, 15338, 0, 4, 0, 100, 0, 0, 0, 0, 0, 1533811, 0, 0, 'Obsidian Destroyer - aggro: the zone'),
(1533812, 15338, 0, 3, 0, 100, 1, 100, 100, 1000, 1000, 1533812, 0, 0, 'Obsidian Destroyer - full of mana: Purge'),
(1533813, 15338, 0, 0, 0, 100, 1, 7000, 7000, 7000, 7000, 1533813, 0, 0, 'Obsidian Destroyer - Drain Mana'),
(1533814, 15338, 0, 6, 0, 100, 0, 0, 0, 0, 0, 1533814, 0, 0, 'Obsidian Destroyer - dead: its obsidian left'),
(1532001, 15320, 0, 4, 0, 100, 0, 0, 0, 0, 0, 1532001, 0, 0, 'Hive''Zara Soldier - aggro: the zone'),
(1532002, 15320, 0, 0, 0, 100, 9, 5000, 5000, 5000, 10000, 1532002, 0, 0, 'Hive''Zara Soldier - Venom Spit at a random attacker'),
(1532003, 15320, 0, 2, 0, 100, 8, 19, 0, 0, 0, 1532003, 0, 0, 'Hive''Zara Soldier - Retaliation under 20 %'),
(1533311, 15333, 0, 11, 0, 100, 0, 0, 0, 0, 0, 1533311, 0, 0, 'Silicate Feeder - not hostile until fought'),
(1533312, 15333, 0, 7, 0, 100, 0, 0, 0, 0, 0, 1533312, 0, 0, 'Silicate Feeder - not hostile until fought'),
(1533313, 15333, 0, 4, 0, 100, 0, 0, 0, 0, 0, 1533313, 0, 0, 'Silicate Feeder - fought: hostile, the zone'),
(1534301, 15343, 0, 11, 0, 100, 0, 0, 0, 0, 0, 1534301, 0, 0, 'Qiraji Swarmguard - runs'),
(1534302, 15343, 0, 4, 0, 100, 0, 0, 0, 0, 0, 1534302, 0, 0, 'Qiraji Swarmguard - aggro: the zone'),
(1534303, 15343, 0, 0, 0, 100, 9, 2000, 2000, 8000, 12000, 1534303, 0, 0, 'Qiraji Swarmguard - Sundering Cleave'),
(1532411, 15324, 0, 11, 0, 100, 0, 0, 0, 0, 0, 1532411, 0, 0, 'Qiraji Gladiator - its fallen counted from now (8 = 0)'),
(1532412, 15324, 0, 7, 0, 100, 0, 0, 0, 0, 0, 1532412, 0, 0, 'Qiraji Gladiator - its fallen counted from now (8 = 0)'),
(1532413, 15324, 0, 4, 0, 100, 0, 0, 0, 0, 0, 1532413, 0, 0, 'Qiraji Gladiator - its fallen counted from now (8 = 0)'),
(1532414, 15324, 0, 6, 0, 100, 0, 0, 0, 0, 0, 1532414, 0, 0, 'Qiraji Gladiator - dead: one more fallen (8)'),
(1532415, 15324, 509000, 0, 0, 100, 8, 1000, 1000, 1000, 1000, 1532415, 0, 0, 'Qiraji Gladiator - another gladiator fallen: Vengeance, once'),
(1532416, 15324, 0, 0, 0, 100, 9, 4000, 4000, 4000, 6000, 1532416, 0, 0, 'Qiraji Gladiator - Trample'),
(1532417, 15324, 0, 0, 0, 100, 9, 9000, 9000, 10000, 15000, 1532417, 0, 0, 'Qiraji Gladiator - Uppercut'),
(1532711, 15327, 0, 0, 0, 100, 9, 3000, 3000, 5000, 5000, 1532711, 0, 0, 'Hive''Zara Stinger - Charge at a random attacker'),
(1539201, 15392, 0, 0, 0, 100, 1, 5000, 5000, 9000, 9000, 1539201, 0, 0, 'Captain Tuubid - marks a random player, his soldiers at the mark'),
(1539202, 15392, 0, 0, 0, 100, 9, 10000, 10000, 10000, 10000, 1539202, 0, 0, 'Captain Tuubid - Cleave'),
(1539203, 15392, 0, 0, 0, 100, 9, 15000, 15000, 15000, 15000, 1539203, 0, 0, 'Captain Tuubid - Sunder Armor'),
(1538711, 15387, 0, 4, 0, 100, 0, 0, 0, 0, 0, 1538711, 0, 0, 'Qiraji Warrior - aggro: the zone'),
(1538712, 15387, 0, 2, 0, 100, 8, 20, 0, 0, 0, 1538712, 0, 0, 'Qiraji Warrior - Enrage under 20 %'),
(1538713, 15387, 0, 0, 0, 100, 9, 6000, 12000, 6000, 6000, 1538713, 0, 0, 'Qiraji Warrior - Thunderclap'),
(1538714, 15387, 0, 0, 0, 100, 9, 10000, 15000, 10000, 10000, 1538714, 0, 0, 'Qiraji Warrior - Uppercut'),
(1534411, 15344, 0, 0, 0, 100, 9, 4000, 16000, 4000, 16000, 1534411, 0, 0, 'Swarmguard Needler - Cleave');

DELETE FROM `creature_ai_scripts` WHERE `id` IN (1532001, 1532002, 1532003, 1532411, 1532412, 1532413, 1532414, 1532415, 1532416, 1532417, 1532711, 1533311, 1533312, 1533313, 1533811, 1533812, 1533813, 1533814, 1534001, 1534002, 1534003, 1534004, 1534005, 1534006, 1534011, 1534012, 1534301, 1534302, 1534303, 1534411, 1534801, 1534802, 1534803, 1534804, 1534811, 1534812, 1534813, 1534814, 1538711, 1538712, 1538713, 1538714, 1539201, 1539202, 1539203);
INSERT INTO `creature_ai_scripts`
(`id`, `delay`, `priority`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`)
VALUES
(1534801, 0, 0, 37, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Kurinnaxx - not started'),
(1534802, 0, 0, 49, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Kurinnaxx - the zone into the fight'),
(1534802, 0, 1, 37, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Kurinnaxx - in progress'),
(1534803, 0, 0, 0, 6, 0, 0, 0, 90893, 0, 9, 2, 11720, 0, 0, 0, 0, 0, 0, 0, 0, 'Ossirian the Unscarred - "The walls have been breached!"'),
(1534803, 0, 1, 37, 0, 3, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Kurinnaxx - done'),
(1534804, 0, 0, 15, 8269, 0, 0, 0, 0, 0, 0, 12, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Kurinnaxx - Enrage'),
(1534804, 0, 1, 0, 2, 0, 0, 0, 0, 0, 0, 0, 10645, 0, 0, 0, 0, 0, 0, 0, 0, 'Kurinnaxx - his enrage emote'),
(1534811, 0, 0, 15, 25646, 0, 0, 0, 0, 0, 1, 8, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Kurinnaxx - Mortal Wound'),
(1534812, 0, 0, 15, 25814, 0, 0, 0, 0, 0, 1, 8, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Kurinnaxx - Wide Slash'),
(1534813, 0, 0, 15, 3391, 0, 0, 0, 0, 0, 0, 12, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Kurinnaxx - Thrash'),
(1534814, 0, 0, 76, 180647, 10, 1, 0, 2, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Kurinnaxx - a sand trap at the player'),
(1534814, 0, 1, 39, 5090001, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0, 0, 0, 0, 0, 0, 0, 'Kurinnaxx - the trap cleared later'),
(1534001, 0, 0, 37, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Moam - not started'),
(1534002, 0, 0, 49, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Moam - the zone into the fight'),
(1534002, 0, 1, 2, 23, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Moam - mana emptied'),
(1534002, 0, 2, 0, 2, 0, 0, 0, 0, 0, 0, 0, 509101, 0, 0, 0, 0, 0, 0, 0, 0, 'Moam - his aggro emote'),
(1534002, 0, 3, 37, 4, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Moam - in progress'),
(1534003, 0, 0, 76, 181069, 345600, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Moam - his spoils'),
(1534003, 0, 1, 37, 4, 3, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Moam - done'),
(1534004, 0, 0, 49, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Moam - the zone into the fight'),
(1534005, 0, 0, 15, 25685, 0, 0, 0, 0, 0, 0, 12, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Moam - Energize (stone)'),
(1534005, 0, 1, 10, 15527, 10000, 0, 0, 0, 0, 0, 0, 262144, 0, 1, 4, 2, 0, 0, 0, 0, 'Moam - a Mana Fiend (1 of 3)'),
(1534005, 0, 2, 10, 15527, 10000, 0, 0, 0, 0, 0, 0, 262144, 0, 1, 4, 2, 0, 0, 0, 0, 'Moam - a Mana Fiend (2 of 3)'),
(1534005, 0, 3, 10, 15527, 10000, 0, 0, 0, 0, 0, 0, 262144, 0, 1, 4, 2, 0, 0, 0, 0, 'Moam - a Mana Fiend (3 of 3)'),
(1534005, 0, 4, 0, 2, 0, 0, 0, 0, 0, 0, 0, 509102, 0, 0, 0, 0, 0, 0, 0, 0, 'Moam - his stone emote'),
(1534006, 0, 0, 14, 25685, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Moam - out of the stone'),
(1534006, 0, 1, 15, 25672, 2, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Moam - Arcane Eruption'),
(1534006, 0, 2, 0, 2, 0, 0, 0, 0, 0, 0, 0, 509103, 0, 0, 0, 0, 0, 0, 0, 0, 'Moam - his eruption emote'),
(1534011, 0, 0, 15, 15550, 0, 0, 0, 0, 0, 0, 12, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Moam - Trample'),
(1534012, 0, 0, 15, 25676, 0, 0, 0, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Moam - Drain Mana'),
(1533811, 0, 0, 49, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Obsidian Destroyer - the zone into the fight'),
(1533812, 0, 0, 15, 25756, 2, 0, 0, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Obsidian Destroyer - Purge'),
(1533813, 0, 0, 15, 25754, 0, 0, 0, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Obsidian Destroyer - Drain Mana'),
(1533814, 0, 0, 76, 181068, 345600, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Obsidian Destroyer - its obsidian'),
(1532001, 0, 0, 49, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Hive''Zara Soldier - the zone into the fight'),
(1532002, 0, 0, 15, 25497, 0, 0, 0, 0, 0, 4, 8, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Hive''Zara Soldier - Venom Spit at a random attacker'),
(1532003, 0, 0, 15, 22857, 0, 0, 0, 0, 0, 0, 12, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Hive''Zara Soldier - Retaliation'),
(1533311, 0, 0, 22, 7, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Silicate Feeder - faction 7'),
(1533312, 0, 0, 22, 7, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Silicate Feeder - faction 7'),
(1533313, 0, 0, 22, 14, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Silicate Feeder - hostile'),
(1533313, 0, 1, 49, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Silicate Feeder - the zone into the fight'),
(1534301, 0, 0, 25, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Qiraji Swarmguard - runs'),
(1534302, 0, 0, 49, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Qiraji Swarmguard - the zone into the fight'),
(1534303, 0, 0, 15, 25174, 0, 0, 0, 0, 0, 1, 8, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Qiraji Swarmguard - Sundering Cleave'),
(1532411, 0, 0, 37, 8, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Qiraji Gladiator - the count reset'),
(1532412, 0, 0, 37, 8, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Qiraji Gladiator - the count reset'),
(1532413, 0, 0, 37, 8, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Qiraji Gladiator - the count reset'),
(1532414, 0, 0, 37, 8, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Qiraji Gladiator - one more'),
(1532415, 0, 0, 15, 25164, 0, 0, 0, 0, 0, 0, 12, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Qiraji Gladiator - Vengeance'),
(1532416, 0, 0, 15, 5568, 0, 0, 0, 0, 0, 0, 12, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Qiraji Gladiator - Trample'),
(1532417, 0, 0, 15, 10966, 0, 0, 0, 0, 0, 1, 8, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Qiraji Gladiator - Uppercut'),
(1532711, 0, 0, 15, 25190, 0, 0, 0, 0, 0, 4, 8, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Hive''Zara Stinger - Charge at a random attacker'),
(1539201, 0, 0, 39, 5090003, 0, 0, 0, 2, 0, 4, 0, 100, 0, 0, 0, 0, 0, 0, 0, 0, 'Captain Tuubid - a random player marked'),
(1539202, 0, 0, 15, 26350, 0, 0, 0, 0, 0, 1, 8, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Captain Tuubid - Cleave'),
(1539203, 0, 0, 15, 24317, 0, 0, 0, 0, 0, 1, 8, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Captain Tuubid - Sunder Armor'),
(1538711, 0, 0, 49, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Qiraji Warrior - the zone into the fight'),
(1538712, 0, 0, 15, 8599, 0, 0, 0, 0, 0, 0, 12, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Qiraji Warrior - Enrage'),
(1538713, 0, 0, 15, 15588, 0, 0, 0, 0, 0, 0, 12, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Qiraji Warrior - Thunderclap'),
(1538714, 0, 0, 15, 10966, 0, 0, 0, 0, 0, 1, 8, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Qiraji Warrior - Uppercut'),
(1534411, 0, 0, 15, 20684, 0, 0, 0, 0, 0, 1, 8, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Swarmguard Needler - Cleave');

DELETE FROM `generic_scripts` WHERE `id` IN (5090001, 5090002, 5090003);
INSERT INTO `generic_scripts`
(`id`, `delay`, `priority`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`)
VALUES
(5090001, 5, 0, 81, 0, 0, 0, 0, 180647, 100, 11, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Kurinnaxx - the sand trap cleared'),
(5090002, 0, 0, 26, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Tuubid''s soldier - at the marked player'),
(5090003, 0, 0, 15, 25471, 0, 0, 0, 0, 0, 0, 8, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Captain Tuubid - Attack Order at the marked player'),
(5090003, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 11009, 0, 0, 0, 0, 0, 0, 0, 0, 'Captain Tuubid - "Kill $n!"'),
(5090003, 0, 2, 68, 5090002, 2, 15387, 100, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Captain Tuubid - his warriors at the mark'),
(5090003, 0, 3, 68, 5090002, 2, 15344, 100, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Captain Tuubid - his needlers at the mark');

