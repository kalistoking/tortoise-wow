-- Dire Maul (map 429), first pass: Tendris, Zevrim, Ironbark, Immol'thar, Pusillin, King Gordok and Cho'Rush: its C++ as rows -- EPIC10 tier 2.
-- Written by the trt repo's scripts/tier2/a26_dire_maul.py from d6_world; dire_maul_restore.sql puts
-- back what this replaces. R8: a person applies it, into the world database.
--
-- The C++ keeps its script names: mod-dire-maul is the switch (AM1, handoff/manager-091).
-- Loaded, the C++ runs as before -- a script found by name comes first. Unloaded
-- (`module unload mod-dire-maul`, which gives every creature standing a new AI at once),
-- the names find no script and the creatures run these rows (their ai_name).
--
-- Loaded, mod-dire-maul runs the C++ (instance, creatures, ritual); unloaded, these rows. Rows that read a
-- slot of 12 and up run only where the module is unloaded (ROWS_MAP). Not as the C++: Immol'thar's 5 s
-- no-target reset and the Mana Fiend visual (25681) of his and Tendris's pulls are left out; Pusillin's
-- menus show his own npc_texts (6877-6881, the C++ sent missing ones); Cho'Rush's heals take a friend
-- missing 40 % (the C++ 15000 health), his range is the 3D distance, and his sets' weapons (equipment
-- 12070-12072, which the world lacks) were never loaded; King Gordok's Sunder Armor keeps its 5-15 s pace
-- on a victim with five stacks (the C++ 15-25 s).
-- What rows cannot say: the loot recipient removed after the tribute; Shield Charge at the farthest player
-- (a random one in sight); the formation speed of the Residual Monstrosity; Old Ironbark's door 181496 (no
-- spawn); Ferra's no-call-for-assistance and her z < 10 aggro guard; Tortheldrin's Counterspell only on a
-- target that casts; Alzzin's minions' follow and 30-yd line-of-sight aggro (his evade check is the
-- distance to his lair); Kalendris' melee/range intent (the C++ flag is never initialised).
-- The ritual: the nodes' auras go to the nearest player within 100 yd of the pedestal (the C++ kept the ritual
-- player); the first wave is the intended ring of 63 yd (the C++ coordinates accumulate), later waves come at
-- a random angle 63 yd from the pedestal; the nodes' breaking keeps the C++ pace (35-45 s, then 41 s or 70 s
-- each by chance, without its 390 s tracker); a failed ritual restarted before its old timeline has run out
-- (about 8 minutes) meets that timeline's steps; J'eevee's walk and texts stay the core's; the nodes, runes
-- and circle stay a day at most (RESPAWN_GO has no despawn time for good; the C++ until a fail or the second part).
-- Slip'kik's 3 s combat-bug watch starts as his Shield Charge lands (the C++ as it is cast). Stomper Kreeg's
-- world rule 1432206 (6 = SPECIAL) runs only where the C++ instance script is; on a rows map his death counts
-- as the other guards' do.

UPDATE `creature_template` SET `ai_name` = 'EventAI' WHERE `entry` = 11441;
UPDATE `creature_template` SET `ai_name` = 'EventAI' WHERE `entry` = 11480;
UPDATE `creature_template` SET `ai_name` = 'EventAI' WHERE `entry` = 11483;
UPDATE `creature_template` SET `ai_name` = 'EventAI' WHERE `entry` = 11484;
UPDATE `creature_template` SET `ai_name` = 'EventAI' WHERE `entry` = 11486;
UPDATE `creature_template` SET `ai_name` = 'EventAI' WHERE `entry` = 11487;
UPDATE `creature_template` SET `ai_name` = 'EventAI' WHERE `entry` = 11490;
UPDATE `creature_template` SET `ai_name` = 'EventAI' WHERE `entry` = 11491;
UPDATE `creature_template` SET `ai_name` = 'EventAI' WHERE `entry` = 11492;
UPDATE `creature_template` SET `ai_name` = 'EventAI' WHERE `entry` = 11496;
UPDATE `creature_template` SET `ai_name` = 'EventAI' WHERE `entry` = 11501;
UPDATE `creature_template` SET `gossip_menu_id` = 1424100 WHERE `entry` = 14241;
UPDATE `creature_template` SET `ai_name` = 'EventAI' WHERE `entry` = 14308;
UPDATE `creature_template` SET `ai_name` = 'EventAI', `gossip_menu_id` = 1432100 WHERE `entry` = 14321;
UPDATE `creature_template` SET `ai_name` = 'EventAI', `gossip_menu_id` = 1432300 WHERE `entry` = 14323;
UPDATE `creature_template` SET `ai_name` = 'EventAI' WHERE `entry` = 14324;
UPDATE `creature_template` SET `ai_name` = 'EventAI', `gossip_menu_id` = 1432500 WHERE `entry` = 14325;
UPDATE `creature_template` SET `ai_name` = 'EventAI', `gossip_menu_id` = 1432600 WHERE `entry` = 14326;
UPDATE `creature_template` SET `gossip_menu_id` = 1433800, `npc_flags` = 3 WHERE `entry` = 14338;
UPDATE `creature_template` SET `ai_name` = 'EventAI', `gossip_menu_id` = 1435300 WHERE `entry` = 14353;
UPDATE `creature_template` SET `ai_name` = 'EventAI', `faction` = 35, `scale` = 0.5, `gossip_menu_id` = 1435400 WHERE `entry` = 14354;
UPDATE `creature_template` SET `ai_name` = 'EventAI' WHERE `entry` = 14502;
UPDATE `creature_template` SET `ai_name` = 'EventAI' WHERE `entry` = 14506;

DELETE FROM `conditions` WHERE `condition_entry` IN (429002, 429004, 429005, 429007, 429014, 429016, 429017, 429018, 429019, 429020, 429022, 429023, 429024, 429038, 429039, 429040, 429041, 429042, 429043, 429045, 429052, 429054, 429055, 429056, 429057, 429058, 429059, 429064, 429065, 429066, 429067, 429069, 429070, 429071, 429072, 429073, 429074, 429075, 429076, 429077, 429078, 429079, 429082, 429083, 429084, 429085, 429086, 429087, 429088, 429089, 429090, 429091, 429093, 429096, 429097, 429098, 429100, 429101, 429102, 429103, 429104, 429105, 429106, 429107, 429108, 429109, 429110, 429111, 429112, 429113, 429114, 429115, 429116, 429117, 429118);
INSERT INTO `conditions`
(`condition_entry`, `type`, `value1`, `value2`, `value3`, `value4`, `flags`)
VALUES
(429002, 16, 11491, 0, 0, 0, 0),
(429004, -1, 33003, 429002, 0, 0, 0),
(429005, 38, 7, 1, 0, 0, 0),
(429007, -1, 999, 1000, 0, 0, 0),
(429014, 38, 30, 2, 0, 0, 0),
(429016, 42, 5, 1, 0, 0, 2),
(429017, -1, 209012, 429014, 189002, 429016, 0),
(429018, -1, 429017, 429017, 0, 0, 1),
(429019, 56, 1, 6, 0, 0, 2),
(429020, 56, 1, 8, 0, 0, 2),
(429022, 20, 11483, 20, 0, 0, 1),
(429023, 20, 11480, 20, 0, 0, 1),
(429024, -1, 429022, 429023, 0, 0, 0),
(429038, 34, 17, 1, 0, 0, 0),
(429039, 34, 18, 1, 0, 0, 0),
(429040, 34, 19, 1, 0, 0, 0),
(429041, 34, 20, 1, 0, 0, 0),
(429042, -1, 229218, 429038, 429039, 0, 0),
(429043, -1, 429042, 429040, 429041, 0, 0),
(429045, -1, 429043, 349003, 43001, 0, 0),
(429052, 1, 22856, 0, 0, 0, 0),
(429054, -1, 429052, 119, 0, 0, 0),
(429055, 63, 0, 0, 0, 0, 0),
(429056, -1, 43001, 229237, 0, 0, 0),
(429057, -1, 43001, 230040, 0, 0, 0),
(429058, 54, 495, 482, 29, 75, 2),
(429059, 54, 495, 482, 29, 75, 3),
(429064, 1, 22799, 0, 0, 0, 0),
(429065, 1, 22799, 0, 0, 0, 1),
(429066, 34, 15, 0, 0, 0, 0),
(429067, -1, 43001, 429066, 0, 0, 0),
(429069, -1, 43001, 229217, 0, 0, 0),
(429070, 34, 15, 2, 0, 0, 0),
(429071, -1, 43001, 429070, 0, 0, 0),
(429072, 34, 15, 3, 0, 0, 0),
(429073, -1, 43001, 429072, 0, 0, 0),
(429074, 34, 15, 4, 0, 0, 0),
(429075, -1, 43001, 429074, 0, 0, 0),
(429076, 34, 15, 5, 0, 0, 0),
(429077, -1, 43001, 429076, 0, 0, 0),
(429078, 34, 15, 6, 0, 0, 0),
(429079, -1, 43001, 429078, 0, 0, 0),
(429082, -1, 43001, 230050, 0, 0, 0),
(429083, 21, 179512, 2, 0, 0, 0),
(429084, 8, 5518, 0, 0, 0, 0),
(429085, 7, 165, 275, 0, 0, 0),
(429086, 17, 22815, 1, 0, 0, 0),
(429087, -1, 429084, 429085, 429086, 0, 0),
(429088, 7, 197, 275, 0, 0, 0),
(429089, 17, 22813, 1, 0, 0, 0),
(429090, -1, 429084, 429088, 429089, 0, 0),
(429091, 56, 1, 7, 0, 0, 2),
(429093, 54, 275, -427, -120, 40, 3),
(429096, 34, 21, 0, 0, 0, 0),
(429097, 34, 21, 1, 0, 0, 0),
(429098, 34, 21, 2, 0, 0, 0),
(429100, 34, 21, 4, 0, 0, 0),
(429101, -2, 429097, 429098, 0, 0, 0),
(429102, -1, 43001, 429096, 0, 0, 0),
(429103, -1, 43001, 409321, 0, 0, 0),
(429104, 34, 22, 1, 0, 0, 0),
(429105, 34, 23, 1, 0, 0, 0),
(429106, 34, 24, 1, 0, 0, 0),
(429107, 34, 22, 1, 0, 0, 1),
(429108, 34, 23, 1, 0, 0, 1),
(429109, 34, 24, 1, 0, 0, 1),
(429110, -1, 429104, 429105, 429106, 0, 0),
(429111, -1, 429104, 429105, 0, 0, 0),
(429112, -1, 429104, 429106, 0, 0, 0),
(429113, -1, 429105, 429106, 0, 0, 0),
(429114, -2, 429111, 429112, 429113, 0, 0),
(429115, -2, 429111, 429112, 429113, 0, 1),
(429116, -1, 429098, 429107, 43001, 0, 0),
(429117, -1, 429098, 429108, 43001, 0, 0),
(429118, -1, 429098, 429109, 43001, 0, 0);

-- Conditions another tier-2 migration writes too, under the same entry: whichever comes first.
INSERT IGNORE INTO `conditions`
(`condition_entry`, `type`, `value1`, `value2`, `value3`, `value4`, `flags`)
VALUES
(33003, 34, 4, 3, 0, 0, 0),
(229240, 34, 9, 0, 0, 0, 0),
(229241, 34, 9, 1, 0, 0, 0),
(229242, 34, 9, 2, 0, 0, 0),
(229243, 34, 9, 3, 0, 0, 0),
(209012, 38, 5, 1, 0, 0, 0),
(189002, 37, 0, 0, 0, 0, 0),
(43001, 63, 0, 0, 0, 0, 1),
(229218, 34, 16, 1, 0, 0, 0),
(349003, 34, 1, 3, 0, 0, 1),
(209001, 34, 1, 0, 0, 0, 0),
(532001, 34, 1, 3, 0, 0, 0),
(229237, 34, 6, 3, 0, 0, 1),
(230040, 34, 6, 3, 0, 0, 0),
(469110, 34, 8, 3, 0, 0, 0),
(229217, 34, 15, 1, 0, 0, 0),
(230050, 34, 7, 3, 0, 0, 0),
(807003, 41, 49, 2, 0, 0, 2),
(48002, 34, 11, 3, 0, 0, 0),
(409321, 34, 21, 3, 0, 0, 0);

DELETE FROM `broadcast_text` WHERE `entry` IN (1148910, 1150110, 4295110, 4295120, 4295130, 4295140, 4295150, 4295160, 4295170, 4295180, 4295190, 4295200, 4295210, 4295220, 4295230, 4295240, 4295250, 4295260);
INSERT INTO `broadcast_text`
(`entry`, `male_text`, `female_text`, `chat_type`, `sound_id`, `language_id`, `emote_id1`, `emote_id2`, `emote_id3`, `emote_delay1`, `emote_delay2`, `emote_delay3`)
VALUES
(1148910, 'You do not belong here!  Ancients, rise against these intruders!', 'You do not belong here!  Ancients, rise against these intruders!', 1, 0, 0, 0, 0, 0, 0, 0, 0),
(1150110, 'You no challenge me, scrubs! I''m da king now, and I stay king FOREVER!!!', 'You no challenge me, scrubs! I''m da king now, and I stay king FOREVER!!!', 0, 0, 0, 0, 0, 0, 0, 0, 0),
(4295110, '%s lets out a deep roar, alerting nearby allies and becoming enraged!', '%s lets out a deep roar, alerting nearby allies and becoming enraged!', 2, 0, 0, 0, 0, 0, 0, 0, 0),
(4295120, '%s lets out a deep roar, alerting nearby allies and becoming enraged!', '%s lets out a deep roar, alerting nearby allies and becoming enraged!', 2, 0, 0, 0, 0, 0, 0, 0, 0),
(4295130, '%s lets out a deep roar, alerting nearby allies and becoming enraged!', '%s lets out a deep roar, alerting nearby allies and becoming enraged!', 2, 0, 0, 0, 0, 0, 0, 0, 0),
(4295140, 'OK Fengus, where you at?! You come call me a gnoll lover while I give you da hammer upside da head!', 'OK Fengus, where you at?! You come call me a gnoll lover while I give you da hammer upside da head!', 1, 0, 0, 0, 0, 0, 0, 0, 0),
(4295150, 'Hey, who Fengus callin'' a gnoll lover?! Take da prisoners to da king; you smart to bring them with their weapons and show da king that they a threat. I''ll go see if Fengus talk smack when I give him da beatdown! HAR!', 'Hey, who Fengus callin'' a gnoll lover?! Take da prisoners to da king; you smart to bring them with their weapons and show da king that they a threat. I''ll go see if Fengus talk smack when I give him da beatdown! HAR!', 1, 0, 0, 0, 0, 0, 0, 0, 0),
(4295160, 'No one get past me and threaten da king!  Ungh, take it!!', 'No one get past me and threaten da king!  Ungh, take it!!', 0, 0, 0, 0, 0, 0, 0, 0, 0),
(4295170, '%s begins to retaliate all attacks against him!', '%s begins to retaliate all attacks against him!', 2, 0, 0, 0, 0, 0, 0, 0, 0),
(4295180, 'Help me crush these punys!', 'Help me crush these punys!', 1, 0, 0, 0, 0, 0, 0, 0, 0),
(4295190, 'OH NOES! Da king is dead! Uh... hail to da new king! Yeah!', 'OH NOES! Da king is dead! Uh... hail to da new king! Yeah!', 6, 0, 0, 0, 0, 0, 0, 0, 0),
(4295200, 'Yar, he''s dead all right. That makes you da new king.. well, all of you! Gordok is yours now, boss! You should talk to me so you can learn everything there is about being da king! I was... is his assistant! Yeah, that''s why I''m called da crafty one!', 'Yar, he''s dead all right. That makes you da new king.. well, all of you! Gordok is yours now, boss! You should talk to me so you can learn everything there is about being da king! I was... is his assistant! Yeah, that''s why I''m called da crafty one!', 0, 0, 0, 0, 0, 0, 0, 0, 0),
(4295210, 'Raaar!!! Me smash %s!', 'Raaar!!! Me smash %s!', 0, 0, 0, 0, 0, 0, 0, 0, 0),
(4295220, 'Gordok Brute puts his club away and begins swinging wildly!', 'Gordok Brute puts his club away and begins swinging wildly!', 2, 0, 0, 0, 0, 0, 0, 0, 0),
(4295230, 'Xorothian Imp is pulled back to Xoroth!', 'Xorothian Imp is pulled back to Xoroth!', 2, 0, 0, 0, 0, 0, 0, 0, 0),
(4295240, 'Dread Guard is pulled back to Xoroth!', 'Dread Guard is pulled back to Xoroth!', 2, 0, 0, 0, 0, 0, 0, 0, 0),
(4295250, 'Ah freedom! Although brief, so sweet it is...', 'Ah freedom! Although brief, so sweet it is...', 1, 0, 0, 0, 0, 0, 0, 0, 0),
(4295260, 'Who dares steal my precious mount? You will pay for your insolence, mortal!', 'Who dares steal my precious mount? You will pay for your insolence, mortal!', 1, 0, 0, 0, 0, 0, 0, 0, 0);

-- Existing rows taken away: the restore puts them back.
DELETE FROM `creature_ai_events` WHERE `id` = 1149001;
DELETE FROM `creature_ai_scripts` WHERE `id` = 1149001;
DELETE FROM `creature_ai_events` WHERE `id` = 1149002;
DELETE FROM `creature_ai_scripts` WHERE `id` = 1149002;
DELETE FROM `creature_ai_events` WHERE `id` = 1148905;
DELETE FROM `creature_ai_scripts` WHERE `id` = 1148905;
DELETE FROM `creature_ai_events` WHERE `id` = 1149601;
DELETE FROM `creature_ai_scripts` WHERE `id` = 1149601;
DELETE FROM `creature_ai_events` WHERE `id` = 1149602;
DELETE FROM `creature_ai_scripts` WHERE `id` = 1149602;
DELETE FROM `creature_ai_events` WHERE `id` = 1149603;
DELETE FROM `creature_ai_scripts` WHERE `id` = 1149603;
DELETE FROM `creature_ai_events` WHERE `id` = 1149604;
DELETE FROM `creature_ai_scripts` WHERE `id` = 1149604;
DELETE FROM `creature_ai_events` WHERE `id` = 1149605;
DELETE FROM `creature_ai_scripts` WHERE `id` = 1149605;
DELETE FROM `creature_ai_events` WHERE `id` = 1150101;
DELETE FROM `creature_ai_scripts` WHERE `id` = 1150101;
DELETE FROM `creature_ai_events` WHERE `id` = 1150102;
DELETE FROM `creature_ai_scripts` WHERE `id` = 1150102;
DELETE FROM `creature_ai_events` WHERE `id` = 1150103;
DELETE FROM `creature_ai_scripts` WHERE `id` = 1150103;
DELETE FROM `creature_ai_events` WHERE `id` = 1150104;
DELETE FROM `creature_ai_scripts` WHERE `id` = 1150104;
DELETE FROM `creature_ai_events` WHERE `id` = 1150105;
DELETE FROM `creature_ai_scripts` WHERE `id` = 1150105;
DELETE FROM `creature_ai_events` WHERE `id` = 1150106;
DELETE FROM `creature_ai_scripts` WHERE `id` = 1150106;
DELETE FROM `creature_ai_events` WHERE `id` = 1148301;
DELETE FROM `creature_ai_scripts` WHERE `id` = 1148301;
DELETE FROM `creature_ai_events` WHERE `id` = 1148302;
DELETE FROM `creature_ai_scripts` WHERE `id` = 1148302;
DELETE FROM `creature_ai_events` WHERE `id` = 1148001;
DELETE FROM `creature_ai_scripts` WHERE `id` = 1148001;
DELETE FROM `creature_ai_events` WHERE `id` = 1148002;
DELETE FROM `creature_ai_scripts` WHERE `id` = 1148002;
DELETE FROM `creature_ai_events` WHERE `id` = 1148403;
DELETE FROM `creature_ai_scripts` WHERE `id` = 1148403;
DELETE FROM `creature_ai_events` WHERE `id` = 1148606;
DELETE FROM `creature_ai_scripts` WHERE `id` = 1148606;
DELETE FROM `creature_ai_events` WHERE `id` = 1146001;
DELETE FROM `creature_ai_scripts` WHERE `id` = 1146001;
DELETE FROM `creature_ai_events` WHERE `id` = 1432504;
DELETE FROM `creature_ai_scripts` WHERE `id` = 1432504;
DELETE FROM `creature_ai_events` WHERE `id` = 1432503;
DELETE FROM `creature_ai_scripts` WHERE `id` = 1432503;
DELETE FROM `creature_ai_events` WHERE `id` = 1432309;
DELETE FROM `creature_ai_scripts` WHERE `id` = 1432309;
DELETE FROM `creature_ai_events` WHERE `id` = 1148604;
DELETE FROM `creature_ai_scripts` WHERE `id` = 1148604;
DELETE FROM `creature_ai_events` WHERE `id` = 1148603;
DELETE FROM `creature_ai_scripts` WHERE `id` = 1148603;
DELETE FROM `creature_ai_events` WHERE `id` = 1148602;
DELETE FROM `creature_ai_scripts` WHERE `id` = 1148602;
DELETE FROM `creature_ai_events` WHERE `id` = 1148601;
DELETE FROM `creature_ai_scripts` WHERE `id` = 1148601;
DELETE FROM `creature_ai_events` WHERE `id` = 1148702;
DELETE FROM `creature_ai_scripts` WHERE `id` = 1148702;
DELETE FROM `creature_ai_events` WHERE `id` = 1148706;
DELETE FROM `creature_ai_scripts` WHERE `id` = 1148706;
DELETE FROM `creature_ai_events` WHERE `id` = 1148705;
DELETE FROM `creature_ai_scripts` WHERE `id` = 1148705;
DELETE FROM `creature_ai_events` WHERE `id` = 1148704;
DELETE FROM `creature_ai_scripts` WHERE `id` = 1148704;
DELETE FROM `creature_ai_events` WHERE `id` = 1148703;
DELETE FROM `creature_ai_scripts` WHERE `id` = 1148703;
DELETE FROM `creature_ai_events` WHERE `id` = 1148701;
DELETE FROM `creature_ai_scripts` WHERE `id` = 1148701;
DELETE FROM `creature_ai_events` WHERE `id` = 1430803;
DELETE FROM `creature_ai_scripts` WHERE `id` = 1430803;
DELETE FROM `creature_ai_events` WHERE `id` = 1430802;
DELETE FROM `creature_ai_scripts` WHERE `id` = 1430802;
DELETE FROM `creature_ai_events` WHERE `id` = 1432105;
DELETE FROM `creature_ai_scripts` WHERE `id` = 1432105;
DELETE FROM `creature_ai_events` WHERE `id` = 1432104;
DELETE FROM `creature_ai_scripts` WHERE `id` = 1432104;
DELETE FROM `creature_ai_events` WHERE `id` = 1432102;
DELETE FROM `creature_ai_scripts` WHERE `id` = 1432102;
DELETE FROM `creature_ai_events` WHERE `id` = 1432601;
DELETE FROM `creature_ai_scripts` WHERE `id` = 1432601;
DELETE FROM `creature_ai_events` WHERE `id` = 1432307;
DELETE FROM `creature_ai_scripts` WHERE `id` = 1432307;
DELETE FROM `creature_ai_events` WHERE `id` = 1432301;
DELETE FROM `creature_ai_scripts` WHERE `id` = 1432301;
DELETE FROM `creature_ai_events` WHERE `id` = 1432302;
DELETE FROM `creature_ai_scripts` WHERE `id` = 1432302;
DELETE FROM `creature_ai_events` WHERE `id` = 1432304;
DELETE FROM `creature_ai_scripts` WHERE `id` = 1432304;
DELETE FROM `creature_ai_events` WHERE `id` = 1432107;
DELETE FROM `creature_ai_scripts` WHERE `id` = 1432107;
DELETE FROM `creature_ai_events` WHERE `id` = 1432305;
DELETE FROM `creature_ai_scripts` WHERE `id` = 1432305;
DELETE FROM `creature_ai_events` WHERE `id` = 1432502;
DELETE FROM `creature_ai_scripts` WHERE `id` = 1432502;
DELETE FROM `creature_ai_events` WHERE `id` = 1432501;
DELETE FROM `creature_ai_scripts` WHERE `id` = 1432501;
DELETE FROM `creature_ai_events` WHERE `id` = 1432505;
DELETE FROM `creature_ai_scripts` WHERE `id` = 1432505;
DELETE FROM `creature_ai_events` WHERE `id` = 1432508;
DELETE FROM `creature_ai_scripts` WHERE `id` = 1432508;
DELETE FROM `creature_ai_events` WHERE `id` = 1432507;
DELETE FROM `creature_ai_scripts` WHERE `id` = 1432507;
DELETE FROM `creature_ai_events` WHERE `id` = 1432605;
DELETE FROM `creature_ai_scripts` WHERE `id` = 1432605;
DELETE FROM `creature_ai_events` WHERE `id` = 1432604;
DELETE FROM `creature_ai_scripts` WHERE `id` = 1432604;
DELETE FROM `creature_ai_events` WHERE `id` = 1432602;
DELETE FROM `creature_ai_scripts` WHERE `id` = 1432602;
DELETE FROM `creature_ai_events` WHERE `id` = 1432101;
DELETE FROM `creature_ai_scripts` WHERE `id` = 1432101;
DELETE FROM `creature_ai_events` WHERE `id` = 1430801;
DELETE FROM `creature_ai_scripts` WHERE `id` = 1430801;
DELETE FROM `creature_ai_events` WHERE `id` = 1432506;
DELETE FROM `creature_ai_scripts` WHERE `id` = 1432506;
DELETE FROM `creature_ai_events` WHERE `id` = 1432607;
DELETE FROM `creature_ai_scripts` WHERE `id` = 1432607;
DELETE FROM `creature_ai_events` WHERE `id` = 1435301;
DELETE FROM `creature_ai_scripts` WHERE `id` = 1435301;
DELETE FROM `creature_ai_events` WHERE `id` = 1432308;
DELETE FROM `creature_ai_scripts` WHERE `id` = 1432308;
DELETE FROM `creature_ai_events` WHERE `id` = 1432108;
DELETE FROM `creature_ai_scripts` WHERE `id` = 1432108;
DELETE FROM `creature_ai_events` WHERE `id` = 1432310;
DELETE FROM `creature_ai_scripts` WHERE `id` = 1432310;
DELETE FROM `creature_ai_events` WHERE `id` = 1432608;
DELETE FROM `creature_ai_scripts` WHERE `id` = 1432608;
DELETE FROM `creature_ai_events` WHERE `id` = 1432509;
DELETE FROM `creature_ai_scripts` WHERE `id` = 1432509;
DELETE FROM `creature_ai_events` WHERE `id` = 1144101;
DELETE FROM `creature_ai_scripts` WHERE `id` = 1144101;
DELETE FROM `creature_ai_events` WHERE `id` = 1144102;
DELETE FROM `creature_ai_scripts` WHERE `id` = 1144102;
DELETE FROM `creature_ai_events` WHERE `id` = 1144104;
DELETE FROM `creature_ai_scripts` WHERE `id` = 1144104;
DELETE FROM `creature_ai_events` WHERE `id` = 1144105;
DELETE FROM `creature_ai_scripts` WHERE `id` = 1144105;
DELETE FROM `event_scripts` WHERE `id` = 8428;
DELETE FROM `creature_ai_events` WHERE `id` = 1450201;
DELETE FROM `creature_ai_scripts` WHERE `id` = 1450201;
DELETE FROM `creature_ai_events` WHERE `id` IN (1144160, 1144163, 1144164, 1144165, 1144166, 1144167, 1144168, 1148060, 1148061, 1148062, 1148360, 1148361, 1148362, 1148460, 1148461, 1148462, 1148660, 1148661, 1148662, 1148663, 1148664, 1148665, 1148666, 1148760, 1148761, 1148762, 1148763, 1148764, 1148765, 1148766, 1148767, 1148768, 1148910, 1148911, 1148912, 1148913, 1148914, 1148915, 1148916, 1149010, 1149011, 1149012, 1149101, 1149102, 1149260, 1149262, 1149264, 1149266, 1149267, 1149268, 1149269, 1149270, 1149271, 1149272, 1149273, 1149274, 1149275, 1149276, 1149277, 1149278, 1149279, 1149280, 1149281, 1149282, 1149283, 1149610, 1149611, 1149612, 1149613, 1149614, 1149615, 1149616, 1149660, 1149661, 1150110, 1150111, 1150112, 1150113, 1150114, 1150115, 1150160, 1430860, 1430861, 1430862, 1432160, 1432161, 1432162, 1432163, 1432164, 1432165, 1432166, 1432167, 1432168, 1432169, 1432260, 1432360, 1432361, 1432362, 1432363, 1432364, 1432365, 1432366, 1432367, 1432368, 1432369, 1432370, 1432371, 1432372, 1432401, 1432402, 1432403, 1432404, 1432405, 1432410, 1432411, 1432412, 1432414, 1432415, 1432416, 1432417, 1432418, 1432419, 1432420, 1432421, 1432422, 1432423, 1432424, 1432425, 1432426, 1432460, 1432461, 1432462, 1432560, 1432561, 1432562, 1432563, 1432564, 1432565, 1432566, 1432567, 1432568, 1432660, 1432661, 1432662, 1432663, 1432664, 1432665, 1432666, 1432667, 1432668, 1432669, 1432670, 1435360, 1435361, 1435401, 1435402, 1450260, 1450261, 1450660, 1450661, 1450662, 1450663);
INSERT INTO `creature_ai_events`
(`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`)
VALUES
(1149010, 11490, 0, 0, 0, 100, 5, 5000, 9000, 20000, 26000, 1149010, 0, 0, 'Zevrim Thornhoof - Intense Pain'),
(1149011, 11490, 0, 0, 0, 100, 13, 9000, 12000, 15000, 18000, 1149011, 0, 0, 'Zevrim Thornhoof - Sacrifice at a random player, until it takes'),
(1149012, 11490, 0, 6, 0, 100, 0, 0, 0, 0, 0, 1149012, 0, 0, 'Zevrim Thornhoof - dead (4 = DONE)'),
(1149101, 11491, 429004, 1, 0, 100, 1, 1000, 1000, 1000, 1000, 1149101, 0, 0, 'Old Ironbark - Zevrim dead (4 = DONE): Ironbark the Redeemed'),
(1149102, 11491, 0, 29, 0, 100, 1, 8, 1, 0, 0, 1149102, 0, 0, 'Ironbark the Redeemed - at the door (point 1): breaks it and dies'),
(1148910, 11489, 0, 4, 0, 100, 0, 0, 0, 0, 0, 1148910, 0, 0, 'Tendris Warpwood - aggro: his yell, every Ironbark Protector into the fight'),
(1148911, 11489, 0, 0, 0, 100, 5, 5000, 9000, 9000, 14000, 1148911, 0, 0, 'Tendris Warpwood - Trample'),
(1148912, 11489, 0, 0, 0, 100, 5, 2000, 4000, 12000, 15000, 1148912, 0, 0, 'Tendris Warpwood - Uppercut'),
(1148913, 11489, 0, 0, 0, 100, 5, 9000, 12000, 17000, 22000, 1148913, 0, 0, 'Tendris Warpwood - Grasping Vines'),
(1148914, 11489, 0, 2, 0, 100, 1, 30, 0, 1000, 1000, 1148914, 0, 0, 'Tendris Warpwood - under 30 %: Enrage, kept up'),
(1148915, 11489, 429005, 0, 0, 100, 9, 0, 0, 10000, 15000, 1148915, 0, 0, 'Tendris Warpwood - a victim more than 7 yd away pulled to him and entangled'),
(1148916, 11489, 0, 6, 0, 100, 0, 0, 0, 0, 0, 1148916, 0, 0, 'Tendris Warpwood - dead: the spirit at his killer for a minute'),
(1149610, 11496, 0, 0, 0, 100, 5, 5000, 9000, 9000, 14000, 1149610, 0, 0, 'Immol''thar - Trample'),
(1149611, 11496, 0, 0, 0, 100, 5, 2000, 4000, 8000, 12000, 1149611, 0, 0, 'Immol''thar - Infected Bite'),
(1149612, 11496, 0, 0, 0, 100, 5, 7000, 12000, 15000, 22000, 1149612, 0, 0, 'Immol''thar - an Eye of Immol''thar at his victim'),
(1149613, 11496, 0, 0, 0, 100, 5, 10000, 14000, 17000, 24000, 1149613, 0, 0, 'Immol''thar - a random player pulled to him, threat wiped'),
(1149614, 11496, 0, 0, 0, 100, 1, 50000, 50000, 1000, 1000, 1149614, 0, 0, 'Immol''thar - after 50 s: Enrage, kept up'),
(1149615, 11496, 0, 7, 0, 100, 0, 0, 0, 0, 0, 1149615, 0, 0, 'Immol''thar - evading: his eyes gone'),
(1149616, 11496, 0, 6, 0, 100, 0, 0, 0, 0, 0, 1149616, 0, 0, 'Immol''thar - dead (2 = DONE)'),
(1435401, 14354, 0, 4, 0, 100, 0, 0, 0, 0, 0, 1435401, 0, 0, 'Pusillin - aggro: the imps within 100 yd join'),
(1435402, 14354, 0, 0, 254, 100, 1, 0, 0, 100, 100, 1435402, 1435403, 1435404, 'Pusillin - one of Fireball, Fire Blast and Blast Wave, then its pause'),
(1150110, 11501, 0, 4, 0, 100, 0, 0, 0, 0, 0, 1150110, 0, 0, 'King Gordok - aggro: his line'),
(1150111, 11501, 0, 0, 0, 100, 1, 4000, 8000, 5000, 15000, 1150111, 0, 0, 'King Gordok - Sunder Armor'),
(1150112, 11501, 0, 0, 0, 100, 9, 15000, 25000, 12000, 20000, 1150112, 0, 0, 'King Gordok - Mortal Strike, until it takes'),
(1150113, 11501, 0, 0, 0, 100, 9, 7000, 8000, 20000, 30000, 1150113, 0, 0, 'King Gordok - War Stomp, until it takes'),
(1150114, 11501, 0, 0, 0, 100, 9, 9000, 12000, 25000, 30000, 1150114, 0, 0, 'King Gordok - Berserker Charge at a player not his victim, until it takes'),
(1150115, 11501, 0, 0, 0, 100, 1, 2500, 2500, 2500, 2500, 1150115, 0, 0, 'King Gordok - Cho''Rush the Observer into his fight, out of one'),
(1432401, 14324, 0, 0, 0, 100, 1, 2500, 2500, 2500, 2500, 1432401, 0, 0, 'Cho''Rush the Observer - King Gordok into his fight, out of one'),
(1432402, 14324, 0, 11, 0, 100, 1, 0, 0, 0, 0, 1432402, 0, 0, 'Cho''Rush the Observer - spawned: his set, drawn once per instance'),
(1432403, 14324, 429017, 0, 171, 100, 1, 500, 500, 500, 500, 1432403, 0, 0, 'Cho''Rush the Observer - at range: he stands'),
(1432404, 14324, 429018, 0, 87, 100, 1, 500, 500, 500, 500, 1432404, 0, 0, 'Cho''Rush the Observer - out of range: he closes in'),
(1432405, 14324, 0, 7, 87, 100, 0, 0, 0, 0, 0, 1432405, 0, 0, 'Cho''Rush the Observer - evading at range: in melee again'),
(1432410, 14324, 0, 0, 251, 100, 9, 1000, 2000, 7000, 10000, 1432410, 0, 0, 'Cho''Rush the Observer - Fireball (melee), until it takes'),
(1432411, 14324, 0, 0, 247, 100, 9, 1000, 2000, 3000, 4000, 1432411, 0, 0, 'Cho''Rush the Observer - Fireball (at range), until it takes'),
(1432412, 14324, 0, 0, 243, 100, 9, 1000, 2000, 10000, 20000, 1432412, 1432413, 0, 'Cho''Rush the Observer - Bloodlust on himself or King Gordok within 30 yd, until it takes'),
(1432414, 14324, 429020, 0, 251, 100, 9, 1000, 2000, 9000, 13000, 1432414, 0, 0, 'Cho''Rush the Observer - Arcane Explosion (melee), until it takes'),
(1432415, 14324, 429020, 0, 247, 100, 9, 1000, 2000, 15000, 25000, 1432415, 0, 0, 'Cho''Rush the Observer - Arcane Explosion (at range), until it takes'),
(1432416, 14324, 429020, 0, 243, 100, 9, 1000, 2000, 20000, 30000, 1432416, 0, 0, 'Cho''Rush the Observer - Frost Nova, until it takes'),
(1432417, 14324, 429019, 0, 207, 100, 9, 1000, 2000, 20000, 30000, 1432417, 0, 0, 'Cho''Rush the Observer - Earthgrab Totem, until it takes'),
(1432418, 14324, 0, 0, 207, 100, 9, 1000, 2000, 10000, 15000, 1432418, 0, 0, 'Cho''Rush the Observer - Healing Wave on the most hurt friend within 40 yd, until it takes'),
(1432419, 14324, 0, 0, 239, 100, 9, 1000, 2000, 7000, 10000, 1432419, 0, 0, 'Cho''Rush the Observer - Lightning Bolt (melee), until it takes'),
(1432420, 14324, 0, 0, 223, 100, 9, 1000, 2000, 3000, 4000, 1432420, 0, 0, 'Cho''Rush the Observer - Lightning Bolt (at range), until it takes'),
(1432421, 14324, 0, 0, 207, 100, 9, 1000, 2000, 15000, 25000, 1432421, 0, 0, 'Cho''Rush the Observer - Chain Lightning, until it takes'),
(1432422, 14324, 0, 0, 63, 100, 9, 1000, 2000, 10000, 15000, 1432422, 0, 0, 'Cho''Rush the Observer - Heal on the most hurt friend within 40 yd, until it takes'),
(1432423, 14324, 0, 0, 191, 100, 9, 1000, 2000, 7000, 10000, 1432423, 0, 0, 'Cho''Rush the Observer - Mind Blast (melee), until it takes'),
(1432424, 14324, 0, 0, 127, 100, 9, 1000, 2000, 2000, 3000, 1432424, 0, 0, 'Cho''Rush the Observer - Mind Blast (at range), until it takes'),
(1432425, 14324, 0, 0, 63, 100, 9, 1000, 2000, 17000, 22000, 1432425, 0, 0, 'Cho''Rush the Observer - Power Word: Shield on the most hurt friend within 40 yd, until it takes'),
(1432426, 14324, 429020, 0, 63, 100, 9, 1000, 2000, 15000, 20000, 1432426, 0, 0, 'Cho''Rush the Observer - Psychic Scream, until it takes'),
(1148360, 11483, 43001, 6, 0, 100, 0, 0, 0, 0, 0, 1148360, 0, 0, 'dead: the crystal whose room it was empties'),
(1148060, 11480, 43001, 6, 0, 100, 0, 0, 0, 0, 0, 1148060, 0, 0, 'dead: the crystal whose room it was empties'),
(1149660, 11496, 349003, 11, 0, 100, 0, 0, 0, 0, 0, 1149660, 0, 0, 'Immol''thar - spawned: unselectable until the crystal event is done'),
(1149661, 11496, 0, 6, 0, 100, 0, 0, 0, 0, 0, 1149661, 0, 0, 'Immol''thar - dead: Tortheldrin yells and wakes'),
(1148660, 11486, 3704, 11, 0, 100, 0, 0, 0, 0, 0, 1148660, 0, 0, 'Prince Tortheldrin - spawned after Immol''thar died: awake'),
(1148361, 11483, 0, 0, 0, 100, 5, 12000, 23000, 6000, 6000, 1148361, 0, 0, 'Mana Remnant - Blink at its victim'),
(1148362, 11483, 0, 0, 0, 100, 5, 2000, 6000, 6000, 6000, 1148362, 0, 0, 'Mana Remnant - Chain Lightning'),
(1148061, 11480, 0, 0, 0, 100, 5, 0, 400, 2400, 3800, 1148061, 0, 0, 'Arcane Aberration - Arcane Bolt'),
(1148062, 11480, 0, 2, 0, 100, 0, 5, 0, 0, 0, 1148062, 0, 0, 'Arcane Aberration - 5 % health: Mana Burn, once'),
(1148460, 11484, 0, 0, 0, 100, 5, 0, 400, 2400, 3800, 1148460, 0, 0, 'Residual Monstrosity - Arcane Bolt'),
(1148461, 11484, 0, 0, 0, 100, 5, 1000, 2500, 3800, 5200, 1148461, 0, 0, 'Residual Monstrosity - Arcane Blast'),
(1148462, 11484, 0, 6, 0, 100, 0, 0, 0, 0, 0, 1148462, 0, 0, 'Residual Monstrosity - dead: Summon Manabursts'),
(1432660, 14326, 0, 0, 0, 100, 9, 500, 500, 12000, 16000, 1432660, 0, 0, 'Guard Mol''dar - Shield Charge, until it takes'),
(1432661, 14326, 0, 13, 253, 100, 9, 10000, 15000, 0, 0, 1432661, 0, 0, 'Guard Mol''dar - Shield Bash at a victim that casts'),
(1432662, 14326, 0, 0, 0, 100, 9, 10000, 20000, 10000, 15000, 1432662, 0, 0, 'Guard Mol''dar - Strike, until it takes'),
(1432663, 14326, 0, 0, 0, 100, 9, 20000, 30000, 20000, 30000, 1432663, 0, 0, 'Guard Mol''dar - Knock Away, until it takes'),
(1432664, 14326, 0, 36, 0, 100, 1, 10101, 1, 0, 0, 1432664, 0, 0, 'Guard Mol''dar - Knock Away took: his victim loses half the threat'),
(1432665, 14326, 0, 2, 0, 100, 0, 50, 0, 0, 0, 1432665, 0, 0, 'Guard Mol''dar - under half: Enrage, a roar and the others'' help'),
(1432666, 14326, 0, 4, 0, 100, 0, 0, 0, 0, 0, 1432666, 0, 0, 'Guard Mol''dar - a fight begins: Shield Bash not ready yet (phase 0)'),
(1432667, 14326, 0, 0, 0, 100, 0, 8000, 15000, 0, 0, 1432667, 0, 0, 'Guard Mol''dar - 8-15 s into the fight: Shield Bash ready (phase 1)'),
(1432160, 14321, 0, 0, 0, 100, 9, 500, 500, 12000, 16000, 1432160, 0, 0, 'Guard Fengus - Shield Charge, until it takes'),
(1432161, 14321, 0, 13, 253, 100, 9, 10000, 15000, 0, 0, 1432161, 0, 0, 'Guard Fengus - Shield Bash at a victim that casts'),
(1432162, 14321, 0, 0, 0, 100, 9, 10000, 20000, 10000, 15000, 1432162, 0, 0, 'Guard Fengus - Strike, until it takes'),
(1432163, 14321, 0, 0, 0, 100, 9, 20000, 30000, 20000, 30000, 1432163, 0, 0, 'Guard Fengus - Knock Away, until it takes'),
(1432164, 14321, 0, 36, 0, 100, 1, 10101, 1, 0, 0, 1432164, 0, 0, 'Guard Fengus - Knock Away took: his victim loses half the threat'),
(1432165, 14321, 0, 2, 0, 100, 0, 50, 0, 0, 0, 1432165, 0, 0, 'Guard Fengus - under half: Enrage, a roar and the others'' help'),
(1432166, 14321, 0, 4, 0, 100, 0, 0, 0, 0, 0, 1432166, 0, 0, 'Guard Fengus - a fight begins: Shield Bash not ready yet (phase 0)'),
(1432167, 14321, 0, 0, 0, 100, 0, 8000, 15000, 0, 0, 1432167, 0, 0, 'Guard Fengus - 8-15 s into the fight: Shield Bash ready (phase 1)'),
(1432360, 14323, 0, 0, 0, 100, 9, 500, 500, 12000, 16000, 1432360, 0, 0, 'Guard Slip''kik - Shield Charge, until it takes'),
(1432361, 14323, 0, 13, 253, 100, 9, 10000, 15000, 0, 0, 1432361, 0, 0, 'Guard Slip''kik - Shield Bash at a victim that casts'),
(1432362, 14323, 0, 0, 0, 100, 9, 10000, 20000, 10000, 15000, 1432362, 0, 0, 'Guard Slip''kik - Strike, until it takes'),
(1432363, 14323, 0, 0, 0, 100, 9, 20000, 30000, 20000, 30000, 1432363, 0, 0, 'Guard Slip''kik - Knock Away, until it takes'),
(1432364, 14323, 0, 36, 0, 100, 1, 10101, 1, 0, 0, 1432364, 0, 0, 'Guard Slip''kik - Knock Away took: his victim loses half the threat'),
(1432365, 14323, 0, 2, 0, 100, 0, 50, 0, 0, 0, 1432365, 0, 0, 'Guard Slip''kik - under half: Enrage, a roar and the others'' help'),
(1432366, 14323, 0, 4, 0, 100, 0, 0, 0, 0, 0, 1432366, 0, 0, 'Guard Slip''kik - a fight begins: Shield Bash not ready yet (phase 0)'),
(1432367, 14323, 0, 0, 0, 100, 0, 8000, 15000, 0, 0, 1432367, 0, 0, 'Guard Slip''kik - 8-15 s into the fight: Shield Bash ready (phase 1)'),
(1432368, 14323, 0, 36, 0, 100, 1, 15749, 1, 0, 0, 1432368, 0, 0, 'Guard Slip''kik - his Shield Charge landed: the combat bug watched for 3 s'),
(1432668, 14326, 429056, 6, 0, 100, 0, 0, 0, 0, 0, 1432668, 0, 0, 'Guard Mol''dar - dead: the tribute counts one more'),
(1432669, 14326, 429057, 6, 0, 100, 0, 0, 0, 0, 0, 1432669, 0, 0, 'Guard Mol''dar - dead after the tribute: his last words'),
(1432168, 14321, 429056, 6, 0, 100, 0, 0, 0, 0, 0, 1432168, 0, 0, 'Guard Fengus - dead: the tribute counts one more'),
(1432169, 14321, 429057, 6, 0, 100, 0, 0, 0, 0, 0, 1432169, 0, 0, 'Guard Fengus - dead after the tribute: his last words'),
(1432369, 14323, 429056, 6, 0, 100, 0, 0, 0, 0, 0, 1432369, 0, 0, 'Guard Slip''kik - dead: the tribute counts one more'),
(1432370, 14323, 429057, 6, 0, 100, 0, 0, 0, 0, 0, 1432370, 0, 0, 'Guard Slip''kik - dead after the tribute: his last words'),
(1432560, 14325, 429056, 6, 0, 100, 0, 0, 0, 0, 0, 1432560, 0, 0, 'Captain Kromcrush - dead: the tribute counts one more'),
(1432561, 14325, 429057, 6, 0, 100, 0, 0, 0, 0, 0, 1432561, 0, 0, 'Captain Kromcrush - dead after the tribute: his last words'),
(1432460, 14324, 429056, 6, 0, 100, 0, 0, 0, 0, 0, 1432460, 0, 0, 'Cho''Rush the Observer - dead: the tribute counts one more'),
(1432461, 14324, 429057, 6, 0, 100, 0, 0, 0, 0, 0, 1432461, 0, 0, 'Cho''Rush the Observer - dead after the tribute: his last words'),
(1432260, 14322, 429056, 6, 0, 100, 0, 0, 0, 0, 0, 1432260, 0, 0, 'Stomper Kreeg - dead: the tribute counts one more'),
(1432462, 14324, 230040, 11, 0, 100, 0, 0, 0, 0, 0, 1432462, 0, 0, 'Cho''Rush the Observer - spawned after the tribute: friendly and sitting'),
(1432670, 14326, 0, 6, 0, 100, 0, 0, 0, 0, 0, 1432670, 0, 0, 'Guard Mol''dar - dead (10 = DONE)'),
(1432562, 14325, 0, 29, 0, 100, 1, 8, 5, 0, 0, 1432562, 0, 0, 'Captain Kromcrush - at Fengus (point 5): his line, selectable again'),
(1432563, 14325, 0, 4, 0, 100, 0, 0, 0, 0, 0, 1432563, 0, 0, 'Captain Kromcrush - aggro: his line'),
(1432564, 14325, 0, 0, 0, 100, 9, 7000, 13000, 15000, 20000, 1432564, 0, 0, 'Captain Kromcrush - Mortal Cleave'),
(1432565, 14325, 0, 0, 0, 100, 9, 10000, 10000, 30000, 35000, 1432565, 0, 0, 'Captain Kromcrush - Intimidating Shout'),
(1432566, 14325, 0, 2, 0, 100, 0, 25, 0, 0, 0, 1432566, 0, 0, 'Captain Kromcrush - under 25 %: Retaliation'),
(1432567, 14325, 0, 2, 0, 100, 0, 50, 0, 0, 0, 1432567, 0, 0, 'Captain Kromcrush - under half: his call, the Reavers'),
(1432568, 14325, 469110, 7, 0, 100, 0, 0, 0, 0, 0, 1432568, 0, 0, 'Captain Kromcrush - evading on his way to Fengus: on with the fifth leg'),
(1150160, 11501, 0, 6, 0, 100, 0, 0, 0, 0, 0, 1150160, 0, 0, 'King Gordok - dead: Mizzle comes, Cho''Rush yields'),
(1435360, 14353, 0, 11, 0, 100, 0, 0, 0, 0, 0, 1435360, 0, 0, 'Mizzle the Crafty - summoned: his cry, home to the king''s hall'),
(1435361, 14353, 0, 29, 0, 100, 1, 8, 1, 0, 0, 1435361, 0, 0, 'Mizzle the Crafty - home: his second line, and he talks'),
(1432371, 14323, 0, 0, 0, 100, 1, 250, 250, 250, 250, 1432371, 0, 0, 'Guard Slip''kik - at the Fixed Trap (in a fight): Ice Lock'),
(1432372, 14323, 0, 1, 0, 100, 1, 250, 250, 250, 250, 1432372, 0, 0, 'Guard Slip''kik - at the Fixed Trap (out of one): Ice Lock'),
(1144160, 11441, 0, 4, 0, 60, 0, 0, 0, 0, 0, 1144160, 1144161, 1144162, 'Gordok Brute - aggro: sometimes a yell'),
(1144163, 11441, 0, 0, 254, 100, 9, 6000, 6000, 3000, 8000, 1144163, 0, 0, 'Gordok Brute - Bruising Blow above 30 %'),
(1144164, 11441, 0, 13, 254, 100, 9, 8000, 10000, 0, 0, 1144164, 0, 0, 'Gordok Brute - Pummel at a victim that casts, above 30 %'),
(1144165, 11441, 0, 0, 0, 100, 9, 0, 0, 6000, 10000, 1144165, 0, 0, 'Gordok Brute - Uppercut'),
(1144166, 11441, 0, 0, 253, 100, 9, 2000, 2000, 5000, 9000, 1144166, 0, 0, 'Gordok Brute - Backhand, swinging wildly'),
(1144167, 11441, 0, 2, 0, 100, 0, 30, 0, 0, 0, 1144167, 0, 0, 'Gordok Brute - under 30 %: the club away, Enrage'),
(1144168, 11441, 0, 7, 0, 100, 0, 0, 0, 0, 0, 1144168, 0, 0, 'Gordok Brute - evading: his club back, above 30 % again'),
(1148661, 11486, 0, 11, 0, 100, 0, 0, 0, 0, 0, 1148661, 0, 0, 'Prince Tortheldrin - spawned: Thrash on himself'),
(1148662, 11486, 0, 4, 0, 100, 0, 0, 0, 0, 0, 1148662, 0, 0, 'Prince Tortheldrin - in a fight: Thrash on himself'),
(1148663, 11486, 0, 0, 0, 100, 13, 0, 3000, 13000, 20000, 1148663, 0, 0, 'Prince Tortheldrin - Summon on his victim'),
(1148664, 11486, 429091, 0, 0, 100, 13, 14000, 22000, 10000, 20000, 1148664, 0, 0, 'Prince Tortheldrin - Whirlwind with someone in melee reach'),
(1148665, 11486, 0, 0, 0, 100, 9, 15000, 20000, 10000, 15000, 1148665, 0, 0, 'Prince Tortheldrin - Arcane Blast: the threat of all is gone'),
(1148666, 11486, 0, 0, 0, 100, 13, 10000, 20000, 25000, 30000, 1148666, 0, 0, 'Prince Tortheldrin - Counterspell on a player with mana'),
(1430860, 14308, 0, 0, 0, 100, 13, 0, 0, 6000, 10000, 1430860, 0, 0, 'Ferra - Charge'),
(1430861, 14308, 0, 0, 0, 100, 13, 5000, 10000, 15000, 20000, 1430861, 0, 0, 'Ferra - Maul'),
(1430862, 14308, 0, 1, 0, 100, 1, 1000, 1000, 1000, 1000, 1430862, 0, 0, 'Ferra - sees a player 80 yd off: the fight begins (the old pulse)'),
(1148760, 11487, 429017, 0, 254, 100, 1, 500, 500, 500, 500, 1148760, 0, 0, 'Magister Kalendris - at range: he stands'),
(1148761, 11487, 429018, 0, 253, 100, 1, 500, 500, 500, 500, 1148761, 0, 0, 'Magister Kalendris - out of range: he closes in'),
(1148762, 11487, 0, 7, 0, 100, 0, 0, 0, 0, 0, 1148762, 0, 0, 'Magister Kalendris - evading: in melee again'),
(1148763, 11487, 0, 0, 0, 100, 13, 5000, 10000, 9000, 11000, 1148763, 0, 0, 'Magister Kalendris - Shadow Word: Pain'),
(1148764, 11487, 0, 0, 0, 100, 13, 10000, 20000, 18000, 23000, 1148764, 0, 0, 'Magister Kalendris - Mind Flay'),
(1148765, 11487, 0, 0, 254, 100, 13, 0, 0, 7000, 10000, 1148765, 0, 0, 'Magister Kalendris - Mind Blast in melee'),
(1148766, 11487, 0, 0, 253, 100, 13, 0, 0, 2000, 3000, 1148766, 0, 0, 'Magister Kalendris - Mind Blast at range'),
(1148767, 11487, 0, 0, 0, 100, 13, 20000, 30000, 25000, 35000, 1148767, 0, 0, 'Magister Kalendris - Dominate Mind'),
(1148768, 11487, 0, 2, 0, 100, 0, 50, 0, 0, 0, 1148768, 0, 0, 'Magister Kalendris - under half: Shadowform'),
(1149260, 11492, 0, 0, 254, 100, 1, 12000, 15000, 12000, 15000, 1149260, 1149261, 0, 'Alzzin the Wildshaper - the satyr: a new form'),
(1149262, 11492, 0, 0, 253, 100, 1, 12000, 15000, 12000, 15000, 1149262, 1149263, 0, 'Alzzin the Wildshaper - the dire wolf: a new form'),
(1149264, 11492, 0, 0, 251, 100, 1, 12000, 15000, 12000, 15000, 1149264, 1149265, 0, 'Alzzin the Wildshaper - the tree: a new form'),
(1149266, 11492, 0, 0, 254, 100, 1, 1000, 3000, 3000, 3000, 1149266, 0, 0, 'Alzzin the Wildshaper - in a fight, a satyr: Thorns'),
(1149267, 11492, 0, 1, 254, 100, 1, 1000, 3000, 3000, 3000, 1149267, 0, 0, 'Alzzin the Wildshaper - out of one, a satyr: Thorns'),
(1149268, 11492, 0, 0, 254, 100, 13, 2000, 5000, 8000, 10000, 1149268, 0, 0, 'Alzzin the Wildshaper - Wither (satyr)'),
(1149269, 11492, 0, 0, 254, 100, 13, 5000, 10000, 12000, 15000, 1149269, 0, 0, 'Alzzin the Wildshaper - Enervate (satyr)'),
(1149270, 11492, 0, 0, 253, 100, 13, 3000, 7000, 8000, 10000, 1149270, 0, 0, 'Alzzin the Wildshaper - Mangle (wolf)'),
(1149271, 11492, 0, 0, 253, 100, 13, 5000, 10000, 8000, 15000, 1149271, 0, 0, 'Alzzin the Wildshaper - Vicious Bite (wolf)'),
(1149272, 11492, 0, 0, 251, 100, 13, 6000, 11000, 16000, 20000, 1149272, 0, 0, 'Alzzin the Wildshaper - Knock Away (tree)'),
(1149273, 11492, 0, 0, 251, 100, 13, 5000, 10000, 16000, 20000, 1149273, 0, 0, 'Alzzin the Wildshaper - Disarm (tree)'),
(1149274, 11492, 807003, 0, 251, 100, 13, 5000, 8000, 10000, 15000, 1149274, 0, 0, 'Alzzin the Wildshaper - Wild Regeneration under half (tree)'),
(1149275, 11492, 429093, 0, 0, 100, 1, 3000, 3000, 3000, 3000, 1149275, 0, 0, 'Alzzin the Wildshaper - 40 yd from his place: evades'),
(1149276, 11492, 0, 4, 0, 100, 0, 0, 0, 0, 0, 1149276, 0, 0, 'Alzzin the Wildshaper - aggro: out of his channeling, a satyr'),
(1149277, 11492, 0, 7, 0, 100, 0, 0, 0, 0, 0, 1149277, 0, 0, 'Alzzin the Wildshaper - evading: phase 0'),
(1149278, 11492, 0, 2, 0, 100, 0, 45, 0, 0, 0, 1149278, 0, 0, 'Alzzin the Wildshaper - under 45 %: the wall breaks, his help and 15 minions'),
(1149279, 11492, 0, 6, 0, 100, 0, 0, 0, 0, 0, 1149279, 0, 0, 'Alzzin the Wildshaper - dead: the vine opens, the shards come back'),
(1149280, 11492, 0, 1, 254, 100, 1, 30000, 45000, 30000, 45000, 1149280, 0, 0, 'Alzzin the Wildshaper - out of a fight: to his channeling spot'),
(1149281, 11492, 0, 29, 0, 100, 1, 8, 0, 0, 0, 1149281, 0, 0, 'Alzzin the Wildshaper - at the first spot: channeling, 10-30 s from now'),
(1149282, 11492, 0, 1, 223, 100, 1, 10000, 30000, 10000, 30000, 1149282, 0, 0, 'Alzzin the Wildshaper - channeled 10-30 s: to the second spot'),
(1149283, 11492, 0, 29, 0, 100, 1, 8, 1, 0, 0, 1149283, 0, 0, 'Alzzin the Wildshaper - at the second spot: wandering again, phase 0'),
(1450660, 14506, 0, 0, 0, 100, 13, 28000, 28000, 10000, 30000, 1450660, 0, 0, 'Lord Hel''nurath - Shadow Word: Pain'),
(1450661, 14506, 0, 0, 0, 100, 13, 16000, 16000, 20000, 85000, 1450661, 0, 0, 'Lord Hel''nurath - Veil of Shadow'),
(1450662, 14506, 0, 0, 0, 100, 13, 21000, 21000, 15000, 36000, 1450662, 0, 0, 'Lord Hel''nurath - Sleep'),
(1450663, 14506, 0, 0, 0, 100, 13, 20000, 20000, 6000, 10000, 1450663, 0, 0, 'Lord Hel''nurath - Knock Away'),
(1450260, 14502, 0, 0, 0, 100, 13, 8000, 8000, 10000, 18000, 1450260, 0, 0, 'Xorothian Dreadsteed - Berserker Charge at a random player'),
(1450261, 14502, 0, 0, 0, 100, 13, 10000, 10000, 7000, 12000, 1450261, 0, 0, 'Xorothian Dreadsteed - Flame Buffet');

DELETE FROM `creature_ai_scripts` WHERE `id` IN (1144160, 1144161, 1144162, 1144163, 1144164, 1144165, 1144166, 1144167, 1144168, 1148060, 1148061, 1148062, 1148360, 1148361, 1148362, 1148460, 1148461, 1148462, 1148660, 1148661, 1148662, 1148663, 1148664, 1148665, 1148666, 1148760, 1148761, 1148762, 1148763, 1148764, 1148765, 1148766, 1148767, 1148768, 1148910, 1148911, 1148912, 1148913, 1148914, 1148915, 1148916, 1149010, 1149011, 1149012, 1149101, 1149102, 1149260, 1149261, 1149262, 1149263, 1149264, 1149265, 1149266, 1149267, 1149268, 1149269, 1149270, 1149271, 1149272, 1149273, 1149274, 1149275, 1149276, 1149277, 1149278, 1149279, 1149280, 1149281, 1149282, 1149283, 1149610, 1149611, 1149612, 1149613, 1149614, 1149615, 1149616, 1149660, 1149661, 1150110, 1150111, 1150112, 1150113, 1150114, 1150115, 1150160, 1430860, 1430861, 1430862, 1432160, 1432161, 1432162, 1432163, 1432164, 1432165, 1432166, 1432167, 1432168, 1432169, 1432260, 1432360, 1432361, 1432362, 1432363, 1432364, 1432365, 1432366, 1432367, 1432368, 1432369, 1432370, 1432371, 1432372, 1432401, 1432402, 1432403, 1432404, 1432405, 1432410, 1432411, 1432412, 1432413, 1432414, 1432415, 1432416, 1432417, 1432418, 1432419, 1432420, 1432421, 1432422, 1432423, 1432424, 1432425, 1432426, 1432460, 1432461, 1432462, 1432560, 1432561, 1432562, 1432563, 1432564, 1432565, 1432566, 1432567, 1432568, 1432660, 1432661, 1432662, 1432663, 1432664, 1432665, 1432666, 1432667, 1432668, 1432669, 1432670, 1435360, 1435361, 1435401, 1435402, 1435403, 1435404, 1450260, 1450261, 1450660, 1450661, 1450662, 1450663);
INSERT INTO `creature_ai_scripts`
(`id`, `delay`, `priority`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`)
VALUES
(1149010, 0, 0, 15, 22478, 0, 0, 0, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Zevrim Thornhoof - Intense Pain'),
(1149011, 0, 0, 15, 22651, 0, 0, 0, 258, 0, 4, 8, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Zevrim Thornhoof - Sacrifice'),
(1149012, 0, 0, 37, 4, 3, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Dire Maul - Zevrim Thornhoof dead (4 = DONE)'),
(1149101, 0, 0, 27, 14241, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Old Ironbark - becomes Ironbark the Redeemed'),
(1149101, 0, 1, 0, 1, 0, 0, 0, 0, 0, 0, 0, 9104, 0, 0, 0, 0, 0, 0, 0, 0, 'Ironbark the Redeemed - yells "At last... Freed from his cursed grasp!"'),
(1149102, 0, 0, 80, 2, 0, 0, 0, 176907, 10, 11, 8, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Ironbark the Redeemed - the door within 10 yd broken'),
(1149102, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 9100, 0, 0, 0, 0, 0, 0, 0, 0, 'Ironbark the Redeemed - says "My strength wanes, mortal..."'),
(1149102, 0, 2, 1, 35, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Ironbark the Redeemed - strikes'),
(1149102, 0, 3, 48, 100, 1, 0, 0, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Ironbark the Redeemed - dies'),
(1148910, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 1148910, 0, 0, 0, 0, 0, 0, 0, 0, 'Tendris Warpwood - yells "You do not belong here!..."'),
(1148910, 0, 1, 68, 1148950, 2, 11459, 1800, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Tendris Warpwood - every Ironbark Protector into the fight'),
(1148911, 0, 0, 15, 5568, 0, 0, 0, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Tendris Warpwood - Trample'),
(1148912, 0, 0, 15, 22916, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Tendris Warpwood - Uppercut'),
(1148913, 0, 0, 15, 22924, 0, 0, 0, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Tendris Warpwood - Grasping Vines'),
(1148914, 0, 0, 15, 8269, 34, 0, 0, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Tendris Warpwood - Enrage'),
(1148915, 0, 0, 39, 1148951, 0, 0, 0, 0, 0, 1, 0, 100, 0, 0, 0, 0, 0, 0, 0, 0, 'Tendris Warpwood - his victim pulled to him'),
(1148916, 0, 0, 10, 14566, 60000, 0, 0, 0, 0, 0, 0, 65536, 0, -1, 6, 0, 0, 0, 0, 0, 'Tendris Warpwood - the spirit (14566) at his killer'),
(1149610, 0, 0, 15, 5568, 0, 0, 0, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Immol''thar - Trample'),
(1149611, 0, 0, 15, 16128, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Immol''thar - Infected Bite'),
(1149612, 0, 0, 10, 14396, 5000, 0, 0, 0, 0, 0, 0, 262144, 0, 1, 4, 0, 0, 0, 0, 0, 'Immol''thar - an Eye of Immol''thar, at his victim'),
(1149613, 0, 0, 39, 1149650, 0, 0, 0, 0, 0, 4, 0, 100, 0, 0, 0, 0, 0, 0, 0, 0, 'Immol''thar - a random player pulled to him'),
(1149614, 0, 0, 15, 8269, 34, 0, 0, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Immol''thar - Enrage'),
(1149615, 0, 0, 56, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Immol''thar - his eyes gone'),
(1149616, 0, 0, 37, 2, 3, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Dire Maul - Immol''thar dead (2 = DONE)'),
(1435401, 0, 0, 68, 1435450, 2, 13276, 100, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Pusillin - every Wildspawn Imp within 100 yd joins'),
(1435402, 0, 0, 15, 15228, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Pusillin - Fireball'),
(1435402, 0, 1, 44, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Pusillin - Fireball: a pause (phase 1)'),
(1435402, 0, 2, 39, 1435452, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0, 0, 0, 0, 0, 0, 0, 'Pusillin - Fireball: the pause ends in 6 s'),
(1435403, 0, 0, 15, 14145, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Pusillin - Fire Blast'),
(1435403, 0, 1, 44, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Pusillin - Fire Blast: a pause (phase 1)'),
(1435403, 0, 2, 39, 1435453, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0, 0, 0, 0, 0, 0, 0, 'Pusillin - Fire Blast: the pause ends in 4 s'),
(1435404, 0, 0, 15, 22424, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Pusillin - Blast Wave'),
(1435404, 0, 1, 44, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Pusillin - Blast Wave: a pause (phase 1)'),
(1435404, 0, 2, 39, 1435454, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0, 0, 0, 0, 0, 0, 0, 'Pusillin - Blast Wave: the pause ends in 9 s'),
(1150110, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1150110, 0, 0, 0, 0, 0, 0, 0, 0, 'King Gordok - says "You no challenge me, scrubs!..."'),
(1150111, 0, 0, 15, 15572, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'King Gordok - Sunder Armor'),
(1150112, 0, 0, 15, 15708, 0, 0, 0, 0, 0, 1, 8, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'King Gordok - Mortal Strike'),
(1150113, 0, 0, 15, 16727, 0, 0, 0, 0, 0, 0, 12, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'King Gordok - War Stomp'),
(1150114, 0, 0, 15, 22886, 0, 0, 0, 2, 0, 5, 8, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'King Gordok - Berserker Charge'),
(1150115, 0, 0, 72, 0, 0, 0, 0, 56945, 0, 9, 18, 0, 0, 0, 0, 0, 0, 0, 0, 429007, 'King Gordok - Cho''Rush the Observer joins him'),
(1432401, 0, 0, 72, 0, 0, 0, 0, 128489, 0, 9, 18, 0, 0, 0, 0, 0, 0, 0, 0, 429007, 'Cho''Rush the Observer - King Gordok joins him'),
(1432402, 0, 0, 39, 1432451, 1432452, 1432453, 0, 0, 0, 0, 0, 33, 33, 34, 0, 0, 0, 0, 0, 229240, 'Cho''Rush the Observer - his set drawn'),
(1432402, 0, 1, 44, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 229241, 'Cho''Rush the Observer - the mage (phase 2)'),
(1432402, 0, 2, 44, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 229242, 'Cho''Rush the Observer - the shaman (phase 4)'),
(1432402, 0, 3, 44, 6, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 229243, 'Cho''Rush the Observer - the priest (phase 6)'),
(1432403, 0, 0, 43, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Cho''Rush the Observer - stands'),
(1432403, 0, 1, 44, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Cho''Rush the Observer - at range (phase +1)'),
(1432404, 0, 0, 43, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Cho''Rush the Observer - closes in'),
(1432404, 0, 1, 44, 1, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Cho''Rush the Observer - in melee (phase -1)'),
(1432405, 0, 0, 43, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Cho''Rush the Observer - closes in'),
(1432405, 0, 1, 44, 1, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Cho''Rush the Observer - in melee (phase -1)'),
(1432410, 0, 0, 15, 17290, 0, 0, 0, 0, 0, 1, 8, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Cho''Rush the Observer - Fireball'),
(1432411, 0, 0, 15, 17290, 0, 0, 0, 0, 0, 1, 8, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Cho''Rush the Observer - Fireball'),
(1432412, 0, 0, 15, 16170, 32, 0, 0, 0, 0, 0, 12, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Cho''Rush the Observer - Bloodlust on himself or King Gordok within 30 yd'),
(1432413, 0, 0, 15, 16170, 32, 0, 0, 11501, 30, 8, 8, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Cho''Rush the Observer - Bloodlust on himself or King Gordok within 30 yd'),
(1432414, 0, 0, 15, 13745, 0, 0, 0, 0, 0, 0, 12, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Cho''Rush the Observer - Arcane Explosion'),
(1432415, 0, 0, 15, 13745, 0, 0, 0, 0, 0, 0, 12, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Cho''Rush the Observer - Arcane Explosion'),
(1432416, 0, 0, 15, 15331, 0, 0, 0, 0, 0, 0, 12, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Cho''Rush the Observer - Frost Nova'),
(1432417, 0, 0, 15, 8376, 0, 0, 0, 0, 0, 0, 12, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Cho''Rush the Observer - Earthgrab Totem'),
(1432418, 0, 0, 15, 15982, 0, 0, 0, 40, 40, 15, 8, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Cho''Rush the Observer - Healing Wave on the most hurt friend within 40 yd'),
(1432419, 0, 0, 15, 15234, 0, 0, 0, 0, 0, 1, 8, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Cho''Rush the Observer - Lightning Bolt'),
(1432420, 0, 0, 15, 15234, 0, 0, 0, 0, 0, 1, 8, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Cho''Rush the Observer - Lightning Bolt'),
(1432421, 0, 0, 15, 15305, 0, 0, 0, 0, 0, 1, 8, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Cho''Rush the Observer - Chain Lightning'),
(1432422, 0, 0, 15, 22883, 0, 0, 0, 40, 40, 15, 8, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Cho''Rush the Observer - Heal on the most hurt friend within 40 yd'),
(1432423, 0, 0, 15, 17194, 0, 0, 0, 0, 0, 1, 8, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Cho''Rush the Observer - Mind Blast'),
(1432424, 0, 0, 15, 17194, 0, 0, 0, 0, 0, 1, 8, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Cho''Rush the Observer - Mind Blast'),
(1432425, 0, 0, 15, 17139, 0, 0, 0, 40, 1, 15, 8, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Cho''Rush the Observer - Power Word: Shield on the most hurt friend within 40 yd'),
(1432426, 0, 0, 15, 22884, 0, 0, 0, 0, 0, 0, 12, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Cho''Rush the Observer - Psychic Scream'),
(1148360, 0, 0, 39, 4295002, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0, 0, 0, 0, 0, 0, 0, 'Dire Maul - a crystal mob dead: the crystals checked'),
(1148060, 0, 0, 39, 4295002, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0, 0, 0, 0, 0, 0, 0, 'Dire Maul - a crystal mob dead: the crystals checked'),
(1149660, 0, 0, 4, 46, 33554434, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Immol''thar - not selectable'),
(1149661, 0, 0, 0, 1, 0, 0, 0, 56951, 0, 9, 2, 9407, 0, 0, 0, 0, 0, 0, 0, 0, 'Prince Tortheldrin - yells "Who dares disrupt the sanctity of Eldre''Thalas? Face me, cowards!"'),
(1149661, 0, 1, 39, 4295004, 0, 0, 0, 56951, 0, 9, 2, 100, 0, 0, 0, 0, 0, 0, 0, 0, 'Dire Maul - Tortheldrin awake'),
(1148660, 0, 0, 39, 4295004, 0, 0, 0, 0, 0, 0, 4, 100, 0, 0, 0, 0, 0, 0, 0, 0, 'Dire Maul - Tortheldrin awake'),
(1148361, 0, 0, 15, 14514, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Mana Remnant - Blink'),
(1148362, 0, 0, 15, 15659, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Mana Remnant - Chain Lightning'),
(1148061, 0, 0, 15, 15979, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Arcane Aberration - Arcane Bolt'),
(1148062, 0, 0, 15, 22936, 0, 0, 0, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Arcane Aberration - Mana Burn'),
(1148460, 0, 0, 15, 13748, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Residual Monstrosity - Arcane Bolt'),
(1148461, 0, 0, 15, 22940, 0, 0, 0, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Residual Monstrosity - Arcane Blast'),
(1148462, 0, 0, 15, 22939, 0, 0, 0, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Residual Monstrosity - Summon Manabursts'),
(1432660, 0, 0, 15, 15749, 0, 0, 0, 259, 0, 4, 8, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Guard Mol''dar - Shield Charge at a player in sight'),
(1432661, 0, 0, 15, 11972, 0, 0, 0, 0, 0, 1, 8, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Guard Mol''dar - Shield Bash'),
(1432662, 0, 0, 15, 14516, 0, 0, 0, 0, 0, 1, 8, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Guard Mol''dar - Strike'),
(1432663, 0, 0, 15, 10101, 0, 0, 0, 0, 0, 1, 8, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Guard Mol''dar - Knock Away'),
(1432664, 0, 0, 29, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, -50, 0, 0, 0, 0, 'Guard Mol''dar - half of the victim''s threat gone'),
(1432665, 0, 0, 15, 8269, 0, 0, 0, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Guard Mol''dar - Enrage'),
(1432665, 0, 1, 0, 2, 0, 0, 0, 0, 0, 0, 4, 4295110, 0, 0, 0, 0, 0, 0, 0, 0, 'Guard Mol''dar - the roar'),
(1432665, 0, 2, 50, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 50, 0, 0, 0, 0, 'Guard Mol''dar - calls for help within 50 yd'),
(1432666, 0, 0, 44, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Guard Mol''dar - phase 0'),
(1432667, 0, 0, 44, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Guard Mol''dar - Shield Bash ready (phase 1)'),
(1432160, 0, 0, 15, 15749, 0, 0, 0, 259, 0, 4, 8, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Guard Fengus - Shield Charge at a player in sight'),
(1432161, 0, 0, 15, 11972, 0, 0, 0, 0, 0, 1, 8, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Guard Fengus - Shield Bash'),
(1432162, 0, 0, 15, 14516, 0, 0, 0, 0, 0, 1, 8, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Guard Fengus - Strike'),
(1432163, 0, 0, 15, 10101, 0, 0, 0, 0, 0, 1, 8, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Guard Fengus - Knock Away'),
(1432164, 0, 0, 29, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, -50, 0, 0, 0, 0, 'Guard Fengus - half of the victim''s threat gone'),
(1432165, 0, 0, 15, 8269, 0, 0, 0, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Guard Fengus - Enrage'),
(1432165, 0, 1, 0, 2, 0, 0, 0, 0, 0, 0, 4, 4295120, 0, 0, 0, 0, 0, 0, 0, 0, 'Guard Fengus - the roar'),
(1432165, 0, 2, 50, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 50, 0, 0, 0, 0, 'Guard Fengus - calls for help within 50 yd'),
(1432166, 0, 0, 44, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Guard Fengus - phase 0'),
(1432167, 0, 0, 44, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Guard Fengus - Shield Bash ready (phase 1)'),
(1432360, 0, 0, 15, 15749, 0, 0, 0, 259, 0, 4, 8, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Guard Slip''kik - Shield Charge at a player in sight'),
(1432361, 0, 0, 15, 11972, 0, 0, 0, 0, 0, 1, 8, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Guard Slip''kik - Shield Bash'),
(1432362, 0, 0, 15, 14516, 0, 0, 0, 0, 0, 1, 8, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Guard Slip''kik - Strike'),
(1432363, 0, 0, 15, 10101, 0, 0, 0, 0, 0, 1, 8, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Guard Slip''kik - Knock Away'),
(1432364, 0, 0, 29, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, -50, 0, 0, 0, 0, 'Guard Slip''kik - half of the victim''s threat gone'),
(1432365, 0, 0, 15, 8269, 0, 0, 0, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Guard Slip''kik - Enrage'),
(1432365, 0, 1, 0, 2, 0, 0, 0, 0, 0, 0, 4, 4295130, 0, 0, 0, 0, 0, 0, 0, 0, 'Guard Slip''kik - the roar'),
(1432365, 0, 2, 50, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 50, 0, 0, 0, 0, 'Guard Slip''kik - calls for help within 50 yd'),
(1432366, 0, 0, 44, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Guard Slip''kik - phase 0'),
(1432367, 0, 0, 44, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Guard Slip''kik - Shield Bash ready (phase 1)'),
(1432368, 0, 0, 39, 4295005, 0, 0, 0, 0, 0, 0, 4, 100, 0, 0, 0, 0, 0, 0, 0, 0, 'Guard Slip''kik - the combat bug watched for 3 s'),
(1432668, 0, 0, 37, 15, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Guard Mol''dar - a guard dead (15 + 1)'),
(1432668, 0, 1, 37, 6, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Guard Mol''dar - the tribute under way (6 = 1)'),
(1432669, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 66103, 0, 0, 0, 0, 0, 0, 0, 0, 'Guard Mol''dar - says "Why... Boss.. betray.. us...?"'),
(1432168, 0, 0, 37, 15, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Guard Fengus - a guard dead (15 + 1)'),
(1432168, 0, 1, 37, 6, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Guard Fengus - the tribute under way (6 = 1)'),
(1432169, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 66103, 0, 0, 0, 0, 0, 0, 0, 0, 'Guard Fengus - says "Why... Boss.. betray.. us...?"'),
(1432369, 0, 0, 37, 15, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Guard Slip''kik - a guard dead (15 + 1)'),
(1432369, 0, 1, 37, 6, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Guard Slip''kik - the tribute under way (6 = 1)'),
(1432370, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 66103, 0, 0, 0, 0, 0, 0, 0, 0, 'Guard Slip''kik - says "Why... Boss.. betray.. us...?"'),
(1432560, 0, 0, 37, 15, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Captain Kromcrush - a guard dead (15 + 1)'),
(1432560, 0, 1, 37, 6, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Captain Kromcrush - the tribute under way (6 = 1)'),
(1432561, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 66103, 0, 0, 0, 0, 0, 0, 0, 0, 'Captain Kromcrush - says "Why... Boss.. betray.. us...?"'),
(1432460, 0, 0, 37, 15, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Cho''Rush the Observer - a guard dead (15 + 1)'),
(1432460, 0, 1, 37, 6, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Cho''Rush the Observer - the tribute under way (6 = 1)'),
(1432461, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 66103, 0, 0, 0, 0, 0, 0, 0, 0, 'Cho''Rush the Observer - says "Why... Boss.. betray.. us...?"'),
(1432260, 0, 0, 37, 15, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Stomper Kreeg - a guard dead (15 + 1)'),
(1432260, 0, 1, 37, 6, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Stomper Kreeg - the tribute under way (6 = 1)'),
(1432462, 0, 0, 22, 35, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Cho''Rush the Observer - friendly (35)'),
(1432462, 0, 1, 28, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Cho''Rush the Observer - sits'),
(1432670, 0, 0, 37, 10, 3, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Dire Maul - Guard Mol''dar dead (10 = DONE)'),
(1432562, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 4, 4295140, 0, 0, 0, 0, 0, 0, 0, 0, 'Captain Kromcrush - "OK Fengus, where you at?!"'),
(1432562, 0, 1, 4, 46, 33554434, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Captain Kromcrush - selectable again'),
(1432563, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 4295160, 0, 0, 0, 0, 0, 0, 0, 0, 'Captain Kromcrush - "No one get past me..."'),
(1432564, 0, 0, 15, 22859, 0, 0, 0, 0, 0, 1, 8, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Captain Kromcrush - Mortal Cleave'),
(1432565, 0, 0, 15, 19134, 0, 0, 0, 0, 0, 1, 8, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Captain Kromcrush - Intimidating Shout'),
(1432566, 0, 0, 15, 22857, 0, 0, 0, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Captain Kromcrush - Retaliation'),
(1432566, 0, 1, 0, 2, 0, 0, 0, 0, 0, 0, 4, 4295170, 0, 0, 0, 0, 0, 0, 0, 0, 'Captain Kromcrush - the Retaliation emote'),
(1432567, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 4, 4295180, 0, 0, 0, 0, 0, 0, 0, 0, 'Captain Kromcrush - "Help me crush these punys!"'),
(1432567, 0, 1, 39, 4295008, 0, 0, 0, 0, 0, 0, 4, 100, 0, 0, 0, 0, 0, 0, 0, 0, 'Captain Kromcrush - the Reavers called'),
(1432568, 0, 0, 39, 4295009, 0, 0, 0, 0, 0, 0, 4, 100, 0, 0, 0, 0, 0, 0, 0, 0, 'Captain Kromcrush - on to Fengus'),
(1150160, 0, 0, 10, 14353, 3000000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 7, 693.44, 480.806, 28.175, 0.02757, 0, 'Mizzle the Crafty - summoned where the king fell'),
(1150160, 0, 1, 22, 35, 0, 0, 0, 56945, 0, 9, 0, 0, 0, 0, 0, 0, 0, 0, 0, 116, 'Cho''Rush the Observer - friendly (35)'),
(1150160, 0, 2, 39, 4295010, 0, 0, 0, 0, 0, 0, 4, 100, 0, 0, 0, 0, 0, 0, 0, 0, 'Cho''Rush the Observer - his yell in 5 s'),
(1435360, 0, 0, 0, 6, 0, 0, 0, 0, 0, 0, 4, 4295190, 0, 0, 0, 0, 0, 0, 0, 0, 'Mizzle the Crafty - "OH NOES! Da king is dead!..."'),
(1435360, 0, 1, 34, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 816.3, 481.8, 37.3, 3.17, 0, 'Mizzle the Crafty - home in the king''s hall'),
(1435360, 0, 2, 3, 0, 15358, 1, 2, 0, 0, 0, 0, 1, 0, 0, 0, 816.3, 481.8, 37.3, 3.17, 0, 'Mizzle the Crafty - runs home (point 1)'),
(1435361, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 4, 4295200, 0, 0, 0, 0, 0, 0, 0, 0, 'Mizzle the Crafty - "Yar, he''s dead all right..."'),
(1435361, 0, 1, 4, 147, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Mizzle the Crafty - gossip'),
(1432371, 0, 0, 32, 429083, 0, 1, 0, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Guard Slip''kik - the Fixed Trap within 2 yd'),
(1432371, 0, 1, 73, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Guard Slip''kik - out of the fight'),
(1432371, 0, 2, 4, 46, 770, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Guard Slip''kik - unreachable'),
(1432371, 0, 3, 15, 22856, 2, 0, 0, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Guard Slip''kik - Ice Lock'),
(1432371, 0, 4, 89, 0, 0, 0, 0, 179512, 5, 11, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Fixed Trap - springs'),
(1432371, 0, 5, 81, 0, 0, 0, 0, 179512, 5, 11, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Fixed Trap - spent'),
(1432372, 0, 0, 32, 429083, 0, 1, 0, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Guard Slip''kik - the Fixed Trap within 2 yd'),
(1432372, 0, 1, 73, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Guard Slip''kik - out of the fight'),
(1432372, 0, 2, 4, 46, 770, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Guard Slip''kik - unreachable'),
(1432372, 0, 3, 15, 22856, 2, 0, 0, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Guard Slip''kik - Ice Lock'),
(1432372, 0, 4, 89, 0, 0, 0, 0, 179512, 5, 11, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Fixed Trap - springs'),
(1432372, 0, 5, 81, 0, 0, 0, 0, 179512, 5, 11, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Fixed Trap - spent'),
(1144160, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 66101, 0, 0, 0, 0, 0, 0, 0, 0, 'Gordok Brute - says "Me smash! You die!"'),
(1144161, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 66102, 0, 0, 0, 0, 0, 0, 0, 0, 'Gordok Brute - says "The Great One will smash you!"'),
(1144162, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 4295210, 0, 0, 0, 0, 0, 0, 0, 0, 'Gordok Brute - says "Raaar!!! Me smash <victim>!"'),
(1144163, 0, 0, 15, 22572, 0, 0, 0, 0, 0, 1, 8, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Gordok Brute - Bruising Blow'),
(1144164, 0, 0, 15, 15615, 0, 0, 0, 0, 0, 1, 8, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Gordok Brute - Pummel'),
(1144165, 0, 0, 15, 18072, 0, 0, 0, 0, 0, 1, 8, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Gordok Brute - Uppercut'),
(1144166, 0, 0, 15, 6253, 0, 0, 0, 0, 0, 1, 8, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Gordok Brute - Backhand'),
(1144167, 0, 0, 19, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Gordok Brute - club away'),
(1144167, 0, 1, 0, 2, 0, 0, 0, 0, 0, 0, 4, 4295220, 0, 0, 0, 0, 0, 0, 0, 0, 'Gordok Brute - puts his club away and begins swinging wildly'),
(1144167, 0, 2, 15, 15716, 0, 0, 0, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Gordok Brute - Enrage'),
(1144167, 0, 3, 44, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Gordok Brute - swinging wildly (phase 1)'),
(1144168, 0, 0, 19, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Gordok Brute - club back'),
(1144168, 0, 1, 44, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Gordok Brute - phase 0'),
(1148661, 0, 0, 15, 8876, 34, 0, 0, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Prince Tortheldrin - Thrash'),
(1148662, 0, 0, 15, 8876, 34, 0, 0, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Prince Tortheldrin - Thrash'),
(1148663, 0, 0, 15, 22995, 0, 0, 0, 0, 0, 1, 8, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Prince Tortheldrin - Summon'),
(1148664, 0, 0, 15, 15589, 0, 0, 0, 0, 0, 0, 12, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Prince Tortheldrin - Whirlwind'),
(1148665, 0, 0, 15, 22920, 0, 0, 0, 0, 0, 1, 8, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Prince Tortheldrin - Arcane Blast'),
(1148665, 0, 1, 29, 6, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, -100, 0, 0, 0, 0, 'Prince Tortheldrin - every threat reset after Arcane Blast'),
(1148666, 0, 0, 15, 20537, 0, 0, 0, 6, 0, 4, 8, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Prince Tortheldrin - Counterspell'),
(1430860, 0, 0, 15, 22911, 0, 0, 0, 0, 0, 1, 8, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Ferra - Charge'),
(1430861, 0, 0, 15, 17156, 0, 0, 0, 0, 0, 1, 8, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Ferra - Maul'),
(1430862, 0, 0, 15, 28033, 0, 0, 0, 0, 0, 0, 12, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Ferra - pulse'),
(1148760, 0, 0, 43, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Magister Kalendris - stands'),
(1148760, 0, 1, 44, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Magister Kalendris - at range (phase 1)'),
(1148761, 0, 0, 43, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Magister Kalendris - closes in'),
(1148761, 0, 1, 44, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Magister Kalendris - in melee (phase 0)'),
(1148762, 0, 0, 43, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Magister Kalendris - closes in'),
(1148762, 0, 1, 44, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Magister Kalendris - phase 0'),
(1148763, 0, 0, 15, 17146, 32, 0, 0, 0, 0, 1, 8, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Magister Kalendris - Shadow Word: Pain'),
(1148764, 0, 0, 15, 22919, 0, 0, 0, 0, 0, 1, 8, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Magister Kalendris - Mind Flay'),
(1148765, 0, 0, 15, 17287, 0, 0, 0, 0, 0, 1, 8, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Magister Kalendris - Mind Blast'),
(1148766, 0, 0, 15, 17287, 0, 0, 0, 0, 0, 1, 8, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Magister Kalendris - Mind Blast'),
(1148767, 0, 0, 15, 7645, 0, 0, 0, 2, 0, 5, 8, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Magister Kalendris - Dominate Mind'),
(1148768, 0, 0, 15, 22917, 0, 0, 0, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Magister Kalendris - Shadowform'),
(1149260, 0, 0, 15, 22660, 0, 0, 0, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Alzzin the Wildshaper - the dire wolf'),
(1149260, 0, 1, 14, 22688, 0, 0, 0, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Alzzin the Wildshaper - no tree'),
(1149260, 0, 2, 44, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Alzzin the Wildshaper - the dire wolf (phase 1)'),
(1149261, 0, 0, 14, 22660, 0, 0, 0, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Alzzin the Wildshaper - no wolf'),
(1149261, 0, 1, 15, 22688, 0, 0, 0, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Alzzin the Wildshaper - the tree'),
(1149261, 0, 2, 44, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Alzzin the Wildshaper - the tree (phase 2)'),
(1149262, 0, 0, 14, 22660, 0, 0, 0, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Alzzin the Wildshaper - no wolf'),
(1149262, 0, 1, 14, 22688, 0, 0, 0, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Alzzin the Wildshaper - no tree'),
(1149262, 0, 2, 44, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Alzzin the Wildshaper - the satyr (phase 0)'),
(1149263, 0, 0, 14, 22660, 0, 0, 0, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Alzzin the Wildshaper - no wolf'),
(1149263, 0, 1, 15, 22688, 0, 0, 0, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Alzzin the Wildshaper - the tree'),
(1149263, 0, 2, 44, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Alzzin the Wildshaper - the tree (phase 2)'),
(1149264, 0, 0, 14, 22660, 0, 0, 0, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Alzzin the Wildshaper - no wolf'),
(1149264, 0, 1, 14, 22688, 0, 0, 0, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Alzzin the Wildshaper - no tree'),
(1149264, 0, 2, 44, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Alzzin the Wildshaper - the satyr (phase 0)'),
(1149265, 0, 0, 15, 22660, 0, 0, 0, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Alzzin the Wildshaper - the dire wolf'),
(1149265, 0, 1, 14, 22688, 0, 0, 0, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Alzzin the Wildshaper - no tree'),
(1149265, 0, 2, 44, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Alzzin the Wildshaper - the dire wolf (phase 1)'),
(1149266, 0, 0, 15, 22128, 32, 0, 0, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Alzzin the Wildshaper - Thorns'),
(1149267, 0, 0, 15, 22128, 32, 0, 0, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Alzzin the Wildshaper - Thorns'),
(1149268, 0, 0, 15, 22662, 32, 0, 0, 0, 0, 1, 8, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Alzzin the Wildshaper - Wither'),
(1149269, 0, 0, 15, 22661, 0, 0, 0, 6, 0, 4, 8, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Alzzin the Wildshaper - Enervate'),
(1149270, 0, 0, 15, 22689, 32, 0, 0, 0, 0, 1, 8, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Alzzin the Wildshaper - Mangle'),
(1149271, 0, 0, 15, 19319, 0, 0, 0, 0, 0, 1, 8, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Alzzin the Wildshaper - Vicious Bite'),
(1149272, 0, 0, 15, 10101, 0, 0, 0, 0, 0, 1, 8, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Alzzin the Wildshaper - Knock Away'),
(1149273, 0, 0, 15, 22691, 0, 0, 0, 0, 0, 1, 8, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Alzzin the Wildshaper - Disarm'),
(1149274, 0, 0, 15, 7948, 32, 0, 0, 0, 0, 0, 12, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Alzzin the Wildshaper - Wild Regeneration'),
(1149275, 0, 0, 33, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Alzzin the Wildshaper - evades'),
(1149276, 0, 0, 14, 21157, 0, 0, 0, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Alzzin the Wildshaper - no channeling'),
(1149276, 0, 1, 44, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Alzzin the Wildshaper - phase 0'),
(1149277, 0, 0, 44, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Alzzin the Wildshaper - phase 0'),
(1149278, 0, 0, 37, 11, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Dire Maul - Alzzin under 45 % (11 = SPECIAL)'),
(1149278, 0, 1, 80, 0, 0, 0, 0, 397147, 0, 12, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Dire Maul - the crumble wall breaks'),
(1149278, 0, 2, 50, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 90, 0, 0, 0, 0, 'Alzzin the Wildshaper - calls for help within 90 yd'),
(1149278, 0, 3, 10, 11460, 20000, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 258.87, -356.773, -106.255, 4.93928, 0, 'Alzzin the Wildshaper - Alzzin''s Minion 1 of 15 on his victim'),
(1149278, 0, 4, 10, 11460, 20000, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 261.65, -358.587, -105.996, 5.88176, 0, 'Alzzin the Wildshaper - Alzzin''s Minion 2 of 15 on his victim'),
(1149278, 0, 5, 10, 11460, 20000, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 260.443, -357.273, -106.288, 3.56047, 0, 'Alzzin the Wildshaper - Alzzin''s Minion 3 of 15 on his victim'),
(1149278, 0, 6, 10, 11460, 20000, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 261.335, -354.319, -105.331, 1.44862, 0, 'Alzzin the Wildshaper - Alzzin''s Minion 4 of 15 on his victim'),
(1149278, 0, 7, 10, 11460, 20000, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 263.817, -354.068, -105.126, 6.02139, 0, 'Alzzin the Wildshaper - Alzzin''s Minion 5 of 15 on his victim'),
(1149278, 0, 8, 10, 11460, 20000, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 252.266, -365.229, -109.915, 4.20624, 0, 'Alzzin the Wildshaper - Alzzin''s Minion 6 of 15 on his victim'),
(1149278, 0, 9, 10, 11460, 20000, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 254.409, -365.498, -109.99, 1.8675, 0, 'Alzzin the Wildshaper - Alzzin''s Minion 7 of 15 on his victim'),
(1149278, 0, 10, 10, 11460, 20000, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 253.869, -362.235, -108.675, 0.331613, 0, 'Alzzin the Wildshaper - Alzzin''s Minion 8 of 15 on his victim'),
(1149278, 0, 11, 10, 11460, 20000, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 255.764, -362.91, -108.83, 5.09636, 0, 'Alzzin the Wildshaper - Alzzin''s Minion 9 of 15 on his victim'),
(1149278, 0, 12, 10, 11460, 20000, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 258.411, -360.927, -107.782, 4.88692, 0, 'Alzzin the Wildshaper - Alzzin''s Minion 10 of 15 on his victim'),
(1149278, 0, 13, 10, 11460, 20000, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 250.652, -370.499, -112.237, 4.20624, 0, 'Alzzin the Wildshaper - Alzzin''s Minion 11 of 15 on his victim'),
(1149278, 0, 14, 10, 11460, 20000, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 253.022, -371.107, -112.171, 1.8675, 0, 'Alzzin the Wildshaper - Alzzin''s Minion 12 of 15 on his victim'),
(1149278, 0, 15, 10, 11460, 20000, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 250.207, -372.675, -112.839, 0.331613, 0, 'Alzzin the Wildshaper - Alzzin''s Minion 13 of 15 on his victim'),
(1149278, 0, 16, 10, 11460, 20000, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 252.79, -372.777, -112.676, 5.09636, 0, 'Alzzin the Wildshaper - Alzzin''s Minion 14 of 15 on his victim'),
(1149278, 0, 17, 10, 11460, 20000, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 251.389, -374.372, -113.371, 4.88692, 0, 'Alzzin the Wildshaper - Alzzin''s Minion 15 of 15 on his victim'),
(1149279, 0, 0, 37, 11, 3, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Dire Maul - Alzzin dead (11 = DONE)'),
(1149279, 0, 1, 80, 0, 0, 0, 0, 397167, 0, 12, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Dire Maul - the corrupt vine opens'),
(1149279, 0, 2, 9, 44726, 600, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Dire Maul - Felvine Shard 1 of 5 back'),
(1149279, 0, 3, 9, 44727, 600, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Dire Maul - Felvine Shard 2 of 5 back'),
(1149279, 0, 4, 9, 44728, 600, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Dire Maul - Felvine Shard 3 of 5 back'),
(1149279, 0, 5, 9, 44729, 600, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Dire Maul - Felvine Shard 4 of 5 back'),
(1149279, 0, 6, 9, 44730, 600, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Dire Maul - Felvine Shard 5 of 5 back'),
(1149280, 0, 0, 5, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Alzzin the Wildshaper - no channeling'),
(1149280, 0, 1, 3, 0, 0, 1, 2, 0, 0, 0, 0, 0, 0, 0, 0, 274.844, -427.251, -119.962, 6.13, 0, 'Alzzin the Wildshaper - to the first spot (point 0)'),
(1149280, 0, 2, 44, 3, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Alzzin the Wildshaper - walking out (phase 3)'),
(1149281, 0, 0, 15, 21157, 0, 0, 0, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Alzzin the Wildshaper - Dark Channeling'),
(1149281, 0, 1, 44, 5, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Alzzin the Wildshaper - channeling (phase 5)'),
(1149282, 0, 0, 14, 21157, 0, 0, 0, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Alzzin the Wildshaper - no channeling'),
(1149282, 0, 1, 3, 0, 0, 1, 2, 0, 0, 0, 0, 1, 0, 0, 0, 262.298, -445.57, -119.962, 0, 0, 'Alzzin the Wildshaper - to the second spot (point 1)'),
(1149282, 0, 2, 44, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Alzzin the Wildshaper - on to the second spot (phase 4)'),
(1149283, 0, 0, 67, 1, 1, 10, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Alzzin the Wildshaper - wandering again'),
(1149283, 0, 1, 44, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Alzzin the Wildshaper - phase 0'),
(1450660, 0, 0, 15, 17146, 0, 0, 0, 0, 0, 1, 8, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Lord Hel''nurath - Shadow Word: Pain'),
(1450661, 0, 0, 15, 23224, 0, 0, 0, 0, 0, 1, 8, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Lord Hel''nurath - Veil of Shadow'),
(1450662, 0, 0, 15, 20989, 0, 0, 0, 258, 0, 4, 8, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Lord Hel''nurath - Sleep'),
(1450663, 0, 0, 15, 18670, 0, 0, 0, 0, 0, 1, 8, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Lord Hel''nurath - Knock Away'),
(1450260, 0, 0, 15, 16636, 0, 0, 0, 258, 0, 4, 8, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Xorothian Dreadsteed - Berserker Charge'),
(1450261, 0, 0, 15, 22713, 0, 0, 0, 0, 0, 1, 8, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Xorothian Dreadsteed - Flame Buffet');

DELETE FROM `generic_scripts` WHERE `id` IN (1148950, 1148951, 1149650, 1432451, 1432452, 1432453, 1435450, 1435451, 1435452, 1435453, 1435454, 4295001, 4295002, 4295003, 4295004, 4295005, 4295006, 4295007, 4295008, 4295009, 4295010, 4295011, 4295012, 4295013, 4295015, 4295016, 4295017, 4295018, 4295019, 4295020, 4295021, 4295022, 4295023, 4295024, 4295025, 4295026, 4295027, 4295028, 4295029, 4295030, 4295031, 4295032, 4295033, 4295034, 4295035, 4295036, 4295037, 4295038, 4295039, 4295040, 4295041, 4295042, 4295043, 4295044, 4295045, 4295046, 4295047, 4295048, 4295049, 4295050, 4295051, 4295052, 4295053, 4295054, 4295055, 4295056, 4295057, 4295058, 4295059, 4295060, 4295061, 4295062, 4295063, 4295064, 4295065, 4295066, 4295067, 4295068, 4295069);
INSERT INTO `generic_scripts`
(`id`, `delay`, `priority`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`)
VALUES
(1148950, 0, 0, 49, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Ironbark Protector - into the fight'),
(1148951, 0, 0, 6, 429, 0, 1, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 1, 0, 0, 'Tendris Warpwood - the player pulled to him'),
(1148951, 0, 1, 15, 22994, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Tendris Warpwood - Entangle at the player'),
(1149650, 0, 0, 6, 429, 0, 1, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 1, 0, 0, 'Immol''thar - the player pulled to him'),
(1149650, 0, 1, 29, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, -100, 0, 0, 0, 0, 'Immol''thar - the player''s threat wiped'),
(1435451, 0, 0, 34, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 18.19, -701.15, -12.64, 0, 0, 'Wildspawn Imp - home where Pusillin makes his stand'),
(1435450, 0, 0, 26, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Wildspawn Imp - joins Pusillin'),
(1435452, 6, 0, 44, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Pusillin - Fireball cast: on to the next spell (6 s)'),
(1435453, 4, 0, 44, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Pusillin - Fire Blast cast: on to the next spell (4 s)'),
(1435454, 9, 0, 44, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Pusillin - Blast Wave cast: on to the next spell (9 s)'),
(1432451, 0, 0, 37, 9, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Dire Maul - Cho''Rush''s set drawn: mage (9 = 1)'),
(1432451, 0, 1, 44, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Cho''Rush the Observer - the mage (phase 2)'),
(1432452, 0, 0, 37, 9, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Dire Maul - Cho''Rush''s set drawn: shaman (9 = 2)'),
(1432452, 0, 1, 44, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Cho''Rush the Observer - the shaman (phase 4)'),
(1432453, 0, 0, 37, 9, 3, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Dire Maul - Cho''Rush''s set drawn: priest (9 = 3)'),
(1432453, 0, 1, 44, 6, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Cho''Rush the Observer - the priest (phase 6)'),
(4295001, 0, 0, 4, 46, 33554946, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Highborne Summoner - selectable'),
(4295001, 0, 1, 22, 100, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Highborne Summoner - faction 100'),
(4295001, 0, 2, 26, 0, 0, 0, 0, 84376, 0, 9, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Highborne Summoner - attacks Immol''thar'),
(4295003, 0, 0, 80, 0, 0, 0, 0, 264399, 0, 12, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Immol''thar - the force field down'),
(4295003, 0, 1, 80, 0, 0, 0, 0, 397151, 0, 12, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Immol''thar - the magic vortex down'),
(4295003, 0, 2, 4, 46, 33554946, 2, 0, 84376, 0, 9, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Immol''thar - attackable'),
(4295003, 0, 3, 68, 4295001, 2, 11466, 100, 84376, 0, 9, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Immol''thar - his guardians within 100 yd turn on him'),
(4295003, 0, 4, 0, 1, 0, 0, 0, 56952, 0, 9, 2, 9364, 0, 0, 0, 0, 0, 0, 0, 0, 'Highborne Summoner - yells "The demon is loose! Quickly we must restrain him!"'),
(4295002, 0, 0, 37, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 209001, 'Dire Maul - the crystal event on (1 = 1)'),
(4295002, 0, 1, 80, 0, 0, 0, 0, 261760, 0, 12, 0, 0, 0, 0, 0, 0, 0, 0, 0, 429024, 'Dire Maul - crystal 1: its room empty, lit'),
(4295002, 0, 2, 37, 16, 1, 0, 0, 261760, 0, 12, 0, 0, 0, 0, 0, 0, 0, 0, 0, 429024, 'Dire Maul - crystal 1 lit (16 = 1)'),
(4295002, 0, 3, 80, 0, 0, 0, 0, 261762, 0, 12, 0, 0, 0, 0, 0, 0, 0, 0, 0, 429024, 'Dire Maul - crystal 2: its room empty, lit'),
(4295002, 0, 4, 37, 17, 1, 0, 0, 261762, 0, 12, 0, 0, 0, 0, 0, 0, 0, 0, 0, 429024, 'Dire Maul - crystal 2 lit (17 = 1)'),
(4295002, 0, 5, 80, 0, 0, 0, 0, 262113, 0, 12, 0, 0, 0, 0, 0, 0, 0, 0, 0, 429024, 'Dire Maul - crystal 3: its room empty, lit'),
(4295002, 0, 6, 37, 18, 1, 0, 0, 262113, 0, 12, 0, 0, 0, 0, 0, 0, 0, 0, 0, 429024, 'Dire Maul - crystal 3 lit (18 = 1)'),
(4295002, 0, 7, 80, 0, 0, 0, 0, 262115, 0, 12, 0, 0, 0, 0, 0, 0, 0, 0, 0, 429024, 'Dire Maul - crystal 4: its room empty, lit'),
(4295002, 0, 8, 37, 19, 1, 0, 0, 262115, 0, 12, 0, 0, 0, 0, 0, 0, 0, 0, 0, 429024, 'Dire Maul - crystal 4 lit (19 = 1)'),
(4295002, 0, 9, 80, 0, 0, 0, 0, 262117, 0, 12, 0, 0, 0, 0, 0, 0, 0, 0, 0, 429024, 'Dire Maul - crystal 5: its room empty, lit'),
(4295002, 0, 10, 37, 20, 1, 0, 0, 262117, 0, 12, 0, 0, 0, 0, 0, 0, 0, 0, 0, 429024, 'Dire Maul - crystal 5 lit (20 = 1)'),
(4295002, 0, 11, 39, 4295003, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0, 0, 0, 0, 0, 0, 429045, 'Dire Maul - every crystal lit: Immol''thar free'),
(4295002, 1, 12, 37, 1, 3, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 429045, 'Dire Maul - the crystal event done (1 = DONE)'),
(4295004, 0, 0, 4, 46, 33554946, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Prince Tortheldrin - attackable'),
(4295004, 0, 1, 22, 14, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Prince Tortheldrin - hostile (14) until he respawns'),
(4295005, 3000, 0, 32, 429054, 0, 1, 0, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Guard Slip''kik - still frozen and still fighting'),
(4295005, 0, 1, 73, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Guard Slip''kik - out of the fight (he charged through the trap)'),
(4295006, 0, 0, 3, 0, 22032, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 386.963, 515.853, -12.788, 0, 0, 'Captain Kromcrush - runs on (1 of 1)'),
(4295006, 22032, 1, 39, 4295009, 0, 0, 0, 0, 0, 0, 4, 100, 0, 0, 0, 0, 0, 0, 0, 0, 'Captain Kromcrush - on to Fengus (the fifth leg)'),
(4295009, 0, 0, 3, 0, 0, 1, 2, 0, 0, 0, 0, 5, 0, 0, 0, 383.887, 258.61, 11.44, 0, 0, 'Captain Kromcrush - runs on to Fengus (point 5)'),
(4295007, 0, 0, 37, 8, 3, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Dire Maul - Kromcrush goes to Fengus (8 = DONE)'),
(4295007, 0, 1, 0, 1, 0, 0, 0, 0, 0, 0, 4, 4295150, 0, 0, 0, 0, 0, 0, 0, 0, 'Captain Kromcrush - "Hey, who Fengus callin'' a gnoll lover?!"'),
(4295007, 0, 2, 15, 15716, 0, 0, 0, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Captain Kromcrush - Enrage'),
(4295007, 0, 3, 25, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Captain Kromcrush - runs'),
(4295007, 0, 4, 4, 46, 33554434, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Captain Kromcrush - unselectable on his way'),
(4295007, 0, 5, 4, 147, 1, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Captain Kromcrush - no gossip'),
(4295007, 0, 6, 3, 0, 17946, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 501.971, 482.321, 29.463, 0, 0, 'Captain Kromcrush - runs on (1 of 4)'),
(4295007, 17946, 7, 3, 0, 9129, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 536.947, 535.784, 27.917, 0, 0, 'Captain Kromcrush - runs on (2 of 4)'),
(4295007, 27075, 8, 3, 0, 9234, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 533.41, 591.445, -4.755, 0, 0, 'Captain Kromcrush - runs on (3 of 4)'),
(4295007, 36309, 9, 3, 0, 7953, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 538.76, 540.026, -25.403, 0, 0, 'Captain Kromcrush - runs on (4 of 4)'),
(4295007, 44262, 10, 39, 4295006, 0, 0, 0, 0, 0, 0, 4, 100, 0, 0, 0, 0, 0, 0, 0, 0, 'Captain Kromcrush - on to Fengus'),
(4295008, 0, 0, 1, 15, 0, 0, 0, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Captain Kromcrush - roars'),
(4295008, 0, 1, 10, 11450, 300000, 0, 0, 0, 0, 0, 0, 0, 0, 4, 2, 495.395, 482.309, 29.4627, 6.267, 429058, 'Captain Kromcrush - a Gordok Reaver (1 of 2) at the gate it is near'),
(4295008, 0, 3, 10, 11450, 300000, 0, 0, 0, 0, 0, 0, 0, 0, 4, 2, 633.437, 482.309, 29.4653, 3.198, 429059, 'Captain Kromcrush - a Gordok Reaver (1 of 2) at the other gate'),
(4295008, 0, 2, 10, 11450, 300000, 0, 0, 0, 0, 0, 0, 0, 0, 4, 2, 495.395, 482.309, 29.4627, 6.267, 429058, 'Captain Kromcrush - a Gordok Reaver (2 of 2) at the gate it is near'),
(4295008, 0, 4, 10, 11450, 300000, 0, 0, 0, 0, 0, 0, 0, 0, 4, 2, 633.437, 482.309, 29.4653, 3.198, 429059, 'Captain Kromcrush - a Gordok Reaver (2 of 2) at the other gate'),
(4295010, 5000, 0, 0, 1, 0, 0, 0, 56945, 0, 9, 0, 9472, 0, 0, 0, 0, 0, 0, 0, 116, 'Cho''Rush the Observer - yells "The king is dead - OH NOES!..."'),
(4295011, 0, 0, 32, 229237, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Dire Maul - the tribute not shown yet'),
(4295011, 0, 1, 37, 6, 3, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Dire Maul - the tribute shown to the king (6 = DONE)'),
(4295011, 0, 2, 9, 396409, 60, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 429067, 'Dire Maul - the tribute chest for 0 guards dead'),
(4295011, 0, 3, 9, 396422, 60, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 429069, 'Dire Maul - the tribute chest for 1 guard dead'),
(4295011, 0, 4, 9, 396423, 60, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 429071, 'Dire Maul - the tribute chest for 2 guards dead'),
(4295011, 0, 5, 9, 396424, 60, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 429073, 'Dire Maul - the tribute chest for 3 guards dead'),
(4295011, 0, 6, 9, 396425, 60, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 429075, 'Dire Maul - the tribute chest for 4 guards dead'),
(4295011, 0, 7, 9, 396426, 60, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 429077, 'Dire Maul - the tribute chest for 5 guards dead'),
(4295011, 0, 8, 9, 396427, 60, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 429079, 'Dire Maul - the tribute chest for 6 guards dead'),
(4295012, 0, 0, 14, 22799, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Dire Maul - a player leaves: King of the Gordok gone'),
(4295013, 0, 0, 76, 179512, 43200, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 559.22, 549.432, -25.4017, 0.0910895, 0, 'Dire Maul - the Fixed Trap where the Broken Trap lay'),
(4295013, 0, 1, 81, 0, 0, 0, 0, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Dire Maul - the Broken Trap gone'),
(4295018, 0, 0, 9, 99786, 86400, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Wheel of the Black March - there'),
(4295018, 0, 1, 80, 0, 0, 0, 0, 99786, 0, 12, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Wheel of the Black March - active'),
(4295018, 0, 2, 4, 9, 1, 1, 0, 99786, 0, 12, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Wheel of the Black March - in use'),
(4295018, 0, 3, 37, 22, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Dreadsteed ritual - the Wheel of the Black March up (22 = 1)'),
(4295018, 0, 4, 39, 4295015, 0, 0, 0, 99895, 0, 12, 2, 100, 0, 0, 0, 0, 0, 0, 0, 0, 'Wheel of the Black March - its aura every 5 s'),
(4295015, 0, 0, 32, 429104, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Wheel of the Black March - down: no more aura'),
(4295015, 0, 1, 32, 429101, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Wheel of the Black March - the ritual not running'),
(4295015, 0, 2, 15, 23120, 2, 0, 0, 100, 0, 23, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Wheel of the Black March - its aura on the player at the pedestal'),
(4295015, 5000, 3, 39, 4295015, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0, 0, 0, 0, 0, 0, 0, 'Wheel of the Black March - again in 5 s'),
(4295021, 0, 0, 32, 429104, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Wheel of the Black March - already down'),
(4295021, 0, 1, 80, 1, 0, 0, 0, 99786, 0, 12, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Wheel of the Black March - broken'),
(4295021, 0, 2, 4, 9, 1, 2, 0, 99786, 0, 12, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Wheel of the Black March - not in use'),
(4295021, 0, 3, 37, 22, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Dreadsteed ritual - the Wheel of the Black March down (22 = 0)'),
(4295019, 0, 0, 9, 99785, 86400, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Doomsday Candle - there'),
(4295019, 0, 1, 80, 0, 0, 0, 0, 99785, 0, 12, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Doomsday Candle - active'),
(4295019, 0, 2, 4, 9, 1, 1, 0, 99785, 0, 12, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Doomsday Candle - in use'),
(4295019, 0, 3, 37, 23, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Dreadsteed ritual - the Doomsday Candle up (23 = 1)'),
(4295019, 0, 4, 39, 4295016, 0, 0, 0, 99895, 0, 12, 2, 100, 0, 0, 0, 0, 0, 0, 0, 0, 'Doomsday Candle - its aura every 5 s'),
(4295016, 0, 0, 32, 429105, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Doomsday Candle - down: no more aura'),
(4295016, 0, 1, 32, 429101, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Doomsday Candle - the ritual not running'),
(4295016, 0, 2, 15, 23226, 2, 0, 0, 100, 0, 23, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Doomsday Candle - its aura on the player at the pedestal'),
(4295016, 5000, 3, 39, 4295016, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0, 0, 0, 0, 0, 0, 0, 'Doomsday Candle - again in 5 s'),
(4295022, 0, 0, 32, 429105, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Doomsday Candle - already down'),
(4295022, 0, 1, 80, 1, 0, 0, 0, 99785, 0, 12, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Doomsday Candle - broken'),
(4295022, 0, 2, 4, 9, 1, 2, 0, 99785, 0, 12, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Doomsday Candle - not in use'),
(4295022, 0, 3, 37, 23, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Dreadsteed ritual - the Doomsday Candle down (23 = 0)'),
(4295020, 0, 0, 9, 99787, 86400, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Bell of Dethmoora - there'),
(4295020, 0, 1, 80, 0, 0, 0, 0, 99787, 0, 12, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Bell of Dethmoora - active'),
(4295020, 0, 2, 4, 9, 1, 1, 0, 99787, 0, 12, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Bell of Dethmoora - in use'),
(4295020, 0, 3, 37, 24, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Dreadsteed ritual - the Bell of Dethmoora up (24 = 1)'),
(4295020, 0, 4, 39, 4295017, 0, 0, 0, 99895, 0, 12, 2, 100, 0, 0, 0, 0, 0, 0, 0, 0, 'Bell of Dethmoora - its aura every 5 s'),
(4295017, 0, 0, 32, 429106, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Bell of Dethmoora - down: no more aura'),
(4295017, 0, 1, 32, 429101, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Bell of Dethmoora - the ritual not running'),
(4295017, 0, 2, 15, 23117, 2, 0, 0, 100, 0, 23, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Bell of Dethmoora - its aura on the player at the pedestal'),
(4295017, 5000, 3, 39, 4295017, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0, 0, 0, 0, 0, 0, 0, 'Bell of Dethmoora - again in 5 s'),
(4295023, 0, 0, 32, 429106, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Bell of Dethmoora - already down'),
(4295023, 0, 1, 80, 1, 0, 0, 0, 99787, 0, 12, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Bell of Dethmoora - broken'),
(4295023, 0, 2, 4, 9, 1, 2, 0, 99787, 0, 12, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Bell of Dethmoora - not in use'),
(4295023, 0, 3, 37, 24, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Dreadsteed ritual - the Bell of Dethmoora down (24 = 0)'),
(4295024, 0, 0, 39, 4295036, 4295037, 4295038, 0, 0, 0, 0, 0, 34, 33, 33, 0, 0, 0, 0, 0, 0, 'Dreadsteed ritual - a node at random'),
(4295036, 0, 0, 39, 4295024, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0, 0, 0, 0, 0, 0, 429107, 'Dreadsteed ritual - the Wheel of the Black March is down: pick again'),
(4295036, 0, 1, 32, 429104, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Dreadsteed ritual - the Wheel of the Black March is down'),
(4295036, 0, 2, 39, 4295021, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0, 0, 0, 0, 0, 0, 0, 'Dreadsteed ritual - the Wheel of the Black March breaks'),
(4295037, 0, 0, 39, 4295024, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0, 0, 0, 0, 0, 0, 429108, 'Dreadsteed ritual - the Doomsday Candle is down: pick again'),
(4295037, 0, 1, 32, 429105, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Dreadsteed ritual - the Doomsday Candle is down'),
(4295037, 0, 2, 39, 4295022, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0, 0, 0, 0, 0, 0, 0, 'Dreadsteed ritual - the Doomsday Candle breaks'),
(4295038, 0, 0, 39, 4295024, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0, 0, 0, 0, 0, 0, 429109, 'Dreadsteed ritual - the Bell of Dethmoora is down: pick again'),
(4295038, 0, 1, 32, 429106, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Dreadsteed ritual - the Bell of Dethmoora is down'),
(4295038, 0, 2, 39, 4295023, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0, 0, 0, 0, 0, 0, 0, 'Dreadsteed ritual - the Bell of Dethmoora breaks'),
(4295039, 0, 0, 32, 429098, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Dreadsteed ritual - break 1 - not in the waves'),
(4295039, 0, 1, 39, 4295026, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0, 0, 0, 0, 0, 0, 429115, 'Dreadsteed ritual - break 1 - fewer than two nodes up: the ritual fails'),
(4295039, 0, 2, 32, 429115, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Dreadsteed ritual - break 1 - fewer than two nodes up'),
(4295039, 0, 3, 39, 4295024, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0, 0, 0, 0, 0, 0, 0, 'Dreadsteed ritual - break 1 - a node breaks'),
(4295047, 36000, 0, 39, 4295040, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0, 0, 0, 0, 0, 0, 0, 'Dreadsteed ritual - break 1 - the next, 36 s after'),
(4295048, 40000, 0, 39, 4295040, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0, 0, 0, 0, 0, 0, 0, 'Dreadsteed ritual - break 1 - the next, 40 s after'),
(4295049, 44000, 0, 39, 4295040, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0, 0, 0, 0, 0, 0, 0, 'Dreadsteed ritual - break 1 - the next, 44 s after'),
(4295039, 0, 4, 39, 4295047, 4295048, 4295049, 0, 0, 0, 0, 0, 34, 33, 33, 0, 0, 0, 0, 0, 0, 'Dreadsteed ritual - break 1: the next after its wait'),
(4295040, 0, 0, 32, 429098, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Dreadsteed ritual - break 2 - not in the waves'),
(4295040, 0, 1, 39, 4295026, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0, 0, 0, 0, 0, 0, 429115, 'Dreadsteed ritual - break 2 - fewer than two nodes up: the ritual fails'),
(4295040, 0, 2, 32, 429115, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Dreadsteed ritual - break 2 - fewer than two nodes up'),
(4295040, 0, 3, 39, 4295024, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0, 0, 0, 0, 0, 0, 0, 'Dreadsteed ritual - break 2 - a node breaks'),
(4295050, 36000, 0, 39, 4295041, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0, 0, 0, 0, 0, 0, 0, 'Dreadsteed ritual - break 2 - the next, 36 s after'),
(4295051, 40000, 0, 39, 4295041, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0, 0, 0, 0, 0, 0, 0, 'Dreadsteed ritual - break 2 - the next, 40 s after'),
(4295052, 44000, 0, 39, 4295041, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0, 0, 0, 0, 0, 0, 0, 'Dreadsteed ritual - break 2 - the next, 44 s after'),
(4295040, 0, 4, 39, 4295050, 4295051, 4295052, 0, 0, 0, 0, 0, 34, 33, 33, 0, 0, 0, 0, 0, 0, 'Dreadsteed ritual - break 2: the next after its wait'),
(4295041, 0, 0, 32, 429098, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Dreadsteed ritual - break 3 - not in the waves'),
(4295041, 0, 1, 39, 4295026, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0, 0, 0, 0, 0, 0, 429115, 'Dreadsteed ritual - break 3 - fewer than two nodes up: the ritual fails'),
(4295041, 0, 2, 32, 429115, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Dreadsteed ritual - break 3 - fewer than two nodes up'),
(4295041, 0, 3, 39, 4295024, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0, 0, 0, 0, 0, 0, 0, 'Dreadsteed ritual - break 3 - a node breaks'),
(4295053, 36000, 0, 39, 4295042, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0, 0, 0, 0, 0, 0, 0, 'Dreadsteed ritual - break 3 - the next, 36 s after'),
(4295054, 40000, 0, 39, 4295042, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0, 0, 0, 0, 0, 0, 0, 'Dreadsteed ritual - break 3 - the next, 40 s after'),
(4295055, 44000, 0, 39, 4295042, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0, 0, 0, 0, 0, 0, 0, 'Dreadsteed ritual - break 3 - the next, 44 s after'),
(4295041, 0, 4, 39, 4295053, 4295054, 4295055, 0, 0, 0, 0, 0, 34, 33, 33, 0, 0, 0, 0, 0, 0, 'Dreadsteed ritual - break 3: the next after its wait'),
(4295042, 0, 0, 32, 429098, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Dreadsteed ritual - break 4 - not in the waves'),
(4295042, 0, 1, 39, 4295026, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0, 0, 0, 0, 0, 0, 429115, 'Dreadsteed ritual - break 4 - fewer than two nodes up: the ritual fails'),
(4295042, 0, 2, 32, 429115, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Dreadsteed ritual - break 4 - fewer than two nodes up'),
(4295042, 0, 3, 39, 4295024, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0, 0, 0, 0, 0, 0, 0, 'Dreadsteed ritual - break 4 - a node breaks'),
(4295056, 36000, 0, 39, 4295043, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0, 0, 0, 0, 0, 0, 0, 'Dreadsteed ritual - break 4 - the next, 36 s after'),
(4295057, 40000, 0, 39, 4295043, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0, 0, 0, 0, 0, 0, 0, 'Dreadsteed ritual - break 4 - the next, 40 s after'),
(4295058, 44000, 0, 39, 4295043, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0, 0, 0, 0, 0, 0, 0, 'Dreadsteed ritual - break 4 - the next, 44 s after'),
(4295042, 0, 4, 39, 4295056, 4295057, 4295058, 0, 0, 0, 0, 0, 34, 33, 33, 0, 0, 0, 0, 0, 0, 'Dreadsteed ritual - break 4: the next after its wait'),
(4295043, 0, 0, 32, 429098, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Dreadsteed ritual - break 5 - not in the waves'),
(4295043, 0, 1, 39, 4295026, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0, 0, 0, 0, 0, 0, 429115, 'Dreadsteed ritual - break 5 - fewer than two nodes up: the ritual fails'),
(4295043, 0, 2, 32, 429115, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Dreadsteed ritual - break 5 - fewer than two nodes up'),
(4295043, 0, 3, 39, 4295024, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0, 0, 0, 0, 0, 0, 0, 'Dreadsteed ritual - break 5 - a node breaks'),
(4295059, 41000, 0, 39, 4295044, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0, 0, 0, 0, 0, 0, 0, 'Dreadsteed ritual - break 5 - the next, 41 s after'),
(4295060, 70000, 0, 39, 4295044, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0, 0, 0, 0, 0, 0, 0, 'Dreadsteed ritual - break 5 - the next, 70 s after'),
(4295043, 0, 4, 39, 4295059, 4295060, 0, 0, 0, 0, 0, 0, 50, 50, 0, 0, 0, 0, 0, 0, 0, 'Dreadsteed ritual - break 5: the next after its wait'),
(4295044, 0, 0, 32, 429098, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Dreadsteed ritual - break 6 - not in the waves'),
(4295044, 0, 1, 39, 4295026, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0, 0, 0, 0, 0, 0, 429115, 'Dreadsteed ritual - break 6 - fewer than two nodes up: the ritual fails'),
(4295044, 0, 2, 32, 429115, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Dreadsteed ritual - break 6 - fewer than two nodes up'),
(4295044, 0, 3, 39, 4295024, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0, 0, 0, 0, 0, 0, 0, 'Dreadsteed ritual - break 6 - a node breaks'),
(4295061, 41000, 0, 39, 4295045, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0, 0, 0, 0, 0, 0, 0, 'Dreadsteed ritual - break 6 - the next, 41 s after'),
(4295062, 70000, 0, 39, 4295045, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0, 0, 0, 0, 0, 0, 0, 'Dreadsteed ritual - break 6 - the next, 70 s after'),
(4295044, 0, 4, 39, 4295061, 4295062, 0, 0, 0, 0, 0, 0, 50, 50, 0, 0, 0, 0, 0, 0, 0, 'Dreadsteed ritual - break 6: the next after its wait'),
(4295045, 0, 0, 32, 429098, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Dreadsteed ritual - break 7 - not in the waves'),
(4295045, 0, 1, 39, 4295026, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0, 0, 0, 0, 0, 0, 429115, 'Dreadsteed ritual - break 7 - fewer than two nodes up: the ritual fails'),
(4295045, 0, 2, 32, 429115, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Dreadsteed ritual - break 7 - fewer than two nodes up'),
(4295045, 0, 3, 39, 4295024, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0, 0, 0, 0, 0, 0, 0, 'Dreadsteed ritual - break 7 - a node breaks'),
(4295063, 41000, 0, 39, 4295046, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0, 0, 0, 0, 0, 0, 0, 'Dreadsteed ritual - break 7 - the next, 41 s after'),
(4295064, 70000, 0, 39, 4295046, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0, 0, 0, 0, 0, 0, 0, 'Dreadsteed ritual - break 7 - the next, 70 s after'),
(4295045, 0, 4, 39, 4295063, 4295064, 0, 0, 0, 0, 0, 0, 50, 50, 0, 0, 0, 0, 0, 0, 0, 'Dreadsteed ritual - break 7: the next after its wait'),
(4295046, 0, 0, 32, 429098, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Dreadsteed ritual - break 8 - not in the waves'),
(4295046, 0, 1, 39, 4295026, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0, 0, 0, 0, 0, 0, 429115, 'Dreadsteed ritual - break 8 - fewer than two nodes up: the ritual fails'),
(4295046, 0, 2, 32, 429115, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Dreadsteed ritual - break 8 - fewer than two nodes up'),
(4295046, 0, 3, 39, 4295024, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0, 0, 0, 0, 0, 0, 0, 'Dreadsteed ritual - break 8 - a node breaks'),
(4295065, 41000, 0, 39, 4295025, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0, 0, 0, 0, 0, 0, 0, 'Dreadsteed ritual - break 8 - the next, 41 s after'),
(4295066, 70000, 0, 39, 4295025, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0, 0, 0, 0, 0, 0, 0, 'Dreadsteed ritual - break 8 - the next, 70 s after'),
(4295046, 0, 4, 39, 4295065, 4295066, 0, 0, 0, 0, 0, 0, 50, 50, 0, 0, 0, 0, 0, 0, 0, 'Dreadsteed ritual - break 8: the next after its wait'),
(4295025, 0, 0, 32, 429098, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Dreadsteed ritual - break 9 and on - not in the waves'),
(4295025, 0, 1, 39, 4295026, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0, 0, 0, 0, 0, 0, 429115, 'Dreadsteed ritual - break 9 and on - fewer than two nodes up: the ritual fails'),
(4295025, 0, 2, 32, 429115, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Dreadsteed ritual - break 9 and on - fewer than two nodes up'),
(4295025, 0, 3, 39, 4295024, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0, 0, 0, 0, 0, 0, 0, 'Dreadsteed ritual - break 9 and on - a node breaks'),
(4295025, 41000, 4, 39, 4295025, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0, 0, 0, 0, 0, 0, 0, 'Dreadsteed ritual - and again 41 s after'),
(4295067, 16000, 0, 39, 4295039, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0, 0, 0, 0, 0, 0, 0, 'Dreadsteed ritual - the first node breaks 16 s into the waves'),
(4295068, 22000, 0, 39, 4295039, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0, 0, 0, 0, 0, 0, 0, 'Dreadsteed ritual - the first node breaks 22 s into the waves'),
(4295069, 29000, 0, 39, 4295039, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0, 0, 0, 0, 0, 0, 0, 'Dreadsteed ritual - the first node breaks 29 s into the waves'),
(4295034, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0, 4295230, 0, 0, 0, 0, 0, 0, 0, 0, 'Xorothian Imp - pulled back to Xoroth'),
(4295034, 0, 1, 18, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Xorothian Imp - gone'),
(4295035, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0, 4295240, 0, 0, 0, 0, 0, 0, 0, 0, 'Dread Guard - pulled back to Xoroth'),
(4295035, 0, 1, 18, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Dread Guard - gone'),
(4295027, 0, 0, 32, 429098, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Dreadsteed ritual - not in the waves'),
(4295027, 0, 1, 37, 21, 3, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Dreadsteed ritual - all three nodes up: the ritual done, the item next (21 = 3)'),
(4295027, 0, 2, 80, 0, 0, 0, 0, 99784, 0, 12, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Dreadsteed ritual - the circle alight'),
(4295027, 0, 3, 81, 0, 0, 0, 0, 179681, 100, 11, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Dreadsteed ritual - done - a Fel Fire flame gone (1 of 18)'),
(4295027, 0, 4, 81, 0, 0, 0, 0, 179681, 100, 11, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Dreadsteed ritual - done - a Fel Fire flame gone (2 of 18)'),
(4295027, 0, 5, 81, 0, 0, 0, 0, 179681, 100, 11, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Dreadsteed ritual - done - a Fel Fire flame gone (3 of 18)'),
(4295027, 0, 6, 81, 0, 0, 0, 0, 179681, 100, 11, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Dreadsteed ritual - done - a Fel Fire flame gone (4 of 18)'),
(4295027, 0, 7, 81, 0, 0, 0, 0, 179681, 100, 11, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Dreadsteed ritual - done - a Fel Fire flame gone (5 of 18)'),
(4295027, 0, 8, 81, 0, 0, 0, 0, 179681, 100, 11, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Dreadsteed ritual - done - a Fel Fire flame gone (6 of 18)'),
(4295027, 0, 9, 81, 0, 0, 0, 0, 179681, 100, 11, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Dreadsteed ritual - done - a Fel Fire flame gone (7 of 18)'),
(4295027, 0, 10, 81, 0, 0, 0, 0, 179681, 100, 11, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Dreadsteed ritual - done - a Fel Fire flame gone (8 of 18)'),
(4295027, 0, 11, 81, 0, 0, 0, 0, 179681, 100, 11, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Dreadsteed ritual - done - a Fel Fire flame gone (9 of 18)'),
(4295027, 0, 12, 81, 0, 0, 0, 0, 179681, 100, 11, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Dreadsteed ritual - done - a Fel Fire flame gone (10 of 18)'),
(4295027, 0, 13, 81, 0, 0, 0, 0, 179681, 100, 11, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Dreadsteed ritual - done - a Fel Fire flame gone (11 of 18)'),
(4295027, 0, 14, 81, 0, 0, 0, 0, 179681, 100, 11, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Dreadsteed ritual - done - a Fel Fire flame gone (12 of 18)'),
(4295027, 0, 15, 81, 0, 0, 0, 0, 179681, 100, 11, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Dreadsteed ritual - done - a Fel Fire flame gone (13 of 18)'),
(4295027, 0, 16, 81, 0, 0, 0, 0, 179681, 100, 11, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Dreadsteed ritual - done - a Fel Fire flame gone (14 of 18)'),
(4295027, 0, 17, 81, 0, 0, 0, 0, 179681, 100, 11, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Dreadsteed ritual - done - a Fel Fire flame gone (15 of 18)'),
(4295027, 0, 18, 81, 0, 0, 0, 0, 179681, 100, 11, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Dreadsteed ritual - done - a Fel Fire flame gone (16 of 18)'),
(4295027, 0, 19, 81, 0, 0, 0, 0, 179681, 100, 11, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Dreadsteed ritual - done - a Fel Fire flame gone (17 of 18)'),
(4295027, 0, 20, 81, 0, 0, 0, 0, 179681, 100, 11, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Dreadsteed ritual - done - a Fel Fire flame gone (18 of 18)'),
(4295027, 0, 21, 68, 4295034, 2, 14482, 30, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Dreadsteed ritual - done - every Xorothian Imp within 30 yd'),
(4295027, 0, 22, 68, 4295035, 2, 14483, 30, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Dreadsteed ritual - done - every Dread Guard within 30 yd'),
(4295026, 0, 0, 32, 429098, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Dreadsteed ritual - not in the waves'),
(4295026, 0, 1, 37, 21, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Dreadsteed ritual - failed: nothing again (21 = 0)'),
(4295026, 0, 2, 81, 99774, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Dreadsteed ritual - failed: rune 1 gone'),
(4295026, 0, 3, 81, 99775, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Dreadsteed ritual - failed: rune 2 gone'),
(4295026, 0, 4, 81, 99776, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Dreadsteed ritual - failed: rune 3 gone'),
(4295026, 0, 5, 81, 99777, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Dreadsteed ritual - failed: rune 4 gone'),
(4295026, 0, 6, 81, 99778, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Dreadsteed ritual - failed: rune 5 gone'),
(4295026, 0, 7, 81, 99779, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Dreadsteed ritual - failed: rune 6 gone'),
(4295026, 0, 8, 81, 99780, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Dreadsteed ritual - failed: rune 7 gone'),
(4295026, 0, 9, 81, 99781, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Dreadsteed ritual - failed: rune 8 gone'),
(4295026, 0, 10, 81, 99782, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Dreadsteed ritual - failed: rune 9 gone'),
(4295026, 0, 11, 81, 99784, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Dreadsteed ritual - failed: the circle gone'),
(4295026, 0, 12, 81, 99786, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Dreadsteed ritual - failed: Wheel of the Black March gone'),
(4295026, 0, 13, 81, 99785, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Dreadsteed ritual - failed: Doomsday Candle gone'),
(4295026, 0, 14, 81, 99787, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Dreadsteed ritual - failed: Bell of Dethmoora gone'),
(4295026, 0, 15, 37, 22, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Dreadsteed ritual - failed: the Wheel of the Black March down (22 = 0)'),
(4295026, 0, 16, 37, 23, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Dreadsteed ritual - failed: the Doomsday Candle down (23 = 0)'),
(4295026, 0, 17, 37, 24, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Dreadsteed ritual - failed: the Bell of Dethmoora down (24 = 0)'),
(4295026, 0, 18, 81, 0, 0, 0, 0, 179681, 100, 11, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Dreadsteed ritual - failed - a Fel Fire flame gone (1 of 18)'),
(4295026, 0, 19, 81, 0, 0, 0, 0, 179681, 100, 11, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Dreadsteed ritual - failed - a Fel Fire flame gone (2 of 18)'),
(4295026, 0, 20, 81, 0, 0, 0, 0, 179681, 100, 11, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Dreadsteed ritual - failed - a Fel Fire flame gone (3 of 18)'),
(4295026, 0, 21, 81, 0, 0, 0, 0, 179681, 100, 11, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Dreadsteed ritual - failed - a Fel Fire flame gone (4 of 18)'),
(4295026, 0, 22, 81, 0, 0, 0, 0, 179681, 100, 11, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Dreadsteed ritual - failed - a Fel Fire flame gone (5 of 18)'),
(4295026, 0, 23, 81, 0, 0, 0, 0, 179681, 100, 11, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Dreadsteed ritual - failed - a Fel Fire flame gone (6 of 18)'),
(4295026, 0, 24, 81, 0, 0, 0, 0, 179681, 100, 11, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Dreadsteed ritual - failed - a Fel Fire flame gone (7 of 18)'),
(4295026, 0, 25, 81, 0, 0, 0, 0, 179681, 100, 11, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Dreadsteed ritual - failed - a Fel Fire flame gone (8 of 18)'),
(4295026, 0, 26, 81, 0, 0, 0, 0, 179681, 100, 11, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Dreadsteed ritual - failed - a Fel Fire flame gone (9 of 18)'),
(4295026, 0, 27, 81, 0, 0, 0, 0, 179681, 100, 11, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Dreadsteed ritual - failed - a Fel Fire flame gone (10 of 18)'),
(4295026, 0, 28, 81, 0, 0, 0, 0, 179681, 100, 11, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Dreadsteed ritual - failed - a Fel Fire flame gone (11 of 18)'),
(4295026, 0, 29, 81, 0, 0, 0, 0, 179681, 100, 11, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Dreadsteed ritual - failed - a Fel Fire flame gone (12 of 18)'),
(4295026, 0, 30, 81, 0, 0, 0, 0, 179681, 100, 11, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Dreadsteed ritual - failed - a Fel Fire flame gone (13 of 18)'),
(4295026, 0, 31, 81, 0, 0, 0, 0, 179681, 100, 11, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Dreadsteed ritual - failed - a Fel Fire flame gone (14 of 18)'),
(4295026, 0, 32, 81, 0, 0, 0, 0, 179681, 100, 11, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Dreadsteed ritual - failed - a Fel Fire flame gone (15 of 18)'),
(4295026, 0, 33, 81, 0, 0, 0, 0, 179681, 100, 11, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Dreadsteed ritual - failed - a Fel Fire flame gone (16 of 18)'),
(4295026, 0, 34, 81, 0, 0, 0, 0, 179681, 100, 11, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Dreadsteed ritual - failed - a Fel Fire flame gone (17 of 18)'),
(4295026, 0, 35, 81, 0, 0, 0, 0, 179681, 100, 11, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Dreadsteed ritual - failed - a Fel Fire flame gone (18 of 18)'),
(4295026, 0, 36, 68, 4295034, 2, 14482, 30, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Dreadsteed ritual - failed - every Xorothian Imp within 30 yd'),
(4295026, 0, 37, 68, 4295035, 2, 14483, 30, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Dreadsteed ritual - failed - every Dread Guard within 30 yd'),
(4295028, 0, 0, 32, 429098, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Dreadsteed ritual - not in the waves'),
(4295028, 0, 1, 39, 4295027, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0, 0, 0, 0, 0, 0, 429110, 'Dreadsteed ritual - all three nodes up: done'),
(4295028, 0, 2, 32, 429110, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Dreadsteed ritual - all three nodes up'),
(4295028, 20000, 3, 39, 4295028, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0, 0, 0, 0, 0, 0, 0, 'Dreadsteed ritual - a node is down: look again in 20 s'),
(4295029, 9000, 0, 39, 4295020, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0, 0, 0, 0, 0, 0, 429097, 'J''eevee - the Bell of Dethmoora up'),
(4295029, 14000, 1, 39, 4295018, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0, 0, 0, 0, 0, 0, 429097, 'J''eevee - the Wheel of the Black March up'),
(4295029, 20000, 2, 39, 4295019, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0, 0, 0, 0, 0, 0, 429097, 'J''eevee - the Doomsday Candle up'),
(4295029, 27000, 3, 37, 21, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 429097, 'Dreadsteed ritual - the waves begin (21 = 2)'),
(4295029, 27001, 4, 76, 179681, 480, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 9.42580410532716, 842.4511979014895, -29.8, 0, 429098, 'Dreadsteed ritual - a Fel Fire flame at the ring (1 of 18)'),
(4295029, 27001, 5, 76, 179681, 480, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, -3.61179653129296, 857.2087095604104, -29.8, 0, 429098, 'Dreadsteed ritual - a Fel Fire flame at the ring (2 of 18)'),
(4295029, 27001, 6, 76, 179681, 480, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, -20.91049989499287, 866.6171123291007, -29.8, 0, 429098, 'Dreadsteed ritual - a Fel Fire flame at the ring (3 of 18)'),
(4295029, 27001, 7, 76, 179681, 480, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, -40.38382705843913, 869.5416139804198, -29.8, 0, 429098, 'Dreadsteed ritual - a Fel Fire flame at the ring (4 of 18)'),
(4295029, 27001, 8, 76, 179681, 480, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, -59.68300737001968, 865.629476454171, -29.8, 0, 429098, 'Dreadsteed ritual - a Fel Fire flame at the ring (5 of 18)'),
(4295029, 27001, 9, 76, 179681, 480, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, -76.48027485859129, 855.3525612730207, -29.8, 0, 429098, 'Dreadsteed ritual - a Fel Fire flame at the ring (6 of 18)'),
(4295029, 27001, 10, 76, 179681, 480, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, -88.7496311637663, 839.9504160789303, -29.8, 0, 429098, 'Dreadsteed ritual - a Fel Fire flame at the ring (7 of 18)'),
(4295029, 27001, 11, 76, 179681, 480, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, -95.01121083872673, 821.2807668937606, -29.8, 0, 429098, 'Dreadsteed ritual - a Fel Fire flame at the ring (8 of 18)'),
(4295029, 27001, 12, 76, 179681, 480, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, -94.5097749635984, 801.59544894392, -29.8, 0, 429098, 'Dreadsteed ritual - a Fel Fire flame at the ring (9 of 18)'),
(4295029, 27001, 13, 76, 179681, 480, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, -87.30580410532716, 783.2688020985105, -29.8, 0, 429098, 'Dreadsteed ritual - a Fel Fire flame at the ring (10 of 18)'),
(4295029, 27001, 14, 76, 179681, 480, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, -74.26820346870707, 768.5112904395896, -29.8, 0, 429098, 'Dreadsteed ritual - a Fel Fire flame at the ring (11 of 18)'),
(4295029, 27001, 15, 76, 179681, 480, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, -56.969500105007135, 759.1028876708993, -29.8, 0, 429098, 'Dreadsteed ritual - a Fel Fire flame at the ring (12 of 18)'),
(4295029, 27001, 16, 76, 179681, 480, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, -37.49617294156085, 756.1783860195802, -29.8, 0, 429098, 'Dreadsteed ritual - a Fel Fire flame at the ring (13 of 18)'),
(4295029, 27001, 17, 76, 179681, 480, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, -18.196992629980322, 760.090523545829, -29.8, 0, 429098, 'Dreadsteed ritual - a Fel Fire flame at the ring (14 of 18)'),
(4295029, 27001, 18, 76, 179681, 480, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, -1.3997251414087444, 770.3674387269792, -29.8, 0, 429098, 'Dreadsteed ritual - a Fel Fire flame at the ring (15 of 18)'),
(4295029, 27001, 19, 76, 179681, 480, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 10.869631163766293, 785.7695839210697, -29.8, 0, 429098, 'Dreadsteed ritual - a Fel Fire flame at the ring (16 of 18)'),
(4295029, 27001, 20, 76, 179681, 480, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 17.13121083872673, 804.4392331062394, -29.8, 0, 429098, 'Dreadsteed ritual - a Fel Fire flame at the ring (17 of 18)'),
(4295029, 27001, 21, 76, 179681, 480, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 16.629774963598408, 824.12455105608, -29.8, 0, 429098, 'Dreadsteed ritual - a Fel Fire flame at the ring (18 of 18)'),
(4295029, 27001, 22, 9, 99784, 86400, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 429098, 'Dreadsteed ritual - the ritual circle'),
(4295029, 27001, 23, 80, 1, 0, 0, 0, 99784, 0, 12, 0, 0, 0, 0, 0, 0, 0, 0, 0, 429098, 'Dreadsteed ritual - the circle ready'),
(4295029, 27001, 24, 39, 4295067, 4295068, 4295069, 0, 0, 0, 0, 0, 34, 33, 33, 0, 0, 0, 0, 0, 429098, 'Dreadsteed ritual - the first node breaks'),
(4295029, 72000, 25, 9, 99774, 86400, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 429098, 'Dreadsteed ritual - rune 1 of 9'),
(4295029, 117000, 26, 9, 99775, 86400, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 429098, 'Dreadsteed ritual - rune 2 of 9'),
(4295029, 162000, 27, 9, 99776, 86400, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 429098, 'Dreadsteed ritual - rune 3 of 9'),
(4295029, 207000, 28, 9, 99777, 86400, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 429098, 'Dreadsteed ritual - rune 4 of 9'),
(4295029, 252000, 29, 9, 99778, 86400, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 429098, 'Dreadsteed ritual - rune 5 of 9'),
(4295029, 297000, 30, 9, 99779, 86400, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 429098, 'Dreadsteed ritual - rune 6 of 9'),
(4295029, 342000, 31, 9, 99780, 86400, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 429098, 'Dreadsteed ritual - rune 7 of 9'),
(4295029, 387000, 32, 9, 99781, 86400, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 429098, 'Dreadsteed ritual - rune 8 of 9'),
(4295029, 432000, 33, 9, 99782, 86400, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 429098, 'Dreadsteed ritual - rune 9 of 9'),
(4295029, 432000, 34, 89, 0, 0, 0, 0, 99782, 0, 12, 0, 0, 0, 0, 0, 0, 0, 0, 0, 429098, 'Dreadsteed ritual - the last rune flares'),
(4295029, 432000, 35, 39, 4295028, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0, 0, 0, 0, 0, 0, 429098, 'Dreadsteed ritual - the nodes checked'),
(4295032, 0, 0, 34, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, -38.94, 812.86, -29.53, 0, 0, 'Xorothian Imp - home at the pedestal'),
(4295032, 0, 1, 3, 0, 10000, 1, 2, 0, 0, 0, 0, 1, 0, 0, 0, -38.94, 812.86, -29.53, 0, 0, 'Xorothian Imp - to the pedestal'),
(4295033, 0, 0, 34, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, -38.94, 812.86, -29.53, 0, 0, 'Dread Guard - home at the pedestal'),
(4295033, 0, 1, 3, 0, 25000, 1, 2, 0, 0, 0, 0, 1, 0, 0, 0, -38.94, 812.86, -29.53, 0, 0, 'Dread Guard - to the pedestal'),
(4295030, 27000, 0, 10, 14482, 600000, 0, 0, 0, 0, 0, 0, 1, 4295032, -1, 1, 14.799782339252396, 845.7391087794329, -28, 0, 429098, 'Dreadsteed ritual - a Xorothian Imp at the ring (1 of 18)'),
(4295030, 27000, 1, 10, 14482, 600000, 0, 0, 0, 0, 0, 0, 1, 4295032, -1, 1, 0.3135594096744896, 862.1363439560116, -28, 0, 429098, 'Dreadsteed ritual - a Xorothian Imp at the ring (2 of 18)'),
(4295030, 27000, 2, 10, 14482, 600000, 0, 0, 0, 0, 0, 0, 1, 4295032, -1, 1, -18.907222105547635, 872.5901248101119, -28, 0, 429098, 'Dreadsteed ritual - a Xorothian Imp at the ring (3 of 18)'),
(4295030, 27000, 3, 10, 14482, 600000, 0, 0, 0, 0, 0, 0, 1, 4295032, -1, 1, -40.54425228715459, 875.8395710893553, -28, 0, 429098, 'Dreadsteed ritual - a Xorothian Imp at the ring (4 of 18)'),
(4295030, 27000, 4, 10, 14482, 600000, 0, 0, 0, 0, 0, 0, 1, 4295032, -1, 1, -61.987785966688534, 871.4927516157455, -28, 0, 429098, 'Dreadsteed ritual - a Xorothian Imp at the ring (5 of 18)'),
(4295030, 27000, 5, 10, 14482, 600000, 0, 0, 0, 0, 0, 0, 1, 4295032, -1, 1, -80.65141650954587, 860.073956970023, -28, 0, 429098, 'Dreadsteed ritual - a Xorothian Imp at the ring (6 of 18)'),
(4295030, 27000, 6, 10, 14482, 600000, 0, 0, 0, 0, 0, 0, 1, 4295032, -1, 1, -94.28403462640699, 842.9604623099225, -28, 0, 429098, 'Dreadsteed ritual - a Xorothian Imp at the ring (7 of 18)'),
(4295030, 27000, 7, 10, 14482, 600000, 0, 0, 0, 0, 0, 0, 1, 4295032, -1, 1, -101.24134537636303, 822.216407659734, -28, 0, 429098, 'Dreadsteed ritual - a Xorothian Imp at the ring (8 of 18)'),
(4295030, 27000, 8, 10, 14482, 600000, 0, 0, 0, 0, 0, 0, 1, 4295032, -1, 1, -100.68419440399822, 800.3438321599111, -28, 0, 429098, 'Dreadsteed ritual - a Xorothian Imp at the ring (9 of 18)'),
(4295030, 27000, 9, 10, 14482, 600000, 0, 0, 0, 0, 0, 0, 1, 4295032, -1, 1, -92.67978233925238, 779.9808912205672, -28, 0, 429098, 'Dreadsteed ritual - a Xorothian Imp at the ring (10 of 18)'),
(4295030, 27000, 10, 10, 14482, 600000, 0, 0, 0, 0, 0, 0, 1, 4295032, -1, 1, -78.19355940967452, 763.5836560439885, -28, 0, 429098, 'Dreadsteed ritual - a Xorothian Imp at the ring (11 of 18)'),
(4295030, 27000, 11, 10, 14482, 600000, 0, 0, 0, 0, 0, 0, 1, 4295032, -1, 1, -58.97277789445237, 753.1298751898881, -28, 0, 429098, 'Dreadsteed ritual - a Xorothian Imp at the ring (12 of 18)'),
(4295030, 27000, 12, 10, 14482, 600000, 0, 0, 0, 0, 0, 0, 1, 4295032, -1, 1, -37.33574771284539, 749.8804289106447, -28, 0, 429098, 'Dreadsteed ritual - a Xorothian Imp at the ring (13 of 18)'),
(4295030, 27000, 13, 10, 14482, 600000, 0, 0, 0, 0, 0, 0, 1, 4295032, -1, 1, -15.892214033311472, 754.2272483842544, -28, 0, 429098, 'Dreadsteed ritual - a Xorothian Imp at the ring (14 of 18)'),
(4295030, 27000, 14, 10, 14482, 600000, 0, 0, 0, 0, 0, 0, 1, 4295032, -1, 1, 2.771416509545837, 765.646043029977, -28, 0, 429098, 'Dreadsteed ritual - a Xorothian Imp at the ring (15 of 18)'),
(4295030, 27000, 15, 10, 14482, 600000, 0, 0, 0, 0, 0, 0, 1, 4295032, -1, 1, 16.40403462640699, 782.7595376900775, -28, 0, 429098, 'Dreadsteed ritual - a Xorothian Imp at the ring (16 of 18)'),
(4295030, 27000, 16, 10, 14482, 600000, 0, 0, 0, 0, 0, 0, 1, 4295032, -1, 1, 23.361345376363033, 803.503592340266, -28, 0, 429098, 'Dreadsteed ritual - a Xorothian Imp at the ring (17 of 18)'),
(4295030, 27000, 17, 10, 14482, 600000, 0, 0, 0, 0, 0, 0, 1, 4295032, -1, 1, 22.804194403998224, 825.3761678400889, -28, 0, 429098, 'Dreadsteed ritual - a Xorothian Imp at the ring (18 of 18)'),
(4295030, 87000, 18, 10, 14482, 600000, 0, 0, 0, 0, 0, 0, 458753, 4295032, -1, 1, 63, 0, 0, 0, 429098, 'Dreadsteed ritual - wave 1: a Xorothian Imp (1)'),
(4295030, 87000, 19, 10, 14482, 600000, 0, 0, 0, 0, 0, 0, 458753, 4295032, -1, 1, 63, 0, 0, 0, 429098, 'Dreadsteed ritual - wave 1: a Xorothian Imp (2)'),
(4295030, 87000, 20, 10, 14483, 600000, 0, 0, 0, 0, 0, 0, 458752, 4295033, -1, 1, 63, 0, 0, 0, 429098, 'Dreadsteed ritual - wave 1: a Dread Guard (3)'),
(4295030, 98000, 21, 10, 14482, 600000, 0, 0, 0, 0, 0, 0, 458753, 4295032, -1, 1, 63, 0, 0, 0, 429098, 'Dreadsteed ritual - wave 2: a Xorothian Imp (1)'),
(4295030, 98000, 22, 10, 14482, 600000, 0, 0, 0, 0, 0, 0, 458753, 4295032, -1, 1, 63, 0, 0, 0, 429098, 'Dreadsteed ritual - wave 2: a Xorothian Imp (2)'),
(4295030, 98000, 23, 10, 14482, 600000, 0, 0, 0, 0, 0, 0, 458753, 4295032, -1, 1, 63, 0, 0, 0, 429098, 'Dreadsteed ritual - wave 2: a Xorothian Imp (3)'),
(4295030, 107000, 24, 10, 14482, 600000, 0, 0, 0, 0, 0, 0, 458753, 4295032, -1, 1, 63, 0, 0, 0, 429098, 'Dreadsteed ritual - wave 3: a Xorothian Imp (1)'),
(4295030, 107000, 25, 10, 14483, 600000, 0, 0, 0, 0, 0, 0, 458752, 4295033, -1, 1, 63, 0, 0, 0, 429098, 'Dreadsteed ritual - wave 3: a Dread Guard (2)'),
(4295030, 117000, 26, 10, 14482, 600000, 0, 0, 0, 0, 0, 0, 458753, 4295032, -1, 1, 63, 0, 0, 0, 429098, 'Dreadsteed ritual - wave 4: a Xorothian Imp (1)'),
(4295030, 117000, 27, 10, 14482, 600000, 0, 0, 0, 0, 0, 0, 458753, 4295032, -1, 1, 63, 0, 0, 0, 429098, 'Dreadsteed ritual - wave 4: a Xorothian Imp (2)'),
(4295030, 117000, 28, 10, 14482, 600000, 0, 0, 0, 0, 0, 0, 458753, 4295032, -1, 1, 63, 0, 0, 0, 429098, 'Dreadsteed ritual - wave 4: a Xorothian Imp (3)'),
(4295030, 145000, 29, 10, 14482, 600000, 0, 0, 0, 0, 0, 0, 458753, 4295032, -1, 1, 63, 0, 0, 0, 429098, 'Dreadsteed ritual - wave 5: a Xorothian Imp (1)'),
(4295030, 145000, 30, 10, 14482, 600000, 0, 0, 0, 0, 0, 0, 458753, 4295032, -1, 1, 63, 0, 0, 0, 429098, 'Dreadsteed ritual - wave 5: a Xorothian Imp (2)'),
(4295030, 145000, 31, 10, 14482, 600000, 0, 0, 0, 0, 0, 0, 458753, 4295032, -1, 1, 63, 0, 0, 0, 429098, 'Dreadsteed ritual - wave 5: a Xorothian Imp (3)'),
(4295030, 165000, 32, 10, 14482, 600000, 0, 0, 0, 0, 0, 0, 458753, 4295032, -1, 1, 63, 0, 0, 0, 429098, 'Dreadsteed ritual - wave 6: a Xorothian Imp (1)'),
(4295030, 165000, 33, 10, 14483, 600000, 0, 0, 0, 0, 0, 0, 458752, 4295033, -1, 1, 63, 0, 0, 0, 429098, 'Dreadsteed ritual - wave 6: a Dread Guard (2)'),
(4295030, 173000, 34, 10, 14482, 600000, 0, 0, 0, 0, 0, 0, 458753, 4295032, -1, 1, 63, 0, 0, 0, 429098, 'Dreadsteed ritual - wave 7: a Xorothian Imp (1)'),
(4295030, 173000, 35, 10, 14482, 600000, 0, 0, 0, 0, 0, 0, 458753, 4295032, -1, 1, 63, 0, 0, 0, 429098, 'Dreadsteed ritual - wave 7: a Xorothian Imp (2)'),
(4295030, 192000, 36, 10, 14482, 600000, 0, 0, 0, 0, 0, 0, 458753, 4295032, -1, 1, 63, 0, 0, 0, 429098, 'Dreadsteed ritual - wave 8: a Xorothian Imp (1)'),
(4295030, 192000, 37, 10, 14482, 600000, 0, 0, 0, 0, 0, 0, 458753, 4295032, -1, 1, 63, 0, 0, 0, 429098, 'Dreadsteed ritual - wave 8: a Xorothian Imp (2)'),
(4295030, 192000, 38, 10, 14482, 600000, 0, 0, 0, 0, 0, 0, 458753, 4295032, -1, 1, 63, 0, 0, 0, 429098, 'Dreadsteed ritual - wave 8: a Xorothian Imp (3)'),
(4295030, 192000, 39, 10, 14482, 600000, 0, 0, 0, 0, 0, 0, 458753, 4295032, -1, 1, 63, 0, 0, 0, 429098, 'Dreadsteed ritual - wave 8: a Xorothian Imp (4)'),
(4295030, 204000, 40, 10, 14483, 600000, 0, 0, 0, 0, 0, 0, 458752, 4295033, -1, 1, 63, 0, 0, 0, 429098, 'Dreadsteed ritual - wave 9: a Dread Guard (1)'),
(4295030, 224000, 41, 10, 14482, 600000, 0, 0, 0, 0, 0, 0, 458753, 4295032, -1, 1, 63, 0, 0, 0, 429098, 'Dreadsteed ritual - wave 10: a Xorothian Imp (1)'),
(4295030, 247000, 42, 10, 14482, 600000, 0, 0, 0, 0, 0, 0, 458753, 4295032, -1, 1, 63, 0, 0, 0, 429098, 'Dreadsteed ritual - wave 11: a Xorothian Imp (1)'),
(4295030, 252000, 43, 10, 14483, 600000, 0, 0, 0, 0, 0, 0, 458752, 4295033, -1, 1, 63, 0, 0, 0, 429098, 'Dreadsteed ritual - wave 12: a Dread Guard (1)'),
(4295030, 277000, 44, 10, 14482, 600000, 0, 0, 0, 0, 0, 0, 458753, 4295032, -1, 1, 63, 0, 0, 0, 429098, 'Dreadsteed ritual - wave 13: a Xorothian Imp (1)'),
(4295030, 277000, 45, 10, 14482, 600000, 0, 0, 0, 0, 0, 0, 458753, 4295032, -1, 1, 63, 0, 0, 0, 429098, 'Dreadsteed ritual - wave 13: a Xorothian Imp (2)'),
(4295030, 277000, 46, 10, 14482, 600000, 0, 0, 0, 0, 0, 0, 458753, 4295032, -1, 1, 63, 0, 0, 0, 429098, 'Dreadsteed ritual - wave 13: a Xorothian Imp (3)'),
(4295030, 305000, 47, 10, 14483, 600000, 0, 0, 0, 0, 0, 0, 458752, 4295033, -1, 1, 63, 0, 0, 0, 429098, 'Dreadsteed ritual - wave 14: a Dread Guard (1)'),
(4295030, 344000, 48, 10, 14482, 600000, 0, 0, 0, 0, 0, 0, 458753, 4295032, -1, 1, 63, 0, 0, 0, 429098, 'Dreadsteed ritual - wave 15: a Xorothian Imp (1)'),
(4295030, 348000, 49, 10, 14483, 600000, 0, 0, 0, 0, 0, 0, 458752, 4295033, -1, 1, 63, 0, 0, 0, 429098, 'Dreadsteed ritual - wave 16: a Dread Guard (1)'),
(4295030, 368000, 50, 10, 14482, 600000, 0, 0, 0, 0, 0, 0, 458753, 4295032, -1, 1, 63, 0, 0, 0, 429098, 'Dreadsteed ritual - wave 17: a Xorothian Imp (1)'),
(4295030, 388000, 51, 10, 14482, 600000, 0, 0, 0, 0, 0, 0, 458753, 4295032, -1, 1, 63, 0, 0, 0, 429098, 'Dreadsteed ritual - wave 18: a Xorothian Imp (1)'),
(4295030, 400000, 52, 10, 14482, 600000, 0, 0, 0, 0, 0, 0, 458753, 4295032, -1, 1, 63, 0, 0, 0, 429098, 'Dreadsteed ritual - wave 19: a Xorothian Imp (1)'),
(4295030, 400000, 53, 10, 14483, 600000, 0, 0, 0, 0, 0, 0, 458752, 4295033, -1, 1, 63, 0, 0, 0, 429098, 'Dreadsteed ritual - wave 19: a Dread Guard (2)'),
(4295030, 450000, 54, 10, 14482, 600000, 0, 0, 0, 0, 0, 0, 458753, 4295032, -1, 1, 63, 0, 0, 0, 429098, 'Dreadsteed ritual - wave 20: a Xorothian Imp (1)'),
(4295030, 450000, 55, 10, 14483, 600000, 0, 0, 0, 0, 0, 0, 458752, 4295033, -1, 1, 63, 0, 0, 0, 429098, 'Dreadsteed ritual - wave 20: a Dread Guard (2)'),
(4295030, 470000, 56, 10, 14482, 600000, 0, 0, 0, 0, 0, 0, 458753, 4295032, -1, 1, 63, 0, 0, 0, 429098, 'Dreadsteed ritual - wave 21: a Xorothian Imp (1)'),
(4295030, 474000, 57, 10, 14482, 600000, 0, 0, 0, 0, 0, 0, 458753, 4295032, -1, 1, 63, 0, 0, 0, 429098, 'Dreadsteed ritual - wave 22: a Xorothian Imp (1)'),
(4295031, 0, 0, 37, 21, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Dreadsteed ritual - the Dreadsteed next (21 = 4)'),
(4295031, 0, 1, 80, 1, 0, 0, 0, 99784, 0, 12, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Dreadsteed ritual - the circle ready'),
(4295031, 0, 2, 81, 99784, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Dreadsteed ritual - the circle gone'),
(4295031, 0, 3, 9, 99783, 10, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Dreadsteed ritual - the Dreadsteed Portal for 10 s'),
(4295031, 8000, 4, 10, 14502, 0, 0, 0, 0, 0, 0, 0, 0, 0, -1, 7, -38.94, 812.86, -29.53, 0, 0, 'Dreadsteed ritual - the Xorothian Dreadsteed at the pedestal'),
(4295031, 18000, 5, 10, 14506, 0, 0, 0, 0, 0, 0, 0, 0, 0, -1, 7, -38.94, 812.86, -29.53, 0, 0, 'Dreadsteed ritual - Lord Hel''nurath at the pedestal'),
(4295031, 18000, 6, 0, 1, 0, 0, 0, 14506, 10, 8, 2, 4295260, 0, 0, 0, 0, 0, 0, 0, 0, 'Lord Hel''nurath - yells "Who dares steal my precious mount?..."');

DELETE FROM `gameobject_scripts` WHERE `id` IN (99785, 99786, 99787, 325544, 325545, 325546, 325547, 325548, 325549, 325550, 325551, 325552, 325553, 325554, 325555, 325556, 325557, 325558, 325559, 325560, 325561, 325562, 325563, 325564, 325565, 325566, 325567, 325568, 325569, 325570, 325571, 325572, 325573);
INSERT INTO `gameobject_scripts`
(`id`, `delay`, `priority`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`)
VALUES
(325544, 0, 0, 15, 22800, 2, 0, 0, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Warpwood Pod - the trap''s spell 22800 on the one who used it'),
(325544, 0, 1, 81, 325544, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Warpwood Pod - spent'),
(325545, 0, 0, 15, 22800, 2, 0, 0, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Warpwood Pod - the trap''s spell 22800 on the one who used it'),
(325545, 0, 1, 81, 325545, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Warpwood Pod - spent'),
(325546, 0, 0, 15, 22800, 2, 0, 0, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Warpwood Pod - the trap''s spell 22800 on the one who used it'),
(325546, 0, 1, 81, 325546, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Warpwood Pod - spent'),
(325547, 0, 0, 15, 22800, 2, 0, 0, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Warpwood Pod - the trap''s spell 22800 on the one who used it'),
(325547, 0, 1, 81, 325547, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Warpwood Pod - spent'),
(325548, 0, 0, 15, 22800, 2, 0, 0, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Warpwood Pod - the trap''s spell 22800 on the one who used it'),
(325548, 0, 1, 81, 325548, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Warpwood Pod - spent'),
(325549, 0, 0, 15, 22800, 2, 0, 0, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Warpwood Pod - the trap''s spell 22800 on the one who used it'),
(325549, 0, 1, 81, 325549, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Warpwood Pod - spent'),
(325550, 0, 0, 15, 22800, 2, 0, 0, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Warpwood Pod - the trap''s spell 22800 on the one who used it'),
(325550, 0, 1, 81, 325550, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Warpwood Pod - spent'),
(325551, 0, 0, 15, 22800, 2, 0, 0, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Warpwood Pod - the trap''s spell 22800 on the one who used it'),
(325551, 0, 1, 81, 325551, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Warpwood Pod - spent'),
(325552, 0, 0, 15, 22800, 2, 0, 0, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Warpwood Pod - the trap''s spell 22800 on the one who used it'),
(325552, 0, 1, 81, 325552, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Warpwood Pod - spent'),
(325553, 0, 0, 15, 22800, 2, 0, 0, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Warpwood Pod - the trap''s spell 22800 on the one who used it'),
(325553, 0, 1, 81, 325553, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Warpwood Pod - spent'),
(325554, 0, 0, 15, 22821, 2, 0, 0, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Warpwood Pod - the trap''s spell 22821 on the one who used it'),
(325554, 0, 1, 81, 325554, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Warpwood Pod - spent'),
(325555, 0, 0, 15, 22821, 2, 0, 0, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Warpwood Pod - the trap''s spell 22821 on the one who used it'),
(325555, 0, 1, 81, 325555, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Warpwood Pod - spent'),
(325556, 0, 0, 15, 22821, 2, 0, 0, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Warpwood Pod - the trap''s spell 22821 on the one who used it'),
(325556, 0, 1, 81, 325556, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Warpwood Pod - spent'),
(325557, 0, 0, 15, 22821, 2, 0, 0, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Warpwood Pod - the trap''s spell 22821 on the one who used it'),
(325557, 0, 1, 81, 325557, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Warpwood Pod - spent'),
(325558, 0, 0, 15, 22821, 2, 0, 0, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Warpwood Pod - the trap''s spell 22821 on the one who used it'),
(325558, 0, 1, 81, 325558, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Warpwood Pod - spent'),
(325559, 0, 0, 15, 22821, 2, 0, 0, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Warpwood Pod - the trap''s spell 22821 on the one who used it'),
(325559, 0, 1, 81, 325559, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Warpwood Pod - spent'),
(325560, 0, 0, 15, 22821, 2, 0, 0, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Warpwood Pod - the trap''s spell 22821 on the one who used it'),
(325560, 0, 1, 81, 325560, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Warpwood Pod - spent'),
(325561, 0, 0, 15, 22821, 2, 0, 0, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Warpwood Pod - the trap''s spell 22821 on the one who used it'),
(325561, 0, 1, 81, 325561, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Warpwood Pod - spent'),
(325562, 0, 0, 15, 22821, 2, 0, 0, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Warpwood Pod - the trap''s spell 22821 on the one who used it'),
(325562, 0, 1, 81, 325562, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Warpwood Pod - spent'),
(325563, 0, 0, 15, 22821, 2, 0, 0, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Warpwood Pod - the trap''s spell 22821 on the one who used it'),
(325563, 0, 1, 81, 325563, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Warpwood Pod - spent'),
(325564, 0, 0, 15, 22803, 2, 0, 0, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Warpwood Pod - the trap''s spell 22803 on the one who used it'),
(325564, 0, 1, 81, 325564, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Warpwood Pod - spent'),
(325565, 0, 0, 15, 22803, 2, 0, 0, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Warpwood Pod - the trap''s spell 22803 on the one who used it'),
(325565, 0, 1, 81, 325565, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Warpwood Pod - spent'),
(325566, 0, 0, 15, 22803, 2, 0, 0, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Warpwood Pod - the trap''s spell 22803 on the one who used it'),
(325566, 0, 1, 81, 325566, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Warpwood Pod - spent'),
(325567, 0, 0, 15, 22803, 2, 0, 0, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Warpwood Pod - the trap''s spell 22803 on the one who used it'),
(325567, 0, 1, 81, 325567, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Warpwood Pod - spent'),
(325568, 0, 0, 15, 22803, 2, 0, 0, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Warpwood Pod - the trap''s spell 22803 on the one who used it'),
(325568, 0, 1, 81, 325568, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Warpwood Pod - spent'),
(325569, 0, 0, 15, 22803, 2, 0, 0, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Warpwood Pod - the trap''s spell 22803 on the one who used it'),
(325569, 0, 1, 81, 325569, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Warpwood Pod - spent'),
(325570, 0, 0, 15, 22803, 2, 0, 0, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Warpwood Pod - the trap''s spell 22803 on the one who used it'),
(325570, 0, 1, 81, 325570, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Warpwood Pod - spent'),
(325571, 0, 0, 15, 22803, 2, 0, 0, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Warpwood Pod - the trap''s spell 22803 on the one who used it'),
(325571, 0, 1, 81, 325571, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Warpwood Pod - spent'),
(325572, 0, 0, 15, 22803, 2, 0, 0, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Warpwood Pod - the trap''s spell 22803 on the one who used it'),
(325572, 0, 1, 81, 325572, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Warpwood Pod - spent'),
(325573, 0, 0, 15, 22803, 2, 0, 0, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Warpwood Pod - the trap''s spell 22803 on the one who used it'),
(325573, 0, 1, 81, 325573, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Warpwood Pod - spent'),
(99786, 0, 0, 32, 429116, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Wheel of the Black March - used: only in the waves, only broken'),
(99786, 0, 1, 39, 4295018, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0, 0, 0, 0, 0, 0, 0, 'Wheel of the Black March - used: up again'),
(99785, 0, 0, 32, 429117, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Doomsday Candle - used: only in the waves, only broken'),
(99785, 0, 1, 39, 4295019, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0, 0, 0, 0, 0, 0, 0, 'Doomsday Candle - used: up again'),
(99787, 0, 0, 32, 429118, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Bell of Dethmoora - used: only in the waves, only broken'),
(99787, 0, 1, 39, 4295020, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0, 0, 0, 0, 0, 0, 0, 'Bell of Dethmoora - used: up again');

DELETE FROM `gossip_scripts` WHERE `id` IN (1424100, 1435400, 1435401, 1435402, 1435403, 1435404, 14321000, 14323000, 14325110, 14325120, 14326000, 14338001, 14338002, 14353010, 14353020);
INSERT INTO `gossip_scripts`
(`id`, `delay`, `priority`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`)
VALUES
(1424100, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 66104, 0, 0, 0, 0, 0, 0, 0, 0, 'Ironbark the Redeemed - says "As you wish..."'),
(1424100, 0, 1, 3, 0, 18056, 65, 2, 0, 0, 0, 0, 1, 0, 0, 0, 123.706, -278.828, -55.868, 0, 0, 'Ironbark the Redeemed - to the door (point 1)'),
(1424100, 0, 2, 37, 5, 3, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Dire Maul - Ironbark opens the door (5 = DONE)'),
(1435400, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 9349, 0, 0, 0, 0, 0, 0, 0, 0, 'Pusillin - says "If you want the key, you''ll have to catch me!"'),
(1435400, 0, 1, 3, 0, 12436, 65, 0, 0, 0, 0, 0, 0, 0, 0, 0, -145, -296.9, -4.12, 0, 0, 'Pusillin - runs on (1 of 4)'),
(1435400, 0, 2, 84, 1435401, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Pusillin - his menu 2 of 5'),
(1435401, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 9353, 0, 0, 0, 0, 0, 0, 0, 0, 'Pusillin - says "Chase me if you dare! I run without a care!"'),
(1435401, 0, 1, 3, 0, 13196, 65, 0, 0, 0, 0, 0, 0, 0, 0, 0, 112.7, -353.87, -4.12, 0, 0, 'Pusillin - runs on (2 of 4)'),
(1435401, 0, 2, 84, 1435402, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Pusillin - his menu 3 of 5'),
(1435402, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 9357, 0, 0, 0, 0, 0, 0, 0, 0, 'Pusillin - says "Why would you ever want to harm me!? Come. Friends we can be!"'),
(1435402, 0, 1, 3, 0, 14278, 65, 0, 0, 0, 0, 0, 0, 0, 0, 0, 50.99, -632.68, -25.12, 0, 0, 'Pusillin - runs on (3 of 4)'),
(1435402, 0, 2, 84, 1435403, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Pusillin - his menu 4 of 5'),
(1435403, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 9360, 0, 0, 0, 0, 0, 0, 0, 0, 'Pusillin - says "DIE?! You make Pusillin cry!"'),
(1435403, 0, 1, 3, 0, 3940, 65, 0, 0, 0, 0, 0, 0, 0, 0, 0, 19.091084, -704.739746, -12.642583, 0, 0, 'Pusillin - runs on (4 of 4)'),
(1435403, 0, 2, 84, 1435404, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Pusillin - his menu 5 of 5'),
(1435404, 0, 0, 34, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 18.19, -701.15, -12.64, 0, 0, 'Pusillin - home where he makes his stand'),
(1435404, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 9363, 0, 0, 0, 0, 0, 0, 0, 0, 'Pusillin - says "Say hello to my little friends!"'),
(1435404, 0, 2, 22, 14, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Pusillin - hostile'),
(1435404, 0, 3, 2, 4, 1060320051, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Pusillin - grown (scale 0.7)'),
(1435404, 0, 4, 15, 22735, 0, 0, 0, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Pusillin - Spirit of Runn Tum'),
(1435404, 0, 5, 26, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Pusillin - attacks the player'),
(1435404, 0, 6, 10, 13276, 0, 0, 0, 0, 0, 0, 0, 1, 1435451, 0, 7, 6.562, -712.43, -12.64, 4.25, 0, 'Pusillin - a Wildspawn Imp (1 of 5) at the player'),
(1435404, 0, 7, 10, 13276, 0, 0, 0, 0, 0, 0, 0, 1, 1435451, 0, 7, 23.994, -697.89, -12.64, 4.25, 0, 'Pusillin - a Wildspawn Imp (2 of 5) at the player'),
(1435404, 0, 8, 10, 13276, 0, 0, 0, 0, 0, 0, 0, 1, 1435451, 0, 7, 22.216, -688.01, -12.64, 4.25, 0, 'Pusillin - a Wildspawn Imp (3 of 5) at the player'),
(1435404, 0, 9, 10, 13276, 0, 0, 0, 0, 0, 0, 0, 1, 1435451, 0, 7, 17.943, -679.68, -12.64, 4.25, 0, 'Pusillin - a Wildspawn Imp (4 of 5) at the player'),
(1435404, 0, 10, 10, 13276, 0, 0, 0, 0, 0, 0, 0, 1, 1435451, 0, 7, 9.54, -671.08, -12.64, 4.25, 0, 'Pusillin - a Wildspawn Imp (5 of 5) at the player'),
(14326000, 0, 0, 15, 22818, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Guard Mol''dar - his buff on the player'),
(14321000, 0, 0, 15, 22817, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Guard Fengus - his buff on the player'),
(14323000, 0, 0, 15, 22820, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Guard Slip''kik - his buff on the player'),
(14325110, 0, 0, 39, 4295007, 0, 0, 0, 0, 0, 0, 4, 100, 0, 0, 0, 0, 0, 0, 0, 0, 'Captain Kromcrush - off to Fengus'),
(14325120, 0, 0, 4, 147, 2, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Captain Kromcrush - gives his quest'),
(14353010, 0, 0, 15, 22799, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 117, 'Mizzle the Crafty - King of the Gordok on the player'),
(14353020, 0, 0, 39, 4295011, 0, 0, 0, 0, 0, 0, 4, 100, 0, 0, 0, 0, 0, 0, 0, 43001, 'Mizzle the Crafty - the tribute shown'),
(14338001, 0, 0, 15, 22816, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Knot Thimblejack - teaches the leatherworker'),
(14338002, 0, 0, 15, 22814, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Knot Thimblejack - teaches the tailor');

DELETE FROM `event_scripts` WHERE `id` IN (8420, 8428);
INSERT INTO `event_scripts`
(`id`, `delay`, `priority`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`)
VALUES
(8420, 0, 0, 32, 429102, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Dreadsteed ritual - started: only from nothing'),
(8420, 0, 1, 37, 21, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Dreadsteed ritual - the nodes first (21 = 1)'),
(8420, 0, 2, 10, 14500, 420000, 0, 0, 0, 0, 0, 0, 0, 0, -1, 1, -38.94, 812.86, -29.53, 4.890318, 0, 'Dreadsteed ritual - J''eevee at the pedestal for 7 minutes'),
(8420, 0, 3, 0, 1, 0, 0, 0, 14500, 10, 8, 2, 4295250, 0, 0, 0, 0, 0, 0, 0, 0, 'J''eevee - yells "Ah freedom!..."'),
(8420, 0, 4, 39, 4295029, 0, 0, 0, 99895, 0, 12, 2, 100, 0, 0, 0, 0, 0, 0, 0, 0, 'Dreadsteed ritual - the timeline'),
(8420, 0, 5, 39, 4295030, 0, 0, 0, 99895, 0, 12, 2, 100, 0, 0, 0, 0, 0, 0, 0, 0, 'Dreadsteed ritual - the waves'),
(8428, 0, 0, 32, 429103, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Dreadsteed ritual - the item: only once the ritual is done'),
(8428, 0, 1, 39, 4295031, 0, 0, 0, 99895, 0, 12, 2, 100, 0, 0, 0, 0, 0, 0, 0, 0, 'Dreadsteed ritual - the second part');

DELETE FROM `quest_end_scripts` WHERE `id` IN (1193, 5525, 7429);
INSERT INTO `quest_end_scripts`
(`id`, `delay`, `priority`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`)
VALUES
(1193, 0, 0, 37, 7, 3, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 43001, 'A Broken Trap rewarded: the trap mended (7 = DONE)'),
(1193, 0, 1, 39, 4295013, 0, 0, 0, 0, 0, 0, 4, 100, 0, 0, 0, 0, 0, 0, 0, 43001, 'A Broken Trap rewarded: the Fixed Trap in its place'),
(5525, 0, 0, 81, 0, 0, 0, 0, 179511, 20, 11, 0, 0, 0, 0, 0, 0, 0, 0, 0, 43001, 'Free Knot! rewarded: Knot''s Ball and Chain gone'),
(5525, 0, 1, 4, 147, 3, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 43001, 'Free Knot! rewarded: Knot no longer talks'),
(5525, 0, 2, 3, 0, 7302, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 518.325, 542.0, -23.901, 0, 43001, 'Free Knot! rewarded: Knot runs out (1 of 13)'),
(5525, 7302, 3, 3, 0, 6016, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 470.225372, 542.596065, -25.363186, 0, 43001, 'Free Knot! rewarded: Knot runs out (2 of 13)'),
(5525, 13318, 4, 3, 0, 635, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 465.367096, 542.843689, -23.911942, 0, 43001, 'Free Knot! rewarded: Knot runs out (3 of 13)'),
(5525, 13953, 5, 3, 0, 1510, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 453.346649, 544.004456, -23.900503, 0, 43001, 'Free Knot! rewarded: Knot runs out (4 of 13)'),
(5525, 15463, 6, 3, 0, 2395, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 435.055573, 542.503967, -18.395958, 0, 43001, 'Free Knot! rewarded: Knot runs out (5 of 13)'),
(5525, 17858, 7, 3, 0, 2878, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 412.700775, 537.009277, -18.343367, 0, 43001, 'Free Knot! rewarded: Knot runs out (6 of 13)'),
(5525, 20736, 8, 3, 0, 2267, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 401.076355, 524.250061, -12.787789, 0, 43001, 'Free Knot! rewarded: Knot runs out (7 of 13)'),
(5525, 23003, 9, 3, 0, 2984, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 390.540833, 502.830505, -12.675946, 0, 43001, 'Free Knot! rewarded: Knot runs out (8 of 13)'),
(5525, 25987, 10, 3, 0, 2628, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 386.112335, 483.01004, -7.232251, 0, 43001, 'Free Knot! rewarded: Knot runs out (9 of 13)'),
(5525, 28615, 11, 3, 0, 5050, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 385.963501, 442.606476, -7.193601, 0, 43001, 'Free Knot! rewarded: Knot runs out (10 of 13)'),
(5525, 33665, 12, 3, 0, 3321, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 385.531738, 416.619385, -1.703543, 0, 43001, 'Free Knot! rewarded: Knot runs out (11 of 13)'),
(5525, 36986, 13, 3, 0, 5085, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 385.355988, 375.94043, -1.623023, 0, 43001, 'Free Knot! rewarded: Knot runs out (12 of 13)'),
(5525, 42071, 14, 3, 0, 3256, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 385.6203, 350.467163, 3.82502, 0, 43001, 'Free Knot! rewarded: Knot runs out (13 of 13)'),
(5525, 50327, 15, 18, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 43001, 'Free Knot! rewarded: Knot gone five seconds after'),
(7429, 0, 0, 81, 0, 0, 0, 0, 179511, 20, 11, 0, 0, 0, 0, 0, 0, 0, 0, 0, 43001, 'Free Knot! rewarded: Knot''s Ball and Chain gone'),
(7429, 0, 1, 4, 147, 3, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 43001, 'Free Knot! rewarded: Knot no longer talks'),
(7429, 0, 2, 3, 0, 7302, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 518.325, 542.0, -23.901, 0, 43001, 'Free Knot! rewarded: Knot runs out (1 of 13)'),
(7429, 7302, 3, 3, 0, 6016, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 470.225372, 542.596065, -25.363186, 0, 43001, 'Free Knot! rewarded: Knot runs out (2 of 13)'),
(7429, 13318, 4, 3, 0, 635, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 465.367096, 542.843689, -23.911942, 0, 43001, 'Free Knot! rewarded: Knot runs out (3 of 13)'),
(7429, 13953, 5, 3, 0, 1510, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 453.346649, 544.004456, -23.900503, 0, 43001, 'Free Knot! rewarded: Knot runs out (4 of 13)'),
(7429, 15463, 6, 3, 0, 2395, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 435.055573, 542.503967, -18.395958, 0, 43001, 'Free Knot! rewarded: Knot runs out (5 of 13)'),
(7429, 17858, 7, 3, 0, 2878, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 412.700775, 537.009277, -18.343367, 0, 43001, 'Free Knot! rewarded: Knot runs out (6 of 13)'),
(7429, 20736, 8, 3, 0, 2267, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 401.076355, 524.250061, -12.787789, 0, 43001, 'Free Knot! rewarded: Knot runs out (7 of 13)'),
(7429, 23003, 9, 3, 0, 2984, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 390.540833, 502.830505, -12.675946, 0, 43001, 'Free Knot! rewarded: Knot runs out (8 of 13)'),
(7429, 25987, 10, 3, 0, 2628, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 386.112335, 483.01004, -7.232251, 0, 43001, 'Free Knot! rewarded: Knot runs out (9 of 13)'),
(7429, 28615, 11, 3, 0, 5050, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 385.963501, 442.606476, -7.193601, 0, 43001, 'Free Knot! rewarded: Knot runs out (10 of 13)'),
(7429, 33665, 12, 3, 0, 3321, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 385.531738, 416.619385, -1.703543, 0, 43001, 'Free Knot! rewarded: Knot runs out (11 of 13)'),
(7429, 36986, 13, 3, 0, 5085, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 385.355988, 375.94043, -1.623023, 0, 43001, 'Free Knot! rewarded: Knot runs out (12 of 13)'),
(7429, 42071, 14, 3, 0, 3256, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 385.6203, 350.467163, 3.82502, 0, 43001, 'Free Knot! rewarded: Knot runs out (13 of 13)'),
(7429, 50327, 15, 18, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 43001, 'Free Knot! rewarded: Knot gone five seconds after');

DELETE FROM `gossip_menu` WHERE `entry` = 1424100 AND `text_id` = 6695;
INSERT INTO `gossip_menu`
(`entry`, `text_id`, `script_id`, `condition_id`)
VALUES
(1424100, 6695, 0, 0);

DELETE FROM `gossip_menu_option` WHERE `menu_id` = 1424100 AND `id` = 0;
INSERT INTO `gossip_menu_option`
(`menu_id`, `id`, `option_icon`, `option_text`, `option_broadcast_text`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `box_broadcast_text`, `condition_id`)
VALUES
(1424100, 0, 0, 'Thank you, Ironbark. We are ready for you to open the door.', 9103, 1, 1, -1, 0, 1424100, 0, 0, NULL, 0, 3705);

DELETE FROM `gossip_menu` WHERE `entry` = 1435400 AND `text_id` = 6877;
INSERT INTO `gossip_menu`
(`entry`, `text_id`, `script_id`, `condition_id`)
VALUES
(1435400, 6877, 0, 0);

DELETE FROM `gossip_menu_option` WHERE `menu_id` = 1435400 AND `id` = 0;
INSERT INTO `gossip_menu_option`
(`menu_id`, `id`, `option_icon`, `option_text`, `option_broadcast_text`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `box_broadcast_text`, `condition_id`)
VALUES
(1435400, 0, 0, 'Game? Are you crazy?', 9352, 1, 1, -1, 0, 1435400, 0, 0, NULL, 0, 0);

DELETE FROM `gossip_menu` WHERE `entry` = 1435401 AND `text_id` = 6878;
INSERT INTO `gossip_menu`
(`entry`, `text_id`, `script_id`, `condition_id`)
VALUES
(1435401, 6878, 0, 0);

DELETE FROM `gossip_menu_option` WHERE `menu_id` = 1435401 AND `id` = 0;
INSERT INTO `gossip_menu_option`
(`menu_id`, `id`, `option_icon`, `option_text`, `option_broadcast_text`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `box_broadcast_text`, `condition_id`)
VALUES
(1435401, 0, 0, 'Why you little...', 9355, 1, 1, -1, 0, 1435401, 0, 0, NULL, 0, 0);

DELETE FROM `gossip_menu` WHERE `entry` = 1435402 AND `text_id` = 6879;
INSERT INTO `gossip_menu`
(`entry`, `text_id`, `script_id`, `condition_id`)
VALUES
(1435402, 6879, 0, 0);

DELETE FROM `gossip_menu_option` WHERE `menu_id` = 1435402 AND `id` = 0;
INSERT INTO `gossip_menu_option`
(`menu_id`, `id`, `option_icon`, `option_text`, `option_broadcast_text`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `box_broadcast_text`, `condition_id`)
VALUES
(1435402, 0, 0, 'Mark my words, I will catch you, imp. And when I do!', 9356, 1, 1, -1, 0, 1435402, 0, 0, NULL, 0, 0);

DELETE FROM `gossip_menu` WHERE `entry` = 1435403 AND `text_id` = 6880;
INSERT INTO `gossip_menu`
(`entry`, `text_id`, `script_id`, `condition_id`)
VALUES
(1435403, 6880, 0, 0);

DELETE FROM `gossip_menu_option` WHERE `menu_id` = 1435403 AND `id` = 0;
INSERT INTO `gossip_menu_option`
(`menu_id`, `id`, `option_icon`, `option_text`, `option_broadcast_text`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `box_broadcast_text`, `condition_id`)
VALUES
(1435403, 0, 0, 'DIE!', 9359, 1, 1, -1, 0, 1435403, 0, 0, NULL, 0, 0);

DELETE FROM `gossip_menu` WHERE `entry` = 1435404 AND `text_id` = 6881;
INSERT INTO `gossip_menu`
(`entry`, `text_id`, `script_id`, `condition_id`)
VALUES
(1435404, 6881, 0, 0);

DELETE FROM `gossip_menu_option` WHERE `menu_id` = 1435404 AND `id` = 0;
INSERT INTO `gossip_menu_option`
(`menu_id`, `id`, `option_icon`, `option_text`, `option_broadcast_text`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `box_broadcast_text`, `condition_id`)
VALUES
(1435404, 0, 0, 'Prepare to meet your maker.', 9362, 1, 1, -1, 0, 1435404, 0, 0, NULL, 0, 0);

DELETE FROM `gossip_menu` WHERE `entry` = 1432601 AND `text_id` = 6908;
INSERT INTO `gossip_menu`
(`entry`, `text_id`, `script_id`, `condition_id`)
VALUES
(1432601, 6908, 0, 0);

DELETE FROM `gossip_menu` WHERE `entry` = 1432600 AND `text_id` = 6907;
INSERT INTO `gossip_menu`
(`entry`, `text_id`, `script_id`, `condition_id`)
VALUES
(1432600, 6907, 0, 0);

DELETE FROM `gossip_menu_option` WHERE `menu_id` = 1432600 AND `id` = 0;
INSERT INTO `gossip_menu_option`
(`menu_id`, `id`, `option_icon`, `option_text`, `option_broadcast_text`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `box_broadcast_text`, `condition_id`)
VALUES
(1432600, 0, 0, 'Call me "Boss". What have you got for me!', 9401, 1, 1, 1432601, 0, 14326000, 0, 0, NULL, 0, 0);

DELETE FROM `gossip_menu` WHERE `entry` = 1432101 AND `text_id` = 6904;
INSERT INTO `gossip_menu`
(`entry`, `text_id`, `script_id`, `condition_id`)
VALUES
(1432101, 6904, 0, 0);

DELETE FROM `gossip_menu` WHERE `entry` = 1432100 AND `text_id` = 6903;
INSERT INTO `gossip_menu`
(`entry`, `text_id`, `script_id`, `condition_id`)
VALUES
(1432100, 6903, 0, 0);

DELETE FROM `gossip_menu_option` WHERE `menu_id` = 1432100 AND `id` = 0;
INSERT INTO `gossip_menu_option`
(`menu_id`, `id`, `option_icon`, `option_text`, `option_broadcast_text`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `box_broadcast_text`, `condition_id`)
VALUES
(1432100, 0, 0, 'I am, am I? Well what have you got for the new big dog of Gordok, Fengus?', 9394, 1, 1, 1432101, 0, 14321000, 0, 0, NULL, 0, 0);

DELETE FROM `gossip_menu` WHERE `entry` = 1432301 AND `text_id` = 6906;
INSERT INTO `gossip_menu`
(`entry`, `text_id`, `script_id`, `condition_id`)
VALUES
(1432301, 6906, 0, 0);

DELETE FROM `gossip_menu` WHERE `entry` = 1432300 AND `text_id` = 6905;
INSERT INTO `gossip_menu`
(`entry`, `text_id`, `script_id`, `condition_id`)
VALUES
(1432300, 6905, 0, 0);

DELETE FROM `gossip_menu_option` WHERE `menu_id` = 1432300 AND `id` = 0;
INSERT INTO `gossip_menu_option`
(`menu_id`, `id`, `option_icon`, `option_text`, `option_broadcast_text`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `box_broadcast_text`, `condition_id`)
VALUES
(1432300, 0, 0, 'Yeah, you''re a real brainiac. Just how smart do you think you are, Slip''kik?', 9398, 1, 1, 1432301, 0, 14323000, 0, 0, NULL, 0, 0);

DELETE FROM `gossip_menu` WHERE `entry` = 1432500 AND `text_id` = 6913;
INSERT INTO `gossip_menu`
(`entry`, `text_id`, `script_id`, `condition_id`)
VALUES
(1432500, 6913, 0, 229237);

DELETE FROM `gossip_menu` WHERE `entry` = 1432500 AND `text_id` = 6914;
INSERT INTO `gossip_menu`
(`entry`, `text_id`, `script_id`, `condition_id`)
VALUES
(1432500, 6914, 0, 230040);

DELETE FROM `gossip_menu_option` WHERE `menu_id` = 1432500 AND `id` = 0;
INSERT INTO `gossip_menu_option`
(`menu_id`, `id`, `option_icon`, `option_text`, `option_broadcast_text`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `box_broadcast_text`, `condition_id`)
VALUES
(1432500, 0, 0, 'Um, I''m taking some prisoners we found outside before the king for punishment.', 0, 1, 1, 1432511, 0, 0, 0, 0, NULL, 0, 229237);

DELETE FROM `gossip_menu_option` WHERE `menu_id` = 1432500 AND `id` = 1;
INSERT INTO `gossip_menu_option`
(`menu_id`, `id`, `option_icon`, `option_text`, `option_broadcast_text`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `box_broadcast_text`, `condition_id`)
VALUES
(1432500, 1, 0, 'So, now that I''m the king... what have you got for me?!', 0, 1, 1, 1432512, 0, 0, 0, 0, NULL, 0, 230040);

DELETE FROM `gossip_menu` WHERE `entry` = 1432511 AND `text_id` = 6915;
INSERT INTO `gossip_menu`
(`entry`, `text_id`, `script_id`, `condition_id`)
VALUES
(1432511, 6915, 0, 0);

DELETE FROM `gossip_menu_option` WHERE `menu_id` = 1432511 AND `id` = 0;
INSERT INTO `gossip_menu_option`
(`menu_id`, `id`, `option_icon`, `option_text`, `option_broadcast_text`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `box_broadcast_text`, `condition_id`)
VALUES
(1432511, 0, 0, 'Er... that''s how I found them. I wanted to show the king that they were a threat. Say Captain... I overhead Guard Fengus calling you a fat, useless knoll lover. ', 0, 1, 1, -1, 0, 14325110, 0, 0, NULL, 0, 0);

DELETE FROM `gossip_menu` WHERE `entry` = 1432512 AND `text_id` = 6920;
INSERT INTO `gossip_menu`
(`entry`, `text_id`, `script_id`, `condition_id`)
VALUES
(1432512, 6920, 0, 0);

DELETE FROM `gossip_menu_option` WHERE `menu_id` = 1432512 AND `id` = 0;
INSERT INTO `gossip_menu_option`
(`menu_id`, `id`, `option_icon`, `option_text`, `option_broadcast_text`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `box_broadcast_text`, `condition_id`)
VALUES
(1432512, 0, 0, 'This sounds like a task worthy of the new king!', 0, 1, 1, -1, 0, 14325120, 0, 0, NULL, 0, 0);

DELETE FROM `gossip_menu` WHERE `entry` = 1435301 AND `text_id` = 6882;
INSERT INTO `gossip_menu`
(`entry`, `text_id`, `script_id`, `condition_id`)
VALUES
(1435301, 6882, 0, 0);

DELETE FROM `gossip_menu_option` WHERE `menu_id` = 1435301 AND `id` = 0;
INSERT INTO `gossip_menu_option`
(`menu_id`, `id`, `option_icon`, `option_text`, `option_broadcast_text`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `box_broadcast_text`, `condition_id`)
VALUES
(1435301, 0, 0, 'It''s good to be King! Now, let''s get back to what you were talking about before...', 0, 1, 1, -1, 0, 14353010, 0, 0, NULL, 0, 0);

DELETE FROM `gossip_menu` WHERE `entry` = 1435302 AND `text_id` = 6916;
INSERT INTO `gossip_menu`
(`entry`, `text_id`, `script_id`, `condition_id`)
VALUES
(1435302, 6916, 0, 0);

DELETE FROM `gossip_menu_option` WHERE `menu_id` = 1435302 AND `id` = 0;
INSERT INTO `gossip_menu_option`
(`menu_id`, `id`, `option_icon`, `option_text`, `option_broadcast_text`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `box_broadcast_text`, `condition_id`)
VALUES
(1435302, 0, 0, 'Well then... show me the tribute!', 0, 1, 1, -1, 0, 14353020, 0, 0, NULL, 0, 0);

DELETE FROM `gossip_menu` WHERE `entry` = 1435300 AND `text_id` = 6876;
INSERT INTO `gossip_menu`
(`entry`, `text_id`, `script_id`, `condition_id`)
VALUES
(1435300, 6876, 0, 429065);

DELETE FROM `gossip_menu` WHERE `entry` = 1435300 AND `text_id` = 6895;
INSERT INTO `gossip_menu`
(`entry`, `text_id`, `script_id`, `condition_id`)
VALUES
(1435300, 6895, 0, 429064);

DELETE FROM `gossip_menu_option` WHERE `menu_id` = 1435300 AND `id` = 0;
INSERT INTO `gossip_menu_option`
(`menu_id`, `id`, `option_icon`, `option_text`, `option_broadcast_text`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `box_broadcast_text`, `condition_id`)
VALUES
(1435300, 0, 0, 'I''m the new king? What are you talking about?', 0, 1, 1, 1435301, 0, 0, 0, 0, NULL, 0, 429065);

DELETE FROM `gossip_menu_option` WHERE `menu_id` = 1435300 AND `id` = 1;
INSERT INTO `gossip_menu_option`
(`menu_id`, `id`, `option_icon`, `option_text`, `option_broadcast_text`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `box_broadcast_text`, `condition_id`)
VALUES
(1435300, 1, 0, 'Henchmen? Tribute?', 0, 1, 1, 1435302, 0, 0, 0, 0, NULL, 0, 429064);

DELETE FROM `map_player_script` WHERE `map_id` = 429 AND `event` = 1 AND `script_id` = 4295012;
INSERT INTO `map_player_script`
(`map_id`, `event`, `script_id`, `condition_id`, `flags`, `comment`)
VALUES
(429, 1, 4295012, 0, 1, 'a player leaves Dire Maul: King of the Gordok goes');

DELETE FROM `gossip_menu` WHERE `entry` = 1433801 AND `text_id` = 6883;
INSERT INTO `gossip_menu`
(`entry`, `text_id`, `script_id`, `condition_id`)
VALUES
(1433801, 6883, 0, 0);

DELETE FROM `gossip_menu` WHERE `entry` = 1433800 AND `text_id` = 6795;
INSERT INTO `gossip_menu`
(`entry`, `text_id`, `script_id`, `condition_id`)
VALUES
(1433800, 6795, 0, 0);

DELETE FROM `gossip_menu_option` WHERE `menu_id` = 1433800 AND `id` = 0;
INSERT INTO `gossip_menu_option`
(`menu_id`, `id`, `option_icon`, `option_text`, `option_broadcast_text`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `box_broadcast_text`, `condition_id`)
VALUES
(1433800, 0, 0, 'Why should I bother fixing the trap? Why not just eliminate the guard the old fashioned way?', 0, 1, 1, 1433801, 0, 0, 0, 0, NULL, 0, 0);

DELETE FROM `gossip_menu_option` WHERE `menu_id` = 1433800 AND `id` = 1;
INSERT INTO `gossip_menu_option`
(`menu_id`, `id`, `option_icon`, `option_text`, `option_broadcast_text`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `box_broadcast_text`, `condition_id`)
VALUES
(1433800, 1, 0, 'Please teach me how to make a Gordok Ogre Suit!', 0, 1, 1, -1, 0, 14338001, 0, 0, NULL, 0, 429087);

DELETE FROM `gossip_menu_option` WHERE `menu_id` = 1433800 AND `id` = 2;
INSERT INTO `gossip_menu_option`
(`menu_id`, `id`, `option_icon`, `option_text`, `option_broadcast_text`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `box_broadcast_text`, `condition_id`)
VALUES
(1433800, 2, 0, 'Please teach me how to make a Gordok Ogre Suit!', 0, 1, 1, -1, 0, 14338002, 0, 0, NULL, 0, 429090);

UPDATE `creature_ai_events` SET `condition_id` = 429055 WHERE `id` = 1432206;
UPDATE `quest_template` SET `CompleteScript` = 1193 WHERE `entry` = 1193;
UPDATE `quest_template` SET `CompleteScript` = 5525 WHERE `entry` = 5525;
UPDATE `quest_template` SET `CompleteScript` = 7429 WHERE `entry` = 7429;
-- A gameobject's state as it spawns (AC3; the table from ac3_gameobject_spawn_state_whole.sql).
DELETE FROM `gameobject_spawn_state` WHERE `guid` = 264399 AND `ord` = 0;
DELETE FROM `gameobject_spawn_state` WHERE `guid` = 397151 AND `ord` = 0;
DELETE FROM `gameobject_spawn_state` WHERE `guid` = 261760 AND `ord` = 0;
DELETE FROM `gameobject_spawn_state` WHERE `guid` = 261762 AND `ord` = 0;
DELETE FROM `gameobject_spawn_state` WHERE `guid` = 262113 AND `ord` = 0;
DELETE FROM `gameobject_spawn_state` WHERE `guid` = 262115 AND `ord` = 0;
DELETE FROM `gameobject_spawn_state` WHERE `guid` = 262117 AND `ord` = 0;
DELETE FROM `gameobject_spawn_state` WHERE `guid` = 396405 AND `ord` = 0;
DELETE FROM `gameobject_spawn_state` WHERE `guid` = 397147 AND `ord` = 0;
DELETE FROM `gameobject_spawn_state` WHERE `guid` = 397167 AND `ord` = 0;
INSERT INTO `gameobject_spawn_state`
(`guid`, `ord`, `condition_id`, `state`, `flags_set`, `flags_clear`, `despawn`, `script_id`, `comment`)
VALUES
(264399, 0, 532001, 0, 0, 0, 0, 0, 'the crystal event done: open'),
(397151, 0, 532001, 0, 0, 0, 0, 0, 'the crystal event done: open'),
(261760, 0, 532001, 0, 0, 0, 0, 0, 'the crystal event done: open'),
(261762, 0, 532001, 0, 0, 0, 0, 0, 'the crystal event done: open'),
(262113, 0, 532001, 0, 0, 0, 0, 0, 'the crystal event done: open'),
(262115, 0, 532001, 0, 0, 0, 0, 0, 'the crystal event done: open'),
(262117, 0, 532001, 0, 0, 0, 0, 0, 'the crystal event done: open'),
(396405, 0, 429082, -1, 0, 0, 0, 4295013, 'the trap mended: the Broken Trap is replaced by the Fixed Trap again'),
(397147, 0, 48002, 0, 0, 0, 0, 0, 'Alzzin dead: the crumble wall open'),
(397167, 0, 48002, 0, 0, 0, 0, 0, 'Alzzin dead: the corrupt vine open');

-- The generic store's slots (AC7; the table from ac7_instance_data_slot.sql).
DELETE FROM `instance_data_slot` WHERE `map` = 429 AND `slot` = 1;
DELETE FROM `instance_data_slot` WHERE `map` = 429 AND `slot` = 2;
DELETE FROM `instance_data_slot` WHERE `map` = 429 AND `slot` = 3;
DELETE FROM `instance_data_slot` WHERE `map` = 429 AND `slot` = 4;
DELETE FROM `instance_data_slot` WHERE `map` = 429 AND `slot` = 5;
DELETE FROM `instance_data_slot` WHERE `map` = 429 AND `slot` = 6;
DELETE FROM `instance_data_slot` WHERE `map` = 429 AND `slot` = 7;
DELETE FROM `instance_data_slot` WHERE `map` = 429 AND `slot` = 8;
DELETE FROM `instance_data_slot` WHERE `map` = 429 AND `slot` = 9;
DELETE FROM `instance_data_slot` WHERE `map` = 429 AND `slot` = 10;
DELETE FROM `instance_data_slot` WHERE `map` = 429 AND `slot` = 11;
DELETE FROM `instance_data_slot` WHERE `map` = 429 AND `slot` = 13;
DELETE FROM `instance_data_slot` WHERE `map` = 429 AND `slot` = 15;
DELETE FROM `instance_data_slot` WHERE `map` = 429 AND `slot` = 16;
DELETE FROM `instance_data_slot` WHERE `map` = 429 AND `slot` = 17;
DELETE FROM `instance_data_slot` WHERE `map` = 429 AND `slot` = 18;
DELETE FROM `instance_data_slot` WHERE `map` = 429 AND `slot` = 19;
DELETE FROM `instance_data_slot` WHERE `map` = 429 AND `slot` = 20;
DELETE FROM `instance_data_slot` WHERE `map` = 429 AND `slot` = 21;
DELETE FROM `instance_data_slot` WHERE `map` = 429 AND `slot` = 22;
DELETE FROM `instance_data_slot` WHERE `map` = 429 AND `slot` = 23;
DELETE FROM `instance_data_slot` WHERE `map` = 429 AND `slot` = 24;
INSERT INTO `instance_data_slot`
(`map`, `slot`, `flags`, `name`)
VALUES
(429, 1, 1, 'the crystal event: 1 on, 3 every room cleared'),
(429, 2, 1, 'Immol''thar dead (3)'),
(429, 3, 4, 'Tendris'' aggro: the C++ never keeps it'),
(429, 4, 1, 'Zevrim Thornhoof dead (3)'),
(429, 5, 4, 'Ironbark''s door opened (3)'),
(429, 6, 1, 'the Gordok''s tribute: 1 a guard fell, 3 shown to the king'),
(429, 7, 1, 'Slip''kik''s trap: 3 mended'),
(429, 8, 1, 'the Gordok Ogre Suit (unused)'),
(429, 9, 1, 'Cho''Rush''s set (1-3)'),
(429, 10, 1, 'Guard Mol''dar dead (3)'),
(429, 11, 1, 'Alzzin: 4 the crumble wall broken, 3 dead'),
(429, 13, 4, 'Tannin looted'),
(429, 15, 1, 'the Gordok''s guards dead (rows)'),
(429, 16, 4, 'crystal 1 lit (rows)'),
(429, 17, 4, 'crystal 2 lit (rows)'),
(429, 18, 4, 'crystal 3 lit (rows)'),
(429, 19, 4, 'crystal 4 lit (rows)'),
(429, 20, 4, 'crystal 5 lit (rows)'),
(429, 21, 4, 'the Dreadsteed ritual: 0 nothing, 1 nodes, 2 waves, 3 waiting, 4 Dreadsteed (rows)'),
(429, 22, 4, 'the Dreadsteed ritual: Wheel of the Black March up (rows)'),
(429, 23, 4, 'the Dreadsteed ritual: Doomsday Candle up (rows)'),
(429, 24, 4, 'the Dreadsteed ritual: Bell of Dethmoora up (rows)');

