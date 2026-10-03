-- Blackwing Lair (map 469), the three drakes, Broodlord, the Death Talons and whelps: its C++ as rows -- EPIC10 tier 2.
-- Written by the trt repo's scripts/tier2/a28_blackwing_lair.py from d6_world; blackwing_lair_restore.sql puts
-- back what this replaces. R8: a person applies it, into the world database.
--
-- The C++ keeps its script names: mod-blackwing-lair is the switch (AM1, handoff/manager-091).
-- Loaded, the C++ runs as before -- a script found by name comes first. Unloaded
-- (`module unload mod-blackwing-lair`, which gives every creature standing a new AI at once),
-- the names find no script and the creatures run these rows (their ai_name).
--
-- Second pass: Vaelastrasz the Corrupt; the core keeps his quest accept (one champion, the instance bound to
-- him), the rest goes to mod-blackwing-lair. Nefarius's intro starts within a second of the room's event (the
-- C++: a second on) and its lines fall on whole seconds; Banishment of Scale is cast thrice (10 s each) where the
-- C++ held its channel for the 25 s. His quest is offered whether or not the Scepter run has started (the C++
-- hid it; its accept still fails the late taker), and a game master is not let past Razorgore unbeaten. He comes
-- back after a restart lying hurt with his intro again if no one had touched him (the C++: hostile, no gossip),
-- and with his gossip if he had been corrupted. A mana user already burning is skipped for that turn (the C++
-- picked another). His week-long respawn is the spawn's own.
-- Second pass: Nefarian's bones. Under 20% his C++ starts generic script 4690100 where the world has it (a seam
-- in boss_nefarian.cpp, his old loop where it has not): his yell, and each drakonid's bones within 200 yd a Bone
-- Construct where they lie, the zone pulled into the fight, gone 10 s out of combat; the bones gone. The
-- constructs are the bones' summons, not his.
-- Second pass: the Death Talon Captain and Seethers. The Captain keeps his pack's Aura of Flames by the second
-- (the C++: every update); a player within 29 yd pulls him, as does the default aggro range beside it. A Seether's
-- first Flame Buffet counts from aggro (the C++: from first reaching melee). Their own EventAI rules, dead under
-- the C++ and unlike it, are taken away.
-- Map 469 keeps instance_blackwing_lair, Razorgore, Vaelastrasz's quest accept, Chromaggus,
-- Victor Nefarius and Nefarian (the core). Broodlord has no height leash (the C++ evaded below z 448.6);
-- Firemaw does not Thrash (the C++ tried only while casting). A Death Talon picks its brood power and
-- vulnerability again as it evades (the C++ kept them till death) and does not get them back if dispelled.
-- The Death Talons' own EventAI rules, dead under the C++, are taken away.

UPDATE `creature_template` SET `ai_name` = 'EventAI' WHERE `entry` = 11981;
UPDATE `creature_template` SET `ai_name` = 'EventAI' WHERE `entry` = 11983;
UPDATE `creature_template` SET `ai_name` = 'EventAI' WHERE `entry` = 12017;
UPDATE `creature_template` SET `ai_name` = 'EventAI' WHERE `entry` = 12460;
UPDATE `creature_template` SET `ai_name` = 'EventAI' WHERE `entry` = 12461;
UPDATE `creature_template` SET `ai_name` = 'EventAI' WHERE `entry` = 12464;
UPDATE `creature_template` SET `ai_name` = 'EventAI' WHERE `entry` = 12467;
UPDATE `creature_template` SET `ai_name` = 'EventAI', `gossip_menu_id` = 1302000 WHERE `entry` = 13020;
UPDATE `creature_template` SET `ai_name` = 'EventAI' WHERE `entry` = 14022;
UPDATE `creature_template` SET `ai_name` = 'EventAI' WHERE `entry` = 14023;
UPDATE `creature_template` SET `ai_name` = 'EventAI' WHERE `entry` = 14024;
UPDATE `creature_template` SET `ai_name` = 'EventAI' WHERE `entry` = 14025;
UPDATE `creature_template` SET `ai_name` = 'EventAI' WHERE `entry` = 14601;

DELETE FROM `conditions` WHERE `condition_entry` IN (469101, 469103, 469104, 469105, 469113, 469115, 469118, 10469100);
INSERT INTO `conditions`
(`condition_entry`, `type`, `value1`, `value2`, `value3`, `value4`, `flags`)
VALUES
(469101, 38, 15, 2, 0, 0, 0),
(469103, 1, 22436, 0, 0, 0, 3),
(10469100, -1, 469101, 1000, 469103, 0, 0),
(469104, 38, 16, 1, 0, 0, 0),
(469105, 1, 22436, 0, 0, 0, 1),
(469113, 34, 1, 2, 0, 0, 1),
(469115, -1, 469110, 209001, 0, 0, 0),
(469118, 1, 23620, 0, 0, 0, 1);

-- Conditions another tier-2 migration writes too, under the same entry: whichever comes first.
INSERT IGNORE INTO `conditions`
(`condition_entry`, `type`, `value1`, `value2`, `value3`, `value4`, `flags`)
VALUES
(469000, 34, 8, 3, 0, 0, 1),
(469110, 34, 8, 3, 0, 0, 0),
(209001, 34, 1, 0, 0, 0, 0),
(209032, 34, 1, 4, 0, 0, 0),
(532000, 34, 0, 3, 0, 0, 0),
(229240, 34, 9, 0, 0, 0, 0);

DELETE FROM `broadcast_text` WHERE `entry` IN (469101, 469102, 469103, 469104, 469105, 469106, 469107, 469108);
INSERT INTO `broadcast_text`
(`entry`, `male_text`, `female_text`, `chat_type`, `sound_id`, `language_id`, `emote_id1`, `emote_id2`, `emote_id3`, `emote_delay1`, `emote_delay2`, `emote_delay3`)
VALUES
(469101, 'None of your kind should be here! You''ve doomed only yourselves!', 'None of your kind should be here! You''ve doomed only yourselves!', 1, 8286, 0, 0, 0, 0, 0, 0, 0),
(469102, 'Ah...the heroes. You are persistent, aren''t you? Your ally here attempted to match his power against mine - and paid the price. Now he shall serve me...by slaughtering you.', 'Ah...the heroes. You are persistent, aren''t you? Your ally here attempted to match his power against mine - and paid the price. Now he shall serve me...by slaughtering you.', 1, 8279, 0, 0, 0, 0, 0, 0, 0),
(469103, 'Get up, little red wyrm...and destroy them!', 'Get up, little red wyrm...and destroy them!', 1, 0, 0, 1, 0, 0, 0, 0, 0),
(469104, 'I beg you, mortals - FLEE! Flee before I lose all sense of control! The black fire rages within my heart! I MUST- release it!', 'I beg you, mortals - FLEE! Flee before I lose all sense of control! The black fire rages within my heart! I MUST- release it!', 1, 8282, 0, 1, 0, 0, 0, 0, 0),
(469105, 'FLAME! DEATH! DESTRUCTION! Cower, mortals before the wrath of Lord...NO - I MUST fight this! Alexstrasza help me, I MUST fight it!', 'FLAME! DEATH! DESTRUCTION! Cower, mortals before the wrath of Lord...NO - I MUST fight this! Alexstrasza help me, I MUST fight it!', 1, 8283, 0, 15, 0, 0, 0, 0, 0),
(469106, 'Too late, friends! Nefarius'' corruption has taken hold...I cannot...control myself.', 'Too late, friends! Nefarius'' corruption has taken hold...I cannot...control myself.', 1, 8281, 0, 1, 0, 0, 0, 0, 0),
(469107, 'Forgive me, $N! Your death only adds to my failure!', 'Forgive me, $N! Your death only adds to my failure!', 1, 8284, 0, 0, 0, 0, 0, 0, 0),
(469108, 'Nefarius'' hate has made me stronger than ever before! You should have fled while you could, mortals! The fury of Blackrock courses through my veins!', 'Nefarius'' hate has made me stronger than ever before! You should have fled while you could, mortals! The fury of Blackrock courses through my veins!', 1, 8285, 0, 0, 0, 0, 0, 0, 0);

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
DELETE FROM `creature_ai_events` WHERE `id` = 1246701;
DELETE FROM `creature_ai_scripts` WHERE `id` = 1246701;
DELETE FROM `creature_ai_events` WHERE `id` = 1246702;
DELETE FROM `creature_ai_scripts` WHERE `id` = 1246702;
DELETE FROM `creature_ai_events` WHERE `id` = 1246703;
DELETE FROM `creature_ai_scripts` WHERE `id` = 1246703;
DELETE FROM `creature_ai_events` WHERE `id` = 1246704;
DELETE FROM `creature_ai_scripts` WHERE `id` = 1246704;
DELETE FROM `creature_ai_events` WHERE `id` = 1246401;
DELETE FROM `creature_ai_scripts` WHERE `id` = 1246401;
DELETE FROM `creature_ai_events` WHERE `id` = 1246402;
DELETE FROM `creature_ai_scripts` WHERE `id` = 1246402;
DELETE FROM `creature_ai_events` WHERE `id` IN (1198101, 1198102, 1198103, 1198106, 1198107, 1198191, 1198192, 1198193, 1198301, 1198302, 1198303, 1198304, 1198391, 1198392, 1198393, 1201701, 1201702, 1201703, 1201704, 1201705, 1201791, 1201792, 1201793, 1201794, 1201795, 1246051, 1246052, 1246053, 1246054, 1246055, 1246151, 1246152, 1246153, 1246154, 1246411, 1246412, 1246711, 1246712, 1246713, 1246714, 1246715, 1246716, 1246721, 1246722, 1246723, 1246724, 1302001, 1302002, 1302003, 1302004, 1302011, 1302012, 1302013, 1302014, 1302021, 1302022, 1302023, 1302024, 1302025, 1302026, 1460101, 1460102, 1460103, 1460104, 1460106, 1460191, 1460192, 1460193);
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
(1246154, 12461, 0, 0, 0, 100, 9, 8000, 8000, 10000, 10000, 1246154, 0, 0, 'Death Talon Overseer - Fire Blast at a random attacker'),
(1246711, 12467, 0, 11, 0, 100, 0, 0, 0, 0, 0, 1246711, 0, 0, 'Death Talon Captain - at rest: his Aura of Flames, his pack''s taken away'),
(1246712, 12467, 0, 7, 0, 100, 0, 0, 0, 0, 0, 1246712, 0, 0, 'Death Talon Captain - at rest: his Aura of Flames, his pack''s taken away'),
(1246713, 12467, 0, 6, 0, 100, 0, 0, 0, 0, 0, 1246713, 0, 0, 'Death Talon Captain - dead: his pack''s Aura of Flames taken away'),
(1246714, 12467, 0, 4, 0, 100, 0, 0, 0, 0, 0, 1246714, 0, 0, 'Death Talon Captain - aggro: his Aura of Flames kept, Commanding Shout'),
(1246715, 12467, 0, 10, 0, 100, 1, 1, 29, 1000, 1000, 1246715, 0, 0, 'Death Talon Captain - a player within 29 yd: the fight'),
(1246716, 12467, 0, 0, 0, 100, 1, 1000, 1000, 1000, 1000, 1246716, 0, 0, 'Death Talon Captain - every second: the Aura of Flames on his pack within 15 yd'),
(1246721, 12467, 0, 0, 0, 100, 9, 4000, 8000, 4000, 8000, 1246721, 0, 0, 'Death Talon Captain - Cleave'),
(1246722, 12467, 0, 0, 0, 100, 9, 12000, 25000, 12000, 25000, 1246722, 0, 0, 'Death Talon Captain - Commanding Shout'),
(1246723, 12467, 0, 0, 0, 100, 9, 6000, 6000, 15000, 15000, 1246723, 0, 0, 'Death Talon Captain - Mark of Flames at a random attacker'),
(1246724, 12467, 0, 0, 0, 100, 1, 10000, 10000, 20000, 20000, 1246724, 0, 0, 'Death Talon Captain - Mark of Detonation, a random attacker on itself'),
(1246411, 12464, 0, 0, 0, 100, 9, 15000, 15000, 15000, 15000, 1246411, 0, 0, 'Death Talon Seether - Frenzy, with its emote'),
(1246412, 12464, 0, 0, 0, 100, 9, 5000, 10000, 8000, 12000, 1246412, 0, 0, 'Death Talon Seether - Flame Buffet'),
(1302001, 13020, 0, 11, 0, 100, 0, 0, 0, 0, 0, 1302001, 0, 0, 'Vaelastrasz - spawned: 30% health, at rest 2 s on'),
(1302002, 13020, 0, 7, 0, 100, 0, 0, 0, 0, 0, 1302002, 0, 0, 'Vaelastrasz - evading: 30% health'),
(1302003, 13020, 0, 21, 0, 100, 0, 0, 0, 0, 0, 1302003, 0, 0, 'Vaelastrasz - home: failed (1), hostile and standing, no gossip'),
(1302004, 13020, 469115, 1, 2, 100, 1, 1000, 1000, 1000, 1000, 1302004, 0, 0, 'Vaelastrasz - the room''s event done, he untouched: Nefarius''s intro (phase 1)'),
(1302011, 13020, 0, 4, 0, 100, 0, 0, 0, 0, 0, 1302011, 0, 0, 'Vaelastrasz - aggro: in progress (1), Essence of the Red, the zone into the fight'),
(1302012, 13020, 0, 6, 0, 100, 0, 0, 0, 0, 0, 1302012, 0, 0, 'Vaelastrasz - dead: done (1)'),
(1302013, 13020, 0, 5, 0, 20, 1, 0, 0, 0, 0, 1302013, 0, 0, 'Vaelastrasz - a player killed: his line, one time in five'),
(1302014, 13020, 0, 2, 0, 100, 0, 15, 0, 0, 0, 1302014, 0, 0, 'Vaelastrasz - under 15% health: his line'),
(1302021, 13020, 0, 0, 0, 100, 9, 6000, 6000, 5000, 10000, 1302021, 0, 0, 'Vaelastrasz - Cleave'),
(1302022, 13020, 0, 0, 0, 100, 9, 8000, 8000, 5000, 10000, 1302022, 0, 0, 'Vaelastrasz - Flame Breath'),
(1302023, 13020, 0, 0, 0, 100, 9, 4000, 4000, 2000, 2000, 1302023, 0, 0, 'Vaelastrasz - Fire Nova'),
(1302024, 13020, 0, 0, 0, 100, 9, 8000, 8000, 4000, 6000, 1302024, 0, 0, 'Vaelastrasz - Tail Sweep'),
(1302025, 13020, 0, 0, 0, 100, 1, 15000, 15000, 15000, 15000, 1302025, 0, 0, 'Vaelastrasz - Burning Adrenaline, a random mana user on itself'),
(1302026, 13020, 0, 0, 0, 100, 9, 45000, 45000, 45000, 45000, 1302026, 0, 0, 'Vaelastrasz - Burning Adrenaline, the tank on itself (retried till it takes)');

DELETE FROM `creature_ai_scripts` WHERE `id` IN (1198101, 1198102, 1198103, 1198106, 1198107, 1198191, 1198192, 1198193, 1198301, 1198302, 1198303, 1198304, 1198391, 1198392, 1198393, 1201701, 1201702, 1201703, 1201704, 1201705, 1201791, 1201792, 1201793, 1201794, 1201795, 1246051, 1246052, 1246053, 1246054, 1246055, 1246151, 1246152, 1246153, 1246154, 1246411, 1246412, 1246711, 1246712, 1246713, 1246714, 1246715, 1246716, 1246721, 1246722, 1246723, 1246724, 1302001, 1302002, 1302003, 1302004, 1302011, 1302012, 1302013, 1302014, 1302021, 1302022, 1302023, 1302024, 1302025, 1302026, 1460101, 1460102, 1460103, 1460104, 1460106, 1460191, 1460192, 1460193);
INSERT INTO `creature_ai_scripts`
(`id`, `delay`, `priority`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`)
VALUES
(1198391, 0, 0, 37, 3, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Firemaw - in progress'),
(1198391, 0, 1, 49, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Firemaw - the zone into the fight'),
(1198392, 0, 0, 37, 3, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Firemaw - failed'),
(1198393, 0, 0, 37, 3, 3, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Firemaw - done'),
(1198301, 0, 0, 15, 22539, 0, 0, 0, 0, 0, 0, 12, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Firemaw - Shadow Flame'),
(1198302, 0, 0, 15, 23339, 0, 0, 0, 0, 0, 1, 8, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Firemaw - Wing Buffet'),
(1198303, 0, 0, 29, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, -50, 0, 0, 0, 0, 'Firemaw - the hit player''s threat halved'),
(1198304, 0, 0, 15, 23341, 0, 0, 0, 0, 0, 0, 12, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Firemaw - Flame Buffet'),
(1460191, 0, 0, 37, 4, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Ebonroc - in progress'),
(1460191, 0, 1, 49, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Ebonroc - the zone into the fight'),
(1460192, 0, 0, 37, 4, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Ebonroc - failed'),
(1460193, 0, 0, 37, 4, 3, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Ebonroc - done'),
(1460101, 0, 0, 15, 22539, 0, 0, 0, 0, 0, 0, 12, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Ebonroc - Shadow Flame'),
(1460102, 0, 0, 15, 23339, 0, 0, 0, 0, 0, 1, 8, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Ebonroc - Wing Buffet'),
(1460103, 0, 0, 29, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, -50, 0, 0, 0, 0, 'Ebonroc - the hit player''s threat halved'),
(1460104, 0, 0, 15, 23340, 32, 0, 0, 0, 0, 1, 8, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Ebonroc - Shadow of Ebonroc'),
(1460106, 0, 0, 15, 3391, 0, 0, 0, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Ebonroc - Thrash, one swing in three'),
(1198191, 0, 0, 37, 5, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Flamegor - in progress'),
(1198191, 0, 1, 49, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Flamegor - the zone into the fight'),
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
(1201791, 0, 6, 49, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Broodlord - the zone'),
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
(1201794, 0, 0, 49, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Broodlord - the zone'),
(1201795, 0, 0, 49, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Broodlord - the zone'),
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
(1246154, 0, 0, 15, 20623, 0, 0, 0, 0, 0, 4, 8, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Death Talon Overseer - Fire Blast at a random attacker'),
(1246711, 0, 0, 15, 22436, 32, 0, 0, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Death Talon Captain - Aura of Flames'),
(1246711, 0, 1, 68, 4690025, 2, 12463, 50, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Death Talon Captain - the pack''s Aura of Flames off (12463)'),
(1246711, 0, 2, 68, 4690025, 2, 12465, 50, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Death Talon Captain - the pack''s Aura of Flames off (12465)'),
(1246711, 0, 3, 68, 4690025, 2, 12464, 50, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Death Talon Captain - the pack''s Aura of Flames off (12464)'),
(1246712, 0, 0, 15, 22436, 32, 0, 0, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Death Talon Captain - Aura of Flames'),
(1246712, 0, 1, 68, 4690025, 2, 12463, 50, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Death Talon Captain - the pack''s Aura of Flames off (12463)'),
(1246712, 0, 2, 68, 4690025, 2, 12465, 50, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Death Talon Captain - the pack''s Aura of Flames off (12465)'),
(1246712, 0, 3, 68, 4690025, 2, 12464, 50, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Death Talon Captain - the pack''s Aura of Flames off (12464)'),
(1246713, 0, 0, 68, 4690025, 2, 12463, 50, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Death Talon Captain - the pack''s Aura of Flames off (12463)'),
(1246713, 0, 1, 68, 4690025, 2, 12465, 50, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Death Talon Captain - the pack''s Aura of Flames off (12465)'),
(1246713, 0, 2, 68, 4690025, 2, 12464, 50, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Death Talon Captain - the pack''s Aura of Flames off (12464)'),
(1246714, 0, 0, 74, 22436, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 469105, 'Death Talon Captain - Aura of Flames, if gone'),
(1246714, 0, 1, 15, 22440, 2, 0, 0, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Death Talon Captain - Commanding Shout'),
(1246715, 0, 0, 26, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 85, 'Death Talon Captain - at the player seen'),
(1246716, 0, 0, 68, 4690026, 2, 12463, 50, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Death Talon Captain - the pack''s Aura of Flames by distance (12463)'),
(1246716, 0, 1, 68, 4690026, 2, 12465, 50, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Death Talon Captain - the pack''s Aura of Flames by distance (12465)'),
(1246716, 0, 2, 68, 4690026, 2, 12464, 50, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Death Talon Captain - the pack''s Aura of Flames by distance (12464)'),
(1246721, 0, 0, 15, 15496, 0, 0, 0, 0, 0, 1, 8, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Death Talon Captain - Cleave'),
(1246722, 0, 0, 15, 22440, 0, 0, 0, 0, 0, 0, 12, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Death Talon Captain - Commanding Shout'),
(1246723, 0, 0, 15, 25050, 0, 0, 0, 0, 0, 4, 8, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Death Talon Captain - Mark of Flames at a random attacker'),
(1246724, 0, 0, 15, 22438, 2, 0, 0, 0, 0, 4, 14, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Death Talon Captain - Mark of Detonation (the attacker casts it on itself)'),
(1246411, 0, 0, 15, 22428, 0, 0, 0, 0, 0, 0, 12, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Death Talon Seether - Frenzy, with its emote'),
(1246411, 0, 1, 0, 2, 0, 0, 0, 0, 0, 0, 0, 7797, 0, 0, 0, 0, 0, 0, 0, 0, 'Death Talon Seether - "goes into a killing frenzy!"'),
(1246412, 0, 0, 15, 22433, 0, 0, 0, 0, 0, 1, 8, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Death Talon Seether - Flame Buffet'),
(1302001, 0, 0, 94, 30, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Vaelastrasz - 30% health'),
(1302001, 0, 1, 39, 4690027, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0, 0, 0, 0, 0, 0, 0, 'Vaelastrasz - at rest'),
(1302002, 0, 0, 94, 30, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Vaelastrasz - 30% health'),
(1302003, 0, 0, 37, 1, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Vaelastrasz - failed'),
(1302003, 0, 1, 22, 14, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Vaelastrasz - hostile'),
(1302003, 0, 2, 28, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Vaelastrasz - up'),
(1302003, 0, 3, 4, 46, 512, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Vaelastrasz - immune to creatures'),
(1302003, 0, 4, 4, 147, 3, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Vaelastrasz - no gossip, no quest'),
(1302003, 0, 5, 94, 30, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Vaelastrasz - 30% health'),
(1302004, 0, 0, 44, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Vaelastrasz - the intro playing'),
(1302004, 0, 1, 39, 4690029, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0, 0, 0, 0, 0, 0, 0, 'Vaelastrasz - Nefarius''s intro'),
(1302011, 0, 0, 37, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Vaelastrasz - in progress'),
(1302011, 0, 1, 15, 23513, 0, 0, 0, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Vaelastrasz - Essence of the Red'),
(1302011, 0, 2, 49, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Vaelastrasz - the zone into the fight'),
(1302012, 0, 0, 37, 1, 3, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Vaelastrasz - done'),
(1302013, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 469107, 0, 0, 0, 0, 0, 0, 0, 0, 'Vaelastrasz - "Forgive me, $n!..."'),
(1302014, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 469108, 0, 0, 0, 0, 0, 0, 0, 0, 'Vaelastrasz - "Nefarius'' hate has made me stronger..."'),
(1302021, 0, 0, 15, 19983, 0, 0, 0, 0, 0, 1, 8, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Vaelastrasz - Cleave'),
(1302022, 0, 0, 15, 23461, 0, 0, 0, 0, 0, 1, 8, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Vaelastrasz - Flame Breath'),
(1302023, 0, 0, 15, 23462, 0, 0, 0, 0, 0, 0, 12, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Vaelastrasz - Fire Nova'),
(1302024, 0, 0, 15, 15847, 0, 0, 0, 0, 0, 0, 12, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Vaelastrasz - Tail Sweep'),
(1302025, 0, 0, 15, 23620, 2, 0, 0, 6, 0, 4, 6, 0, 0, 0, 0, 0, 0, 0, 0, 469118, 'Vaelastrasz - Burning Adrenaline (a mana user without it casts it on itself)'),
(1302026, 0, 0, 15, 23620, 2, 0, 0, 0, 0, 1, 14, 0, 0, 0, 0, 0, 0, 0, 0, 469118, 'Vaelastrasz - Burning Adrenaline (the tank, without it, casts it on itself)');

DELETE FROM `generic_scripts` WHERE `id` IN (4690001, 4690002, 4690003, 4690004, 4690005, 4690006, 4690007, 4690008, 4690009, 4690010, 4690011, 4690012, 4690013, 4690014, 4690015, 4690016, 4690017, 4690018, 4690019, 4690020, 4690021, 4690022, 4690023, 4690024, 4690025, 4690026, 4690027, 4690028, 4690029, 4690030, 4690031, 4690032, 4690100);
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
(4690024, 0, 0, 37, 8, 3, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Vael room - its event done (8 = 3): the technicians run'),
(4690025, 0, 0, 14, 22436, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Death Talon pack - Aura of Flames off'),
(4690026, 0, 0, 74, 22436, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 10469100, 'Death Talon pack - Aura of Flames, within 15 yd of the Captain'),
(4690026, 0, 1, 14, 22436, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 469104, 'Death Talon pack - Aura of Flames off, farther than 15 yd'),
(4690027, 2, 0, 22, 14, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1112, 'Vaelastrasz - hostile after a failed fight'),
(4690027, 2, 1, 28, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1112, 'Vaelastrasz - up after a failed fight'),
(4690027, 2, 2, 22, 35, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 469113, 'Vaelastrasz - friendly'),
(4690027, 2, 3, 28, 7, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 469113, 'Vaelastrasz - lying hurt'),
(4690027, 2, 4, 4, 46, 512, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Vaelastrasz - immune to creatures'),
(4690027, 2, 5, 4, 147, 3, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Vaelastrasz - no gossip, no quest'),
(4690027, 2, 6, 4, 147, 3, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 209032, 'Vaelastrasz - gossip and quest, Nefarius done with him'),
(4690028, 0, 0, 4, 46, 33554432, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Lord Victor Nefarius - not selectable'),
(4690028, 1, 1, 15, 16404, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Lord Victor Nefarius - Banishment of Scale on Vaelastrasz (10 s, cast again)'),
(4690028, 11, 2, 15, 16404, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Lord Victor Nefarius - Banishment of Scale on Vaelastrasz (10 s, cast again)'),
(4690028, 21, 3, 15, 16404, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Lord Victor Nefarius - Banishment of Scale on Vaelastrasz (10 s, cast again)'),
(4690028, 1, 4, 0, 1, 0, 0, 0, 0, 0, 0, 0, 469102, 0, 0, 0, 0, 0, 0, 0, 0, 'Lord Victor Nefarius - "Ah...the heroes. You are persistent..."'),
(4690028, 17, 5, 0, 1, 0, 0, 0, 0, 0, 0, 0, 469103, 0, 0, 0, 0, 0, 0, 0, 0, 'Lord Victor Nefarius - "Get up, little red wyrm...and destroy them!"'),
(4690029, 1, 0, 10, 10162, 25000, 0, 0, 0, 0, 0, 4, 16, 4690028, -1, 3, -7466.16, -1040.8, 412.053, 2.14675, 0, 'Vaelastrasz - Lord Victor Nefarius at the throne for 25 s, no AI of his own'),
(4690029, 2, 1, 74, 23642, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Vaelastrasz - Nefarius''s Corruption'),
(4690029, 18, 2, 37, 1, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Vaelastrasz - corrupted (1 = 4)'),
(4690029, 26, 3, 14, 23642, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Vaelastrasz - Corruption gone (24 s)'),
(4690029, 26, 4, 4, 147, 3, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Vaelastrasz - gossip and quest'),
(4690030, 10, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 469104, 0, 0, 0, 0, 0, 0, 0, 0, 'Vaelastrasz - "I beg you, mortals - FLEE!..."'),
(4690030, 26, 1, 0, 1, 0, 0, 0, 0, 0, 0, 0, 469105, 0, 0, 0, 0, 0, 0, 0, 0, 'Vaelastrasz - "FLAME! DEATH! DESTRUCTION!..."'),
(4690030, 36, 2, 22, 14, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Vaelastrasz - hostile'),
(4690030, 36, 3, 26, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Vaelastrasz - at the one who spoke to him'),
(4690031, 0, 0, 49, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Bone Construct - the zone into the fight'),
(4690032, 0, 0, 10, 14605, 10000, 0, 0, 0, 0, 0, 0, 262144, 4690031, -1, 4, 0, 0, 0, 0, 0, 'Drakonid Bones - a Bone Construct where they lie, gone 10 s out of combat'),
(4690032, 0, 1, 81, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Drakonid Bones - gone'),
(4690100, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 9883, 0, 0, 0, 0, 0, 0, 0, 0, 'Nefarian - "Impossible! Rise my minions! Serve your master once more!"'),
(4690100, 0, 1, 68, 4690032, 0, 179804, 200, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Nefarian - each drakonid''s bones within 200 yd rise');

DELETE FROM `gossip_scripts` WHERE `id` IN (1302000);
INSERT INTO `gossip_scripts`
(`id`, `delay`, `priority`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`)
VALUES
(1302000, 0, 0, 28, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Vaelastrasz - up'),
(1302000, 0, 1, 4, 147, 3, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Vaelastrasz - no gossip, no quest'),
(1302000, 0, 2, 0, 1, 0, 0, 0, 0, 0, 0, 0, 469106, 0, 0, 0, 0, 0, 0, 0, 0, 'Vaelastrasz - "Too late, friends!..."'),
(1302000, 0, 3, 37, 9, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 229240, 'Vaelastrasz - the Scepter run failed: no one took his quest'),
(1302000, 0, 4, 39, 4690030, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0, 0, 0, 0, 0, 0, 0, 'Vaelastrasz - his speech, then the fight');

DELETE FROM `areatrigger_generic_script` WHERE `trigger_id` = 3626 AND `script_id` = 4690024;
INSERT INTO `areatrigger_generic_script`
(`trigger_id`, `script_id`, `condition_id`, `flags`, `comment`)
VALUES
(3626, 4690024, 469000, 2, 'Vaelastrasz''s room: its event done as the first player walks in, no game master');

DELETE FROM `gossip_menu` WHERE `entry` = 1302000 AND `text_id` = 7156;
INSERT INTO `gossip_menu`
(`entry`, `text_id`, `script_id`, `condition_id`)
VALUES
(1302000, 7156, 0, 532000);

DELETE FROM `gossip_menu` WHERE `entry` = 1302001 AND `text_id` = 7256;
INSERT INTO `gossip_menu`
(`entry`, `text_id`, `script_id`, `condition_id`)
VALUES
(1302001, 7256, 0, 0);

DELETE FROM `gossip_menu_option` WHERE `menu_id` = 1302000 AND `id` = 0;
INSERT INTO `gossip_menu_option`
(`menu_id`, `id`, `option_icon`, `option_text`, `option_broadcast_text`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `box_broadcast_text`, `condition_id`)
VALUES
(1302000, 0, 0, 'I cannot, Vaelastrasz! Surely something can be done to heal you!', 9847, 1, 1, 1302001, 0, 0, 0, 0, NULL, 0, 0);

DELETE FROM `gossip_menu_option` WHERE `menu_id` = 1302001 AND `id` = 0;
INSERT INTO `gossip_menu_option`
(`menu_id`, `id`, `option_icon`, `option_text`, `option_broadcast_text`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `box_broadcast_text`, `condition_id`)
VALUES
(1302001, 0, 0, 'Vaelastrasz, no!!!', 10011, 1, 1, -1, 0, 1302000, 0, 0, NULL, 0, 0);

