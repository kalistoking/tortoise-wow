-- Scarlet Monastery (map 189), seven bosses: its C++ as rows -- EPIC10 tier 2.
-- Written by the trt repo's scripts/tier2/a15_scarlet_monastery.py from t1_world; scarlet_monastery_restore.sql puts
-- back what this replaces. R8: a person applies it, into the world database.
--
-- The C++ keeps its script names: mod-scarlet-monastery is the switch (AM1, handoff/manager-091).
-- Loaded, the C++ runs as before -- a script found by name comes first. Unloaded
-- (`module unload mod-scarlet-monastery`, which gives every creature standing a new AI at once),
-- the names find no script and the creatures run these rows (their ai_name).
--
-- Map 189 keeps instance_scarlet_monastery (the core): the Ashbringer event and the Mograine and
-- Whitemane stages. Herod's myrmidons join by SetInCombatWithZone (the C++: his victim), and give
-- experience (the C++ took it away); his trainees go down into the room by a path of their own, not
-- the C++'s two flanks. Herod's lever keeps its own row: the door open for 15 s. The C++'s
-- Fairbanks reset the wrong timer after Dispel Magic, trying it on every update once due: here
-- every 30 s, as it meant.

UPDATE `creature_template` SET `ai_name` = 'EventAI' WHERE `entry` = 3974;
UPDATE `creature_template` SET `ai_name` = 'EventAI' WHERE `entry` = 3975;
UPDATE `creature_template` SET `ai_name` = 'EventAI' WHERE `entry` = 3983;
UPDATE `creature_template` SET `ai_name` = 'EventAI' WHERE `entry` = 4542;
UPDATE `creature_template` SET `ai_name` = 'EventAI' WHERE `entry` = 4543;
UPDATE `creature_template` SET `ai_name` = 'EventAI' WHERE `entry` = 6487;
UPDATE `creature_template` SET `ai_name` = 'EventAI' WHERE `entry` = 14693;

DELETE FROM `conditions` WHERE `condition_entry` IN (189001, 189002, 189004, 189005);
INSERT INTO `conditions`
(`condition_entry`, `type`, `value1`, `value2`, `value3`, `value4`, `flags`)
VALUES
(189001, 1, 9438, 0, 0, 0, 3),
(189002, 37, 0, 0, 0, 0, 0),
(189004, 54, 1965, -432, 7, 32, 3),
(189005, 38, 15, 1, 0, 0, 0);

DELETE FROM `broadcast_text` WHERE `entry` IN (397401, 397501, 397503, 397504, 397505, 397508, 397513, 398301, 398302, 398303, 398304, 398306, 454301, 454302, 454303, 648701, 648702);
INSERT INTO `broadcast_text`
(`entry`, `male_text`, `female_text`, `chat_type`, `sound_id`, `language_id`, `emote_id1`, `emote_id2`, `emote_id3`, `emote_delay1`, `emote_delay2`, `emote_delay3`)
VALUES
(397401, 'Release the hounds!', 'Release the hounds!', 1, 5841, 0, 0, 0, 0, 0, 0, 0),
(398301, 'Tell me... tell me everything!', 'Tell me... tell me everything!', 1, 5847, 0, 0, 0, 0, 0, 0, 0),
(398302, 'Purged by pain!', 'Purged by pain!', 1, 5848, 0, 0, 0, 0, 0, 0, 0),
(398303, 'Naughty secrets!', 'Naughty secrets!', 1, 5849, 0, 0, 0, 0, 0, 0, 0),
(398304, 'I''ll rip the secrets from your flesh!', 'I''ll rip the secrets from your flesh!', 1, 5850, 0, 0, 0, 0, 0, 0, 0),
(398306, 'The monster got what he deserved.', 'The monster got what he deserved.', 0, 0, 0, 0, 0, 0, 0, 0, 0),
(454301, 'We hunger for vengeance.', 'We hunger for vengeance.', 1, 5844, 0, 0, 0, 0, 0, 0, 0),
(454302, 'More... More souls.', 'More... More souls.', 1, 5845, 0, 0, 0, 0, 0, 0, 0),
(454303, 'No rest, for the angry dead.', 'No rest, for the angry dead.', 1, 5846, 0, 0, 0, 0, 0, 0, 0),
(648701, 'You will not defile these mysteries!', 'You will not defile these mysteries!', 1, 5842, 0, 0, 0, 0, 0, 0, 0),
(648702, 'Burn in righteous fire!', 'Burn in righteous fire!', 1, 5843, 0, 0, 0, 0, 0, 0, 0),
(397501, 'Ah, I have been waiting for a real challenge!', 'Ah, I have been waiting for a real challenge!', 1, 5830, 0, 0, 0, 0, 0, 0, 0),
(397503, 'Blades of Light!', 'Blades of Light!', 1, 5832, 0, 0, 0, 0, 0, 0, 0),
(397504, '%s becomes enraged!', '%s becomes enraged!', 2, 0, 0, 0, 0, 0, 0, 0, 0),
(397505, 'Light, give me strength!', 'Light, give me strength!', 1, 5833, 0, 0, 0, 0, 0, 0, 0),
(397508, 'Hah, is that all?', 'Hah, is that all?', 1, 5831, 0, 0, 0, 0, 0, 0, 0),
(397513, 'The master has fallen! Avenge him my brethren!', 'The master has fallen! Avenge him my brethren!', 1, 5834, 0, 0, 0, 0, 0, 0, 0);

DELETE FROM `creature_ai_events` WHERE `id` IN (397401, 397402, 397501, 397502, 397503, 397504, 397506, 397507, 397508, 397509, 397511, 398301, 398302, 398303, 398304, 398305, 398306, 429590, 454201, 454202, 454203, 454204, 454205, 454206, 454207, 454301, 454302, 454303, 454304, 454305, 454306, 454307, 648701, 648702, 648703, 648704, 648705, 1469301, 1469302, 1469303, 1469304);
INSERT INTO `creature_ai_events`
(`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`)
VALUES
(397401, 3974, 0, 4, 0, 100, 0, 0, 0, 0, 0, 397401, 0, 0, 'Houndmaster Loksey - aggro'),
(397402, 3974, 0, 0, 0, 100, 1, 20000, 20000, 20000, 20000, 397402, 0, 0, 'Houndmaster Loksey - Bloodlust'),
(398301, 3983, 0, 4, 0, 100, 0, 0, 0, 0, 0, 398301, 0, 0, 'Interrogator Vishas - aggro line'),
(398302, 3983, 0, 5, 0, 100, 1, 0, 0, 0, 0, 398302, 0, 0, 'Interrogator Vishas - kill line'),
(398303, 3983, 0, 2, 0, 100, 0, 60, 0, 0, 0, 398303, 0, 0, 'Interrogator Vishas - 60 % line'),
(398304, 3983, 0, 2, 0, 100, 0, 30, 0, 0, 0, 398304, 0, 0, 'Interrogator Vishas - 30 % line'),
(398305, 3983, 0, 0, 0, 100, 1, 5000, 5000, 5000, 15000, 398305, 0, 0, 'Interrogator Vishas - Shadow Word: Pain'),
(398306, 3983, 0, 6, 0, 100, 0, 0, 0, 0, 0, 398306, 0, 0, 'Interrogator Vishas - dead: Vorrel''s line'),
(454301, 4543, 0, 4, 0, 100, 0, 0, 0, 0, 0, 454301, 0, 0, 'Bloodmage Thalnos - aggro line'),
(454302, 4543, 0, 5, 0, 100, 1, 0, 0, 0, 0, 454302, 0, 0, 'Bloodmage Thalnos - kill line'),
(454303, 4543, 0, 2, 0, 100, 0, 35, 0, 0, 0, 454303, 0, 0, 'Bloodmage Thalnos - 35 % line'),
(454304, 4543, 0, 0, 0, 100, 1, 10000, 10000, 10000, 15000, 454304, 0, 0, 'Bloodmage Thalnos - Flame Shock'),
(454305, 4543, 0, 0, 0, 100, 1, 8000, 8000, 30000, 30000, 454305, 0, 0, 'Bloodmage Thalnos - Flame Spike'),
(454306, 4543, 0, 0, 0, 100, 1, 40000, 40000, 40000, 40000, 454306, 0, 0, 'Bloodmage Thalnos - Fire Nova'),
(454307, 4543, 0, 0, 0, 100, 1, 2000, 2000, 2000, 2000, 454307, 0, 0, 'Bloodmage Thalnos - Shadow Bolt'),
(648701, 6487, 0, 4, 0, 100, 0, 0, 0, 0, 0, 648701, 0, 0, 'Arcanist Doan - aggro line'),
(648702, 6487, 0, 2, 0, 100, 4, 50, 0, 0, 0, 648702, 0, 0, 'Arcanist Doan - the bubble and its detonation, at half health'),
(648703, 6487, 189001, 0, 0, 100, 1, 20000, 20000, 20000, 20000, 648703, 0, 0, 'Arcanist Doan - Polymorph'),
(648704, 6487, 189001, 0, 0, 100, 1, 15000, 15000, 15000, 20000, 648704, 0, 0, 'Arcanist Doan - Silence'),
(648705, 6487, 189001, 0, 0, 100, 1, 3000, 3000, 8000, 8000, 648705, 0, 0, 'Arcanist Doan - Arcane Explosion'),
(454201, 4542, 0, 2, 0, 100, 5, 25, 0, 30000, 30000, 454201, 0, 0, 'High Inquisitor Fairbanks - Heal under a quarter, every 30 s'),
(454202, 4542, 0, 0, 0, 100, 1, 40000, 40000, 40000, 40000, 454202, 0, 0, 'High Inquisitor Fairbanks - Fear'),
(454203, 4542, 0, 0, 0, 100, 1, 30000, 30000, 30000, 30000, 454203, 0, 0, 'High Inquisitor Fairbanks - Sleep'),
(454204, 4542, 0, 2, 0, 100, 0, 25, 0, 0, 0, 454204, 0, 0, 'High Inquisitor Fairbanks - Power Word: Shield once, under a quarter'),
(454205, 4542, 0, 0, 0, 100, 1, 20000, 20000, 30000, 30000, 454205, 0, 0, 'High Inquisitor Fairbanks - Dispel Magic'),
(454206, 4542, 0, 0, 0, 100, 1, 10000, 10000, 25000, 25000, 454206, 0, 0, 'High Inquisitor Fairbanks - Curse of Blood'),
(454207, 4542, 189002, 8, 0, 100, 0, 28441, 127, 0, 0, 454207, 0, 0, 'High Inquisitor Fairbanks - the Ashbringer seen'),
(397501, 3975, 0, 4, 0, 100, 0, 0, 0, 0, 0, 397501, 0, 0, 'Herod - aggro: his myrmidons'),
(397502, 3975, 189004, 0, 0, 100, 1, 500, 500, 500, 500, 397502, 0, 0, 'Herod - pulled out of his room: his myrmidons join'),
(429590, 4295, 0, 31, 0, 100, 1, 3975, 1, 0, 0, 429590, 0, 0, 'Scarlet Myrmidon - Herod''s call: joins'),
(397503, 3975, 0, 0, 2, 100, 9, 10000, 20000, 20000, 30000, 397503, 0, 0, 'Herod - Whirlwind'),
(397504, 3975, 0, 2, 2, 100, 12, 50, 0, 0, 0, 397504, 0, 0, 'Herod - Frenzy at half health, until it takes'),
(397506, 3975, 189005, 0, 2, 100, 9, 1500, 1500, 4500, 4500, 397506, 0, 0, 'Herod - Rushing Charge at a victim 15 yd off'),
(397507, 3975, 0, 0, 2, 100, 9, 12000, 12000, 12000, 12000, 397507, 0, 0, 'Herod - Cleave'),
(397508, 3975, 0, 5, 0, 100, 1, 0, 0, 0, 0, 397508, 0, 0, 'Herod - kill line'),
(397509, 3975, 0, 7, 0, 100, 0, 0, 0, 0, 0, 397509, 0, 0, 'Herod - evading: his event over, not rooted'),
(397511, 3975, 0, 6, 0, 100, 0, 0, 0, 0, 0, 397511, 0, 0, 'Herod - dead: the trainees, his door'),
(1469301, 14693, 0, 0, 0, 100, 1, 45000, 45000, 45000, 45000, 1469301, 0, 0, 'Scorn - Lich Slap'),
(1469302, 14693, 0, 0, 0, 100, 1, 30000, 30000, 20000, 20000, 1469302, 0, 0, 'Scorn - Frostbolt Volley'),
(1469303, 14693, 0, 0, 0, 100, 1, 30000, 30000, 20000, 20000, 1469303, 0, 0, 'Scorn - Mind Flay'),
(1469304, 14693, 0, 0, 0, 100, 1, 30000, 30000, 15000, 15000, 1469304, 0, 0, 'Scorn - Frost Nova');

DELETE FROM `creature_ai_scripts` WHERE `id` IN (397401, 397402, 397501, 397502, 397503, 397504, 397506, 397507, 397508, 397509, 397511, 398301, 398302, 398303, 398304, 398305, 398306, 429590, 454201, 454202, 454203, 454204, 454205, 454206, 454207, 454301, 454302, 454303, 454304, 454305, 454306, 454307, 648701, 648702, 648703, 648704, 648705, 1469301, 1469302, 1469303, 1469304);
INSERT INTO `creature_ai_scripts`
(`id`, `delay`, `priority`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`)
VALUES
(397401, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 397401, 0, 0, 0, 0, 0, 0, 0, 0, 'Houndmaster Loksey - "Release the hounds!"'),
(397401, 0, 1, 15, 17164, 0, 0, 0, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Houndmaster Loksey - Summon Scarlet Hound'),
(397402, 0, 0, 15, 6742, 0, 0, 0, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Houndmaster Loksey - Bloodlust'),
(398301, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 398301, 0, 0, 0, 0, 0, 0, 0, 0, 'Interrogator Vishas - aggro line'),
(398302, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 398302, 0, 0, 0, 0, 0, 0, 0, 0, 'Interrogator Vishas - kill line'),
(398303, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 398303, 0, 0, 0, 0, 0, 0, 0, 0, 'Interrogator Vishas - 60 % line'),
(398304, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 398304, 0, 0, 0, 0, 0, 0, 0, 0, 'Interrogator Vishas - 30 % line'),
(398305, 0, 0, 15, 2767, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Interrogator Vishas - Shadow Word: Pain'),
(398306, 0, 0, 0, 0, 0, 0, 0, 3981, 200, 8, 2, 398306, 0, 0, 0, 0, 0, 0, 0, 0, 'Vorrel Sengutz - "The monster got what he deserved."'),
(454301, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 454301, 0, 0, 0, 0, 0, 0, 0, 0, 'Bloodmage Thalnos - aggro line'),
(454302, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 454302, 0, 0, 0, 0, 0, 0, 0, 0, 'Bloodmage Thalnos - kill line'),
(454303, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 454303, 0, 0, 0, 0, 0, 0, 0, 0, 'Bloodmage Thalnos - 35 % line'),
(454304, 0, 0, 15, 8053, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Bloodmage Thalnos - Flame Shock'),
(454305, 0, 0, 15, 8814, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Bloodmage Thalnos - Flame Spike'),
(454306, 0, 0, 15, 16079, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Bloodmage Thalnos - Fire Nova'),
(454307, 0, 0, 15, 1106, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Bloodmage Thalnos - Shadow Bolt'),
(648701, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 648701, 0, 0, 0, 0, 0, 0, 0, 0, 'Arcanist Doan - aggro line'),
(648702, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 648702, 0, 0, 0, 0, 0, 0, 0, 0, 'Arcanist Doan - "Burn in righteous fire!"'),
(648702, 0, 1, 15, 9438, 0, 0, 0, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Arcanist Doan - Arcane Bubble'),
(648702, 0, 2, 15, 9435, 0, 0, 0, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Arcanist Doan - Detonation'),
(648703, 0, 0, 15, 13323, 0, 0, 0, 0, 0, 5, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Arcanist Doan - Polymorph'),
(648704, 0, 0, 15, 8988, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Arcanist Doan - Silence'),
(648705, 0, 0, 15, 9433, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Arcanist Doan - Arcane Explosion'),
(454201, 0, 0, 15, 12039, 0, 0, 0, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'High Inquisitor Fairbanks - Heal'),
(454202, 0, 0, 15, 12096, 0, 0, 0, 0, 0, 5, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'High Inquisitor Fairbanks - Fear'),
(454203, 0, 0, 15, 8399, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'High Inquisitor Fairbanks - Sleep'),
(454204, 0, 0, 15, 11647, 0, 0, 0, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'High Inquisitor Fairbanks - Power Word: Shield'),
(454205, 0, 0, 15, 15090, 0, 0, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'High Inquisitor Fairbanks - Dispel Magic'),
(454206, 0, 0, 15, 8282, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'High Inquisitor Fairbanks - Curse of Blood'),
(454207, 0, 0, 51, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'High Inquisitor Fairbanks - unarmed'),
(454207, 0, 1, 15, 28443, 2, 0, 0, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'High Inquisitor Fairbanks - Transform Ghost'),
(454207, 0, 2, 35, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'High Inquisitor Fairbanks - turned to the bearer'),
(454207, 0, 3, 4, 147, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'High Inquisitor Fairbanks - gossip on'),
(397501, 0, 0, 61, 3975, 3600, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Herod - his myrmidons'' map event'),
(397501, 0, 1, 10, 4295, 20000, 0, 0, 0, 0, 0, 0, 0, 397510, -1, 7, 1928.03, -368.61, 18.0, 0.05, 0, 'Herod - a Scarlet Myrmidon (1 of 4)'),
(397501, 0, 2, 10, 4295, 20000, 0, 0, 0, 0, 0, 0, 0, 397510, -1, 7, 1928.03, -372.61, 18.0, 0.05, 0, 'Herod - a Scarlet Myrmidon (2 of 4)'),
(397501, 0, 3, 10, 4295, 20000, 0, 0, 0, 0, 0, 0, 0, 397510, -1, 7, 1924.03, -368.61, 18.0, 0.05, 0, 'Herod - a Scarlet Myrmidon (3 of 4)'),
(397501, 0, 4, 10, 4295, 20000, 0, 0, 0, 0, 0, 0, 0, 397510, -1, 7, 1924.03, -372.61, 18.0, 0.05, 0, 'Herod - a Scarlet Myrmidon (4 of 4)'),
(397501, 0, 5, 0, 1, 0, 0, 0, 0, 0, 0, 0, 397501, 0, 0, 0, 0, 0, 0, 0, 0, 'Herod - "Ah, I have been waiting for a real challenge!"'),
(397501, 0, 6, 15, 8260, 0, 0, 0, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Herod - Rushing Charge'),
(397502, 0, 0, 66, 3975, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Herod - "join" to his myrmidons'),
(429590, 0, 0, 49, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Scarlet Myrmidon - joins Herod''s fight'),
(397503, 0, 0, 15, 8989, 0, 0, 0, 0, 0, 1, 8, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Herod - Whirlwind'),
(397503, 0, 1, 74, 17507, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Herod - rooted while he whirls'),
(397503, 0, 2, 0, 1, 0, 0, 0, 0, 0, 0, 0, 397503, 0, 0, 0, 0, 0, 0, 0, 0, 'Herod - "Blades of Light!"'),
(397503, 0, 3, 44, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Herod - whirling (phase 1)'),
(397503, 0, 4, 39, 397512, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0, 0, 0, 0, 0, 0, 0, 'Herod - the whirl over in 11 s'),
(397504, 0, 0, 15, 8269, 0, 0, 0, 0, 0, 0, 12, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Herod - Frenzy'),
(397504, 0, 1, 0, 2, 0, 0, 0, 0, 0, 0, 0, 397504, 0, 0, 0, 0, 0, 0, 0, 0, 'Herod - "%s becomes enraged!"'),
(397504, 0, 2, 0, 1, 0, 0, 0, 0, 0, 0, 0, 397505, 0, 0, 0, 0, 0, 0, 0, 0, 'Herod - "Light, give me strength!"'),
(397506, 0, 0, 15, 8260, 0, 0, 0, 0, 0, 0, 12, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Herod - Rushing Charge at a victim 15 yd off'),
(397507, 0, 0, 15, 15496, 0, 0, 0, 0, 0, 1, 8, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Herod - Cleave'),
(397508, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 397508, 0, 0, 0, 0, 0, 0, 0, 0, 'Herod - kill line'),
(397509, 0, 0, 62, 3975, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Herod - his myrmidons'' event over'),
(397509, 0, 1, 14, 17507, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Herod - not rooted'),
(397509, 0, 2, 44, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Herod - phase 0'),
(397511, 0, 0, 62, 3975, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Herod - his myrmidons'' event over'),
(397511, 0, 1, 10, 397514, 180000, 0, 0, 0, 0, 0, 0, 0, 397513, -1, 1, 1939.18, -431.58, 17.09, 6.22, 0, 'Herod - a Scarlet Trainee (1 of 20)'),
(397511, 0, 2, 10, 397514, 180000, 0, 0, 0, 0, 0, 0, 0, 397514, -1, 1, 1939.18, -431.58, 17.09, 6.22, 0, 'Herod - a Scarlet Trainee (2 of 20)'),
(397511, 0, 3, 10, 397514, 180000, 0, 0, 0, 0, 0, 0, 0, 397514, -1, 1, 1939.18, -431.58, 17.09, 6.22, 0, 'Herod - a Scarlet Trainee (3 of 20)'),
(397511, 0, 4, 10, 397514, 180000, 0, 0, 0, 0, 0, 0, 0, 397514, -1, 1, 1939.18, -431.58, 17.09, 6.22, 0, 'Herod - a Scarlet Trainee (4 of 20)'),
(397511, 0, 5, 10, 397514, 180000, 0, 0, 0, 0, 0, 0, 0, 397514, -1, 1, 1939.18, -431.58, 17.09, 6.22, 0, 'Herod - a Scarlet Trainee (5 of 20)'),
(397511, 0, 6, 10, 397514, 180000, 0, 0, 0, 0, 0, 0, 0, 397514, -1, 1, 1939.18, -431.58, 17.09, 6.22, 0, 'Herod - a Scarlet Trainee (6 of 20)'),
(397511, 0, 7, 10, 397514, 180000, 0, 0, 0, 0, 0, 0, 0, 397514, -1, 1, 1939.18, -431.58, 17.09, 6.22, 0, 'Herod - a Scarlet Trainee (7 of 20)'),
(397511, 0, 8, 10, 397514, 180000, 0, 0, 0, 0, 0, 0, 0, 397514, -1, 1, 1939.18, -431.58, 17.09, 6.22, 0, 'Herod - a Scarlet Trainee (8 of 20)'),
(397511, 0, 9, 10, 397514, 180000, 0, 0, 0, 0, 0, 0, 0, 397514, -1, 1, 1939.18, -431.58, 17.09, 6.22, 0, 'Herod - a Scarlet Trainee (9 of 20)'),
(397511, 0, 10, 10, 397514, 180000, 0, 0, 0, 0, 0, 0, 0, 397514, -1, 1, 1939.18, -431.58, 17.09, 6.22, 0, 'Herod - a Scarlet Trainee (10 of 20)'),
(397511, 0, 11, 10, 397514, 180000, 0, 0, 0, 0, 0, 0, 0, 397514, -1, 1, 1939.18, -431.58, 17.09, 6.22, 0, 'Herod - a Scarlet Trainee (11 of 20)'),
(397511, 0, 12, 10, 397514, 180000, 0, 0, 0, 0, 0, 0, 0, 397514, -1, 1, 1939.18, -431.58, 17.09, 6.22, 0, 'Herod - a Scarlet Trainee (12 of 20)'),
(397511, 0, 13, 10, 397514, 180000, 0, 0, 0, 0, 0, 0, 0, 397514, -1, 1, 1939.18, -431.58, 17.09, 6.22, 0, 'Herod - a Scarlet Trainee (13 of 20)'),
(397511, 0, 14, 10, 397514, 180000, 0, 0, 0, 0, 0, 0, 0, 397514, -1, 1, 1939.18, -431.58, 17.09, 6.22, 0, 'Herod - a Scarlet Trainee (14 of 20)'),
(397511, 0, 15, 10, 397514, 180000, 0, 0, 0, 0, 0, 0, 0, 397514, -1, 1, 1939.18, -431.58, 17.09, 6.22, 0, 'Herod - a Scarlet Trainee (15 of 20)'),
(397511, 0, 16, 10, 397514, 180000, 0, 0, 0, 0, 0, 0, 0, 397514, -1, 1, 1939.18, -431.58, 17.09, 6.22, 0, 'Herod - a Scarlet Trainee (16 of 20)'),
(397511, 0, 17, 10, 397514, 180000, 0, 0, 0, 0, 0, 0, 0, 397514, -1, 1, 1939.18, -431.58, 17.09, 6.22, 0, 'Herod - a Scarlet Trainee (17 of 20)'),
(397511, 0, 18, 10, 397514, 180000, 0, 0, 0, 0, 0, 0, 0, 397514, -1, 1, 1939.18, -431.58, 17.09, 6.22, 0, 'Herod - a Scarlet Trainee (18 of 20)'),
(397511, 0, 19, 10, 397514, 180000, 0, 0, 0, 0, 0, 0, 0, 397514, -1, 1, 1939.18, -431.58, 17.09, 6.22, 0, 'Herod - a Scarlet Trainee (19 of 20)'),
(397511, 0, 20, 10, 397514, 180000, 0, 0, 0, 0, 0, 0, 0, 397514, -1, 1, 1939.18, -431.58, 17.09, 6.22, 0, 'Herod - a Scarlet Trainee (20 of 20)'),
(397511, 0, 21, 11, 32250, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Herod - Herod''s Door open'),
(1469301, 0, 0, 15, 28873, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Scorn - Lich Slap'),
(1469302, 0, 0, 15, 22643, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Scorn - Frostbolt Volley'),
(1469303, 0, 0, 15, 17313, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Scorn - Mind Flay'),
(1469304, 0, 0, 15, 29849, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Scorn - Frost Nova');

DELETE FROM `generic_scripts` WHERE `id` IN (397510, 397511, 397512, 397513, 397514, 397515, 397516, 397517, 397518);
INSERT INTO `generic_scripts`
(`id`, `delay`, `priority`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`)
VALUES
(397510, 0, 0, 63, 3975, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 397511, 0, 0, 0, 0, 0, 'Scarlet Myrmidon - in Herod''s map event'),
(397511, 0, 0, 18, 0, 0, 0, 0, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, 117, 'Scarlet Myrmidon - Herod''s event over, gone if not fighting'),
(397512, 11, 0, 14, 17507, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Herod - not rooted'),
(397512, 11, 1, 44, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Herod - back to phase 0'),
(397513, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 397513, 0, 0, 0, 0, 0, 0, 0, 0, 'Scarlet Trainee - "The master has fallen! Avenge him my brethren!"'),
(397513, 0, 1, 39, 397515, 397516, 397517, 397518, 0, 0, 0, 0, 25, 25, 25, 25, 0, 0, 0, 0, 0, 'Scarlet Trainee - off in 1-6 s'),
(397514, 0, 1, 39, 397515, 397516, 397517, 397518, 0, 0, 0, 0, 25, 25, 25, 25, 0, 0, 0, 0, 0, 'Scarlet Trainee - off in 1-6 s'),
(397515, 1, 0, 3, 0, 0, 5, 0, 0, 0, 0, 4, 0, 0, 0, 0, 1965.039795, -431.733856, 6.177539, 0, 117, 'Scarlet Trainee - down into the room (1 s)'),
(397516, 3, 0, 3, 0, 0, 5, 0, 0, 0, 0, 4, 0, 0, 0, 0, 1965.039795, -431.733856, 6.177539, 0, 117, 'Scarlet Trainee - down into the room (3 s)'),
(397517, 4, 0, 3, 0, 0, 5, 0, 0, 0, 0, 4, 0, 0, 0, 0, 1965.039795, -431.733856, 6.177539, 0, 117, 'Scarlet Trainee - down into the room (4 s)'),
(397518, 6, 0, 3, 0, 0, 5, 0, 0, 0, 0, 4, 0, 0, 0, 0, 1965.039795, -431.733856, 6.177539, 0, 117, 'Scarlet Trainee - down into the room (6 s)');

DELETE FROM `creature_movement` WHERE `id` = 39850 AND `point` = 1;
INSERT INTO `creature_movement`
(`id`, `point`, `position_x`, `position_y`, `position_z`, `orientation`, `waittime`, `wander_distance`, `script_id`)
VALUES
(39850, 1, 1797.668335, 1214.438965, 18.158447, 100, 0, 0, 0);

DELETE FROM `creature_movement` WHERE `id` = 39850 AND `point` = 2;
INSERT INTO `creature_movement`
(`id`, `point`, `position_x`, `position_y`, `position_z`, `orientation`, `waittime`, `wander_distance`, `script_id`)
VALUES
(39850, 2, 1798.763306, 1275.821533, 18.488573, 100, 0, 0, 0);

DELETE FROM `creature_movement` WHERE `id` = 39850 AND `point` = 3;
INSERT INTO `creature_movement`
(`id`, `point`, `position_x`, `position_y`, `position_z`, `orientation`, `waittime`, `wander_distance`, `script_id`)
VALUES
(39850, 3, 1800.72644, 1313.862305, 18.725443, 100, 0, 0, 0);

DELETE FROM `creature_movement` WHERE `id` = 39850 AND `point` = 4;
INSERT INTO `creature_movement`
(`id`, `point`, `position_x`, `position_y`, `position_z`, `orientation`, `waittime`, `wander_distance`, `script_id`)
VALUES
(39850, 4, 1805.438354, 1323.63501, 18.919188, 100, 0, 0, 0);

DELETE FROM `creature_movement` WHERE `id` = 39850 AND `point` = 5;
INSERT INTO `creature_movement`
(`id`, `point`, `position_x`, `position_y`, `position_z`, `orientation`, `waittime`, `wander_distance`, `script_id`)
VALUES
(39850, 5, 1799.388916, 1338.318481, 18.887611, 100, 0, 0, 0);

DELETE FROM `creature_movement` WHERE `id` = 39850 AND `point` = 6;
INSERT INTO `creature_movement`
(`id`, `point`, `position_x`, `position_y`, `position_z`, `orientation`, `waittime`, `wander_distance`, `script_id`)
VALUES
(39850, 6, 1797.709351, 1383.367432, 18.765408, 100, 0, 0, 0);

DELETE FROM `creature_movement` WHERE `id` = 39850 AND `point` = 7;
INSERT INTO `creature_movement`
(`id`, `point`, `position_x`, `position_y`, `position_z`, `orientation`, `waittime`, `wander_distance`, `script_id`)
VALUES
(39850, 7, 1796.630859, 1349.865845, 18.887638, 100, 0, 0, 0);

DELETE FROM `creature_movement` WHERE `id` = 39850 AND `point` = 8;
INSERT INTO `creature_movement`
(`id`, `point`, `position_x`, `position_y`, `position_z`, `orientation`, `waittime`, `wander_distance`, `script_id`)
VALUES
(39850, 8, 1791.184326, 1326.423096, 18.950106, 100, 0, 0, 0);

DELETE FROM `creature_movement` WHERE `id` = 39850 AND `point` = 9;
INSERT INTO `creature_movement`
(`id`, `point`, `position_x`, `position_y`, `position_z`, `orientation`, `waittime`, `wander_distance`, `script_id`)
VALUES
(39850, 9, 1793.545776, 1316.592651, 18.793835, 100, 0, 0, 0);

DELETE FROM `creature_movement` WHERE `id` = 39850 AND `point` = 10;
INSERT INTO `creature_movement`
(`id`, `point`, `position_x`, `position_y`, `position_z`, `orientation`, `waittime`, `wander_distance`, `script_id`)
VALUES
(39850, 10, 1796.11084, 1294.494141, 18.594208, 100, 0, 0, 0);

UPDATE `creature` SET `movement_type` = 2 WHERE `guid` = 39850;
