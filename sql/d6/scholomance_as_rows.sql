-- Scholomance (map 289), Gandling and his rooms, six bosses and the corpses: its C++ as rows -- EPIC10 tier 2.
-- Written by the trt repo's scripts/tier2/a23_scholomance.py from t1_world; scholomance_restore.sql puts
-- back what this replaces. R8: a person applies it, into the world database.
--
-- The C++ keeps its script names: mod-scholomance is the switch (AM1, handoff/manager-091).
-- Loaded, the C++ runs as before -- a script found by name comes first. Unloaded
-- (`module unload mod-scholomance`, which gives every creature standing a new AI at once),
-- the names find no script and the creatures run these rows (their ai_name).
--
-- Map 289 keeps instance_scholomance (with the brazier, the Viewing Room door and Lord Blackwood), Jandice
-- Barov, Vectus and the students (the core). Gandling's Risen Guards go at the player through the summon's
-- attack (the C++ also gave them 100000 threat on the player); a portal whose player is gone is skipped (the
-- C++ stopped teleporting for good). Malicia's three Flash Heals come every 40 s (the C++: 5 s, 5 s, 30 s).
-- The Reanimated Corpse lies dead at 1 hp (the C++: at a lethal blow it was spared), once until it evades.
-- The Spectral Projection's own 6 s despawn (1126301), dead under the C++, is taken away.

UPDATE `creature_template` SET `ai_name` = 'EventAI' WHERE `entry` = 1853;
UPDATE `creature_template` SET `ai_name` = 'EventAI' WHERE `entry` = 10480;
UPDATE `creature_template` SET `ai_name` = 'EventAI' WHERE `entry` = 10481;
UPDATE `creature_template` SET `ai_name` = 'EventAI' WHERE `entry` = 10502;
UPDATE `creature_template` SET `ai_name` = 'EventAI' WHERE `entry` = 10504;
UPDATE `creature_template` SET `ai_name` = 'EventAI' WHERE `entry` = 10505;
UPDATE `creature_template` SET `ai_name` = 'EventAI' WHERE `entry` = 10507;
UPDATE `creature_template` SET `ai_name` = 'EventAI' WHERE `entry` = 10508;
UPDATE `creature_template` SET `ai_name` = 'EventAI' WHERE `entry` = 10901;
UPDATE `creature_template` SET `ai_name` = 'EventAI' WHERE `entry` = 11261;
UPDATE `creature_template` SET `ai_name` = 'EventAI' WHERE `entry` = 11263;

DELETE FROM `conditions` WHERE `condition_entry` IN (289000);
INSERT INTO `conditions`
(`condition_entry`, `type`, `value1`, `value2`, `value3`, `value4`, `flags`)
VALUES
(289000, 41, 4, 1, 0, 0, 2);

DELETE FROM `broadcast_text` WHERE `entry` IN (289101);
INSERT INTO `broadcast_text`
(`entry`, `male_text`, `female_text`, `chat_type`, `sound_id`, `language_id`, `emote_id1`, `emote_id2`, `emote_id3`, `emote_delay1`, `emote_delay2`, `emote_delay3`)
VALUES
(289101, 'Class...dismissed.', 'Class...dismissed.', 1, 0, 0, 0, 0, 0, 0, 0, 0);

-- Existing rows taken away: the restore puts them back.
DELETE FROM `creature_ai_events` WHERE `id` = 1126301;
DELETE FROM `creature_ai_scripts` WHERE `id` = 1126301;
DELETE FROM `creature_ai_events` WHERE `id` IN (185301, 185302, 185303, 185321, 185322, 185323, 185324, 1048001, 1048002, 1048101, 1048102, 1048103, 1050201, 1050202, 1050203, 1050204, 1050220, 1050401, 1050402, 1050420, 1050501, 1050502, 1050503, 1050504, 1050511, 1050520, 1050701, 1050702, 1050703, 1050704, 1050720, 1050801, 1050802, 1050803, 1050804, 1050805, 1050806, 1050811, 1050812, 1090101, 1090102, 1090103, 1090111, 1090120, 1126101, 1126111, 1126112, 1126120, 1126311);
INSERT INTO `creature_ai_events`
(`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`)
VALUES
(1126101, 11261, 0, 0, 0, 100, 1, 8000, 8000, 10000, 10000, 1126101, 0, 0, 'Doctor Theolen Krastinov - Rend'),
(1126120, 11261, 0, 6, 0, 100, 0, 0, 0, 0, 0, 1126120, 0, 0, 'Doctor Theolen Krastinov - dead: done (1)'),
(1050201, 10502, 0, 0, 0, 100, 1, 18000, 18000, 30000, 30000, 1050201, 0, 0, 'Lady Illucia Barov - Curse of Agony'),
(1050202, 10502, 0, 0, 0, 100, 1, 9000, 9000, 12000, 12000, 1050202, 0, 0, 'Lady Illucia Barov - Shadow Shock'),
(1050203, 10502, 0, 0, 0, 100, 1, 5000, 5000, 14000, 14000, 1050203, 0, 0, 'Lady Illucia Barov - Silence'),
(1050204, 10502, 0, 0, 0, 100, 1, 30000, 30000, 30000, 30000, 1050204, 0, 0, 'Lady Illucia Barov - Fear'),
(1050220, 10502, 0, 6, 0, 100, 0, 0, 0, 0, 0, 1050220, 0, 0, 'Lady Illucia Barov - dead: done (3)'),
(1050501, 10505, 0, 0, 0, 100, 1, 4000, 4000, 65000, 65000, 1050501, 0, 0, 'Instructor Malicia - Call of the Grave'),
(1050502, 10505, 0, 0, 0, 100, 1, 8000, 8000, 24000, 24000, 1050502, 0, 0, 'Instructor Malicia - Corruption'),
(1050503, 10505, 0, 0, 0, 100, 1, 15000, 15000, 10000, 10000, 1050503, 0, 0, 'Instructor Malicia - Renew'),
(1050504, 10505, 0, 0, 0, 100, 1, 25000, 25000, 30000, 30000, 1050504, 0, 0, 'Instructor Malicia - Healing Touch'),
(1050520, 10505, 0, 6, 0, 100, 0, 0, 0, 0, 0, 1050520, 0, 0, 'Instructor Malicia - dead: done (2)'),
(1050401, 10504, 0, 0, 0, 100, 1, 7000, 7000, 12000, 12000, 1050401, 0, 0, 'Lord Alexei Barov - Immolate'),
(1050402, 10504, 0, 0, 0, 100, 1, 15000, 15000, 20000, 20000, 1050402, 0, 0, 'Lord Alexei Barov - Veil of Shadow'),
(1050420, 10504, 0, 6, 0, 100, 0, 0, 0, 0, 0, 1050420, 0, 0, 'Lord Alexei Barov - dead: done (4)'),
(1090101, 10901, 0, 0, 0, 100, 1, 38000, 38000, 32000, 32000, 1090101, 0, 0, 'Lorekeeper Polkelt - Volatile Infection'),
(1090102, 10901, 0, 0, 0, 100, 1, 45000, 45000, 25000, 25000, 1090102, 0, 0, 'Lorekeeper Polkelt - Corrosive Acid'),
(1090103, 10901, 0, 0, 0, 100, 1, 35000, 35000, 38000, 38000, 1090103, 0, 0, 'Lorekeeper Polkelt - Noxious Catalyst'),
(1090120, 10901, 0, 6, 0, 100, 0, 0, 0, 0, 0, 1090120, 0, 0, 'Lorekeeper Polkelt - dead: done (5)'),
(1050801, 10508, 0, 0, 0, 100, 1, 2000, 2000, 180000, 180000, 1050801, 0, 0, 'Ras Frostwhisper - Ice Armor'),
(1050802, 10508, 0, 0, 0, 100, 1, 8000, 8000, 8000, 8000, 1050802, 0, 0, 'Ras Frostwhisper - Frostbolt'),
(1050803, 10508, 0, 0, 0, 100, 1, 18000, 18000, 24000, 24000, 1050803, 0, 0, 'Ras Frostwhisper - Freeze'),
(1050804, 10508, 0, 0, 0, 100, 1, 45000, 45000, 30000, 30000, 1050804, 0, 0, 'Ras Frostwhisper - Fear'),
(1050805, 10508, 0, 0, 0, 100, 1, 12000, 12000, 14000, 14000, 1050805, 0, 0, 'Ras Frostwhisper - Chill Nova'),
(1050806, 10508, 0, 0, 0, 100, 1, 24000, 24000, 15000, 15000, 1050806, 0, 0, 'Ras Frostwhisper - Frost Volley'),
(1050701, 10507, 0, 0, 0, 100, 1, 24000, 24000, 10000, 10000, 1050701, 0, 0, 'The Ravenian - Trample'),
(1050702, 10507, 0, 0, 0, 100, 1, 15000, 15000, 7000, 7000, 1050702, 0, 0, 'The Ravenian - Cleave'),
(1050703, 10507, 0, 0, 0, 100, 1, 40000, 40000, 20000, 20000, 1050703, 0, 0, 'The Ravenian - Sundering Cleave'),
(1050704, 10507, 0, 0, 0, 100, 1, 32000, 32000, 12000, 12000, 1050704, 0, 0, 'The Ravenian - Knock Away'),
(1050720, 10507, 0, 6, 0, 100, 0, 0, 0, 0, 0, 1050720, 0, 0, 'The Ravenian - dead: done (6)'),
(185301, 1853, 0, 0, 0, 100, 9, 4500, 4500, 10000, 16000, 185301, 0, 0, 'Darkmaster Gandling - Arcane Missiles'),
(185302, 1853, 0, 0, 0, 100, 9, 12000, 12000, 10000, 12000, 185302, 0, 0, 'Darkmaster Gandling - Shadow Shield'),
(185303, 1853, 0, 0, 0, 100, 9, 2000, 2000, 15000, 27000, 185303, 0, 0, 'Darkmaster Gandling - Curse'),
(1126111, 11261, 0, 0, 0, 100, 1, 9000, 9000, 10000, 10000, 1126111, 0, 0, 'Doctor Theolen Krastinov - Backhand, his victim''s threat dropped'),
(1126112, 11261, 0, 2, 0, 100, 9, 25, 0, 120000, 120000, 1126112, 0, 0, 'Doctor Theolen Krastinov - Frenzy under 26 %, with its emote'),
(1050511, 10505, 0, 0, 0, 100, 1, 22000, 22000, 40000, 40000, 1050511, 0, 0, 'Instructor Malicia - three Flash Heals, 5 s apart'),
(1090111, 10901, 0, 4, 0, 100, 0, 0, 0, 0, 0, 1090111, 0, 0, 'Lorekeeper Polkelt - aggro: his disease'),
(1050811, 10508, 0, 11, 0, 100, 0, 0, 0, 0, 0, 1050811, 0, 0, 'Ras Frostwhisper - Ice Armor'),
(1050812, 10508, 0, 7, 0, 100, 0, 0, 0, 0, 0, 1050812, 0, 0, 'Ras Frostwhisper - Ice Armor'),
(185321, 1853, 0, 11, 0, 100, 0, 0, 0, 0, 0, 185321, 0, 0, 'Darkmaster Gandling - "School is in session!"'),
(185322, 1853, 0, 6, 0, 100, 0, 0, 0, 0, 0, 185322, 0, 0, 'Darkmaster Gandling - dead: done (0), "Class...dismissed."'),
(185323, 1853, 0, 21, 0, 100, 0, 0, 0, 0, 0, 185323, 0, 0, 'Darkmaster Gandling - home: failed (0)'),
(185324, 1853, 289000, 0, 0, 100, 1, 16000, 16000, 20000, 35000, 185324, 0, 0, 'Darkmaster Gandling - a player to one of his rooms, above 3 %'),
(1048001, 10480, 0, 4, 0, 100, 0, 0, 0, 0, 0, 1048001, 0, 0, 'Unstable Corpse - aggro: its disease'),
(1048002, 10480, 0, 6, 0, 100, 0, 0, 0, 0, 0, 1048002, 0, 0, 'Unstable Corpse - dead: its burst'),
(1048101, 10481, 0, 11, 0, 100, 0, 0, 0, 0, 0, 1048101, 0, 0, 'Reanimated Corpse - cannot drop below 1 hp'),
(1048102, 10481, 0, 4, 0, 100, 0, 0, 0, 0, 0, 1048102, 0, 0, 'Reanimated Corpse - aggro: its disease'),
(1048103, 10481, 0, 2, 0, 100, 0, 1, 0, 0, 0, 1048103, 0, 0, 'Reanimated Corpse - at its last hp: lies dead 10 s, rises whole, once'),
(1126311, 11263, 0, 8, 0, 100, 1, 17652, -1, 0, 0, 1126311, 0, 0, 'Spectral Projection - hit by its master''s spell: the caster healed, the projection gone');

DELETE FROM `creature_ai_scripts` WHERE `id` IN (185301, 185302, 185303, 185321, 185322, 185323, 185324, 1048001, 1048002, 1048101, 1048102, 1048103, 1050201, 1050202, 1050203, 1050204, 1050220, 1050401, 1050402, 1050420, 1050501, 1050502, 1050503, 1050504, 1050511, 1050520, 1050701, 1050702, 1050703, 1050704, 1050720, 1050801, 1050802, 1050803, 1050804, 1050805, 1050806, 1050811, 1050812, 1090101, 1090102, 1090103, 1090111, 1090120, 1126101, 1126111, 1126112, 1126120, 1126311);
INSERT INTO `creature_ai_scripts`
(`id`, `delay`, `priority`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`)
VALUES
(1126101, 0, 0, 15, 16509, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Doctor Theolen Krastinov - Rend'),
(1126120, 0, 0, 37, 1, 3, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Doctor Theolen Krastinov - done'),
(1050201, 0, 0, 15, 18671, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Lady Illucia Barov - Curse of Agony'),
(1050202, 0, 0, 15, 20603, 0, 0, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Lady Illucia Barov - Shadow Shock'),
(1050203, 0, 0, 15, 15487, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Lady Illucia Barov - Silence'),
(1050204, 0, 0, 15, 6215, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Lady Illucia Barov - Fear'),
(1050220, 0, 0, 37, 3, 3, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Lady Illucia Barov - done'),
(1050501, 0, 0, 15, 17831, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Instructor Malicia - Call of the Grave'),
(1050502, 0, 0, 15, 11672, 0, 0, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Instructor Malicia - Corruption'),
(1050503, 0, 0, 15, 10929, 0, 0, 0, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Instructor Malicia - Renew'),
(1050504, 0, 0, 15, 9889, 0, 0, 0, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Instructor Malicia - Healing Touch'),
(1050520, 0, 0, 37, 2, 3, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Instructor Malicia - done'),
(1050401, 0, 0, 15, 15570, 0, 0, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Lord Alexei Barov - Immolate'),
(1050402, 0, 0, 15, 17820, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Lord Alexei Barov - Veil of Shadow'),
(1050420, 0, 0, 37, 4, 3, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Lord Alexei Barov - done'),
(1090101, 0, 0, 15, 24928, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Lorekeeper Polkelt - Volatile Infection'),
(1090102, 0, 0, 15, 8245, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Lorekeeper Polkelt - Corrosive Acid'),
(1090103, 0, 0, 15, 18151, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Lorekeeper Polkelt - Noxious Catalyst'),
(1090120, 0, 0, 37, 5, 3, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Lorekeeper Polkelt - done'),
(1050801, 0, 0, 15, 18100, 0, 0, 0, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Ras Frostwhisper - Ice Armor'),
(1050802, 0, 0, 15, 21369, 0, 0, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Ras Frostwhisper - Frostbolt'),
(1050803, 0, 0, 15, 18763, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Ras Frostwhisper - Freeze'),
(1050804, 0, 0, 15, 26070, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Ras Frostwhisper - Fear'),
(1050805, 0, 0, 15, 18099, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Ras Frostwhisper - Chill Nova'),
(1050806, 0, 0, 15, 8398, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Ras Frostwhisper - Frost Volley'),
(1050701, 0, 0, 15, 15550, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'The Ravenian - Trample'),
(1050702, 0, 0, 15, 20691, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'The Ravenian - Cleave'),
(1050703, 0, 0, 15, 25174, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'The Ravenian - Sundering Cleave'),
(1050704, 0, 0, 15, 10101, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'The Ravenian - Knock Away'),
(1050720, 0, 0, 37, 6, 3, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'The Ravenian - done'),
(185301, 0, 0, 15, 15790, 0, 0, 0, 0, 0, 1, 8, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Darkmaster Gandling - Arcane Missiles'),
(185302, 0, 0, 15, 22417, 0, 0, 0, 0, 0, 0, 12, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Darkmaster Gandling - Shadow Shield'),
(185303, 0, 0, 15, 18702, 0, 0, 0, 0, 0, 1, 8, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Darkmaster Gandling - Curse'),
(1126111, 0, 0, 15, 18103, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Doctor Theolen Krastinov - Backhand'),
(1126111, 0, 1, 29, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, -100, 0, 0, 0, 0, 'Doctor Theolen Krastinov - his victim''s threat dropped'),
(1126112, 0, 0, 15, 8269, 0, 0, 0, 0, 0, 0, 12, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Doctor Theolen Krastinov - Frenzy'),
(1126112, 0, 1, 0, 2, 0, 0, 0, 0, 0, 0, 0, 7797, 0, 0, 0, 0, 0, 0, 0, 0, 'Doctor Theolen Krastinov - "%s goes into a killing frenzy!"'),
(1050511, 0, 0, 39, 2890001, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0, 0, 0, 0, 0, 0, 0, 'Instructor Malicia - the Flash Heals'),
(1090111, 0, 0, 15, 12038, 34, 0, 0, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Lorekeeper Polkelt - his disease'),
(1050811, 0, 0, 15, 18100, 2, 0, 0, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Ras Frostwhisper - Ice Armor'),
(1050812, 0, 0, 15, 18100, 2, 0, 0, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Ras Frostwhisper - Ice Armor'),
(185321, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 7145, 0, 0, 0, 0, 0, 0, 0, 0, 'Darkmaster Gandling - "School is in session!"'),
(185322, 0, 0, 37, 0, 3, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Darkmaster Gandling - done'),
(185322, 0, 1, 0, 1, 0, 0, 0, 0, 0, 0, 0, 289101, 0, 0, 0, 0, 0, 0, 0, 0, 'Darkmaster Gandling - "Class...dismissed."'),
(185323, 0, 0, 37, 0, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Darkmaster Gandling - failed'),
(185324, 0, 0, 39, 2890010, 0, 0, 0, 2, 0, 4, 0, 100, 0, 0, 0, 0, 0, 0, 0, 0, 'Darkmaster Gandling - a random player through the portal'),
(1048001, 0, 0, 15, 12038, 34, 0, 0, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Unstable Corpse - its disease'),
(1048002, 0, 0, 15, 17689, 2, 0, 0, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Unstable Corpse - its burst'),
(1048101, 0, 0, 52, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Reanimated Corpse - no lower than 1 hp'),
(1048102, 0, 0, 15, 12038, 34, 0, 0, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Reanimated Corpse - its disease'),
(1048103, 0, 0, 28, 7, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Reanimated Corpse - down'),
(1048103, 0, 1, 4, 143, 32, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Reanimated Corpse - looks dead'),
(1048103, 0, 2, 43, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Reanimated Corpse - lies still'),
(1048103, 0, 3, 42, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Reanimated Corpse - no blows'),
(1048103, 0, 4, 39, 2890011, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0, 0, 0, 0, 0, 0, 0, 'Reanimated Corpse - rises in 10 s'),
(1126311, 0, 0, 94, 1000, 2, 0, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Spectral Projection - its caster up by 1000'),
(1126311, 0, 1, 18, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Spectral Projection - gone');

DELETE FROM `generic_scripts` WHERE `id` IN (2890001, 2890002, 2890003, 2890004, 2890005, 2890006, 2890007, 2890008, 2890009, 2890010, 2890011);
INSERT INTO `generic_scripts`
(`id`, `delay`, `priority`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`)
VALUES
(2890001, 0, 0, 15, 10917, 0, 0, 0, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Instructor Malicia - Flash Heal (1 of 3)'),
(2890001, 5, 1, 15, 10917, 0, 0, 0, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Instructor Malicia - Flash Heal (2 of 3)'),
(2890001, 10, 2, 15, 10917, 0, 0, 0, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Instructor Malicia - Flash Heal (3 of 3)'),
(2890002, 0, 0, 6, 289, 0, 0, 0, 0, 0, 0, 2, 0, 0, 0, 0, 250.0696, 0.3921, 84.8408, 3.149, 0, 'Gandling''s room 1 - the player sent there'),
(2890002, 0, 1, 37, 8, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Gandling''s room 1 - in progress (8): its gate shut'),
(2890002, 0, 2, 10, 30000, 15000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 4, 229.229, 5.39118, 85.2283, 0.0961165, 0, 'Gandling''s room 1 - a Risen Guard at the player (1)'),
(2890002, 0, 3, 10, 30000, 15000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 4, 229.503, 0.00814369, 85.2283, 0.0961165, 0, 'Gandling''s room 1 - a Risen Guard at the player (2)'),
(2890002, 0, 4, 10, 30000, 15000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 4, 229.727, -4.39616, 85.2283, 0.0961165, 0, 'Gandling''s room 1 - a Risen Guard at the player (3)'),
(2890003, 0, 0, 6, 289, 0, 0, 0, 0, 0, 0, 2, 0, 0, 0, 0, 181.422, -91.9481, 84.841, 1.608, 0, 'Gandling''s room 2 - the player sent there'),
(2890003, 0, 1, 37, 9, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Gandling''s room 2 - in progress (9): its gate shut'),
(2890003, 0, 2, 10, 30001, 15000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 4, 186.217, -50.0985, 85.2283, 4.75432, 0, 'Gandling''s room 2 - a Risen Guard at the player (1)'),
(2890003, 0, 3, 10, 30001, 15000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 4, 181.568, -56.2009, 84.841, 4.75432, 0, 'Gandling''s room 2 - a Risen Guard at the player (2)'),
(2890003, 0, 4, 10, 30001, 15000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 4, 188.325, -55.6766, 85.2283, 4.75432, 0, 'Gandling''s room 2 - a Risen Guard at the player (3)'),
(2890003, 0, 5, 10, 30001, 15000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 4, 173.013, -56.4198, 85.2283, 4.75432, 0, 'Gandling''s room 2 - a Risen Guard at the player (4)'),
(2890004, 0, 0, 6, 289, 0, 0, 0, 0, 0, 0, 2, 0, 0, 0, 0, 95.1547, -1.8173, 85.2289, 0.043, 0, 'Gandling''s room 3 - the player sent there'),
(2890004, 0, 1, 37, 10, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Gandling''s room 3 - in progress (10): its gate shut'),
(2890004, 0, 2, 10, 30002, 15000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 4, 128.205, 5.00569, 85.2283, 3.09949, 0, 'Gandling''s room 3 - a Risen Guard at the player (1)'),
(2890004, 0, 3, 10, 30002, 15000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 4, 128.06, -6.1269, 85.2283, 3.09949, 0, 'Gandling''s room 3 - a Risen Guard at the player (2)'),
(2890004, 0, 4, 10, 30002, 15000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 4, 128.124, -1.71736, 85.3764, 3.09949, 0, 'Gandling''s room 3 - a Risen Guard at the player (3)'),
(2890005, 0, 0, 6, 289, 0, 0, 0, 0, 0, 0, 2, 0, 0, 0, 0, 250.0696, 0.3921, 72.6722, 3.149, 0, 'Gandling''s room 4 - the player sent there'),
(2890005, 0, 1, 37, 11, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Gandling''s room 4 - in progress (11): its gate shut'),
(2890005, 0, 2, 10, 30003, 15000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 4, 235.598, 0.588147, 72.6727, 2.92513, 0, 'Gandling''s room 4 - a Risen Guard at the player (1)'),
(2890005, 0, 3, 10, 30003, 15000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 4, 235.51, -5.92126, 72.6727, 0.331743, 0, 'Gandling''s room 4 - a Risen Guard at the player (2)'),
(2890005, 0, 4, 10, 30003, 15000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 4, 229.127, -3.10989, 72.6727, 3.17017, 0, 'Gandling''s room 4 - a Risen Guard at the player (3)'),
(2890006, 0, 0, 6, 289, 0, 0, 0, 0, 0, 0, 2, 0, 0, 0, 0, 181.422, -91.9481, 70.7734, 1.608, 0, 'Gandling''s room 5 - the player sent there'),
(2890006, 0, 1, 37, 12, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Gandling''s room 5 - in progress (12): its gate shut'),
(2890006, 0, 2, 10, 30004, 15000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 4, 170.96, -56.9603, 75.3971, 3.75058, 0, 'Gandling''s room 5 - a Risen Guard at the player (1)'),
(2890006, 0, 3, 10, 30004, 15000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 4, 182.708, -55.8739, 75.3971, 1.88447, 0, 'Gandling''s room 5 - a Risen Guard at the player (2)'),
(2890006, 0, 4, 10, 30004, 15000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 4, 175.353, -55.9977, 75.3971, 0.461331, 0, 'Gandling''s room 5 - a Risen Guard at the player (3)'),
(2890006, 0, 5, 10, 30004, 15000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 4, 191.41, -55.4289, 75.3971, 3.75058, 0, 'Gandling''s room 5 - a Risen Guard at the player (4)'),
(2890007, 0, 0, 6, 289, 0, 0, 0, 0, 0, 0, 2, 0, 0, 0, 0, 106.1541, -1.8994, 75.3663, 0.043, 0, 'Gandling''s room 6 - the player sent there'),
(2890007, 0, 1, 37, 13, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Gandling''s room 6 - in progress (13): its gate shut'),
(2890007, 0, 2, 10, 30005, 10000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 4, 138.599, 4.62909, 75.397, 0.065487, 0, 'Gandling''s room 6 - a Risen Guard at the player (1)'),
(2890007, 0, 3, 10, 30005, 10000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 4, 136.525, -1.6351, 75.397, 0.065487, 0, 'Gandling''s room 6 - a Risen Guard at the player (2)'),
(2890007, 0, 4, 10, 30005, 10000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 4, 139.392, -7.35632, 75.397, 0.039568, 0, 'Gandling''s room 6 - a Risen Guard at the player (3)'),
(2890008, 0, 0, 39, 2890002, 2890003, 2890004, 0, 0, 0, 0, 0, 33, 33, 34, 0, 0, 0, 0, 0, 0, 'Gandling''s rooms - one of three (1 of 2)'),
(2890009, 0, 0, 39, 2890005, 2890006, 2890007, 0, 0, 0, 0, 0, 33, 33, 34, 0, 0, 0, 0, 0, 0, 'Gandling''s rooms - one of three (2 of 2)'),
(2890010, 0, 0, 15, 17950, 0, 0, 0, 0, 0, 0, 8, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Darkmaster Gandling - Shadow Portal at the player'),
(2890010, 2, 1, 29, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, -100, 0, 0, 0, 0, 'Darkmaster Gandling - the player''s threat dropped'),
(2890010, 2, 2, 39, 2890008, 2890009, 0, 0, 0, 0, 0, 0, 50, 50, 0, 0, 0, 0, 0, 0, 0, 'Darkmaster Gandling - the player to one of the six rooms'),
(2890011, 10, 0, 94, 100, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Reanimated Corpse - whole again'),
(2890011, 10, 1, 28, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Reanimated Corpse - up'),
(2890011, 10, 2, 4, 143, 32, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Reanimated Corpse - alive'),
(2890011, 10, 3, 43, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Reanimated Corpse - moves again'),
(2890011, 10, 4, 42, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Reanimated Corpse - strikes again'),
(2890011, 10, 5, 52, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Reanimated Corpse - can die now');

