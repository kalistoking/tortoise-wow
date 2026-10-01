-- Gilneas City (map 815), instance_gilneas_city, Celia and Lord Mortimer, the Greymanes: its C++ as rows -- EPIC10 tier 2.
-- Written by the trt repo's scripts/tier2/a10_gilneas_city.py from t1_world; gilneas_city_restore.sql puts
-- back what this replaces. R8: a person applies it, into the world database.
--
-- The C++ keeps its script names: mod-gilneas-city is the switch (AM1, handoff/manager-091).
-- Loaded, the C++ runs as before -- a script found by name comes first. Unloaded
-- (`module unload mod-gilneas-city`, which gives every creature standing a new AI at once),
-- the names find no script and the creatures run these rows (their ai_name).
--
-- Map 815 keeps instance_gilneas_city: with mod-gilneas-city unloaded a map made then gets the generic
-- store (AC7), and its rain for a player entering (AC9) runs only on such a map (condition 63 reversed);
-- so do the instance's yells, rules of their creatures -- Holtz and Blackowl run EventAI either way.
-- The rain is SET_WEATHER (96), the core's own (A10): grade 2.0 as the C++'s, held.
-- The instance put each creature entering combat into combat with the zone only when it was not in
-- combat -- never, as the hook runs once it is: no row. The chest's respawn keeps the C++'s time,
-- HOUR * IN_MILLISECONDS given as seconds; the chest stands from the start, so as in the C++ it
-- matters only once looted. The knight's Hammer of Justice goes at his victim (the C++ the player
-- highest on his threat list: a pet tanking him is stunned instead).
-- The 90 % says of the knight and the noble (899708, 899712, script 899706) and Genn's empty 50 % rule
-- (899705) were dead under the C++ and go: their creatures run EventAI now. The restore puts them back.
-- Needs the core of trt/module-structure with SET_WEATHER (a18c292a) and the SQL of AC7 and AC9.

UPDATE `creature_template` SET `ai_name` = 'EventAI' WHERE `entry` = 61263;
UPDATE `creature_template` SET `ai_name` = 'EventAI' WHERE `entry` = 61264;
UPDATE `creature_template` SET `ai_name` = 'EventAI' WHERE `entry` = 61365;
UPDATE `creature_template` SET `ai_name` = 'EventAI' WHERE `entry` = 61390;
UPDATE `creature_template` SET `ai_name` = 'EventAI' WHERE `entry` = 61418;
UPDATE `creature_template` SET `ai_name` = 'EventAI' WHERE `entry` = 61419;
UPDATE `creature_template` SET `ai_name` = 'EventAI' WHERE `entry` = 61421;
UPDATE `creature_template` SET `ai_name` = 'EventAI' WHERE `entry` = 61422;
UPDATE `creature_template` SET `ai_name` = 'EventAI' WHERE `entry` = 61423;

-- Conditions another tier-2 migration writes too, under the same entry: whichever comes first.
INSERT IGNORE INTO `conditions`
(`condition_entry`, `type`, `value1`, `value2`, `value3`, `value4`, `flags`)
VALUES
(43001, 63, 0, 0, 0, 0, 1);

DELETE FROM `broadcast_text` WHERE `entry` IN (815001, 815002, 815003, 815004, 815005, 815006, 815007, 815008, 815009, 815010, 815011, 815012);
INSERT INTO `broadcast_text`
(`entry`, `male_text`, `female_text`, `chat_type`, `sound_id`, `language_id`, `emote_id1`, `emote_id2`, `emote_id3`, `emote_delay1`, `emote_delay2`, `emote_delay3`)
VALUES
(815001, 'This district is currently on lockdown!', 'This district is currently on lockdown!', 1, 60384, 0, 0, 0, 0, 0, 0, 0),
(815002, 'Foolish interloper, you do not belong here...', 'Foolish interloper, you do not belong here...', 1, 60385, 0, 0, 0, 0, 0, 0, 0),
(815003, 'Order must be maintained!', 'Order must be maintained!', 1, 60382, 0, 0, 0, 0, 0, 0, 0),
(815004, 'I will not let Gilneas fall to madness, not while I...', 'I will not let Gilneas fall to madness, not while I...', 1, 60383, 0, 0, 0, 0, 0, 0, 0),
(815005, 'I hunt from the shadows, these streets have been cleared by my hand!', 'I hunt from the shadows, these streets have been cleared by my hand!', 1, 60391, 0, 0, 0, 0, 0, 0, 0),
(815006, 'This was not meant to be...', 'This was not meant to be...', 1, 60392, 0, 0, 0, 0, 0, 0, 0),
(815007, 'I have served as Marshal throughout all of the orcish incursions. You will not put an end to Gilneas.', 'I have served as Marshal throughout all of the orcish incursions. You will not put an end to Gilneas.', 1, 60386, 0, 0, 0, 0, 0, 0, 0),
(815008, 'The brave defenders of this city... will not let you put it to ruin, outsider!', 'The brave defenders of this city... will not let you put it to ruin, outsider!', 1, 60387, 0, 0, 0, 0, 0, 0, 0),
(815009, 'My family has held power in Gilneas for countless generations. You will not change fate.', 'My family has held power in Gilneas for countless generations. You will not change fate.', 1, 60388, 0, 0, 0, 0, 0, 0, 0),
(815010, 'It... it was pointless after all... This cannot be the way I fall...', 'It... it was pointless after all... This cannot be the way I fall...', 1, 60390, 0, 0, 0, 0, 0, 0, 0),
(815011, 'Mortimer, it would appear we have someone here to interrupt our plans!', 'Mortimer, it would appear we have someone here to interrupt our plans!', 1, 60400, 0, 0, 0, 0, 0, 0, 0),
(815012, 'All of our progress, our influence... What a pointless end...', 'All of our progress, our influence... What a pointless end...', 1, 60399, 0, 0, 0, 0, 0, 0, 0);

-- Existing rows taken away: the restore puts them back.
DELETE FROM `creature_ai_events` WHERE `id` = 899712 AND `creature_id` = 61390;
DELETE FROM `creature_ai_events` WHERE `id` = 899708 AND `creature_id` = 61365;
DELETE FROM `creature_ai_events` WHERE `id` = 899705 AND `creature_id` = 61418;
DELETE FROM `creature_ai_events` WHERE `id` IN (6126301, 6126302, 6126303, 6126304, 6126305, 6126306, 6126307, 6126308, 6126309, 6126310, 6126401, 6126402, 6126403, 6126404, 6126405, 6126406, 6126407, 6126408, 6126409, 6136501, 6136502, 6139001, 6139002, 6141801, 6141802, 6141803, 6141804, 6141805, 6141806, 6141901, 6141902, 6142101, 6142102, 6142201, 6142202, 6142301, 6142302);
INSERT INTO `creature_ai_events`
(`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`)
VALUES
(6141901, 61419, 43001, 4, 0, 100, 0, 0, 0, 0, 0, 6141901, 0, 0, 'Matthias Holtz - aggro: the instance''s yell'),
(6141902, 61419, 43001, 6, 0, 100, 0, 0, 0, 0, 0, 6141902, 0, 0, 'Matthias Holtz - death: the instance''s yell'),
(6142101, 61421, 43001, 4, 0, 100, 0, 0, 0, 0, 0, 6142101, 0, 0, 'Judge Sutherland - aggro: the instance''s yell'),
(6142102, 61421, 43001, 6, 0, 100, 0, 0, 0, 0, 0, 6142102, 0, 0, 'Judge Sutherland - death: the instance''s yell'),
(6142201, 61422, 43001, 4, 0, 100, 0, 0, 0, 0, 0, 6142201, 0, 0, 'Dustivan Blackcowl - aggro: the instance''s yell'),
(6142202, 61422, 43001, 6, 0, 100, 0, 0, 0, 0, 0, 6142202, 0, 0, 'Dustivan Blackcowl - death: the instance''s yell'),
(6142301, 61423, 43001, 4, 0, 100, 0, 0, 0, 0, 0, 6142301, 0, 0, 'Marshal Magnus Greystone - aggro: the instance''s yell'),
(6142302, 61423, 43001, 6, 0, 100, 0, 0, 0, 0, 0, 6142302, 0, 0, 'Marshal Magnus Greystone - death: the instance''s yell'),
(6141801, 61418, 43001, 4, 0, 100, 0, 0, 0, 0, 0, 6141801, 0, 0, 'Genn Greymane - aggro: the instance''s yell'),
(6141802, 61418, 43001, 6, 0, 100, 0, 0, 0, 0, 0, 6141802, 0, 0, 'Genn Greymane - death: the instance''s yell'),
(6126301, 61263, 43001, 4, 0, 100, 0, 0, 0, 0, 0, 6126301, 0, 0, 'Celia Harlow - aggro: the instance''s yell'),
(6126302, 61263, 43001, 6, 0, 100, 0, 0, 0, 0, 0, 6126302, 0, 0, 'Celia Harlow - death: the instance''s yell'),
(6141803, 61418, 0, 0, 0, 100, 9, 4000, 4000, 20000, 25000, 6141803, 0, 0, 'Genn Greymane - Drain Life at his victim'),
(6141804, 61418, 0, 0, 0, 100, 9, 2000, 2000, 17000, 20000, 6141804, 0, 0, 'Genn Greymane - Mortal Strike at his victim'),
(6141805, 61418, 0, 0, 0, 100, 9, 1000, 1000, 10000, 15000, 6141805, 0, 0, 'Genn Greymane - Curse of Agony at a random player'),
(6141806, 61418, 0, 2, 0, 100, 0, 49, 0, 0, 0, 6141806, 0, 0, 'Genn Greymane - under 50 %: his line, Fear at a random player, once'),
(6136501, 61365, 0, 0, 0, 100, 9, 1000, 1000, 10000, 10000, 6136501, 0, 0, 'Greymane Knight - Strike at his victim'),
(6136502, 61365, 0, 0, 0, 100, 9, 12000, 20000, 12000, 20000, 6136502, 0, 0, 'Greymane Knight - Hammer of Justice at his victim'),
(6139001, 61390, 0, 0, 0, 100, 9, 2000, 2000, 9000, 9000, 6139001, 0, 0, 'Greymane Noble - Mind Blast at his victim'),
(6139002, 61390, 0, 0, 0, 100, 9, 10000, 18000, 10000, 18000, 6139002, 0, 0, 'Greymane Noble - Mind Flay at a random player'),
(6126303, 61263, 0, 11, 0, 100, 0, 0, 0, 0, 0, 6126303, 0, 0, 'Celia Harlow - spawned: the native shape again'),
(6126304, 61263, 0, 7, 0, 100, 0, 0, 0, 0, 0, 6126304, 0, 0, 'Celia Harlow - evading: the native shape again'),
(6126305, 61263, 0, 2, 2, 100, 1, 49, 0, 1000, 1000, 6126305, 0, 0, 'Celia Harlow - under 50 %: the dragonkin shape, phase 1'),
(6126306, 61263, 0, 2, 1, 100, 1, 100, 50, 1000, 1000, 6126306, 0, 0, 'Celia Harlow - over 50 % again: phase 0, the shape kept'),
(6126307, 61263, 0, 0, 2, 100, 9, 8000, 8000, 8000, 8000, 6126307, 0, 0, 'Celia Harlow - Immolate at a random attacker (over 50 %)'),
(6126308, 61263, 0, 0, 2, 100, 9, 11000, 11000, 11000, 11000, 6126308, 0, 0, 'Celia Harlow - Shadow Word: Pain at a random attacker (over 50 %)'),
(6126309, 61263, 0, 0, 2, 100, 9, 6000, 6000, 6000, 6000, 6126309, 0, 0, 'Celia Harlow - Corruption at a random attacker (over 50 %)'),
(6126310, 61263, 0, 0, 1, 100, 9, 25000, 25000, 25000, 25000, 6126310, 0, 0, 'Celia Harlow - Blast Wave at a random attacker (under 50 %)'),
(6126401, 61264, 0, 11, 0, 100, 0, 0, 0, 0, 0, 6126401, 0, 0, 'Lord Mortimer Harlow - spawned: the native shape again'),
(6126402, 61264, 0, 7, 0, 100, 0, 0, 0, 0, 0, 6126402, 0, 0, 'Lord Mortimer Harlow - evading: the native shape again'),
(6126403, 61264, 0, 2, 2, 100, 1, 49, 0, 1000, 1000, 6126403, 0, 0, 'Lord Mortimer Harlow - under 50 %: the dragonkin shape, phase 1'),
(6126404, 61264, 0, 2, 1, 100, 1, 100, 50, 1000, 1000, 6126404, 0, 0, 'Lord Mortimer Harlow - over 50 % again: phase 0, the shape kept'),
(6126405, 61264, 0, 0, 2, 100, 9, 9000, 9000, 9000, 9000, 6126405, 0, 0, 'Lord Mortimer Harlow - Holy Strike at a random attacker (over 50 %)'),
(6126406, 61264, 0, 0, 2, 100, 9, 12000, 12000, 12000, 12000, 6126406, 0, 0, 'Lord Mortimer Harlow - Consecration at a random attacker (over 50 %)'),
(6126407, 61264, 0, 0, 1, 100, 9, 25000, 25000, 25000, 25000, 6126407, 0, 0, 'Lord Mortimer Harlow - Blast Wave at a random attacker (under 50 %)'),
(6126408, 61264, 0, 4, 0, 100, 0, 0, 0, 0, 0, 6126408, 0, 0, 'Lord Mortimer Harlow - aggro: his yell'),
(6126409, 61264, 0, 6, 0, 100, 0, 0, 0, 0, 0, 6126409, 0, 0, 'Lord Mortimer Harlow - death: his yell');

DELETE FROM `creature_ai_scripts` WHERE `id` IN (6126301, 6126302, 6126303, 6126304, 6126305, 6126306, 6126307, 6126308, 6126309, 6126310, 6126401, 6126402, 6126403, 6126404, 6126405, 6126406, 6126407, 6126408, 6126409, 6136501, 6136502, 6139001, 6139002, 6141801, 6141802, 6141803, 6141804, 6141805, 6141806, 6141901, 6141902, 6142101, 6142102, 6142201, 6142202, 6142301, 6142302);
INSERT INTO `creature_ai_scripts`
(`id`, `delay`, `priority`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`)
VALUES
(6141901, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 815001, 0, 0, 0, 0, 0, 0, 0, 0, 'Matthias Holtz - yells "This district is currently on lockdown!"'),
(6141902, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 815002, 0, 0, 0, 0, 0, 0, 0, 0, 'Matthias Holtz - yells "Foolish interloper, you do not belong here..."'),
(6142101, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 815003, 0, 0, 0, 0, 0, 0, 0, 0, 'Judge Sutherland - yells "Order must be maintained!"'),
(6142102, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 815004, 0, 0, 0, 0, 0, 0, 0, 0, 'Judge Sutherland - yells "I will not let Gilneas fall to madness, not while I..."'),
(6142201, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 815005, 0, 0, 0, 0, 0, 0, 0, 0, 'Dustivan Blackcowl - yells "I hunt from the shadows, these streets have been cleared by "'),
(6142202, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 815006, 0, 0, 0, 0, 0, 0, 0, 0, 'Dustivan Blackcowl - yells "This was not meant to be..."'),
(6142301, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 815007, 0, 0, 0, 0, 0, 0, 0, 0, 'Marshal Magnus Greystone - yells "I have served as Marshal throughout all of the orcish incurs"'),
(6142302, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 815008, 0, 0, 0, 0, 0, 0, 0, 0, 'Marshal Magnus Greystone - yells "The brave defenders of this city... will not let you put it "'),
(6141801, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 815009, 0, 0, 0, 0, 0, 0, 0, 0, 'Genn Greymane - yells "My family has held power in Gilneas for countless generation"'),
(6141802, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 815010, 0, 0, 0, 0, 0, 0, 0, 0, 'Genn Greymane - yells "It... it was pointless after all... This cannot be the way I"'),
(6126301, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 815011, 0, 0, 0, 0, 0, 0, 0, 0, 'Celia Harlow - yells "Mortimer, it would appear we have someone here to interrupt "'),
(6126302, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 815012, 0, 0, 0, 0, 0, 0, 0, 0, 'Celia Harlow - yells "All of our progress, our influence... What a pointless end.."'),
(6126302, 0, 1, 9, 5015837, 3600000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Celia Harlow - the Harlow Family Chest respawned (unless it stands)'),
(6141803, 0, 0, 15, 17620, 4, 0, 0, 0, 0, 1, 8, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Genn Greymane - Drain Life'),
(6141804, 0, 0, 15, 21551, 4, 0, 0, 0, 0, 1, 8, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Genn Greymane - Mortal Strike'),
(6141805, 0, 0, 15, 11711, 4, 0, 0, 2, 0, 4, 8, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Genn Greymane - Curse of Agony'),
(6141806, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 81055, 0, 0, 0, 0, 0, 0, 0, 0, 'Genn Greymane - says "Our nation stands strong!..." (broadcast text 81055)'),
(6141806, 0, 1, 15, 22678, 0, 0, 0, 2, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Genn Greymane - Fear'),
(6136501, 0, 0, 15, 18368, 4, 0, 0, 0, 0, 1, 8, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Greymane Knight - Strike'),
(6136502, 0, 0, 15, 853, 0, 0, 0, 0, 0, 1, 8, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Greymane Knight - Hammer of Justice'),
(6139001, 0, 0, 15, 10945, 4, 0, 0, 0, 0, 1, 8, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Greymane Noble - Mind Blast'),
(6139002, 0, 0, 15, 17312, 0, 0, 0, 2, 0, 4, 8, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Greymane Noble - Mind Flay'),
(6126303, 0, 0, 23, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Celia Harlow - the native shape'),
(6126304, 0, 0, 23, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Celia Harlow - the native shape'),
(6126305, 0, 0, 23, 8249, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Celia Harlow - dragonkin (display 8249)'),
(6126305, 0, 1, 44, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Celia Harlow - phase 1: Blast Wave'),
(6126306, 0, 0, 44, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Celia Harlow - phase 0'),
(6126307, 0, 0, 15, 25309, 0, 0, 0, 0, 0, 4, 8, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Celia Harlow - Immolate'),
(6126308, 0, 0, 15, 2767, 0, 0, 0, 0, 0, 4, 8, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Celia Harlow - Shadow Word: Pain'),
(6126309, 0, 0, 15, 11671, 0, 0, 0, 0, 0, 4, 8, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Celia Harlow - Corruption'),
(6126310, 0, 0, 15, 13021, 0, 0, 0, 0, 0, 4, 8, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Celia Harlow - Blast Wave'),
(6126401, 0, 0, 23, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Lord Mortimer Harlow - the native shape'),
(6126402, 0, 0, 23, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Lord Mortimer Harlow - the native shape'),
(6126403, 0, 0, 23, 143, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Lord Mortimer Harlow - dragonkin (display 143)'),
(6126403, 0, 1, 44, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Lord Mortimer Harlow - phase 1: Blast Wave'),
(6126404, 0, 0, 44, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Lord Mortimer Harlow - phase 0'),
(6126405, 0, 0, 15, 2495, 0, 0, 0, 0, 0, 4, 8, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Lord Mortimer Harlow - Holy Strike'),
(6126406, 0, 0, 15, 20924, 0, 0, 0, 0, 0, 4, 8, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Lord Mortimer Harlow - Consecration'),
(6126407, 0, 0, 15, 13021, 0, 0, 0, 0, 0, 4, 8, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Lord Mortimer Harlow - Blast Wave'),
(6126408, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 30138, 0, 0, 0, 0, 0, 0, 0, 0, 'Lord Mortimer Harlow - yells "You will not take what is mine!" (broadcast text 30138)'),
(6126409, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 30139, 0, 0, 0, 0, 0, 0, 0, 0, 'Lord Mortimer Harlow - yells "Father..." (broadcast text 30139)');

DELETE FROM `generic_scripts` WHERE `id` IN (815001);
INSERT INTO `generic_scripts`
(`id`, `delay`, `priority`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`)
VALUES
(815001, 0, 0, 96, 1, 200, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Gilneas City - rain on the zone of the player entering, held');

DELETE FROM `map_player_script` WHERE `map_id` = 815 AND `event` = 0 AND `script_id` = 815001;
INSERT INTO `map_player_script`
(`map_id`, `event`, `script_id`, `condition_id`, `flags`, `comment`)
VALUES
(815, 0, 815001, 43001, 0, 'Gilneas City: rain on the zone of the player entering');

