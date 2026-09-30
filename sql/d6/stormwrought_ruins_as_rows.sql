-- Stormwrought Ruins (map 818), eleven bosses, the secret door and its instance: its C++ as rows -- EPIC10 tier 2.
-- Written by the trt repo's scripts/tier2/a19_stormwrought_ruins.py from t1_world; stormwrought_ruins_restore.sql puts
-- back what this replaces. R8: a person applies it, into the world database.
--
-- The C++ keeps its script names: mod-stormwrought-ruins is the switch (AM1, handoff/manager-091).
-- Loaded, the C++ runs as before -- a script found by name comes first. Unloaded
-- (`module unload mod-stormwrought-ruins`, which gives every creature standing a new AI at once),
-- the names find no script and the creatures run these rows (their ai_name).
--
-- Map 818's instance script goes: the generic store (AC7), the levers in slots 4-7, Ighal'for's channel in 8.
-- Ighal'for's imps and Mergothid join the zone (the C++ copied Ighal'for's threat to them, value by value);
-- his channel, not attackable, may still evade if every player leaves his threat list (the C++ could not).
-- Mycellakos's blast is cast by its helper at the kept spot, not by Mycellakos; it goes off even if
-- Mycellakos left the fight in those 3 s. The levers show their default use, not the alternative state.

UPDATE `creature_template` SET `ai_name` = 'EventAI' WHERE `entry` = 62547;
UPDATE `creature_template` SET `ai_name` = 'EventAI' WHERE `entry` = 62548;
UPDATE `creature_template` SET `ai_name` = 'EventAI' WHERE `entry` = 62549;
UPDATE `creature_template` SET `ai_name` = 'EventAI' WHERE `entry` = 62550;
UPDATE `creature_template` SET `ai_name` = 'EventAI' WHERE `entry` = 62551;
UPDATE `creature_template` SET `ai_name` = 'EventAI' WHERE `entry` = 62552;
UPDATE `creature_template` SET `ai_name` = 'EventAI' WHERE `entry` = 62652;
UPDATE `creature_template` SET `ai_name` = 'EventAI' WHERE `entry` = 62661;
UPDATE `creature_template` SET `ai_name` = 'EventAI' WHERE `entry` = 62664;
UPDATE `creature_template` SET `ai_name` = 'EventAI' WHERE `entry` = 62665;
UPDATE `creature_template` SET `ai_name` = 'EventAI' WHERE `entry` = 62671;
UPDATE `creature_template` SET `ai_name` = 'EventAI' WHERE `entry` = 62673;
UPDATE `creature_template` SET `ai_name` = 'EventAI' WHERE `entry` = 62731;

DELETE FROM `conditions` WHERE `condition_entry` IN (818012, 818013, 818014);
INSERT INTO `conditions`
(`condition_entry`, `type`, `value1`, `value2`, `value3`, `value4`, `flags`)
VALUES
(818012, 34, 6, 1, 0, 0, 0),
(818013, 34, 7, 1, 0, 0, 0),
(818014, -1, 298, 9938, 818012, 818013, 0);

DELETE FROM `broadcast_text` WHERE `entry` IN (818062, 818063, 818064, 818065, 818066, 818067, 818068, 818069, 818070, 818071, 818072, 818073, 818074, 818075, 818076, 818077, 818078, 818079, 818080, 818081, 818082, 818083, 818084, 818085, 818086, 818087, 818088);
INSERT INTO `broadcast_text`
(`entry`, `male_text`, `female_text`, `chat_type`, `sound_id`, `language_id`, `emote_id1`, `emote_id2`, `emote_id3`, `emote_delay1`, `emote_delay2`, `emote_delay3`)
VALUES
(818062, 'More meat to devour!', 'More meat to devour!', 0, 60590, 0, 0, 0, 0, 0, 0, 0),
(818063, 'The hunger... never ends...', 'The hunger... never ends...', 0, 60591, 0, 0, 0, 0, 0, 0, 0),
(818069, 'Let me tear your heart asunder!', 'Let me tear your heart asunder!', 0, 60595, 0, 0, 0, 0, 0, 0, 0),
(818070, 'Gul''dan...! Your legacy...', 'Gul''dan...! Your legacy...', 0, 60596, 0, 0, 0, 0, 0, 0, 0),
(818064, 'Yet again do the forces of darkness seek to lay claim to my throne. Stormwrought will not fall into your hands, fiends!', 'Yet again do the forces of darkness seek to lay claim to my throne. Stormwrought will not fall into your hands, fiends!', 0, 60586, 0, 0, 0, 0, 0, 0, 0),
(818065, 'Olivert... Philmore... Old friends...', 'Olivert... Philmore... Old friends...', 0, 60587, 0, 0, 0, 0, 0, 0, 0),
(818073, 'Step forth. Accept the cold embrace of death and drown in its bleakness!', 'Step forth. Accept the cold embrace of death and drown in its bleakness!', 0, 60597, 0, 0, 0, 0, 0, 0, 0),
(818075, 'The waves... they beckon me...', 'The waves... they beckon me...', 0, 60599, 0, 0, 0, 0, 0, 0, 0),
(818074, 'Darkness shall come, and consume you all!', 'Darkness shall come, and consume you all!', 0, 60598, 0, 0, 0, 0, 0, 0, 0),
(818071, 'The dark sea will swallow your souls!', 'The dark sea will swallow your souls!', 0, 60588, 0, 0, 0, 0, 0, 0, 0),
(818072, 'You know so little, whelps...', 'You know so little, whelps...', 0, 60589, 0, 0, 0, 0, 0, 0, 0),
(818066, 'I must kindly ask you to leave, the archives are not ready for public viewing!', 'I must kindly ask you to leave, the archives are not ready for public viewing!', 1, 60634, 0, 0, 0, 0, 0, 0, 0),
(818068, 'These pages were mine to organize... Such great effort, gone to waste!', 'These pages were mine to organize... Such great effort, gone to waste!', 1, 60636, 0, 0, 0, 0, 0, 0, 0),
(818067, 'Behold, my signature attack! The great waves of Balor shall destroy you, once and for all!', 'Behold, my signature attack! The great waves of Balor shall destroy you, once and for all!', 1, 60635, 0, 0, 0, 0, 0, 0, 0),
(818076, 'You shall be brought under heel intruder...', 'You shall be brought under heel intruder...', 0, 60605, 0, 0, 0, 0, 0, 0, 0),
(818078, 'This cannot be! I was going to change the world!', 'This cannot be! I was going to change the world!', 0, 60607, 0, 0, 0, 0, 0, 0, 0),
(818077, 'My will is unbreakable, you shall bend your knee.', 'My will is unbreakable, you shall bend your knee.', 0, 60606, 0, 0, 0, 0, 0, 0, 0),
(818079, 'New toys, let''s hope you will not break so easily...', 'New toys, let''s hope you will not break so easily...', 0, 60608, 0, 0, 0, 0, 0, 0, 0),
(818081, 'Impossible... You... vile...', 'Impossible... You... vile...', 0, 60610, 0, 0, 0, 0, 0, 0, 0),
(818080, 'Share your darkest secrets with me!', 'Share your darkest secrets with me!', 0, 60609, 0, 0, 0, 0, 0, 0, 0),
(818082, 'My master prepared me for this moment. Those ignorant to his truth will perish by my hands.', 'My master prepared me for this moment. Those ignorant to his truth will perish by my hands.', 1, 60600, 0, 0, 0, 0, 0, 0, 0),
(818083, 'Your intrusion ends here!', 'Your intrusion ends here!', 1, 60601, 0, 0, 0, 0, 0, 0, 0),
(818084, 'Enough! The Bloodstone is ready; savor the last fleeting moments of your life!', 'Enough! The Bloodstone is ready; savor the last fleeting moments of your life!', 1, 60602, 0, 0, 0, 0, 0, 0, 0),
(818085, 'Great Mergothid, lay your eyes upon this feast of souls!', 'Great Mergothid, lay your eyes upon this feast of souls!', 1, 60603, 0, 0, 0, 0, 0, 0, 0),
(818086, 'Too soon, incessant weakling. Your pathetic soul will be the compensation for your failure.', 'Too soon, incessant weakling. Your pathetic soul will be the compensation for your failure.', 1, 60621, 0, 0, 0, 0, 0, 0, 0),
(818087, 'More souls to feast upon!', 'More souls to feast upon!', 1, 60622, 0, 0, 0, 0, 0, 0, 0),
(818088, 'The nether, calls yet again!', 'The nether, calls yet again!', 1, 60623, 0, 0, 0, 0, 0, 0, 0);

DELETE FROM `creature_ai_events` WHERE `id` IN (6254701, 6254702, 6254703, 6254801, 6254802, 6254803, 6254804, 6254805, 6254901, 6254902, 6254903, 6254904, 6254905, 6254906, 6255001, 6255002, 6255003, 6255004, 6255005, 6255101, 6255102, 6255103, 6255104, 6255105, 6255106, 6255201, 6255202, 6255203, 6255204, 6255205, 6255206, 6265201, 6265202, 6265203, 6265204, 6265205, 6266101, 6266102, 6266401, 6266402, 6266501, 6266502, 6266503, 6266504, 6267101, 6267102, 6267103, 6267104, 6267105, 6267106, 6267107, 6267108, 6267201, 6267301, 6267302, 6267303, 6267401, 6267501);
INSERT INTO `creature_ai_events`
(`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`)
VALUES
(6254701, 62547, 0, 4, 0, 100, 0, 0, 0, 0, 0, 6254701, 0, 0, 'Dagar the Glutton - aggro line'),
(6254702, 62547, 0, 6, 0, 100, 0, 0, 0, 0, 0, 6254702, 0, 0, 'Dagar the Glutton - death line'),
(6254703, 62547, 0, 0, 0, 100, 9, 6000, 8000, 12000, 16000, 6254703, 0, 0, 'Dagar the Glutton - Consume Flesh'),
(6254801, 62548, 0, 4, 0, 100, 0, 0, 0, 0, 0, 6254801, 0, 0, 'Oronok Torn-Heart - aggro line'),
(6254802, 62548, 0, 6, 0, 100, 0, 0, 0, 0, 0, 6254802, 0, 0, 'Oronok Torn-Heart - death line'),
(6254803, 62548, 0, 0, 0, 100, 9, 8000, 12000, 16000, 22000, 6254803, 0, 0, 'Oronok Torn-Heart - Knock Away'),
(6254804, 62548, 0, 0, 0, 100, 9, 1000, 1000, 22000, 30000, 6254804, 0, 0, 'Oronok Torn-Heart - Death and Decay'),
(6254805, 62548, 0, 0, 0, 100, 9, 5000, 8000, 7000, 10000, 6254805, 0, 0, 'Oronok Torn-Heart - Shadow Bolt'),
(6254901, 62549, 0, 4, 0, 100, 0, 0, 0, 0, 0, 6254901, 0, 0, 'Duke Balor the IV - aggro line'),
(6254902, 62549, 0, 6, 0, 100, 0, 0, 0, 0, 0, 6254902, 0, 0, 'Duke Balor the IV - death line'),
(6254903, 62549, 0, 0, 0, 100, 9, 5000, 5000, 25000, 30000, 6254903, 0, 0, 'Duke Balor the IV - Mind Flay'),
(6254904, 62549, 0, 0, 0, 100, 9, 15000, 20000, 15000, 20000, 6254904, 0, 0, 'Duke Balor the IV - Psychic Scream'),
(6254905, 62549, 0, 0, 0, 100, 9, 10000, 15000, 10000, 15000, 6254905, 0, 0, 'Duke Balor the IV - Wailing Dead'),
(6254906, 62549, 0, 0, 0, 100, 9, 7000, 10000, 16000, 22000, 6254906, 0, 0, 'Duke Balor the IV - Dark Strike'),
(6255001, 62550, 0, 4, 0, 100, 0, 0, 0, 0, 0, 6255001, 0, 0, 'Deathlord Tidebane - aggro line'),
(6255002, 62550, 0, 6, 0, 100, 0, 0, 0, 0, 0, 6255002, 0, 0, 'Deathlord Tidebane - death line'),
(6255003, 62550, 0, 0, 0, 100, 9, 9000, 13000, 18000, 24000, 6255003, 0, 0, 'Deathlord Tidebane - Rain of Fire'),
(6255004, 62550, 0, 0, 0, 100, 9, 4000, 7000, 10000, 14000, 6255004, 0, 0, 'Deathlord Tidebane - Dark Plague'),
(6255005, 62550, 0, 0, 0, 100, 9, 16000, 22000, 22000, 30000, 6255005, 0, 0, 'Deathlord Tidebane - Wail of Souls'),
(6255101, 62551, 0, 4, 0, 100, 0, 0, 0, 0, 0, 6255101, 0, 0, 'Chieftain Stormsong - aggro line'),
(6255102, 62551, 0, 6, 0, 100, 0, 0, 0, 0, 0, 6255102, 0, 0, 'Chieftain Stormsong - death line'),
(6255103, 62551, 0, 0, 0, 100, 9, 5000, 8000, 11000, 15000, 6255103, 0, 0, 'Chieftain Stormsong - Forked Lightning'),
(6255104, 62551, 0, 0, 0, 100, 9, 25000, 30000, 25000, 30000, 6255104, 0, 0, 'Chieftain Stormsong - Stun Bomb'),
(6255105, 62551, 0, 0, 0, 100, 9, 12000, 16000, 14000, 20000, 6255105, 0, 0, 'Chieftain Stormsong - Lightning Strike'),
(6255106, 62551, 0, 2, 0, 100, 0, 50, 0, 0, 0, 6255106, 0, 0, 'Chieftain Stormsong - threat wiped at half health'),
(6255201, 62552, 0, 4, 0, 100, 0, 0, 0, 0, 0, 6255201, 0, 0, 'Librarian Theodorus - aggro line'),
(6255202, 62552, 0, 6, 0, 100, 0, 0, 0, 0, 0, 6255202, 0, 0, 'Librarian Theodorus - death line'),
(6255203, 62552, 0, 0, 0, 100, 9, 1000, 1000, 15000, 22000, 6255203, 0, 0, 'Librarian Theodorus - Cone of Cold'),
(6255204, 62552, 0, 0, 0, 100, 9, 4000, 6000, 6000, 9000, 6255204, 0, 0, 'Librarian Theodorus - Frostbolt'),
(6255205, 62552, 0, 0, 0, 100, 9, 10000, 14000, 16000, 22000, 6255205, 0, 0, 'Librarian Theodorus - Blizzard'),
(6255206, 62552, 0, 2, 0, 100, 8, 50, 0, 0, 0, 6255206, 0, 0, 'Librarian Theodorus - his elemental at half health, until it takes'),
(6265201, 62652, 0, 4, 0, 100, 0, 0, 0, 0, 0, 6265201, 0, 0, 'Subjugator Halthas Shadecrest - aggro line'),
(6265202, 62652, 0, 6, 0, 100, 0, 0, 0, 0, 0, 6265202, 0, 0, 'Subjugator Halthas Shadecrest - death line'),
(6265203, 62652, 0, 0, 0, 100, 9, 12000, 16000, 26000, 34000, 6265203, 0, 0, 'Subjugator Halthas Shadecrest - Dominate Mind'),
(6265204, 62652, 0, 0, 0, 100, 9, 0, 0, 12000, 16000, 6265204, 0, 0, 'Subjugator Halthas Shadecrest - Flamestrike'),
(6265205, 62652, 0, 0, 0, 100, 9, 18000, 24000, 24000, 32000, 6265205, 0, 0, 'Subjugator Halthas Shadecrest - Fear'),
(6266101, 62661, 0, 0, 0, 100, 9, 4000, 6000, 10000, 12000, 6266101, 0, 0, 'Eldermaw the Primordial - Tail Slap at a random attacker in melee'),
(6266102, 62661, 0, 2, 0, 100, 0, 50, 0, 0, 0, 6266102, 0, 0, 'Eldermaw the Primordial - the primordial call at half health'),
(6267401, 62674, 0, 11, 0, 100, 0, 0, 0, 0, 0, 6267401, 0, 0, 'Eldermaw Crocolisk - the zone pulled as it comes'),
(6267501, 62675, 0, 11, 0, 100, 0, 0, 0, 0, 0, 6267501, 0, 0, 'Growth of Mycellekos - the zone pulled as it comes'),
(6267201, 62672, 0, 11, 0, 100, 0, 0, 0, 0, 0, 6267201, 0, 0, 'Rifttorn Nether Imp - the zone pulled as it comes'),
(6266401, 62664, 0, 0, 0, 100, 9, 25000, 30000, 25000, 30000, 6266401, 0, 0, 'Mycellakos - Decaying Mold'),
(6266402, 62664, 0, 0, 0, 100, 1, 8000, 8000, 15000, 20000, 6266402, 0, 0, 'Mycellakos - the Volatile Fungus where it stands'),
(6266501, 62665, 0, 4, 0, 100, 0, 0, 0, 0, 0, 6266501, 0, 0, 'Lady Drazare - aggro line'),
(6266502, 62665, 0, 6, 0, 100, 0, 0, 0, 0, 0, 6266502, 0, 0, 'Lady Drazare - death line'),
(6266503, 62665, 0, 0, 0, 100, 9, 19000, 20000, 39000, 58000, 6266503, 0, 0, 'Lady Drazare - Dark Seduction'),
(6266504, 62665, 0, 0, 0, 100, 9, 12000, 24000, 12000, 24000, 6266504, 0, 0, 'Lady Drazare - Drazare''s Embrace'),
(6267101, 62671, 0, 10, 0, 100, 0, 1, 80, 0, 0, 6267101, 0, 0, 'Ighal''for - a player in sight'),
(6267102, 62671, 0, 4, 0, 100, 0, 0, 0, 0, 0, 6267102, 0, 0, 'Ighal''for - aggro line'),
(6267103, 62671, 0, 0, 2, 100, 9, 12000, 12000, 22000, 22000, 6267103, 0, 0, 'Ighal''for - Death Coil'),
(6267104, 62671, 0, 0, 2, 100, 9, 7000, 7000, 24000, 24000, 6267104, 0, 0, 'Ighal''for - Flamestrike'),
(6267105, 62671, 0, 0, 2, 100, 9, 18000, 18000, 26000, 26000, 6267105, 0, 0, 'Ighal''for - Curse of Agony'),
(6267106, 62671, 0, 2, 0, 100, 0, 24, 0, 0, 0, 6267106, 0, 0, 'Ighal''for - the Bloodstone channel under a quarter'),
(6267107, 62671, 0, 7, 0, 100, 0, 0, 0, 0, 0, 6267107, 0, 0, 'Ighal''for - evading: the channel over, the imps gone'),
(6267108, 62671, 0, 6, 0, 100, 0, 0, 0, 0, 0, 6267108, 0, 0, 'Ighal''for - dead: the channel over, the imps gone'),
(6267301, 62673, 0, 11, 0, 100, 0, 0, 0, 0, 0, 6267301, 0, 0, 'Mergothid - unattackable and passive until released'),
(6267302, 62673, 0, 2, 0, 100, 0, 50, 0, 0, 0, 6267302, 0, 0, 'Mergothid - half health line'),
(6267303, 62673, 0, 6, 0, 100, 0, 0, 0, 0, 0, 6267303, 0, 0, 'Mergothid - death line');

DELETE FROM `creature_ai_scripts` WHERE `id` IN (6254701, 6254702, 6254703, 6254801, 6254802, 6254803, 6254804, 6254805, 6254901, 6254902, 6254903, 6254904, 6254905, 6254906, 6255001, 6255002, 6255003, 6255004, 6255005, 6255101, 6255102, 6255103, 6255104, 6255105, 6255106, 6255201, 6255202, 6255203, 6255204, 6255205, 6255206, 6265201, 6265202, 6265203, 6265204, 6265205, 6266101, 6266102, 6266401, 6266402, 6266501, 6266502, 6266503, 6266504, 6267101, 6267102, 6267103, 6267104, 6267105, 6267106, 6267107, 6267108, 6267201, 6267301, 6267302, 6267303, 6267401, 6267501);
INSERT INTO `creature_ai_scripts`
(`id`, `delay`, `priority`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`)
VALUES
(6254701, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 818062, 0, 0, 0, 0, 0, 0, 0, 0, 'Dagar the Glutton - aggro line'),
(6254702, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 818063, 0, 0, 0, 0, 0, 0, 0, 0, 'Dagar the Glutton - death line'),
(6254703, 0, 0, 15, 3393, 0, 0, 0, 0, 0, 1, 8, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Dagar the Glutton - Consume Flesh'),
(6254801, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 818069, 0, 0, 0, 0, 0, 0, 0, 0, 'Oronok Torn-Heart - aggro line'),
(6254802, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 818070, 0, 0, 0, 0, 0, 0, 0, 0, 'Oronok Torn-Heart - death line'),
(6254803, 0, 0, 15, 10101, 0, 0, 0, 0, 0, 1, 8, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Oronok Torn-Heart - Knock Away'),
(6254804, 0, 0, 15, 11433, 0, 0, 0, 0, 0, 1, 8, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Oronok Torn-Heart - Death and Decay'),
(6254805, 0, 0, 15, 11660, 0, 0, 0, 257, 0, 4, 8, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Oronok Torn-Heart - Shadow Bolt'),
(6254901, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 818064, 0, 0, 0, 0, 0, 0, 0, 0, 'Duke Balor the IV - aggro line'),
(6254902, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 818065, 0, 0, 0, 0, 0, 0, 0, 0, 'Duke Balor the IV - death line'),
(6254903, 0, 0, 15, 47386, 0, 0, 0, 0, 0, 1, 8, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Duke Balor the IV - Mind Flay'),
(6254904, 0, 0, 15, 13704, 0, 0, 0, 0, 0, 0, 12, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Duke Balor the IV - Psychic Scream'),
(6254905, 0, 0, 15, 7713, 0, 0, 0, 0, 0, 0, 12, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Duke Balor the IV - Wailing Dead'),
(6254906, 0, 0, 15, 22574, 0, 0, 0, 0, 0, 1, 8, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Duke Balor the IV - Dark Strike'),
(6255001, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 818073, 0, 0, 0, 0, 0, 0, 0, 0, 'Deathlord Tidebane - aggro line'),
(6255002, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 818075, 0, 0, 0, 0, 0, 0, 0, 0, 'Deathlord Tidebane - death line'),
(6255003, 0, 0, 15, 11990, 0, 0, 0, 257, 0, 4, 8, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Deathlord Tidebane - Rain of Fire'),
(6255004, 0, 0, 15, 18270, 0, 0, 0, 257, 0, 4, 8, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Deathlord Tidebane - Dark Plague'),
(6255005, 0, 0, 15, 17631, 0, 0, 0, 0, 0, 0, 12, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Deathlord Tidebane - Wail of Souls'),
(6255005, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 818074, 0, 0, 0, 0, 0, 0, 0, 0, 'Deathlord Tidebane - its line after Wail of Souls'),
(6255101, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 818071, 0, 0, 0, 0, 0, 0, 0, 0, 'Chieftain Stormsong - aggro line'),
(6255102, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 818072, 0, 0, 0, 0, 0, 0, 0, 0, 'Chieftain Stormsong - death line'),
(6255103, 0, 0, 15, 20299, 0, 0, 0, 0, 0, 1, 8, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Chieftain Stormsong - Forked Lightning'),
(6255104, 0, 0, 15, 16497, 0, 0, 0, 257, 0, 4, 8, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Chieftain Stormsong - Stun Bomb'),
(6255105, 0, 0, 15, 52422, 0, 0, 0, 0, 0, 1, 8, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Chieftain Stormsong - Lightning Strike'),
(6255106, 0, 0, 29, 6, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, -100, 0, 0, 0, 0, 'Chieftain Stormsong - every threat wiped'),
(6255201, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 818066, 0, 0, 0, 0, 0, 0, 0, 0, 'Librarian Theodorus - aggro line'),
(6255202, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 818068, 0, 0, 0, 0, 0, 0, 0, 0, 'Librarian Theodorus - death line'),
(6255203, 0, 0, 15, 10159, 0, 0, 0, 0, 0, 1, 8, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Librarian Theodorus - Cone of Cold'),
(6255204, 0, 0, 15, 8406, 0, 0, 0, 257, 0, 4, 8, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Librarian Theodorus - Frostbolt'),
(6255205, 0, 0, 15, 30093, 0, 0, 0, 257, 0, 4, 8, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Librarian Theodorus - Blizzard'),
(6255206, 0, 0, 15, 44100, 2, 0, 0, 0, 0, 0, 12, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Librarian Theodorus - Summon Theodorus Elemental'),
(6255206, 0, 1, 0, 1, 0, 0, 0, 0, 0, 0, 0, 818067, 0, 0, 0, 0, 0, 0, 0, 0, 'Librarian Theodorus - "Behold, my signature attack!"'),
(6265201, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 818076, 0, 0, 0, 0, 0, 0, 0, 0, 'Subjugator Halthas Shadecrest - aggro line'),
(6265202, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 818078, 0, 0, 0, 0, 0, 0, 0, 0, 'Subjugator Halthas Shadecrest - death line'),
(6265203, 0, 0, 15, 15859, 0, 0, 0, 0, 0, 1, 8, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Subjugator Halthas Shadecrest - Dominate Mind'),
(6265203, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 818077, 0, 0, 0, 0, 0, 0, 0, 0, 'Subjugator Halthas Shadecrest - its line after Dominate Mind'),
(6265204, 0, 0, 15, 11829, 0, 0, 0, 0, 0, 1, 8, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Subjugator Halthas Shadecrest - Flamestrike'),
(6265205, 0, 0, 15, 27641, 0, 0, 0, 0, 0, 0, 12, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Subjugator Halthas Shadecrest - Fear'),
(6266101, 0, 0, 15, 44041, 0, 0, 0, 321, 0, 4, 8, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Eldermaw the Primordial - Tail Slap at a random attacker in melee'),
(6266102, 0, 0, 15, 44043, 2, 0, 0, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Eldermaw the Primordial - Call of the Primordial'),
(6266102, 0, 1, 15, 44042, 2, 0, 0, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Eldermaw the Primordial - Primordial Regeneration'),
(6266102, 0, 2, 10, 62674, 60000, 0, 0, 0, 0, 0, 0, 327680, 0, -1, 2, 2, 0, 0, 1.0, 0, 'Eldermaw the Primordial - an Eldermaw Crocolisk 2 yd off at +1 rad'),
(6266102, 0, 3, 10, 62674, 60000, 0, 0, 0, 0, 0, 0, 327680, 0, -1, 2, 2, 0, 0, -1.0, 0, 'Eldermaw the Primordial - an Eldermaw Crocolisk 2 yd off at -1 rad'),
(6267401, 0, 0, 49, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Eldermaw Crocolisk - SetInCombatWithZone'),
(6267501, 0, 0, 49, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Growth of Mycellekos - SetInCombatWithZone'),
(6267201, 0, 0, 49, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Rifttorn Nether Imp - SetInCombatWithZone'),
(6266401, 0, 0, 15, 44050, 0, 0, 0, 0, 0, 0, 12, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Mycellakos - Decaying Mold'),
(6266402, 0, 0, 76, 300420, 3, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Mycellakos - the Volatile Fungus under it, for 3 s'),
(6266402, 0, 1, 10, 62731, 10000, 0, 0, 0, 0, 0, 0, 262144, 6266430, -1, 3, 0, 0, 0, 0, 0, 'Mycellakos - the spot kept (invisible helper, 10 s)'),
(6266501, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 818079, 0, 0, 0, 0, 0, 0, 0, 0, 'Lady Drazare - aggro line'),
(6266502, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 818081, 0, 0, 0, 0, 0, 0, 0, 0, 'Lady Drazare - death line'),
(6266503, 0, 0, 15, 44051, 0, 0, 0, 259, 0, 4, 8, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Lady Drazare - Dark Seduction'),
(6266503, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 818080, 0, 0, 0, 0, 0, 0, 0, 0, 'Lady Drazare - its line after Dark Seduction'),
(6266504, 0, 0, 15, 44053, 0, 0, 0, 259, 0, 4, 8, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Lady Drazare - Drazare''s Embrace'),
(6267101, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 818082, 0, 0, 0, 0, 0, 0, 0, 0, 'Ighal''for - a player in sight'),
(6267102, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 818083, 0, 0, 0, 0, 0, 0, 0, 0, 'Ighal''for - aggro line'),
(6267103, 0, 0, 15, 6789, 0, 0, 0, 257, 0, 4, 8, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Ighal''for - Death Coil'),
(6267104, 0, 0, 15, 8423, 0, 0, 0, 257, 0, 4, 8, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Ighal''for - Flamestrike'),
(6267105, 0, 0, 15, 11712, 0, 0, 0, 257, 0, 4, 8, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Ighal''for - Curse of Agony'),
(6267106, 0, 0, 4, 46, 65664, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Ighal''for - unattackable'),
(6267106, 0, 1, 59, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Ighal''for - passive'),
(6267106, 0, 2, 42, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Ighal''for - no melee'),
(6267106, 0, 3, 43, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Ighal''for - no combat movement'),
(6267106, 0, 4, 0, 1, 0, 0, 0, 0, 0, 0, 0, 818084, 0, 0, 0, 0, 0, 0, 0, 0, 'Ighal''for - "Enough! The Bloodstone is ready"'),
(6267106, 0, 5, 6, 818, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, -5494.0, -3968.64, 257.972, 0.00115, 0, 'Ighal''for - home, facing the altar'),
(6267106, 0, 6, 15, 8734, 2, 0, 0, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Ighal''for - Blackfathom Channeling'),
(6267106, 0, 7, 44, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Ighal''for - channelling (phase 1)'),
(6267106, 0, 8, 37, 8, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Ighal''for - the channel runs (slot 8)'),
(6267106, 0, 9, 39, 6267130, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0, 0, 0, 0, 0, 0, 0, 'Ighal''for - the channel timeline'),
(6267107, 0, 0, 37, 8, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Ighal''for - the channel over (slot 8)'),
(6267107, 0, 1, 14, 8734, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Ighal''for - no channel'),
(6267107, 0, 2, 4, 46, 65664, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Ighal''for - attackable'),
(6267107, 0, 3, 59, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Ighal''for - aggressive'),
(6267107, 0, 4, 44, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Ighal''for - phase 0'),
(6267107, 0, 5, 68, 6267132, 2, 62672, 100, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Ighal''for - every Rifttorn Nether Imp within 100 yd gone'),
(6267108, 0, 0, 37, 8, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Ighal''for - the channel over (slot 8)'),
(6267108, 0, 1, 14, 8734, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Ighal''for - no channel'),
(6267108, 0, 2, 4, 46, 65664, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Ighal''for - attackable'),
(6267108, 0, 3, 59, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Ighal''for - aggressive'),
(6267108, 0, 4, 44, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Ighal''for - phase 0'),
(6267108, 0, 5, 68, 6267132, 2, 62672, 100, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Ighal''for - every Rifttorn Nether Imp within 100 yd gone'),
(6267301, 0, 0, 4, 46, 65664, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Mergothid - unattackable'),
(6267301, 0, 1, 59, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Mergothid - passive'),
(6267302, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 818087, 0, 0, 0, 0, 0, 0, 0, 0, 'Mergothid - half health line'),
(6267303, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 818088, 0, 0, 0, 0, 0, 0, 0, 0, 'Mergothid - death line');

DELETE FROM `generic_scripts` WHERE `id` IN (6266430, 6267130, 6267132);
INSERT INTO `generic_scripts`
(`id`, `delay`, `priority`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`)
VALUES
(6266430, 0, 0, 4, 46, 33554432, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Mycellakos helper - not selectable'),
(6266430, 3, 0, 10, 62675, 60000, 0, 0, 0, 0, 0, 0, 262144, 0, -1, 2, 1.0, 0, 0, 0, 0, 'Mycellakos helper - a Growth of Mycellekos at x+1'),
(6266430, 3, 1, 10, 62675, 60000, 0, 0, 0, 0, 0, 0, 262144, 0, -1, 2, -1.0, 0, 0, 0, 0, 'Mycellakos helper - a Growth of Mycellekos at x-1'),
(6266430, 3, 2, 15, 44048, 2, 0, 0, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Mycellakos helper - the Volatile Fungus blast on the spot'),
(6266430, 4, 0, 18, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Mycellakos helper - gone'),
(6267130, 5, 0, 10, 62672, 120000, 0, 0, 0, 0, 0, 0, 0, 0, -1, 2, -5478.29, -3968.8, 259.671, 3.11807, 8503, 'Ighal''for - imp wave 1: a Rifttorn Nether Imp at the altar'),
(6267130, 5, 1, 10, 62672, 120000, 0, 0, 0, 0, 0, 0, 0, 0, -1, 2, -5480.54, -3967.5, 259.671, 3.11807, 8503, 'Ighal''for - imp wave 1: a Rifttorn Nether Imp at the altar'),
(6267130, 5, 2, 10, 62672, 120000, 0, 0, 0, 0, 0, 0, 0, 0, -1, 2, -5480.54, -3970.1000000000004, 259.671, 3.11807, 8503, 'Ighal''for - imp wave 1: a Rifttorn Nether Imp at the altar'),
(6267130, 20, 0, 10, 62672, 120000, 0, 0, 0, 0, 0, 0, 0, 0, -1, 2, -5478.29, -3968.8, 259.671, 3.11807, 8503, 'Ighal''for - imp wave 2: a Rifttorn Nether Imp at the altar'),
(6267130, 20, 1, 10, 62672, 120000, 0, 0, 0, 0, 0, 0, 0, 0, -1, 2, -5480.54, -3967.5, 259.671, 3.11807, 8503, 'Ighal''for - imp wave 2: a Rifttorn Nether Imp at the altar'),
(6267130, 20, 2, 10, 62672, 120000, 0, 0, 0, 0, 0, 0, 0, 0, -1, 2, -5480.54, -3970.1000000000004, 259.671, 3.11807, 8503, 'Ighal''for - imp wave 2: a Rifttorn Nether Imp at the altar'),
(6267130, 35, 0, 10, 62672, 120000, 0, 0, 0, 0, 0, 0, 0, 0, -1, 2, -5478.29, -3968.8, 259.671, 3.11807, 8503, 'Ighal''for - imp wave 3: a Rifttorn Nether Imp at the altar'),
(6267130, 35, 1, 10, 62672, 120000, 0, 0, 0, 0, 0, 0, 0, 0, -1, 2, -5480.54, -3967.5, 259.671, 3.11807, 8503, 'Ighal''for - imp wave 3: a Rifttorn Nether Imp at the altar'),
(6267130, 35, 2, 10, 62672, 120000, 0, 0, 0, 0, 0, 0, 0, 0, -1, 2, -5480.54, -3970.1000000000004, 259.671, 3.11807, 8503, 'Ighal''for - imp wave 3: a Rifttorn Nether Imp at the altar'),
(6267130, 38, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 818085, 0, 0, 0, 0, 0, 0, 0, 8503, 'Ighal''for - "Great Mergothid, lay your eyes upon this feast of souls!"'),
(6267130, 40, 0, 10, 62673, 0, 0, 0, 0, 0, 0, 0, 0, 0, -1, 7, -5479.79, -3968.8, 259.671, 3.11807, 8503, 'Ighal''for - Mergothid at the altar'),
(6267130, 48, 0, 14, 8734, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 8503, 'Ighal''for - the channel ends'),
(6267130, 48, 1, 4, 46, 65664, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 8503, 'Ighal''for - attackable'),
(6267130, 48, 2, 59, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 8503, 'Ighal''for - aggressive'),
(6267130, 48, 3, 42, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 8503, 'Ighal''for - melee'),
(6267130, 48, 4, 43, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 8503, 'Ighal''for - combat movement'),
(6267130, 48, 5, 44, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 8503, 'Ighal''for - phase 0'),
(6267130, 48, 6, 49, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 8503, 'Ighal''for - back at the zone'),
(6267130, 48, 7, 0, 1, 0, 0, 0, 62673, 60, 8, 2, 818086, 0, 0, 0, 0, 0, 0, 0, 8503, 'Mergothid - "Too soon, incessant weakling."'),
(6267130, 48, 8, 4, 46, 65664, 2, 0, 62673, 60, 8, 2, 0, 0, 0, 0, 0, 0, 0, 0, 8503, 'Mergothid - attackable'),
(6267130, 48, 9, 59, 2, 0, 0, 0, 62673, 60, 8, 2, 0, 0, 0, 0, 0, 0, 0, 0, 8503, 'Mergothid - aggressive'),
(6267130, 48, 10, 49, 0, 0, 0, 0, 62673, 60, 8, 2, 0, 0, 0, 0, 0, 0, 0, 0, 8503, 'Mergothid - at the zone'),
(6267130, 48, 11, 37, 8, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 8503, 'Ighal''for - the channel over (slot 8)'),
(6267132, 0, 0, 18, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Rifttorn Nether Imp - gone, Ighal''for''s channel over');

DELETE FROM `gameobject_scripts` WHERE `id` IN (5025429, 5025430, 5025431, 5025432);
INSERT INTO `gameobject_scripts`
(`id`, `delay`, `priority`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`)
VALUES
(5025429, 0, 0, 37, 4, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Chamber Lever 1 - pulled (slot 4)'),
(5025429, 0, 1, 80, 2, 0, 0, 0, 5025428, 0, 12, 2, 0, 0, 0, 0, 0, 0, 0, 0, 818014, 'the secret door - open, all four pulled'),
(5025430, 0, 0, 37, 5, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Chamber Lever 2 - pulled (slot 5)'),
(5025430, 0, 1, 80, 2, 0, 0, 0, 5025428, 0, 12, 2, 0, 0, 0, 0, 0, 0, 0, 0, 818014, 'the secret door - open, all four pulled'),
(5025431, 0, 0, 37, 6, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Chamber Lever 3 - pulled (slot 6)'),
(5025431, 0, 1, 80, 2, 0, 0, 0, 5025428, 0, 12, 2, 0, 0, 0, 0, 0, 0, 0, 0, 818014, 'the secret door - open, all four pulled'),
(5025432, 0, 0, 37, 7, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Chamber Lever 4 - pulled (slot 7)'),
(5025432, 0, 1, 80, 2, 0, 0, 0, 5025428, 0, 12, 2, 0, 0, 0, 0, 0, 0, 0, 0, 818014, 'the secret door - open, all four pulled');

-- The generic store's slots (AC7; the table from ac7_instance_data_slot.sql).
DELETE FROM `instance_data_slot` WHERE `map` = 818 AND `slot` = 4;
DELETE FROM `instance_data_slot` WHERE `map` = 818 AND `slot` = 5;
DELETE FROM `instance_data_slot` WHERE `map` = 818 AND `slot` = 6;
DELETE FROM `instance_data_slot` WHERE `map` = 818 AND `slot` = 7;
DELETE FROM `instance_data_slot` WHERE `map` = 818 AND `slot` = 8;
INSERT INTO `instance_data_slot`
(`map`, `slot`, `flags`, `name`)
VALUES
(818, 4, 4, 'Chamber Lever 1 pulled'),
(818, 5, 4, 'Chamber Lever 2 pulled'),
(818, 6, 4, 'Chamber Lever 3 pulled'),
(818, 7, 4, 'Chamber Lever 4 pulled'),
(818, 8, 1, 'Ighal''for channelling at the Bloodstone');

