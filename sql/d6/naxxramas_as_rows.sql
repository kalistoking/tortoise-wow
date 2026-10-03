-- Naxxramas (map 533), the creatures around its bosses: its C++ as rows -- EPIC10 tier 2.
-- Written by the trt repo's scripts/tier2/a30_naxxramas.py from d6_world; naxxramas_restore.sql puts
-- back what this replaces. R8: a person applies it, into the world database.
--
-- The C++ keeps its script names: mod-naxxramas is the switch (AM1, handoff/manager-091).
-- Loaded, the C++ runs as before -- a script found by name comes first. Unloaded
-- (`module unload mod-naxxramas`, which gives every creature standing a new AI at once),
-- the names find no script and the creatures run these rows (their ai_name).
--
-- Second pass: a standing Stoneskin Gargoyle aggroes at its detection range in stoneform (the C++: 17 yd); its
-- Stoneskin is cast once a time (the C++ cast it twice). The maggots' 1.5 yd aggro, no call for help and 40 yd
-- leash are their template's data (the C++ leashed from where they aggroed, not from home); they are gone a
-- second after Heigan is done. The Dark Touched Warrior flees for help to the nearest friend (the C++: to the
-- nearest Skeletal Steed). The gargoyles' and the warrior's own EventAI rules, dead under the C++, are taken away.
-- Third pass: Grobbulus and Faerlina leave the C++ but for their spell scripts. Grobbulus's leash is 3D from
-- home (the C++: 2D); his Mutating Injection is two rules split at 30 % health, so the faster one may cast at
-- once as he crosses it (the C++ waited out the slower timer), and a random pick that has it already is
-- retried; his Slime Stream comes as soon as his victim is 3 yd past his bounding radius (the C++ waited
-- 1.5 s out of melee reach; its 3 s at the pull is a phase). Faerlina's adds are all despawned and summoned
-- anew as she gets home (the C++ summoned only the ones dead); her Enrage held off while Widow's Embrace is
-- on her is the C++'s 30 s at least (the aura's duration); her Poison Bolt Volley is retried as the aura
-- falls (the C++: every 2.5 s); her 30 yd aggro is her detection range (the C++ did not ask for line of
-- sight); her height leash is a 200000 yd sphere's top, 0.06 yd low 150 yd from her room.
-- Omarion: his gossip is menus by skill (225 to be offered, 300 to learn) and Argent Dawn rank (revered, exalted
-- for the chests and the cloak), as the C++ chose; under revered he closes the gossip -- the C++'s spit is
-- script_texts -1999913, in no table, so it said nothing. His crafter pages show npc_text 68, "Greetings, $n."
-- (the C++ sent 8508, which the world has not: the client was shown the core's "Greetings $N"). A recipe is
-- cast by the player on himself, as the C++ did; once taught, the page is farewell only, as the C++'s was.
-- Map 533 keeps instance_naxxramas and every boss (the core). Anub'Rekhan's door says his line only with the
-- C++ gone (CONDITION_SCRIPT_LOADED reversed: go_anub_door returns false). The worshippers kneel and pray each
-- on its own, alive and out of a fight (the C++ held the whole group once the first of it fought). The Shade's
-- and Spirit's portal is summoned without the C++'s Portal of Shadows visual (a spell go no row sends), and
-- casts its own spell once, from its row (the C++ cast it a second time). A Plague Slime's scale is set as the
-- field's float bits. The Shades' own Shadow Bolt Volley rule, dead under the C++ and unlike it, is taken away.

UPDATE `creature_template` SET `ai_name` = 'EventAI' WHERE `entry` = 15931;
UPDATE `creature_template` SET `ai_name` = 'EventAI', `detection_range` = 30 WHERE `entry` = 15953;
UPDATE `creature_template` SET `ai_name` = 'EventAI', `detection_range` = 1.5, `call_for_help_range` = 0, `leash_range` = 40 WHERE `entry` = 16056;
UPDATE `creature_template` SET `ai_name` = 'EventAI', `detection_range` = 1.5, `call_for_help_range` = 0, `leash_range` = 40 WHERE `entry` = 16057;
UPDATE `creature_template` SET `ai_name` = 'EventAI' WHERE `entry` = 16129;
UPDATE `creature_template` SET `ai_name` = 'EventAI' WHERE `entry` = 16156;
UPDATE `creature_template` SET `ai_name` = 'EventAI' WHERE `entry` = 16164;
UPDATE `creature_template` SET `ai_name` = 'EventAI' WHERE `entry` = 16168;
UPDATE `creature_template` SET `ai_name` = 'EventAI' WHERE `entry` = 16243;
UPDATE `creature_template` SET `gossip_menu_id` = 1636500 WHERE `entry` = 16365;
UPDATE `creature_template` SET `ai_name` = 'EventAI' WHERE `entry` = 16400;
UPDATE `creature_template` SET `ai_name` = 'EventAI' WHERE `entry` = 16446;
UPDATE `creature_template` SET `ai_name` = 'EventAI' WHERE `entry` = 16449;
UPDATE `creature_template` SET `ai_name` = 'EventAI' WHERE `entry` = 16573;
UPDATE `creature_template` SET `ai_name` = 'EventAI' WHERE `entry` = 16783;
UPDATE `creature_template` SET `ai_name` = 'EventAI' WHERE `entry` = 16784;
UPDATE `creature_template` SET `ai_name` = 'EventAI' WHERE `entry` = 16785;
UPDATE `creature_template` SET `ai_name` = 'NullAI' WHERE `entry` = 533002;
UPDATE `creature_template` SET `ai_name` = 'NullAI' WHERE `entry` = 533003;
UPDATE `creature_template` SET `ai_name` = 'EventAI' WHERE `entry` = 533004;

DELETE FROM `conditions` WHERE `condition_entry` IN (533011, 533012, 533013, 533015, 533016, 533017, 533019, 533020, 533022, 533031, 533032, 533033, 533034, 533036, 533038, 533040, 533042, 533044, 533045, 533046, 533048, 533050, 533052, 533053, 533054, 533055, 533056, 533058, 533060, 533062, 533064, 533066, 533068, 533069, 10533010, 10533035, 10533037, 10533039, 10533041, 10533047, 10533049, 10533051, 10533057, 10533059, 10533061, 10533063, 10533065, 10533067);
INSERT INTO `conditions`
(`condition_entry`, `type`, `value1`, `value2`, `value3`, `value4`, `flags`)
VALUES
(533011, 52, 88092, 88093, 88096, 88097, 0),
(533012, 52, 88098, 88099, 0, 0, 0),
(10533010, -2, 533011, 533012, 0, 0, 0),
(533013, 52, 88095, 0, 0, 0, 1),
(533015, 41, 30, 2, 0, 0, 2),
(533016, 41, 30, 2, 0, 0, 3),
(533017, 54, 3205, -3342, 320, 180, 3),
(533019, 1, 28732, -1, 0, 0, 3),
(533020, 54, 3353, -3620, -199734, 200000, 3),
(533022, 5, 529, 6, 0, 0, 1),
(533031, 7, 197, 225, 0, 0, 0),
(533032, -1, 533031, 548, 0, 0, 0),
(533033, -1, 533031, 533022, 0, 0, 0),
(533034, 7, 197, 300, 0, 0, 0),
(533036, 17, 28205, 1, 0, 0, 0),
(10533035, -1, 533034, 533036, 0, 0, 0),
(533038, 17, 28209, 1, 0, 0, 0),
(10533037, -1, 533034, 533038, 0, 0, 0),
(533040, 17, 28207, 1, 0, 0, 0),
(10533039, -1, 533034, 533040, 0, 0, 0),
(533042, 17, 28208, 1, 0, 0, 0),
(10533041, -1, 533034, 533042, 0, 0, 0),
(533044, -1, 1350, 548, 0, 0, 0),
(533045, -1, 1350, 533022, 0, 0, 0),
(533046, 7, 164, 300, 0, 0, 0),
(533048, 17, 28243, 1, 0, 0, 0),
(10533047, -1, 533046, 533048, 0, 0, 0),
(533050, 17, 28244, 1, 0, 0, 0),
(10533049, -1, 533046, 533050, 0, 0, 0),
(533052, 17, 28242, 1, 0, 0, 0),
(10533051, -1, 533046, 533052, 0, 0, 0),
(533053, 7, 165, 225, 0, 0, 0),
(533054, -1, 533053, 548, 0, 0, 0),
(533055, -1, 533053, 533022, 0, 0, 0),
(533056, 7, 165, 300, 0, 0, 0),
(533058, 17, 28220, 1, 0, 0, 0),
(10533057, -1, 533056, 533058, 0, 0, 0),
(533060, 17, 28223, 1, 0, 0, 0),
(10533059, -1, 533056, 533060, 0, 0, 0),
(533062, 17, 28221, 1, 0, 0, 0),
(10533061, -1, 533056, 533062, 0, 0, 0),
(533064, 17, 28224, 1, 0, 0, 0),
(10533063, -1, 533056, 533064, 0, 0, 0),
(533066, 17, 28219, 1, 0, 0, 0),
(10533065, -1, 533056, 533066, 0, 0, 0),
(533068, 17, 28222, 1, 0, 0, 0),
(10533067, -1, 533056, 533068, 0, 0, 0),
(533069, 23, 22719, 1, 0, 0, 1);

-- Conditions another tier-2 migration writes too, under the same entry: whichever comes first.
INSERT IGNORE INTO `conditions`
(`condition_entry`, `type`, `value1`, `value2`, `value3`, `value4`, `flags`)
VALUES
(230000, 62, 0, 0, 0, 0, 1),
(209009, -1, 1000, 999, 0, 0, 0),
(33003, 34, 4, 3, 0, 0, 0),
(349003, 34, 1, 3, 0, 0, 1);

DELETE FROM `broadcast_text` WHERE `entry` IN (533101, 533102, 533103, 533104, 533105, 533106, 533107);
INSERT INTO `broadcast_text`
(`entry`, `male_text`, `female_text`, `chat_type`, `sound_id`, `language_id`, `emote_id1`, `emote_id2`, `emote_id3`, `emote_delay1`, `emote_delay2`, `emote_delay3`)
VALUES
(533101, 'Slay them in the master''s name!', 'Slay them in the master''s name!', 1, 8794, 0, 0, 0, 0, 0, 0, 0),
(533102, 'You have failed!', 'You have failed!', 1, 8800, 0, 0, 0, 0, 0, 0, 0),
(533103, 'Pathetic wretch!', 'Pathetic wretch!', 1, 8801, 0, 0, 0, 0, 0, 0, 0),
(533104, 'The master... will avenge me!', 'The master... will avenge me!', 1, 8798, 0, 0, 0, 0, 0, 0, 0),
(533105, 'You cannot hide from me!', 'You cannot hide from me!', 1, 8795, 0, 0, 0, 0, 0, 0, 0),
(533106, 'Kneel before me, worm!', 'Kneel before me, worm!', 1, 8796, 0, 0, 0, 0, 0, 0, 0),
(533107, 'Run while you still can!', 'Run while you still can!', 1, 8797, 0, 0, 0, 0, 0, 0, 0);

-- Existing rows taken away: the restore puts them back.
DELETE FROM `creature_ai_events` WHERE `id` = 1616401;
DELETE FROM `creature_ai_scripts` WHERE `id` = 1616401;
DELETE FROM `creature_ai_events` WHERE `id` = 1616801;
DELETE FROM `creature_ai_scripts` WHERE `id` = 1616801;
DELETE FROM `creature_ai_events` WHERE `id` = 1616802;
DELETE FROM `creature_ai_scripts` WHERE `id` = 1616802;
DELETE FROM `creature_ai_events` WHERE `id` = 1644601;
DELETE FROM `creature_ai_scripts` WHERE `id` = 1644601;
DELETE FROM `creature_ai_events` WHERE `id` = 1644602;
DELETE FROM `creature_ai_scripts` WHERE `id` = 1644602;
DELETE FROM `creature_ai_events` WHERE `id` = 1615601;
DELETE FROM `creature_ai_scripts` WHERE `id` = 1615601;
DELETE FROM `creature_ai_events` WHERE `id` IN (1593111, 1593112, 1593113, 1593114, 1593115, 1593116, 1593117, 1593118, 1593119, 1593120, 1593121, 1593122, 1595311, 1595312, 1595313, 1595314, 1595315, 1595316, 1595317, 1595318, 1595319, 1595320, 1595321, 1605611, 1605612, 1605613, 1605711, 1605712, 1612901, 1615611, 1616411, 1616412, 1616413, 1616414, 1616415, 1616811, 1616812, 1616813, 1616814, 1616815, 1624311, 1624312, 1624313, 1624314, 1636011, 1636012, 1640011, 1640012, 1640013, 1640014, 1644613, 1644614, 1644615, 1644911, 1644912, 1644913, 1644914, 1644915, 1657301, 1657302, 1657303, 1657304, 1657305, 1678311, 1678312, 1678313, 1678314, 1678411, 1678412, 1678413, 1678414, 1678511, 1678512, 1678513, 1678514, 5339001, 5339002, 5339003, 5339004, 5339005);
INSERT INTO `creature_ai_events`
(`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`)
VALUES
(1657301, 16573, 0, 4, 0, 100, 0, 0, 0, 0, 0, 1657301, 0, 0, 'Crypt Guard - fought: Anub''Rekhan into the fight at the one who pulled it'),
(1657302, 16573, 0, 2, 0, 100, 8, 50, 0, 0, 0, 1657302, 0, 0, 'Crypt Guard - Enrage at half health, with its emote'),
(1657303, 16573, 0, 0, 0, 100, 9, 12000, 12000, 12000, 12000, 1657303, 0, 0, 'Crypt Guard - Web, then every threat wiped'),
(1657304, 16573, 0, 0, 0, 100, 9, 6000, 6000, 6000, 6000, 1657304, 0, 0, 'Crypt Guard - Cleave'),
(1657305, 16573, 0, 0, 0, 100, 9, 5000, 5000, 5000, 5000, 1657305, 0, 0, 'Crypt Guard - Acid Spit'),
(5339001, 533004, 0, 1, 30, 100, 1, 5000, 10000, 5000, 10000, 5339001, 0, 0, 'Faerlina RP - the worshippers kneel (phase 0 to 1)'),
(5339002, 533004, 0, 1, 29, 100, 1, 10000, 90000, 10000, 90000, 5339002, 0, 0, 'Faerlina RP - they channel (phase 1 to 2)'),
(5339003, 533004, 0, 1, 27, 100, 1, 1000, 1000, 1000, 1000, 5339003, 0, 0, 'Faerlina RP - they stand (phase 2 to 3)'),
(5339004, 533004, 0, 1, 23, 100, 1, 10000, 30000, 10000, 30000, 5339004, 0, 0, 'Faerlina RP - they stop channelling (phase 3 to 4)'),
(5339005, 533004, 0, 1, 15, 100, 1, 2000, 10000, 2000, 10000, 5339005, 0, 0, 'Faerlina RP - they kneel again (phase 4 to 1)'),
(1636011, 16360, 0, 7, 0, 100, 0, 0, 0, 0, 0, 1636011, 0, 0, 'Zombie Chow - reset: Infected Wound, fighting again'),
(1636012, 16360, 0, 8, 0, 100, 0, 28374, 0, 0, 0, 1636012, 0, 0, 'Zombie Chow - hit by Gluth''s Decimate: no more fighting, after Gluth'),
(1612901, 16129, 0, 11, 0, 100, 0, 0, 0, 0, 0, 1612901, 0, 0, 'Shadow Fissure - never fighting; Void Blast at 3 s, gone 2.25 s later'),
(1616411, 16164, 0, 11, 0, 100, 0, 0, 0, 0, 0, 1616411, 0, 0, 'Shade of Naxxramas - stealth detection'),
(1616412, 16164, 0, 0, 0, 100, 0, 5000, 5000, 0, 0, 1616412, 0, 0, 'Shade of Naxxramas - 5 s into a fight: a Portal of Shadows for 60 s'),
(1616413, 16164, 0, 0, 0, 100, 9, 6000, 6000, 10000, 10000, 1616413, 0, 0, 'Shade of Naxxramas - Shadow Bolt Volley'),
(1616414, 16164, 0, 7, 0, 100, 0, 0, 0, 0, 0, 1616414, 0, 0, 'Shade of Naxxramas - reset: its portal gone'),
(1616415, 16164, 0, 6, 0, 100, 0, 0, 0, 0, 0, 1616415, 0, 0, 'Shade of Naxxramas - dead: its portal gone'),
(1644911, 16449, 0, 11, 0, 100, 0, 0, 0, 0, 0, 1644911, 0, 0, 'Spirit of Naxxramas - stealth detection'),
(1644912, 16449, 0, 0, 0, 100, 0, 5000, 5000, 0, 0, 1644912, 0, 0, 'Spirit of Naxxramas - 5 s into a fight: a Portal of Shadows for 60 s'),
(1644913, 16449, 0, 0, 0, 100, 9, 6000, 6000, 10000, 10000, 1644913, 0, 0, 'Spirit of Naxxramas - Shadow Bolt Volley'),
(1644914, 16449, 0, 7, 0, 100, 0, 0, 0, 0, 0, 1644914, 0, 0, 'Spirit of Naxxramas - reset: its portal gone'),
(1644915, 16449, 0, 6, 0, 100, 0, 0, 0, 0, 0, 1644915, 0, 0, 'Spirit of Naxxramas - dead: its portal gone'),
(1624311, 16243, 0, 11, 0, 100, 0, 0, 0, 0, 0, 1624311, 0, 0, 'Plague Slime - spawned: a colour'),
(1624312, 16243, 0, 7, 0, 100, 0, 0, 0, 0, 0, 1624312, 0, 0, 'Plague Slime - reset: a colour'),
(1624313, 16243, 0, 0, 0, 100, 1, 0, 0, 9000, 12000, 1624313, 0, 0, 'Plague Slime - in a fight: another colour every 9-12 s'),
(1624314, 16243, 0, 4, 0, 100, 0, 0, 0, 0, 0, 1624314, 0, 0, 'Plague Slime - aggro: help called within 10 yd'),
(1678311, 16783, 0, 11, 0, 100, 0, 0, 0, 0, 0, 1678311, 0, 0, 'Plague Slime - spawned: a colour'),
(1678312, 16783, 0, 7, 0, 100, 0, 0, 0, 0, 0, 1678312, 0, 0, 'Plague Slime - reset: a colour'),
(1678313, 16783, 0, 0, 0, 100, 1, 0, 0, 9000, 12000, 1678313, 0, 0, 'Plague Slime - in a fight: another colour every 9-12 s'),
(1678314, 16783, 0, 4, 0, 100, 0, 0, 0, 0, 0, 1678314, 0, 0, 'Plague Slime - aggro: help called within 10 yd'),
(1678511, 16785, 0, 11, 0, 100, 0, 0, 0, 0, 0, 1678511, 0, 0, 'Plague Slime - spawned: a colour'),
(1678512, 16785, 0, 7, 0, 100, 0, 0, 0, 0, 0, 1678512, 0, 0, 'Plague Slime - reset: a colour'),
(1678513, 16785, 0, 0, 0, 100, 1, 0, 0, 9000, 12000, 1678513, 0, 0, 'Plague Slime - in a fight: another colour every 9-12 s'),
(1678514, 16785, 0, 4, 0, 100, 0, 0, 0, 0, 0, 1678514, 0, 0, 'Plague Slime - aggro: help called within 10 yd'),
(1678411, 16784, 0, 11, 0, 100, 0, 0, 0, 0, 0, 1678411, 0, 0, 'Plague Slime - spawned: a colour'),
(1678412, 16784, 0, 7, 0, 100, 0, 0, 0, 0, 0, 1678412, 0, 0, 'Plague Slime - reset: a colour'),
(1678413, 16784, 0, 0, 0, 100, 1, 0, 0, 9000, 12000, 1678413, 0, 0, 'Plague Slime - in a fight: another colour every 9-12 s'),
(1678414, 16784, 0, 4, 0, 100, 0, 0, 0, 0, 0, 1678414, 0, 0, 'Plague Slime - aggro: help called within 10 yd'),
(1640011, 16400, 0, 11, 0, 100, 0, 0, 0, 0, 0, 1640011, 0, 0, 'Toxic Tunnel - never fighting'),
(1640012, 16400, 0, 1, 0, 100, 1, 0, 0, 5000, 5000, 1640012, 0, 0, 'Toxic Tunnel - its gas kept up'),
(1640013, 16400, 0, 0, 0, 100, 1, 0, 0, 5000, 5000, 1640013, 0, 0, 'Toxic Tunnel - its gas kept up in a fight'),
(1640014, 16400, 0, 4, 0, 100, 0, 0, 0, 0, 0, 1640014, 0, 0, 'Toxic Tunnel - its gas hit someone: out of the fight 5 s on'),
(1616811, 16168, 10533010, 11, 0, 100, 0, 0, 0, 0, 0, 1616811, 0, 0, 'Stoneskin Gargoyle - standing still: stealth detection, stoneform'),
(1616812, 16168, 10533010, 21, 0, 100, 0, 0, 0, 0, 0, 1616812, 0, 0, 'Stoneskin Gargoyle - home, standing still: stoneform again'),
(1616813, 16168, 0, 4, 0, 100, 0, 0, 0, 0, 0, 1616813, 0, 0, 'Stoneskin Gargoyle - aggro: out of its stoneform'),
(1616814, 16168, 0, 2, 0, 100, 13, 29, 0, 1000, 1000, 1616814, 0, 0, 'Stoneskin Gargoyle - under 30 %: Stoneskin whenever it is gone, with its emote'),
(1616815, 16168, 533013, 0, 0, 100, 13, 2800, 6500, 8000, 8000, 1616815, 0, 0, 'Stoneskin Gargoyle - Acid Volley'),
(1644613, 16446, 0, 4, 0, 100, 0, 0, 0, 0, 0, 1644613, 0, 0, 'Plagued Gargoyle - aggro: out of its stoneform'),
(1644614, 16446, 0, 2, 0, 100, 13, 29, 0, 1000, 1000, 1644614, 0, 0, 'Plagued Gargoyle - under 30 %: Stoneskin whenever it is gone, with its emote'),
(1644615, 16446, 533013, 0, 0, 100, 13, 2800, 6500, 8000, 8000, 1644615, 0, 0, 'Plagued Gargoyle - Acid Volley'),
(1605711, 16057, 33003, 1, 0, 100, 1, 1000, 1000, 1000, 1000, 1605711, 0, 0, 'Rotting Maggot - Heigan done: gone'),
(1605712, 16057, 33003, 0, 0, 100, 1, 1000, 1000, 1000, 1000, 1605712, 0, 0, 'Rotting Maggot - Heigan done: gone'),
(1605611, 16056, 33003, 1, 0, 100, 1, 1000, 1000, 1000, 1000, 1605611, 0, 0, 'Diseased Maggot - Heigan done: gone'),
(1605612, 16056, 33003, 0, 0, 100, 1, 1000, 1000, 1000, 1000, 1605612, 0, 0, 'Diseased Maggot - Heigan done: gone'),
(1605613, 16056, 0, 0, 0, 100, 1, 0, 0, 1000, 1000, 1605613, 0, 0, 'Diseased Maggot - Retching Plague kept up'),
(1615611, 16156, 0, 2, 0, 100, 0, 49, 0, 0, 0, 1615611, 0, 0, 'Dark Touched Warrior - under half health: flees for help, once'),
(1593111, 15931, 0, 4, 0, 100, 0, 0, 0, 0, 0, 1593111, 0, 0, 'Grobbulus - aggro: his encounter in progress'),
(1593112, 15931, 0, 6, 0, 100, 0, 0, 0, 0, 0, 1593112, 0, 0, 'Grobbulus - dead: his encounter done'),
(1593113, 15931, 0, 21, 0, 100, 0, 0, 0, 0, 0, 1593113, 0, 0, 'Grobbulus - home: his encounter failed'),
(1593114, 15931, 533016, 0, 0, 100, 13, 12000, 12000, 7000, 13000, 1593114, 0, 0, 'Grobbulus - above 30 %: Mutating Injection every 7-13 s, on a player without it'),
(1593115, 15931, 533015, 0, 0, 100, 13, 12000, 12000, 3000, 7000, 1593115, 0, 0, 'Grobbulus - at 30 % or under: Mutating Injection every 3-7 s, on a player without it'),
(1593116, 15931, 0, 0, 0, 100, 9, 16000, 16000, 16000, 16000, 1593116, 0, 0, 'Grobbulus - Poison Cloud'),
(1593117, 15931, 0, 0, 0, 100, 9, 20000, 30000, 30000, 35000, 1593117, 0, 0, 'Grobbulus - Slime Spray'),
(1593118, 15931, 0, 36, 0, 100, 1, 28157, 1, 0, 0, 1593118, 0, 0, 'Grobbulus - Slime Spray hit a player: a Fallout Slime where he stands'),
(1593119, 15931, 0, 0, 0, 100, 0, 3000, 3000, 0, 0, 1593119, 0, 0, 'Grobbulus - 3 s into the fight: his Slime Stream ready (phase 1)'),
(1593120, 15931, 0, 9, 29, 100, 9, 3, 200, 1500, 1500, 1593120, 0, 0, 'Grobbulus - his victim out of his reach: Slime Stream every 1.5 s'),
(1593121, 15931, 0, 0, 0, 100, 8, 720000, 720000, 0, 0, 1593121, 0, 0, 'Grobbulus - 12 minutes in: Berserk'),
(1593122, 15931, 533017, 0, 0, 100, 1, 1000, 1000, 1000, 1000, 1593122, 0, 0, 'Grobbulus - beyond 180 yd from home: out of the fight'),
(1595311, 15953, 349003, 11, 0, 100, 0, 0, 0, 0, 0, 1595311, 0, 0, 'Faerlina - spawned, not done: her two followers and four worshippers'),
(1595312, 15953, 0, 21, 0, 100, 0, 0, 0, 0, 0, 1595312, 0, 0, 'Faerlina - home: her encounter failed'),
(1595313, 15953, 349003, 21, 0, 100, 0, 0, 0, 0, 0, 1595313, 0, 0, 'Faerlina - home, not done: her followers and worshippers anew'),
(1595314, 15953, 0, 4, 0, 100, 0, 0, 0, 0, 0, 1595314, 0, 0, 'Faerlina - aggro: her line, her encounter in progress, her adds at her puller'),
(1595315, 15953, 0, 5, 0, 100, 1, 0, 0, 1, 0, 1595315, 0, 0, 'Faerlina - a player killed: one of her two lines'),
(1595316, 15953, 0, 6, 0, 100, 0, 0, 0, 0, 0, 1595316, 0, 0, 'Faerlina - dead: her line, her encounter done'),
(1595317, 15953, 533019, 0, 0, 100, 9, 8000, 8000, 10000, 12000, 1595317, 0, 0, 'Faerlina - Poison Bolt Volley, not under Widow''s Embrace'),
(1595318, 15953, 0, 0, 0, 100, 9, 16000, 16000, 8000, 12000, 1595318, 0, 0, 'Faerlina - Rain of Fire on a random target'),
(1595319, 15953, 533019, 0, 0, 100, 9, 60000, 60000, 60000, 60000, 1595319, 0, 0, 'Faerlina - Enrage every 60 s, not under Widow''s Embrace, with one of her three lines'),
(1595320, 15953, 0, 8, 0, 100, 1, 28732, 0, 0, 0, 1595320, 0, 0, 'Faerlina - hit by Widow''s Embrace: her Enrage off'),
(1595321, 15953, 533020, 0, 0, 100, 1, 1000, 1000, 1000, 1000, 1595321, 0, 0, 'Faerlina - above 266 yd high: out of the fight, her adds within 150 yd too');

DELETE FROM `creature_ai_scripts` WHERE `id` IN (1593111, 1593112, 1593113, 1593114, 1593115, 1593116, 1593117, 1593118, 1593119, 1593120, 1593121, 1593122, 1595311, 1595312, 1595313, 1595314, 1595315, 1595316, 1595317, 1595318, 1595319, 1595320, 1595321, 1605611, 1605612, 1605613, 1605711, 1605712, 1612901, 1615611, 1616411, 1616412, 1616413, 1616414, 1616415, 1616811, 1616812, 1616813, 1616814, 1616815, 1624311, 1624312, 1624313, 1624314, 1636011, 1636012, 1640011, 1640012, 1640013, 1640014, 1644613, 1644614, 1644615, 1644911, 1644912, 1644913, 1644914, 1644915, 1657301, 1657302, 1657303, 1657304, 1657305, 1678311, 1678312, 1678313, 1678314, 1678411, 1678412, 1678413, 1678414, 1678511, 1678512, 1678513, 1678514, 5339001, 5339002, 5339003, 5339004, 5339005);
INSERT INTO `creature_ai_scripts`
(`id`, `delay`, `priority`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`)
VALUES
(1657301, 0, 0, 68, 5330001, 2, 15956, 200, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Crypt Guard - Anub''Rekhan at its attacker'),
(1657302, 0, 0, 15, 28747, 0, 0, 0, 0, 0, 0, 12, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Crypt Guard - Enrage'),
(1657302, 0, 1, 0, 2, 0, 0, 0, 0, 0, 0, 0, 7798, 0, 0, 0, 0, 0, 0, 0, 0, 'Crypt Guard - its enrage emote'),
(1657303, 0, 0, 15, 28991, 0, 0, 0, 0, 0, 0, 12, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Crypt Guard - Web'),
(1657303, 0, 1, 29, 6, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, -100, 0, 0, 0, 0, 'Crypt Guard - every threat wiped'),
(1657304, 0, 0, 15, 26350, 0, 0, 0, 0, 0, 1, 8, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Crypt Guard - Cleave'),
(1657305, 0, 0, 15, 28969, 0, 0, 0, 0, 0, 1, 8, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Crypt Guard - Acid Spit'),
(5339005, 0, 0, 68, 5330004, 2, 15981, 11, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Faerlina RP - the acolytes kneel'),
(5339005, 0, 1, 68, 5330004, 2, 15980, 11, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Faerlina RP - the cultists kneel'),
(5339001, 0, 2, 44, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Faerlina RP - phase 1'),
(5339002, 0, 0, 68, 5330005, 2, 15981, 11, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Faerlina RP - the acolytes channel'),
(5339002, 0, 1, 68, 5330005, 2, 15980, 11, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Faerlina RP - the cultists channel'),
(5339002, 0, 2, 44, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Faerlina RP - phase 2'),
(5339003, 0, 0, 68, 5330006, 2, 15981, 11, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Faerlina RP - the acolytes stand'),
(5339003, 0, 1, 68, 5330006, 2, 15980, 11, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Faerlina RP - the cultists stand'),
(5339003, 0, 2, 44, 3, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Faerlina RP - phase 3'),
(5339004, 0, 0, 68, 5330007, 2, 15981, 11, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Faerlina RP - the acolytes stop channelling'),
(5339004, 0, 1, 68, 5330007, 2, 15980, 11, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Faerlina RP - the cultists stop channelling'),
(5339004, 0, 2, 44, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Faerlina RP - phase 4'),
(5339005, 0, 0, 68, 5330004, 2, 15981, 11, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Faerlina RP - the acolytes kneel'),
(5339005, 0, 1, 68, 5330004, 2, 15980, 11, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Faerlina RP - the cultists kneel'),
(5339005, 0, 2, 44, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Faerlina RP - phase 1'),
(1636011, 0, 0, 15, 29307, 2, 0, 0, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Zombie Chow - Infected Wound'),
(1636011, 0, 1, 43, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Zombie Chow - chasing again'),
(1636011, 0, 2, 42, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Zombie Chow - melee again'),
(1636012, 0, 0, 59, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Zombie Chow - passive'),
(1636012, 0, 1, 43, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Zombie Chow - no chase'),
(1636012, 0, 2, 42, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Zombie Chow - no melee'),
(1636012, 0, 3, 73, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Zombie Chow - out of the fight'),
(1636012, 0, 4, 20, 14, 0, 0, 0, 15932, 200, 8, 0, 0, 0, 0, 0, 5, 0, 0, 0, 0, 'Zombie Chow - following Gluth'),
(1636012, 0, 5, 15, 28375, 2, 0, 0, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Zombie Chow - Decimate, on itself'),
(1612901, 0, 0, 59, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Shadow Fissure - passive'),
(1612901, 0, 1, 39, 5330008, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0, 0, 0, 0, 0, 0, 0, 'Shadow Fissure - what comes later'),
(1616411, 0, 0, 15, 18950, 2, 0, 0, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Shade of Naxxramas - Detect Invisibility'),
(1616412, 0, 0, 10, 16420, 60000, 0, 0, 0, 0, 0, 0, 262144, 0, -1, 3, 0, 0, 0, 0, 0, 'Shade of Naxxramas - a Portal of Shadows'),
(1616413, 0, 0, 15, 28599, 0, 0, 0, 0, 0, 0, 12, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Shade of Naxxramas - Shadow Bolt Volley'),
(1616414, 0, 0, 18, 0, 0, 0, 0, 16420, 30, 8, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Shade of Naxxramas - its portal gone'),
(1616415, 0, 0, 18, 0, 0, 0, 0, 16420, 30, 8, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Shade of Naxxramas - its portal gone'),
(1644911, 0, 0, 15, 18950, 2, 0, 0, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Spirit of Naxxramas - Detect Invisibility'),
(1644912, 0, 0, 10, 16420, 60000, 0, 0, 0, 0, 0, 0, 262144, 0, -1, 3, 0, 0, 0, 0, 0, 'Spirit of Naxxramas - a Portal of Shadows'),
(1644913, 0, 0, 15, 28599, 0, 0, 0, 0, 0, 0, 12, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Spirit of Naxxramas - Shadow Bolt Volley'),
(1644914, 0, 0, 18, 0, 0, 0, 0, 16420, 30, 8, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Spirit of Naxxramas - its portal gone'),
(1644915, 0, 0, 18, 0, 0, 0, 0, 16420, 30, 8, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Spirit of Naxxramas - its portal gone'),
(1624311, 0, 0, 39, 5330013, 5330014, 0, 0, 0, 0, 0, 0, 50, 50, 0, 0, 0, 0, 0, 0, 0, 'Plague Slime - a colour'),
(1624312, 0, 0, 39, 5330013, 5330014, 0, 0, 0, 0, 0, 0, 50, 50, 0, 0, 0, 0, 0, 0, 0, 'Plague Slime - a colour'),
(1624313, 0, 0, 39, 5330013, 5330014, 0, 0, 0, 0, 0, 0, 50, 50, 0, 0, 0, 0, 0, 0, 0, 'Plague Slime - another colour'),
(1624314, 0, 0, 50, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 10, 0, 0, 0, 0, 'Plague Slime - help within 10 yd'),
(1678311, 0, 0, 39, 5330013, 5330014, 0, 0, 0, 0, 0, 0, 50, 50, 0, 0, 0, 0, 0, 0, 0, 'Plague Slime - a colour'),
(1678312, 0, 0, 39, 5330013, 5330014, 0, 0, 0, 0, 0, 0, 50, 50, 0, 0, 0, 0, 0, 0, 0, 'Plague Slime - a colour'),
(1678313, 0, 0, 39, 5330013, 5330014, 0, 0, 0, 0, 0, 0, 50, 50, 0, 0, 0, 0, 0, 0, 0, 'Plague Slime - another colour'),
(1678314, 0, 0, 50, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 10, 0, 0, 0, 0, 'Plague Slime - help within 10 yd'),
(1678511, 0, 0, 39, 5330013, 5330014, 0, 0, 0, 0, 0, 0, 50, 50, 0, 0, 0, 0, 0, 0, 0, 'Plague Slime - a colour'),
(1678512, 0, 0, 39, 5330013, 5330014, 0, 0, 0, 0, 0, 0, 50, 50, 0, 0, 0, 0, 0, 0, 0, 'Plague Slime - a colour'),
(1678513, 0, 0, 39, 5330013, 5330014, 0, 0, 0, 0, 0, 0, 50, 50, 0, 0, 0, 0, 0, 0, 0, 'Plague Slime - another colour'),
(1678514, 0, 0, 50, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 10, 0, 0, 0, 0, 'Plague Slime - help within 10 yd'),
(1678411, 0, 0, 39, 5330013, 5330014, 0, 0, 0, 0, 0, 0, 50, 50, 0, 0, 0, 0, 0, 0, 0, 'Plague Slime - a colour'),
(1678412, 0, 0, 39, 5330013, 5330014, 0, 0, 0, 0, 0, 0, 50, 50, 0, 0, 0, 0, 0, 0, 0, 'Plague Slime - a colour'),
(1678413, 0, 0, 39, 5330013, 5330014, 0, 0, 0, 0, 0, 0, 50, 50, 0, 0, 0, 0, 0, 0, 0, 'Plague Slime - another colour'),
(1678414, 0, 0, 50, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 10, 0, 0, 0, 0, 'Plague Slime - help within 10 yd'),
(1640011, 0, 0, 59, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Toxic Tunnel - passive'),
(1640012, 0, 0, 15, 28370, 34, 0, 0, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Toxic Tunnel - Toxic Gas, if it is gone'),
(1640013, 0, 0, 15, 28370, 34, 0, 0, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Toxic Tunnel - Toxic Gas, if it is gone'),
(1640014, 0, 0, 39, 5330015, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0, 0, 0, 0, 0, 0, 0, 'Toxic Tunnel - what comes later'),
(1616811, 0, 0, 15, 18950, 2, 0, 0, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Stoneskin Gargoyle - Detect Invisibility'),
(1616811, 0, 1, 15, 29153, 2, 0, 0, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Stoneskin Gargoyle - Stoneform'),
(1616812, 0, 0, 15, 29153, 2, 0, 0, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Stoneskin Gargoyle - Stoneform'),
(1616813, 0, 0, 14, 29153, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Stoneskin Gargoyle - Stoneform off'),
(1616814, 0, 0, 15, 28995, 32, 0, 0, 0, 0, 0, 12, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Stoneskin Gargoyle - Stoneskin'),
(1616814, 0, 1, 0, 2, 0, 0, 0, 0, 0, 0, 0, 10755, 0, 0, 0, 0, 0, 0, 0, 0, 'Stoneskin Gargoyle - "emits a strange noise"'),
(1616815, 0, 0, 15, 29325, 0, 0, 0, 0, 0, 0, 12, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Stoneskin Gargoyle - Acid Volley'),
(1644613, 0, 0, 14, 29153, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Plagued Gargoyle - Stoneform off'),
(1644614, 0, 0, 15, 28995, 32, 0, 0, 0, 0, 0, 12, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Plagued Gargoyle - Stoneskin'),
(1644614, 0, 1, 0, 2, 0, 0, 0, 0, 0, 0, 0, 10755, 0, 0, 0, 0, 0, 0, 0, 0, 'Plagued Gargoyle - "emits a strange noise"'),
(1644615, 0, 0, 15, 29325, 0, 0, 0, 0, 0, 0, 12, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Plagued Gargoyle - Acid Volley'),
(1605711, 0, 0, 18, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Rotting Maggot - gone'),
(1605712, 0, 0, 18, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Rotting Maggot - gone'),
(1605611, 0, 0, 18, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Diseased Maggot - gone'),
(1605612, 0, 0, 18, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Diseased Maggot - gone'),
(1605613, 0, 0, 15, 30079, 34, 0, 0, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Diseased Maggot - Retching Plague'),
(1615611, 0, 0, 47, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Dark Touched Warrior - flees for help'),
(1593111, 0, 0, 37, 10, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Grobbulus - in progress (10 = 1)'),
(1593112, 0, 0, 37, 10, 3, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Grobbulus - done (10 = 3)'),
(1593113, 0, 0, 37, 10, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Grobbulus - failed (10 = 2)'),
(1593114, 0, 0, 15, 28169, 32, 0, 0, 2, 0, 4, 8, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Grobbulus - Mutating Injection'),
(1593115, 0, 0, 15, 28169, 32, 0, 0, 2, 0, 4, 8, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Grobbulus - Mutating Injection'),
(1593116, 0, 0, 15, 28240, 0, 0, 0, 0, 0, 0, 12, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Grobbulus - Poison Cloud'),
(1593117, 0, 0, 15, 28157, 0, 0, 0, 0, 0, 1, 8, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Grobbulus - Slime Spray'),
(1593118, 0, 0, 10, 16290, 10000, 0, 0, 0, 0, 0, 0, 65536, 5330016, -1, 4, 0, 0, 0, 0, 0, 'Grobbulus - a Fallout Slime at the hit player'),
(1593119, 0, 0, 44, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Grobbulus - phase 1'),
(1593120, 0, 0, 15, 28137, 0, 0, 0, 0, 0, 0, 12, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Grobbulus - Slime Stream'),
(1593121, 0, 0, 15, 26662, 0, 0, 0, 0, 0, 0, 12, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Grobbulus - Berserk'),
(1593122, 0, 0, 33, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Grobbulus - out of the fight'),
(1595311, 0, 0, 68, 5330017, 2, 16505, 100, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Faerlina - her followers gone'),
(1595311, 0, 1, 68, 5330017, 2, 16506, 100, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Faerlina - her worshippers gone'),
(1595311, 0, 2, 10, 16505, 20000, 0, 0, 0, 0, 0, 0, 0, 0, -1, 6, 3359.75, -3621.77, 261.18, 4.54, 0, 'Faerlina - a Naxxramas Follower'),
(1595311, 0, 3, 10, 16505, 20000, 0, 0, 0, 0, 0, 0, 0, 0, -1, 6, 3346.29, -3619.32, 261.18, 4.61, 0, 'Faerlina - a Naxxramas Follower'),
(1595311, 0, 4, 10, 16506, 20000, 0, 0, 0, 0, 0, 0, 0, 0, -1, 6, 3350.61, -3619.74, 261.18, 4.65, 0, 'Faerlina - a Naxxramas Worshipper'),
(1595311, 0, 5, 10, 16506, 20000, 0, 0, 0, 0, 0, 0, 0, 0, -1, 6, 3341.36, -3619.35, 261.18, 4.68, 0, 'Faerlina - a Naxxramas Worshipper'),
(1595311, 0, 6, 10, 16506, 20000, 0, 0, 0, 0, 0, 0, 0, 0, -1, 6, 3356.69, -3621.17, 261.18, 4.38, 0, 'Faerlina - a Naxxramas Worshipper'),
(1595311, 0, 7, 10, 16506, 20000, 0, 0, 0, 0, 0, 0, 0, 0, -1, 6, 3364.08, -3622.85, 261.18, 4.35, 0, 'Faerlina - a Naxxramas Worshipper'),
(1595312, 0, 0, 37, 1, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Faerlina - failed (1 = 2)'),
(1595313, 0, 0, 68, 5330017, 2, 16505, 100, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Faerlina - her followers gone'),
(1595313, 0, 1, 68, 5330017, 2, 16506, 100, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Faerlina - her worshippers gone'),
(1595313, 0, 2, 10, 16505, 20000, 0, 0, 0, 0, 0, 0, 0, 0, -1, 6, 3359.75, -3621.77, 261.18, 4.54, 0, 'Faerlina - a Naxxramas Follower'),
(1595313, 0, 3, 10, 16505, 20000, 0, 0, 0, 0, 0, 0, 0, 0, -1, 6, 3346.29, -3619.32, 261.18, 4.61, 0, 'Faerlina - a Naxxramas Follower'),
(1595313, 0, 4, 10, 16506, 20000, 0, 0, 0, 0, 0, 0, 0, 0, -1, 6, 3350.61, -3619.74, 261.18, 4.65, 0, 'Faerlina - a Naxxramas Worshipper'),
(1595313, 0, 5, 10, 16506, 20000, 0, 0, 0, 0, 0, 0, 0, 0, -1, 6, 3341.36, -3619.35, 261.18, 4.68, 0, 'Faerlina - a Naxxramas Worshipper'),
(1595313, 0, 6, 10, 16506, 20000, 0, 0, 0, 0, 0, 0, 0, 0, -1, 6, 3356.69, -3621.17, 261.18, 4.38, 0, 'Faerlina - a Naxxramas Worshipper'),
(1595313, 0, 7, 10, 16506, 20000, 0, 0, 0, 0, 0, 0, 0, 0, -1, 6, 3364.08, -3622.85, 261.18, 4.35, 0, 'Faerlina - a Naxxramas Worshipper'),
(1595314, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 533101, 0, 0, 0, 0, 0, 0, 0, 0, 'Faerlina - "Slay them in the master''s name!"'),
(1595314, 0, 1, 37, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Faerlina - in progress (1 = 1)'),
(1595314, 0, 2, 68, 5330018, 2, 16505, 100, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Faerlina - her followers at her puller'),
(1595314, 0, 3, 68, 5330018, 2, 16506, 100, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Faerlina - her worshippers at her puller'),
(1595315, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 533102, 533103, 0, 0, 0, 0, 0, 0, 0, 'Faerlina - a kill'),
(1595316, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 533104, 0, 0, 0, 0, 0, 0, 0, 0, 'Faerlina - "The master... will avenge me!"'),
(1595316, 0, 1, 37, 1, 3, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Faerlina - done (1 = 3)'),
(1595317, 0, 0, 15, 28796, 0, 0, 0, 0, 0, 1, 8, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Faerlina - Poison Bolt Volley'),
(1595318, 0, 0, 15, 28794, 0, 0, 0, 0, 0, 4, 8, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Faerlina - Rain of Fire'),
(1595319, 0, 0, 15, 28798, 0, 0, 0, 0, 0, 0, 12, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Faerlina - Enrage'),
(1595319, 0, 1, 0, 1, 0, 0, 0, 0, 0, 0, 0, 533105, 533106, 533107, 0, 0, 0, 0, 0, 0, 'Faerlina - her enrage'),
(1595320, 0, 0, 14, 28798, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Faerlina - Enrage off'),
(1595321, 0, 0, 68, 5330019, 2, 16505, 150, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Faerlina - her followers out of the fight'),
(1595321, 0, 1, 68, 5330019, 2, 16506, 150, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Faerlina - her worshippers out of the fight'),
(1595321, 0, 2, 33, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Faerlina - out of the fight');

DELETE FROM `generic_scripts` WHERE `id` IN (5330001, 5330002, 5330003, 5330004, 5330005, 5330006, 5330007, 5330008, 5330009, 5330010, 5330011, 5330012, 5330013, 5330014, 5330015, 5330016, 5330017, 5330018, 5330019);
INSERT INTO `generic_scripts`
(`id`, `delay`, `priority`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`)
VALUES
(5330001, 0, 0, 26, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Anub''Rekhan - at the one who pulled his guard'),
(5330002, 0, 0, 0, 0, 0, 0, 0, 88346, 0, 9, 2, 13004, 13006, 0, 0, 0, 0, 0, 0, 1000, 'Anub''Rekhan - a line as the door opens'),
(5330003, 0, 0, 0, 0, 0, 0, 0, 88346, 0, 9, 2, 13007, 13008, 13009, 0, 0, 0, 0, 0, 1000, 'Anub''Rekhan - a line as the door opens'),
(5330004, 0, 0, 28, 8, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 209009, 'Faerlina RP - a worshipper kneels'),
(5330005, 0, 0, 15, 21157, 2, 0, 0, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, 209009, 'Faerlina RP - a worshipper channels Dark Channeling'),
(5330006, 0, 0, 28, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 209009, 'Faerlina RP - a worshipper stands'),
(5330007, 0, 0, 14, 21157, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 209009, 'Faerlina RP - a worshipper stops channelling'),
(5330008, 3, 0, 15, 27812, 2, 0, 0, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Shadow Fissure - Void Blast'),
(5330008, 3, 1, 18, 2250, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Shadow Fissure - gone 2.25 s on'),
(5330009, 0, 0, 14, 28988, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Plague Slime - the blue aura off'),
(5330009, 0, 1, 14, 28989, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Plague Slime - the green aura off'),
(5330009, 0, 2, 14, 28990, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Plague Slime - the red aura off'),
(5330009, 0, 3, 27, 16243, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Plague Slime - black'),
(5330009, 0, 4, 15, 28987, 2, 0, 0, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Plague Slime - the black aura'),
(5330009, 0, 5, 2, 4, 1073741824, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Plague Slime - scale 2'),
(5330010, 0, 0, 14, 28987, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Plague Slime - the black aura off'),
(5330010, 0, 1, 14, 28989, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Plague Slime - the green aura off'),
(5330010, 0, 2, 14, 28990, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Plague Slime - the red aura off'),
(5330010, 0, 3, 27, 16783, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Plague Slime - blue'),
(5330010, 0, 4, 15, 28988, 2, 0, 0, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Plague Slime - the blue aura'),
(5330010, 0, 5, 2, 4, 1073741824, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Plague Slime - scale 2'),
(5330011, 0, 0, 14, 28987, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Plague Slime - the black aura off'),
(5330011, 0, 1, 14, 28988, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Plague Slime - the blue aura off'),
(5330011, 0, 2, 14, 28990, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Plague Slime - the red aura off'),
(5330011, 0, 3, 27, 16785, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Plague Slime - green'),
(5330011, 0, 4, 15, 28989, 2, 0, 0, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Plague Slime - the green aura'),
(5330011, 0, 5, 2, 4, 1073741824, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Plague Slime - scale 2'),
(5330012, 0, 0, 14, 28987, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Plague Slime - the black aura off'),
(5330012, 0, 1, 14, 28988, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Plague Slime - the blue aura off'),
(5330012, 0, 2, 14, 28989, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Plague Slime - the green aura off'),
(5330012, 0, 3, 27, 16784, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Plague Slime - red'),
(5330012, 0, 4, 15, 28990, 2, 0, 0, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Plague Slime - the red aura'),
(5330012, 0, 5, 2, 4, 1073741824, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Plague Slime - scale 2'),
(5330013, 0, 0, 39, 5330009, 5330010, 0, 0, 0, 0, 0, 0, 50, 50, 0, 0, 0, 0, 0, 0, 0, 'Plague Slime - one of two colours (1 of 2)'),
(5330014, 0, 0, 39, 5330011, 5330012, 0, 0, 0, 0, 0, 0, 50, 50, 0, 0, 0, 0, 0, 0, 0, 'Plague Slime - one of two colours (2 of 2)'),
(5330015, 5, 0, 33, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Toxic Tunnel - out of the fight'),
(5330016, 0, 0, 49, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Fallout Slime - the zone into the fight'),
(5330017, 0, 0, 18, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Faerlina - a follower or worshipper gone'),
(5330018, 0, 0, 26, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Faerlina - a follower or worshipper at her puller'),
(5330019, 0, 0, 33, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Faerlina - a follower or worshipper out of the fight');

DELETE FROM `gameobject_scripts` WHERE `id` IN (533008);
INSERT INTO `gameobject_scripts`
(`id`, `delay`, `priority`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`)
VALUES
(533008, 0, 0, 39, 5330002, 5330003, 0, 0, 0, 0, 0, 0, 40, 60, 0, 0, 0, 0, 0, 0, 230000, 'Anub''Rekhan''s door - used: one of his five lines'),
(533008, 0, 1, 4, 9, 16, 1, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0, 0, 230000, 'Anub''Rekhan''s door - not usable again');

DELETE FROM `gossip_scripts` WHERE `id` IN (1636500, 1636506, 1636510, 1636511, 1636512, 1636513, 1636514, 1636515, 1636516, 1636517, 1636518, 1636519, 1636520, 1636521, 1636522);
INSERT INTO `gossip_scripts`
(`id`, `delay`, `priority`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`)
VALUES
(1636500, 0, 0, 1, 11, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Omarion - he laughs'),
(1636510, 0, 0, 15, 28212, 0, 0, 0, 0, 0, 0, 5, 0, 0, 0, 0, 0, 0, 0, 0, 10533035, 'Omarion - the player learns Glacial Gloves'),
(1636511, 0, 0, 15, 28215, 0, 0, 0, 0, 0, 0, 5, 0, 0, 0, 0, 0, 0, 0, 0, 10533037, 'Omarion - the player learns Glacial Wrists'),
(1636512, 0, 0, 15, 28213, 0, 0, 0, 0, 0, 0, 5, 0, 0, 0, 0, 0, 0, 0, 0, 10533039, 'Omarion - the player learns Glacial Vest'),
(1636513, 0, 0, 15, 28214, 0, 0, 0, 0, 0, 0, 5, 0, 0, 0, 0, 0, 0, 0, 0, 10533041, 'Omarion - the player learns Glacial Cloak'),
(1636514, 0, 0, 15, 28248, 0, 0, 0, 0, 0, 0, 5, 0, 0, 0, 0, 0, 0, 0, 0, 10533047, 'Omarion - the player learns Icebane Gauntlets'),
(1636515, 0, 0, 15, 28249, 0, 0, 0, 0, 0, 0, 5, 0, 0, 0, 0, 0, 0, 0, 0, 10533049, 'Omarion - the player learns Icebane Bracers'),
(1636516, 0, 0, 15, 28245, 0, 0, 0, 0, 0, 0, 5, 0, 0, 0, 0, 0, 0, 0, 0, 10533051, 'Omarion - the player learns Icebane Breastplate'),
(1636517, 0, 0, 15, 28229, 0, 0, 0, 0, 0, 0, 5, 0, 0, 0, 0, 0, 0, 0, 0, 10533057, 'Omarion - the player learns Polar Gloves'),
(1636518, 0, 0, 15, 28232, 0, 0, 0, 0, 0, 0, 5, 0, 0, 0, 0, 0, 0, 0, 0, 10533059, 'Omarion - the player learns Icy Scale Gauntlets'),
(1636519, 0, 0, 15, 28230, 0, 0, 0, 0, 0, 0, 5, 0, 0, 0, 0, 0, 0, 0, 0, 10533061, 'Omarion - the player learns Polar Bracers'),
(1636520, 0, 0, 15, 28233, 0, 0, 0, 0, 0, 0, 5, 0, 0, 0, 0, 0, 0, 0, 0, 10533063, 'Omarion - the player learns Icy Scale Bracers'),
(1636521, 0, 0, 15, 28228, 0, 0, 0, 0, 0, 0, 5, 0, 0, 0, 0, 0, 0, 0, 0, 10533065, 'Omarion - the player learns Polar Tunic'),
(1636522, 0, 0, 15, 28231, 0, 0, 0, 0, 0, 0, 5, 0, 0, 0, 0, 0, 0, 0, 0, 10533067, 'Omarion - the player learns Icy Scale Breastplate'),
(1636506, 0, 0, 17, 22719, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 533069, 'Omarion - his handbook, if the player has none');

DELETE FROM `gossip_menu` WHERE `entry` = 1636500 AND `text_id` = 8507;
INSERT INTO `gossip_menu`
(`entry`, `text_id`, `script_id`, `condition_id`)
VALUES
(1636500, 8507, 1636500, 0);

DELETE FROM `gossip_menu` WHERE `entry` = 1636501 AND `text_id` = 68;
INSERT INTO `gossip_menu`
(`entry`, `text_id`, `script_id`, `condition_id`)
VALUES
(1636501, 68, 0, 0);

DELETE FROM `gossip_menu` WHERE `entry` = 1636502 AND `text_id` = 68;
INSERT INTO `gossip_menu`
(`entry`, `text_id`, `script_id`, `condition_id`)
VALUES
(1636502, 68, 0, 0);

DELETE FROM `gossip_menu` WHERE `entry` = 1636503 AND `text_id` = 68;
INSERT INTO `gossip_menu`
(`entry`, `text_id`, `script_id`, `condition_id`)
VALUES
(1636503, 68, 0, 0);

DELETE FROM `gossip_menu` WHERE `entry` = 1636504 AND `text_id` = 8516;
INSERT INTO `gossip_menu`
(`entry`, `text_id`, `script_id`, `condition_id`)
VALUES
(1636504, 8516, 0, 0);

DELETE FROM `gossip_menu` WHERE `entry` = 1636505 AND `text_id` = 68;
INSERT INTO `gossip_menu`
(`entry`, `text_id`, `script_id`, `condition_id`)
VALUES
(1636505, 68, 0, 0);

DELETE FROM `gossip_menu_option` WHERE `menu_id` = 1636500 AND `id` = 0;
INSERT INTO `gossip_menu_option`
(`menu_id`, `id`, `option_icon`, `option_text`, `option_broadcast_text`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `box_broadcast_text`, `condition_id`)
VALUES
(1636500, 0, 0, 'I am a master tailor, Omarion.', 12251, 1, 1, 1636501, 0, 0, 0, 0, NULL, 0, 533032);

DELETE FROM `gossip_menu_option` WHERE `menu_id` = 1636500 AND `id` = 1;
INSERT INTO `gossip_menu_option`
(`menu_id`, `id`, `option_icon`, `option_text`, `option_broadcast_text`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `box_broadcast_text`, `condition_id`)
VALUES
(1636500, 1, 0, 'I am a master tailor, Omarion.', 12251, 1, 1, -1, 0, 0, 0, 0, NULL, 0, 533033);

DELETE FROM `gossip_menu_option` WHERE `menu_id` = 1636501 AND `id` = 0;
INSERT INTO `gossip_menu_option`
(`menu_id`, `id`, `option_icon`, `option_text`, `option_broadcast_text`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `box_broadcast_text`, `condition_id`)
VALUES
(1636501, 0, 0, 'Glacial Gloves', 0, 1, 1, 1636505, 0, 1636510, 0, 0, NULL, 0, 0);

DELETE FROM `gossip_menu_option` WHERE `menu_id` = 1636501 AND `id` = 1;
INSERT INTO `gossip_menu_option`
(`menu_id`, `id`, `option_icon`, `option_text`, `option_broadcast_text`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `box_broadcast_text`, `condition_id`)
VALUES
(1636501, 1, 0, 'Glacial Wrists', 0, 1, 1, 1636505, 0, 1636511, 0, 0, NULL, 0, 0);

DELETE FROM `gossip_menu_option` WHERE `menu_id` = 1636501 AND `id` = 2;
INSERT INTO `gossip_menu_option`
(`menu_id`, `id`, `option_icon`, `option_text`, `option_broadcast_text`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `box_broadcast_text`, `condition_id`)
VALUES
(1636501, 2, 0, 'Glacial Vest', 0, 1, 1, 1636505, 0, 1636512, 0, 0, NULL, 0, 549);

DELETE FROM `gossip_menu_option` WHERE `menu_id` = 1636501 AND `id` = 3;
INSERT INTO `gossip_menu_option`
(`menu_id`, `id`, `option_icon`, `option_text`, `option_broadcast_text`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `box_broadcast_text`, `condition_id`)
VALUES
(1636501, 3, 0, 'Glacial Cloak', 0, 1, 1, 1636505, 0, 1636513, 0, 0, NULL, 0, 549);

DELETE FROM `gossip_menu_option` WHERE `menu_id` = 1636501 AND `id` = 4;
INSERT INTO `gossip_menu_option`
(`menu_id`, `id`, `option_icon`, `option_text`, `option_broadcast_text`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `box_broadcast_text`, `condition_id`)
VALUES
(1636501, 4, 0, 'I need to go. Evil stirs. Die well, Omarion.', 12270, 1, 1, -1, 0, 0, 0, 0, NULL, 0, 0);

DELETE FROM `gossip_menu_option` WHERE `menu_id` = 1636500 AND `id` = 2;
INSERT INTO `gossip_menu_option`
(`menu_id`, `id`, `option_icon`, `option_text`, `option_broadcast_text`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `box_broadcast_text`, `condition_id`)
VALUES
(1636500, 2, 0, 'I am a master blacksmith, Omarion.', 12269, 1, 1, 1636502, 0, 0, 0, 0, NULL, 0, 533044);

DELETE FROM `gossip_menu_option` WHERE `menu_id` = 1636500 AND `id` = 3;
INSERT INTO `gossip_menu_option`
(`menu_id`, `id`, `option_icon`, `option_text`, `option_broadcast_text`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `box_broadcast_text`, `condition_id`)
VALUES
(1636500, 3, 0, 'I am a master blacksmith, Omarion.', 12269, 1, 1, -1, 0, 0, 0, 0, NULL, 0, 533045);

DELETE FROM `gossip_menu_option` WHERE `menu_id` = 1636502 AND `id` = 0;
INSERT INTO `gossip_menu_option`
(`menu_id`, `id`, `option_icon`, `option_text`, `option_broadcast_text`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `box_broadcast_text`, `condition_id`)
VALUES
(1636502, 0, 0, 'Icebane Gauntlets', 0, 1, 1, 1636505, 0, 1636514, 0, 0, NULL, 0, 0);

DELETE FROM `gossip_menu_option` WHERE `menu_id` = 1636502 AND `id` = 1;
INSERT INTO `gossip_menu_option`
(`menu_id`, `id`, `option_icon`, `option_text`, `option_broadcast_text`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `box_broadcast_text`, `condition_id`)
VALUES
(1636502, 1, 0, 'Icebane Bracers', 0, 1, 1, 1636505, 0, 1636515, 0, 0, NULL, 0, 0);

DELETE FROM `gossip_menu_option` WHERE `menu_id` = 1636502 AND `id` = 2;
INSERT INTO `gossip_menu_option`
(`menu_id`, `id`, `option_icon`, `option_text`, `option_broadcast_text`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `box_broadcast_text`, `condition_id`)
VALUES
(1636502, 2, 0, 'Icebane Breastplate', 0, 1, 1, 1636505, 0, 1636516, 0, 0, NULL, 0, 549);

DELETE FROM `gossip_menu_option` WHERE `menu_id` = 1636502 AND `id` = 3;
INSERT INTO `gossip_menu_option`
(`menu_id`, `id`, `option_icon`, `option_text`, `option_broadcast_text`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `box_broadcast_text`, `condition_id`)
VALUES
(1636502, 3, 0, 'I need to go. Evil stirs. Die well, Omarion.', 12270, 1, 1, -1, 0, 0, 0, 0, NULL, 0, 0);

DELETE FROM `gossip_menu_option` WHERE `menu_id` = 1636500 AND `id` = 4;
INSERT INTO `gossip_menu_option`
(`menu_id`, `id`, `option_icon`, `option_text`, `option_broadcast_text`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `box_broadcast_text`, `condition_id`)
VALUES
(1636500, 4, 0, 'I am a master leatherworker, Omarion.', 12257, 1, 1, 1636503, 0, 0, 0, 0, NULL, 0, 533054);

DELETE FROM `gossip_menu_option` WHERE `menu_id` = 1636500 AND `id` = 5;
INSERT INTO `gossip_menu_option`
(`menu_id`, `id`, `option_icon`, `option_text`, `option_broadcast_text`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `box_broadcast_text`, `condition_id`)
VALUES
(1636500, 5, 0, 'I am a master leatherworker, Omarion.', 12257, 1, 1, -1, 0, 0, 0, 0, NULL, 0, 533055);

DELETE FROM `gossip_menu_option` WHERE `menu_id` = 1636503 AND `id` = 0;
INSERT INTO `gossip_menu_option`
(`menu_id`, `id`, `option_icon`, `option_text`, `option_broadcast_text`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `box_broadcast_text`, `condition_id`)
VALUES
(1636503, 0, 0, 'Polar Gloves', 0, 1, 1, 1636505, 0, 1636517, 0, 0, NULL, 0, 0);

DELETE FROM `gossip_menu_option` WHERE `menu_id` = 1636503 AND `id` = 1;
INSERT INTO `gossip_menu_option`
(`menu_id`, `id`, `option_icon`, `option_text`, `option_broadcast_text`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `box_broadcast_text`, `condition_id`)
VALUES
(1636503, 1, 0, 'Icy Scale Gauntlets', 0, 1, 1, 1636505, 0, 1636518, 0, 0, NULL, 0, 0);

DELETE FROM `gossip_menu_option` WHERE `menu_id` = 1636503 AND `id` = 2;
INSERT INTO `gossip_menu_option`
(`menu_id`, `id`, `option_icon`, `option_text`, `option_broadcast_text`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `box_broadcast_text`, `condition_id`)
VALUES
(1636503, 2, 0, 'Polar Bracers', 0, 1, 1, 1636505, 0, 1636519, 0, 0, NULL, 0, 0);

DELETE FROM `gossip_menu_option` WHERE `menu_id` = 1636503 AND `id` = 3;
INSERT INTO `gossip_menu_option`
(`menu_id`, `id`, `option_icon`, `option_text`, `option_broadcast_text`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `box_broadcast_text`, `condition_id`)
VALUES
(1636503, 3, 0, 'Icy Scale Bracers', 0, 1, 1, 1636505, 0, 1636520, 0, 0, NULL, 0, 0);

DELETE FROM `gossip_menu_option` WHERE `menu_id` = 1636503 AND `id` = 4;
INSERT INTO `gossip_menu_option`
(`menu_id`, `id`, `option_icon`, `option_text`, `option_broadcast_text`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `box_broadcast_text`, `condition_id`)
VALUES
(1636503, 4, 0, 'Polar Tunic', 0, 1, 1, 1636505, 0, 1636521, 0, 0, NULL, 0, 549);

DELETE FROM `gossip_menu_option` WHERE `menu_id` = 1636503 AND `id` = 5;
INSERT INTO `gossip_menu_option`
(`menu_id`, `id`, `option_icon`, `option_text`, `option_broadcast_text`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `box_broadcast_text`, `condition_id`)
VALUES
(1636503, 5, 0, 'Icy Scale Breastplate', 0, 1, 1, 1636505, 0, 1636522, 0, 0, NULL, 0, 549);

DELETE FROM `gossip_menu_option` WHERE `menu_id` = 1636503 AND `id` = 6;
INSERT INTO `gossip_menu_option`
(`menu_id`, `id`, `option_icon`, `option_text`, `option_broadcast_text`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `box_broadcast_text`, `condition_id`)
VALUES
(1636503, 6, 0, 'I need to go. Evil stirs. Die well, Omarion.', 12270, 1, 1, -1, 0, 0, 0, 0, NULL, 0, 0);

DELETE FROM `gossip_menu_option` WHERE `menu_id` = 1636500 AND `id` = 6;
INSERT INTO `gossip_menu_option`
(`menu_id`, `id`, `option_icon`, `option_text`, `option_broadcast_text`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `box_broadcast_text`, `condition_id`)
VALUES
(1636500, 6, 0, 'Omarion, I am not a craftsman. Can you still help me?', 12279, 1, 1, 1636504, 0, 1636506, 0, 0, NULL, 0, 548);

DELETE FROM `gossip_menu_option` WHERE `menu_id` = 1636500 AND `id` = 7;
INSERT INTO `gossip_menu_option`
(`menu_id`, `id`, `option_icon`, `option_text`, `option_broadcast_text`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `box_broadcast_text`, `condition_id`)
VALUES
(1636500, 7, 0, 'Omarion, I am not a craftsman. Can you still help me?', 12279, 1, 1, -1, 0, 0, 0, 0, NULL, 0, 533022);

DELETE FROM `gossip_menu_option` WHERE `menu_id` = 1636504 AND `id` = 0;
INSERT INTO `gossip_menu_option`
(`menu_id`, `id`, `option_icon`, `option_text`, `option_broadcast_text`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `box_broadcast_text`, `condition_id`)
VALUES
(1636504, 0, 0, 'I need to go. Evil stirs. Die well, Omarion.', 12270, 1, 1, -1, 0, 0, 0, 0, NULL, 0, 0);

DELETE FROM `gossip_menu_option` WHERE `menu_id` = 1636505 AND `id` = 0;
INSERT INTO `gossip_menu_option`
(`menu_id`, `id`, `option_icon`, `option_text`, `option_broadcast_text`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `box_broadcast_text`, `condition_id`)
VALUES
(1636505, 0, 0, 'I need to go. Evil stirs. Die well, Omarion.', 12270, 1, 1, -1, 0, 0, 0, 0, NULL, 0, 0);

