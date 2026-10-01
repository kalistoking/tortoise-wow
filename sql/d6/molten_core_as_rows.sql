-- Molten Core (map 409), its bosses but four, Garr and Golemagg's adds, the trash: its C++ as rows -- EPIC10 tier 2.
-- Written by the trt repo's scripts/tier2/a27_molten_core.py from t1_world; molten_core_restore.sql puts
-- back what this replaces. R8: a person applies it, into the world database.
--
-- The C++ keeps its script names: mod-molten-core is the switch (AM1, handoff/manager-091).
-- Loaded, the C++ runs as before -- a script found by name comes first. Unloaded
-- (`module unload mod-molten-core`, which gives every creature standing a new AI at once),
-- the names find no script and the creatures run these rows (their ai_name).
--
-- Second pass: Incindis and his eggs (Quaking Stomp's one target now its spell_template column), the runes.
-- Fire Nova follows the stomp by 1 s, once (the C++ retried it until it took). A rune cannot be doused before
-- its boss is dead (gameobject_requirement: the douse fails and the Aqual Quintessence is kept -- the C++ took
-- it and did nothing); its circle is despawned for a week (the C++ deleted it for the instance's life).
-- Map 409 keeps instance_molten_core (it douses the runes again as it loads), Majordomo, Ragnaros, Baron Geddon,
-- Sorcerer-Thane and the twin golems (the core). Lucifron's Shadow Shock keeps its timer after a failed cast (the C++ lost it
-- for the fight). A firesworn made to explode is picked whatever it is doing (the C++ skipped a banished one);
-- a core rager is healed every second while under half health; a core hound rises if any other hound lives
-- within 100 yd (the C++: one in combat), and lies dead at 1 hp (the C++: at a lethal blow); the ancient core
-- hound bites every 2 s in melee for its blows (the C++: at its own swing timer). The Firewalker's, Firelord's
-- and Lava Surger's own EventAI rules, dead under the C++ and different from it, are taken away.

UPDATE `creature_template` SET `ai_name` = 'EventAI' WHERE `entry` = 11668;
UPDATE `creature_template` SET `ai_name` = 'EventAI' WHERE `entry` = 11671;
UPDATE `creature_template` SET `ai_name` = 'EventAI' WHERE `entry` = 11672;
UPDATE `creature_template` SET `ai_name` = 'EventAI' WHERE `entry` = 11673;
UPDATE `creature_template` SET `ai_name` = 'EventAI' WHERE `entry` = 11982;
UPDATE `creature_template` SET `ai_name` = 'EventAI' WHERE `entry` = 11988;
UPDATE `creature_template` SET `ai_name` = 'EventAI' WHERE `entry` = 12057;
UPDATE `creature_template` SET `ai_name` = 'EventAI' WHERE `entry` = 12098;
UPDATE `creature_template` SET `ai_name` = 'EventAI' WHERE `entry` = 12099;
UPDATE `creature_template` SET `ai_name` = 'EventAI' WHERE `entry` = 12101;
UPDATE `creature_template` SET `ai_name` = 'EventAI' WHERE `entry` = 12118;
UPDATE `creature_template` SET `ai_name` = 'EventAI' WHERE `entry` = 12259;
UPDATE `creature_template` SET `ai_name` = 'EventAI' WHERE `entry` = 12264;
UPDATE `creature_template` SET `ai_name` = 'EventAI' WHERE `entry` = 52145;
UPDATE `creature_template` SET `ai_name` = 'EventAI' WHERE `entry` = 52146;
UPDATE `creature_template` SET `ai_name` = 'EventAI' WHERE `entry` = 52147;

DELETE FROM `conditions` WHERE `condition_entry` IN (409001, 409010, 409011, 409316, 409317, 409318, 409319, 409320, 409321, 409322, 409330, 409331, 409332, 409333);
INSERT INTO `conditions`
(`condition_entry`, `type`, `value1`, `value2`, `value3`, `value4`, `flags`)
VALUES
(409001, 38, 45, 1, 0, 0, 0),
(409010, 20, 11671, 100, 0, 1, 2),
(409011, 20, 11671, 100, 0, 1, 3),
(409316, 34, 16, 3, 0, 0, 0),
(409317, 34, 17, 3, 0, 0, 0),
(409318, 34, 18, 3, 0, 0, 0),
(409319, 34, 19, 3, 0, 0, 0),
(409320, 34, 20, 3, 0, 0, 0),
(409321, 34, 21, 3, 0, 0, 0),
(409322, 34, 22, 3, 0, 0, 0),
(409330, -1, 409316, 409317, 409318, 409319, 0),
(409332, 34, 23, 3, 0, 0, 1),
(409331, -1, 409320, 409321, 409322, 409332, 0),
(409333, -1, 409330, 409331, 329004, 230000, 0);

-- Conditions another tier-2 migration writes too, under the same entry: whichever comes first.
INSERT IGNORE INTO `conditions`
(`condition_entry`, `type`, `value1`, `value2`, `value3`, `value4`, `flags`)
VALUES
(409020, 38, 5, 2, 0, 0, 0),
(230000, 62, 0, 0, 0, 0, 1),
(329004, 34, 9, 3, 0, 0, 1);

DELETE FROM `broadcast_text` WHERE `entry` IN (409101, 409102, 409103, 409301);
INSERT INTO `broadcast_text`
(`entry`, `male_text`, `female_text`, `chat_type`, `sound_id`, `language_id`, `emote_id1`, `emote_id2`, `emote_id3`, `emote_delay1`, `emote_delay2`, `emote_delay3`)
VALUES
(409101, '%s refuses to die while its master is in trouble.', '%s refuses to die while its master is in trouble.', 2, 0, 0, 0, 0, 0, 0, 0, 0),
(409102, 'Core Hound reignites from the heat of another Core Hound!', 'Core Hound reignites from the heat of another Core Hound!', 2, 0, 0, 0, 0, 0, 0, 0, 0),
(409103, 'Core Hound collapses and begins to smolder.', 'Core Hound collapses and begins to smolder.', 2, 0, 0, 0, 0, 0, 0, 0, 0),
(409301, 'The runes of warding have been destroyed! Hunt down the infidels, my brethren!', 'The runes of warding have been destroyed! Hunt down the infidels, my brethren!', 6, 8039, 0, 0, 0, 0, 0, 0, 0);

-- Existing rows taken away: the restore puts them back.
DELETE FROM `creature_ai_events` WHERE `id` = 1166602;
DELETE FROM `creature_ai_scripts` WHERE `id` = 1166602;
DELETE FROM `creature_ai_events` WHERE `id` = 1166603;
DELETE FROM `creature_ai_scripts` WHERE `id` = 1166603;
DELETE FROM `creature_ai_events` WHERE `id` = 1166801;
DELETE FROM `creature_ai_scripts` WHERE `id` = 1166801;
DELETE FROM `creature_ai_events` WHERE `id` = 1166802;
DELETE FROM `creature_ai_scripts` WHERE `id` = 1166802;
DELETE FROM `creature_ai_events` WHERE `id` = 1210101;
DELETE FROM `creature_ai_scripts` WHERE `id` = 1210101;
DELETE FROM `creature_ai_events` WHERE `id` IN (1166611, 1166612, 1166613, 1166811, 1166812, 1166813, 1167101, 1167102, 1167103, 1167104, 1167201, 1167202, 1167203, 1167204, 1167301, 1167302, 1167311, 1167312, 1167313, 1167314, 1167315, 1167316, 1167321, 1167322, 1167323, 1167324, 1198201, 1198202, 1198203, 1198204, 1198211, 1198212, 1198291, 1198292, 1198293, 1198801, 1198802, 1198803, 1198804, 1198811, 1198812, 1198891, 1198892, 1198893, 1205701, 1205702, 1205703, 1205791, 1205792, 1205793, 1209801, 1209802, 1209803, 1209804, 1209805, 1209891, 1209892, 1209893, 1209901, 1209902, 1209903, 1209904, 1209905, 1210111, 1211801, 1211802, 1211803, 1211891, 1211892, 1211893, 1225901, 1225902, 1225903, 1225904, 1225991, 1225992, 1225993, 1226401, 1226402, 1226403, 1226404, 1226405, 1226491, 1226492, 1226493, 5214511, 5214512, 5214513, 5214514, 5214611, 5214612, 5214613, 5214711, 5214712, 5214713);
INSERT INTO `creature_ai_events`
(`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`)
VALUES
(1211891, 12118, 0, 4, 0, 100, 0, 0, 0, 0, 0, 1211891, 0, 0, 'Lucifron - aggro: in progress (7)'),
(1211892, 12118, 0, 7, 0, 100, 0, 0, 0, 0, 0, 1211892, 0, 0, 'Lucifron - evading: not started (7)'),
(1211893, 12118, 0, 6, 0, 100, 0, 0, 0, 0, 0, 1211893, 0, 0, 'Lucifron - dead: done (7)'),
(1211801, 12118, 0, 0, 0, 100, 9, 10000, 10000, 20000, 20000, 1211801, 0, 0, 'Lucifron - Impending Doom'),
(1211802, 12118, 0, 0, 0, 100, 9, 20000, 20000, 15000, 15000, 1211802, 0, 0, 'Lucifron - Lucifron''s Curse'),
(1211803, 12118, 0, 0, 0, 100, 9, 6000, 6000, 6000, 6000, 1211803, 0, 0, 'Lucifron - Shadow Shock at a random attacker'),
(1198291, 11982, 0, 4, 0, 100, 0, 0, 0, 0, 0, 1198291, 0, 0, 'Magmadar - aggro: in progress (5)'),
(1198292, 11982, 0, 7, 0, 100, 0, 0, 0, 0, 0, 1198292, 0, 0, 'Magmadar - evading: not started (5)'),
(1198293, 11982, 0, 6, 0, 100, 0, 0, 0, 0, 0, 1198293, 0, 0, 'Magmadar - dead: done (5)'),
(1198211, 11982, 0, 11, 0, 100, 0, 0, 0, 0, 0, 1198211, 0, 0, 'Magmadar - Magma Spit kept up'),
(1198212, 11982, 0, 7, 0, 100, 0, 0, 0, 0, 0, 1198212, 0, 0, 'Magmadar - Magma Spit kept up'),
(1198201, 11982, 0, 0, 0, 100, 9, 15000, 15000, 15000, 20000, 1198201, 0, 0, 'Magmadar - Frenzy, with its emote'),
(1198202, 11982, 0, 0, 0, 100, 9, 10000, 10000, 30000, 35000, 1198202, 0, 0, 'Magmadar - Panic'),
(1198203, 11982, 0, 0, 0, 100, 9, 12000, 12000, 12000, 15000, 1198203, 0, 0, 'Magmadar - Lava Bomb at a random player'),
(1198204, 11982, 0, 0, 0, 100, 9, 18000, 18000, 12000, 15000, 1198204, 0, 0, 'Magmadar - Lava Bomb at a random player with mana'),
(1225991, 12259, 0, 4, 0, 100, 0, 0, 0, 0, 0, 1225991, 0, 0, 'Gehennas - aggro: in progress (6)'),
(1225992, 12259, 0, 7, 0, 100, 0, 0, 0, 0, 0, 1225992, 0, 0, 'Gehennas - evading: not started (6)'),
(1225993, 12259, 0, 6, 0, 100, 0, 0, 0, 0, 0, 1225993, 0, 0, 'Gehennas - dead: done (6)'),
(1225901, 12259, 0, 0, 0, 100, 9, 6000, 12000, 6000, 12000, 1225901, 0, 0, 'Gehennas - Rain of Fire at a random attacker'),
(1225902, 12259, 0, 0, 0, 100, 9, 5000, 10000, 25000, 30000, 1225902, 0, 0, 'Gehennas - Gehennas'' Curse'),
(1225903, 12259, 0, 0, 0, 100, 9, 3000, 6000, 3000, 6000, 1225903, 0, 0, 'Gehennas - Shadow Bolt at a random attacker'),
(1225904, 12259, 0, 0, 0, 100, 9, 3000, 6000, 3000, 6000, 1225904, 0, 0, 'Gehennas - Shadow Bolt'),
(1226491, 12264, 0, 4, 0, 100, 0, 0, 0, 0, 0, 1226491, 0, 0, 'Shazzrah - aggro: in progress (2)'),
(1226492, 12264, 0, 7, 0, 100, 0, 0, 0, 0, 0, 1226492, 0, 0, 'Shazzrah - evading: not started (2)'),
(1226493, 12264, 0, 6, 0, 100, 0, 0, 0, 0, 0, 1226493, 0, 0, 'Shazzrah - dead: done (2)'),
(1226401, 12264, 0, 0, 0, 100, 9, 2000, 2000, 3000, 5000, 1226401, 0, 0, 'Shazzrah - Arcane Explosion'),
(1226402, 12264, 0, 0, 0, 100, 9, 10000, 10000, 20000, 20000, 1226402, 0, 0, 'Shazzrah - Shazzrah''s Curse'),
(1226403, 12264, 0, 0, 0, 100, 9, 5000, 5000, 7000, 14000, 1226403, 0, 0, 'Shazzrah - Deaden Magic'),
(1226404, 12264, 0, 0, 0, 100, 9, 15000, 15000, 16000, 18000, 1226404, 0, 0, 'Shazzrah - Counterspell'),
(1226405, 12264, 0, 0, 0, 100, 9, 25000, 30000, 25000, 35000, 1226405, 0, 0, 'Shazzrah - Blink to a random player'),
(1209891, 12098, 0, 4, 0, 100, 0, 0, 0, 0, 0, 1209891, 0, 0, 'Sulfuron Harbinger - aggro: in progress (0)'),
(1209892, 12098, 0, 7, 0, 100, 0, 0, 0, 0, 0, 1209892, 0, 0, 'Sulfuron Harbinger - evading: not started (0)'),
(1209893, 12098, 0, 6, 0, 100, 0, 0, 0, 0, 0, 1209893, 0, 0, 'Sulfuron Harbinger - dead: done (0)'),
(1209801, 12098, 0, 0, 0, 100, 9, 15000, 15000, 15000, 20000, 1209801, 0, 0, 'Sulfuron Harbinger - Demoralizing Shout'),
(1209802, 12098, 0, 0, 0, 100, 9, 6000, 6000, 12000, 15000, 1209802, 0, 0, 'Sulfuron Harbinger - Hand of Ragnaros'),
(1209803, 12098, 0, 0, 0, 100, 9, 2000, 2000, 12000, 16000, 1209803, 0, 0, 'Sulfuron Harbinger - Flame Spear at a random attacker'),
(1209804, 12098, 0, 0, 0, 100, 9, 10000, 10000, 15000, 18000, 1209804, 0, 0, 'Sulfuron Harbinger - Dark Strike'),
(1209805, 12098, 0, 0, 0, 100, 9, 13000, 13000, 20000, 26000, 1209805, 0, 0, 'Sulfuron Harbinger - Inspire, a friend lacking it and himself'),
(1205791, 12057, 0, 4, 0, 100, 0, 0, 0, 0, 0, 1205791, 0, 0, 'Garr - aggro: in progress (4)'),
(1205792, 12057, 0, 7, 0, 100, 0, 0, 0, 0, 0, 1205792, 0, 0, 'Garr - evading: not started (4)'),
(1205793, 12057, 0, 6, 0, 100, 0, 0, 0, 0, 0, 1205793, 0, 0, 'Garr - dead: done (4)'),
(1205701, 12057, 0, 0, 0, 100, 9, 15000, 15000, 20000, 20000, 1205701, 0, 0, 'Garr - Antimagic Pulse'),
(1205702, 12057, 0, 0, 0, 100, 9, 10000, 10000, 15000, 15000, 1205702, 0, 0, 'Garr - Magma Shackles'),
(1205703, 12057, 0, 0, 0, 100, 1, 360000, 360000, 20000, 20000, 1205703, 0, 0, 'Garr - after six minutes, every 20 s: a firesworn made to explode'),
(1209901, 12099, 0, 4, 0, 100, 0, 0, 0, 0, 0, 1209901, 0, 0, 'Firesworn - aggro: Thrash, Immolate, the zone into the fight'),
(1209902, 12099, 0, 8, 0, 100, 0, 20482, -1, 0, 0, 1209902, 0, 0, 'Firesworn - made to explode: Massive Eruption (phase 1)'),
(1209903, 12099, 0, 6, 2, 100, 0, 0, 0, 0, 0, 1209903, 0, 0, 'Firesworn - dead: Garr enraged, its eruption'),
(1209904, 12099, 0, 6, 1, 100, 0, 0, 0, 0, 0, 1209904, 0, 0, 'Firesworn - dead after exploding: Garr enraged'),
(1209905, 12099, 0, 0, 0, 100, 9, 10000, 10000, 5000, 5000, 1209905, 0, 0, 'Firesworn - Separation Anxiety, 45 yd or more from Garr'),
(1198891, 11988, 0, 4, 0, 100, 0, 0, 0, 0, 0, 1198891, 0, 0, 'Golemagg the Incinerator - aggro: in progress (3)'),
(1198892, 11988, 0, 7, 0, 100, 0, 0, 0, 0, 0, 1198892, 0, 0, 'Golemagg the Incinerator - evading: not started (3)'),
(1198893, 11988, 0, 6, 0, 100, 0, 0, 0, 0, 0, 1198893, 0, 0, 'Golemagg the Incinerator - dead: done (3)'),
(1198801, 11988, 0, 0, 0, 100, 9, 7000, 7000, 3000, 6000, 1198801, 0, 0, 'Golemagg the Incinerator - Pyroblast at a random attacker'),
(1198802, 11988, 0, 0, 0, 100, 9, 10000, 10000, 2000, 2000, 1198802, 0, 0, 'Golemagg the Incinerator - Golemagg''s Trust'),
(1198803, 11988, 0, 2, 0, 100, 8, 9, 0, 0, 0, 1198803, 0, 0, 'Golemagg the Incinerator - Enrage under 10 %, Earthquake from then on (phase 1)'),
(1198804, 11988, 0, 0, 1, 100, 9, 3000, 3000, 3000, 3000, 1198804, 0, 0, 'Golemagg the Incinerator - Earthquake, enraged'),
(1198811, 11988, 0, 7, 0, 100, 0, 0, 0, 0, 0, 1198811, 0, 0, 'Golemagg the Incinerator - evading: his ragers back'),
(1198812, 11988, 0, 6, 0, 100, 0, 0, 0, 0, 0, 1198812, 0, 0, 'Golemagg the Incinerator - dead: his ragers with him'),
(1167201, 11672, 0, 11, 0, 100, 0, 0, 0, 0, 0, 1167201, 0, 0, 'Core Rager - cannot die while Golemagg lives'),
(1167202, 11672, 0, 2, 0, 100, 1, 49, 0, 1000, 1000, 1167202, 0, 0, 'Core Rager - under half health: refuses to die, whole again'),
(1167203, 11672, 0, 0, 0, 100, 9, 7000, 7000, 10000, 10000, 1167203, 0, 0, 'Core Rager - Mangle'),
(1167204, 11672, 0, 0, 0, 10, 1, 1000, 1000, 1000, 1000, 1167204, 0, 0, 'Core Rager - Thrash, one time in ten a second'),
(1166611, 11666, 0, 4, 0, 100, 0, 0, 0, 0, 0, 1166611, 0, 0, 'Firewalker - aggro: the zone into the fight'),
(1166612, 11666, 0, 0, 0, 100, 9, 6000, 6000, 12000, 12000, 1166612, 0, 0, 'Firewalker - Fire Blossom'),
(1166613, 11666, 0, 0, 0, 100, 9, 20000, 20000, 20000, 20000, 1166613, 0, 0, 'Firewalker - Incite Flames'),
(1166811, 11668, 0, 4, 0, 100, 0, 0, 0, 0, 0, 1166811, 0, 0, 'Firelord - aggro: Incinerate'),
(1166812, 11668, 0, 0, 0, 100, 9, 7500, 12500, 15000, 20000, 1166812, 0, 0, 'Firelord - Summon Lava Spawn'),
(1166813, 11668, 0, 0, 0, 100, 9, 4000, 6000, 3000, 4000, 1166813, 0, 0, 'Firelord - Soul Burn at a random player'),
(1210111, 12101, 0, 0, 0, 100, 9, 1000, 2000, 5000, 6000, 1210111, 0, 0, 'Lava Surger - Surge at a player out of melee'),
(1167101, 11671, 0, 11, 0, 100, 0, 0, 0, 0, 0, 1167101, 0, 0, 'Core Hound - cannot die at once'),
(1167102, 11671, 0, 4, 0, 100, 0, 0, 0, 0, 0, 1167102, 0, 0, 'Core Hound - aggro: the zone into the fight'),
(1167103, 11671, 0, 0, 0, 100, 9, 4000, 7000, 4000, 7000, 1167103, 0, 0, 'Core Hound - Serrated Bite'),
(1167104, 11671, 0, 2, 0, 100, 1, 1, 0, 11000, 11000, 1167104, 0, 0, 'Core Hound - at its last hp: smoulders 10 s'),
(1167301, 11673, 0, 11, 0, 100, 0, 0, 0, 0, 0, 1167301, 0, 0, 'Ancient Core Hound - its breath, one of six'),
(1167302, 11673, 0, 7, 0, 100, 0, 0, 0, 0, 0, 1167302, 0, 0, 'Ancient Core Hound - its breath, one of six'),
(1167311, 11673, 0, 0, 125, 100, 9, 12000, 15000, 14000, 24000, 1167311, 0, 0, 'Ancient Core Hound - its breath 19364'),
(1167312, 11673, 0, 0, 123, 100, 9, 12000, 15000, 14000, 24000, 1167312, 0, 0, 'Ancient Core Hound - its breath 19365'),
(1167313, 11673, 0, 0, 119, 100, 9, 12000, 15000, 14000, 24000, 1167313, 0, 0, 'Ancient Core Hound - its breath 19366'),
(1167314, 11673, 0, 0, 111, 100, 9, 12000, 15000, 14000, 24000, 1167314, 0, 0, 'Ancient Core Hound - its breath 19367'),
(1167315, 11673, 0, 0, 95, 100, 9, 12000, 15000, 14000, 24000, 1167315, 0, 0, 'Ancient Core Hound - its breath 19369'),
(1167316, 11673, 0, 0, 63, 100, 9, 12000, 15000, 14000, 24000, 1167316, 0, 0, 'Ancient Core Hound - its breath 19372'),
(1167321, 11673, 0, 0, 0, 100, 1, 4000, 7000, 6000, 8000, 1167321, 0, 0, 'Ancient Core Hound - Cone of Fire'),
(1167322, 11673, 0, 0, 0, 100, 9, 4000, 4000, 6000, 6000, 1167322, 0, 0, 'Ancient Core Hound - Bite'),
(1167323, 11673, 0, 4, 0, 100, 0, 0, 0, 0, 0, 1167323, 0, 0, 'Ancient Core Hound - aggro: bites for blows'),
(1167324, 11673, 409020, 0, 0, 100, 9, 2000, 2000, 2000, 2000, 1167324, 0, 0, 'Ancient Core Hound - Vicious Bite for a blow'),
(5214511, 52145, 0, 0, 0, 100, 9, 6000, 6000, 6000, 6000, 5214511, 0, 0, 'Incindis - Molten Bite'),
(5214512, 52145, 0, 0, 0, 100, 9, 24000, 30000, 24000, 30000, 5214512, 0, 0, 'Incindis - Quaking Stomp, then Fire Nova'),
(5214513, 52145, 0, 2, 0, 100, 0, 50, 0, 0, 0, 5214513, 0, 0, 'Incindis - at half health: a large egg and two small ones within 15 yd'),
(5214514, 52145, 0, 7, 0, 100, 0, 0, 0, 0, 0, 5214514, 0, 0, 'Incindis - home: his eggs gone'),
(5214611, 52146, 0, 11, 0, 100, 0, 0, 0, 0, 0, 5214611, 0, 0, 'Small Incendic Egg - laid: never fighting, never moving'),
(5214612, 52146, 0, 1, 2, 100, 9, 0, 0, 1000, 1000, 5214612, 0, 0, 'Small Incendic Egg - hatching until it takes (phase 0, then 1)'),
(5214613, 52146, 0, 0, 2, 100, 9, 0, 0, 1000, 1000, 5214613, 0, 0, 'Small Incendic Egg - hatching until it takes (phase 0, then 1)'),
(5214711, 52147, 0, 11, 0, 100, 0, 0, 0, 0, 0, 5214711, 0, 0, 'Large Incendic Egg - laid: never fighting, never moving'),
(5214712, 52147, 0, 1, 2, 100, 9, 0, 0, 1000, 1000, 5214712, 0, 0, 'Large Incendic Egg - hatching until it takes (phase 0, then 1)'),
(5214713, 52147, 0, 0, 2, 100, 9, 0, 0, 1000, 1000, 5214713, 0, 0, 'Large Incendic Egg - hatching until it takes (phase 0, then 1)');

DELETE FROM `creature_ai_scripts` WHERE `id` IN (1166611, 1166612, 1166613, 1166811, 1166812, 1166813, 1167101, 1167102, 1167103, 1167104, 1167201, 1167202, 1167203, 1167204, 1167301, 1167302, 1167311, 1167312, 1167313, 1167314, 1167315, 1167316, 1167321, 1167322, 1167323, 1167324, 1198201, 1198202, 1198203, 1198204, 1198211, 1198212, 1198291, 1198292, 1198293, 1198801, 1198802, 1198803, 1198804, 1198811, 1198812, 1198891, 1198892, 1198893, 1205701, 1205702, 1205703, 1205791, 1205792, 1205793, 1209801, 1209802, 1209803, 1209804, 1209805, 1209891, 1209892, 1209893, 1209901, 1209902, 1209903, 1209904, 1209905, 1210111, 1211801, 1211802, 1211803, 1211891, 1211892, 1211893, 1225901, 1225902, 1225903, 1225904, 1225991, 1225992, 1225993, 1226401, 1226402, 1226403, 1226404, 1226405, 1226491, 1226492, 1226493, 5214511, 5214512, 5214513, 5214514, 5214611, 5214612, 5214613, 5214711, 5214712, 5214713);
INSERT INTO `creature_ai_scripts`
(`id`, `delay`, `priority`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`)
VALUES
(1211891, 0, 0, 37, 7, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Lucifron - in progress'),
(1211891, 0, 1, 49, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Lucifron - the zone into the fight'),
(1211892, 0, 0, 37, 7, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Lucifron - not started'),
(1211893, 0, 0, 37, 7, 3, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Lucifron - done'),
(1211801, 0, 0, 15, 19702, 0, 0, 0, 0, 0, 0, 12, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Lucifron - Impending Doom'),
(1211802, 0, 0, 15, 19703, 0, 0, 0, 0, 0, 0, 12, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Lucifron - Lucifron''s Curse'),
(1211803, 0, 0, 15, 19460, 0, 0, 0, 0, 0, 4, 8, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Lucifron - Shadow Shock at a random attacker'),
(1198291, 0, 0, 37, 5, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Magmadar - in progress'),
(1198292, 0, 0, 37, 5, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Magmadar - not started'),
(1198293, 0, 0, 37, 5, 3, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Magmadar - done'),
(1198211, 0, 0, 15, 19449, 34, 0, 0, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Magmadar - Magma Spit'),
(1198212, 0, 0, 15, 19449, 34, 0, 0, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Magmadar - Magma Spit'),
(1198201, 0, 0, 15, 19451, 0, 0, 0, 0, 0, 0, 12, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Magmadar - Frenzy, with its emote'),
(1198201, 0, 1, 0, 2, 0, 0, 0, 0, 0, 0, 0, 7797, 0, 0, 0, 0, 0, 0, 0, 0, 'Magmadar - "%s goes into a killing frenzy!"'),
(1198202, 0, 0, 15, 19408, 0, 0, 0, 0, 0, 1, 8, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Magmadar - Panic'),
(1198203, 0, 0, 15, 19411, 0, 0, 0, 2, 0, 4, 8, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Magmadar - Lava Bomb at a random player'),
(1198204, 0, 0, 15, 20474, 0, 0, 0, 6, 0, 4, 8, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Magmadar - Lava Bomb at a random player with mana'),
(1225991, 0, 0, 37, 6, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Gehennas - in progress'),
(1225991, 0, 1, 49, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Gehennas - the zone into the fight'),
(1225992, 0, 0, 37, 6, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Gehennas - not started'),
(1225993, 0, 0, 37, 6, 3, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Gehennas - done'),
(1225901, 0, 0, 15, 19717, 0, 0, 0, 0, 0, 4, 8, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Gehennas - Rain of Fire at a random attacker'),
(1225902, 0, 0, 15, 19716, 0, 0, 0, 0, 0, 0, 12, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Gehennas - Gehennas'' Curse'),
(1225903, 0, 0, 15, 19728, 0, 0, 0, 0, 0, 4, 8, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Gehennas - Shadow Bolt at a random attacker'),
(1225904, 0, 0, 15, 19729, 0, 0, 0, 0, 0, 1, 8, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Gehennas - Shadow Bolt'),
(1226491, 0, 0, 37, 2, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Shazzrah - in progress'),
(1226492, 0, 0, 37, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Shazzrah - not started'),
(1226493, 0, 0, 37, 2, 3, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Shazzrah - done'),
(1226401, 0, 0, 15, 19712, 0, 0, 0, 0, 0, 1, 8, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Shazzrah - Arcane Explosion'),
(1226402, 0, 0, 15, 19713, 32, 0, 0, 0, 0, 1, 8, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Shazzrah - Shazzrah''s Curse'),
(1226403, 0, 0, 15, 19714, 0, 0, 0, 0, 0, 0, 12, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Shazzrah - Deaden Magic'),
(1226404, 0, 0, 15, 19715, 0, 0, 0, 0, 0, 1, 8, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Shazzrah - Counterspell'),
(1226405, 0, 0, 15, 23138, 2, 0, 0, 0, 0, 0, 12, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Shazzrah - Blink to a random player'),
(1226405, 0, 1, 39, 4090001, 0, 0, 0, 2, 0, 4, 0, 100, 0, 0, 0, 0, 0, 0, 0, 0, 'Shazzrah - to the player'),
(1209891, 0, 0, 37, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Sulfuron Harbinger - in progress'),
(1209891, 0, 1, 49, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Sulfuron Harbinger - the zone into the fight'),
(1209892, 0, 0, 37, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Sulfuron Harbinger - not started'),
(1209893, 0, 0, 37, 0, 3, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Sulfuron Harbinger - done'),
(1209801, 0, 0, 15, 19778, 0, 0, 0, 0, 0, 1, 8, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Sulfuron Harbinger - Demoralizing Shout'),
(1209802, 0, 0, 15, 19780, 0, 0, 0, 0, 0, 1, 8, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Sulfuron Harbinger - Hand of Ragnaros'),
(1209803, 0, 0, 15, 19781, 0, 0, 0, 0, 0, 4, 8, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Sulfuron Harbinger - Flame Spear at a random attacker'),
(1209804, 0, 0, 15, 19777, 0, 0, 0, 0, 0, 1, 8, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Sulfuron Harbinger - Dark Strike'),
(1209805, 0, 0, 15, 19779, 0, 0, 0, 45, 19779, 17, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Sulfuron Harbinger - Inspire on a friend lacking it'),
(1209805, 0, 1, 15, 19779, 0, 0, 0, 0, 0, 0, 12, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Sulfuron Harbinger - Inspire on himself'),
(1205791, 0, 0, 37, 4, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Garr - in progress'),
(1205791, 0, 1, 49, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Garr - the zone into the fight'),
(1205792, 0, 0, 37, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Garr - not started'),
(1205793, 0, 0, 37, 4, 3, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Garr - done'),
(1205701, 0, 0, 15, 19492, 0, 0, 0, 0, 0, 0, 12, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Garr - Antimagic Pulse'),
(1205702, 0, 0, 15, 19496, 0, 0, 0, 0, 0, 0, 12, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Garr - Magma Shackles'),
(1205703, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0, 8254, 0, 0, 0, 0, 0, 0, 0, 0, 'Garr - "%s forces one of his Firesworn minions to erupt!"'),
(1205703, 0, 1, 15, 20482, 2, 0, 0, 12099, 150, 26, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Garr - Erupt on a firesworn'),
(1209901, 0, 0, 15, 8876, 34, 0, 0, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Firesworn - Thrash'),
(1209901, 0, 1, 15, 15733, 34, 0, 0, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Firesworn - Immolate'),
(1209901, 0, 2, 49, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Firesworn - the zone into the fight'),
(1209902, 0, 0, 44, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Firesworn - made to explode'),
(1209902, 0, 1, 15, 20483, 2, 0, 0, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Firesworn - Massive Eruption'),
(1209903, 0, 0, 15, 19516, 2, 0, 0, 56609, 0, 9, 6, 0, 0, 0, 0, 0, 0, 0, 0, 1000, 'Garr - Enrage'),
(1209903, 0, 1, 15, 19497, 2, 0, 0, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Firesworn - Eruption'),
(1209904, 0, 0, 15, 19516, 2, 0, 0, 56609, 0, 9, 6, 0, 0, 0, 0, 0, 0, 0, 0, 1000, 'Garr - Enrage'),
(1209905, 0, 0, 15, 23492, 32, 0, 0, 56609, 0, 9, 12, 0, 0, 0, 0, 0, 0, 0, 0, 409001, 'Firesworn - Separation Anxiety'),
(1198891, 0, 0, 37, 3, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Golemagg the Incinerator - in progress'),
(1198892, 0, 0, 37, 3, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Golemagg the Incinerator - not started'),
(1198893, 0, 0, 37, 3, 3, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Golemagg the Incinerator - done'),
(1198801, 0, 0, 15, 20228, 0, 0, 0, 0, 0, 4, 8, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Golemagg the Incinerator - Pyroblast at a random attacker'),
(1198802, 0, 0, 15, 20553, 0, 0, 0, 0, 0, 0, 12, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Golemagg the Incinerator - Golemagg''s Trust'),
(1198803, 0, 0, 15, 19953, 0, 0, 0, 0, 0, 0, 12, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Golemagg the Incinerator - Enrage'),
(1198803, 0, 1, 44, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Golemagg - enraged'),
(1198804, 0, 0, 15, 19798, 0, 0, 0, 0, 0, 1, 8, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Golemagg the Incinerator - Earthquake, enraged'),
(1198811, 0, 0, 68, 4090002, 2, 11672, 150, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Golemagg - the ragers back'),
(1198812, 0, 0, 68, 4090003, 2, 11672, 150, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Golemagg - the ragers die'),
(1167201, 0, 0, 52, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Core Rager - no lower than 1 hp'),
(1167202, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0, 409101, 0, 0, 0, 0, 0, 0, 0, 0, 'Core Rager - "%s refuses to die while its master is in trouble."'),
(1167202, 0, 1, 94, 100, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Core Rager - whole again'),
(1167203, 0, 0, 15, 19820, 0, 0, 0, 0, 0, 1, 8, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Core Rager - Mangle'),
(1167204, 0, 0, 15, 3391, 34, 0, 0, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Core Rager - Thrash'),
(1166611, 0, 0, 49, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Firewalker - into the fight'),
(1166612, 0, 0, 15, 19636, 0, 0, 0, 0, 0, 0, 12, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Firewalker - Fire Blossom'),
(1166612, 0, 1, 39, 4090004, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0, 0, 0, 0, 0, 0, 0, 'Firewalker - six blossoms, a second apart'),
(1166613, 0, 0, 15, 19635, 0, 0, 0, 0, 0, 1, 8, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Firewalker - Incite Flames'),
(1166811, 0, 0, 15, 19396, 34, 0, 0, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Firelord - Incinerate'),
(1166812, 0, 0, 15, 19569, 0, 0, 0, 0, 0, 0, 12, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Firelord - Summon Lava Spawn'),
(1166813, 0, 0, 15, 19393, 2, 0, 0, 2, 0, 4, 8, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Firelord - Soul Burn at a random player'),
(1210111, 0, 0, 15, 19196, 0, 0, 0, 130, 0, 4, 8, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Lava Surger - Surge at a player out of melee'),
(1167101, 0, 0, 52, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Core Hound - no lower than 1 hp'),
(1167102, 0, 0, 49, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Core Hound - into the fight'),
(1167103, 0, 0, 15, 19771, 0, 0, 0, 0, 0, 1, 8, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Core Hound - Serrated Bite'),
(1167104, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0, 409103, 0, 0, 0, 0, 0, 0, 0, 0, 'Core Hound - "Core Hound collapses and begins to smolder."'),
(1167104, 0, 1, 28, 7, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Core Hound - down'),
(1167104, 0, 2, 4, 143, 32, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Core Hound - looks dead'),
(1167104, 0, 3, 43, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Core Hound - lies still'),
(1167104, 0, 4, 42, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Core Hound - no blows'),
(1167104, 0, 5, 39, 4090005, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0, 0, 0, 0, 0, 0, 0, 'Core Hound - rises or dies in 10 s'),
(1167301, 0, 0, 39, 4090012, 4090013, 0, 0, 0, 0, 0, 0, 50, 50, 0, 0, 0, 0, 0, 0, 0, 'Ancient Core Hound - one of six breaths'),
(1167302, 0, 0, 39, 4090012, 4090013, 0, 0, 0, 0, 0, 0, 50, 50, 0, 0, 0, 0, 0, 0, 0, 'Ancient Core Hound - one of six breaths'),
(1167311, 0, 0, 15, 19364, 0, 0, 0, 0, 0, 0, 12, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Ancient Core Hound - its breath 19364'),
(1167312, 0, 0, 15, 19365, 0, 0, 0, 0, 0, 0, 12, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Ancient Core Hound - its breath 19365'),
(1167313, 0, 0, 15, 19366, 0, 0, 0, 0, 0, 0, 12, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Ancient Core Hound - its breath 19366'),
(1167314, 0, 0, 15, 19367, 0, 0, 0, 0, 0, 0, 12, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Ancient Core Hound - its breath 19367'),
(1167315, 0, 0, 15, 19369, 0, 0, 0, 0, 0, 0, 12, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Ancient Core Hound - its breath 19369'),
(1167316, 0, 0, 15, 19372, 0, 0, 0, 0, 0, 0, 12, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Ancient Core Hound - its breath 19372'),
(1167321, 0, 0, 15, 19630, 0, 0, 0, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Ancient Core Hound - Cone of Fire'),
(1167322, 0, 0, 15, 19771, 0, 0, 0, 0, 0, 1, 8, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Ancient Core Hound - Bite'),
(1167323, 0, 0, 42, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Ancient Core Hound - no blows'),
(1167324, 0, 0, 15, 19319, 2, 0, 0, 0, 0, 1, 8, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Ancient Core Hound - Vicious Bite for a blow'),
(5214511, 0, 0, 15, 42040, 0, 0, 0, 0, 0, 1, 8, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Incindis - Molten Bite'),
(5214512, 0, 0, 15, 42036, 0, 0, 0, 0, 0, 0, 12, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Incindis - Quaking Stomp, then Fire Nova'),
(5214512, 0, 1, 39, 4090014, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0, 0, 0, 0, 0, 0, 0, 'Incindis - Fire Nova 1 s on'),
(5214513, 0, 0, 10, 52147, 0, 0, 0, 0, 0, 0, 0, 589824, 0, -1, 5, 15, 0, 0, 0, 0, 'Incindis - a large Incendic Egg'),
(5214513, 0, 1, 10, 52146, 0, 0, 0, 0, 0, 0, 0, 589824, 0, -1, 5, 15, 0, 0, 0, 0, 'Incindis - a small Incendic Egg'),
(5214513, 0, 2, 10, 52146, 0, 0, 0, 0, 0, 0, 0, 589824, 0, -1, 5, 15, 0, 0, 0, 0, 'Incindis - a small Incendic Egg'),
(5214514, 0, 0, 68, 4090015, 2, 52146, 100, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Incindis - his eggs gone (52146)'),
(5214514, 0, 1, 68, 4090015, 2, 52147, 100, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Incindis - his eggs gone (52147)'),
(5214611, 0, 0, 59, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Small Incendic Egg - passive'),
(5214611, 0, 1, 43, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Small Incendic Egg - standing'),
(5214611, 0, 2, 42, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Small Incendic Egg - no melee'),
(5214612, 0, 0, 15, 42042, 0, 0, 0, 0, 0, 0, 12, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Small Incendic Egg - Fiery Hatching'),
(5214612, 0, 1, 44, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Small Incendic Egg - hatching (phase 1)'),
(5214613, 0, 0, 15, 42042, 0, 0, 0, 0, 0, 0, 12, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Small Incendic Egg - Fiery Hatching'),
(5214613, 0, 1, 44, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Small Incendic Egg - hatching (phase 1)'),
(5214711, 0, 0, 59, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Large Incendic Egg - passive'),
(5214711, 0, 1, 43, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Large Incendic Egg - standing'),
(5214711, 0, 2, 42, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Large Incendic Egg - no melee'),
(5214712, 0, 0, 15, 42044, 0, 0, 0, 0, 0, 0, 12, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Large Incendic Egg - Fiery Hatching'),
(5214712, 0, 1, 44, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Large Incendic Egg - hatching (phase 1)'),
(5214713, 0, 0, 15, 42044, 0, 0, 0, 0, 0, 0, 12, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Large Incendic Egg - Fiery Hatching'),
(5214713, 0, 1, 44, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Large Incendic Egg - hatching (phase 1)');

DELETE FROM `generic_scripts` WHERE `id` IN (4090001, 4090002, 4090003, 4090004, 4090005, 4090006, 4090007, 4090008, 4090009, 4090010, 4090011, 4090012, 4090013, 4090014, 4090015, 4090016);
INSERT INTO `generic_scripts`
(`id`, `delay`, `priority`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`)
VALUES
(4090001, 0, 0, 29, 6, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, -100, 0, 0, 0, 0, 'Shazzrah - every threat wiped'),
(4090001, 0, 1, 6, 409, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Shazzrah - at the player'),
(4090001, 0, 2, 26, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Shazzrah - at the player'),
(4090002, 0, 0, 71, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Core Rager - back'),
(4090003, 0, 0, 52, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Core Rager - can die'),
(4090003, 0, 1, 48, 100, 1, 0, 0, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Core Rager - dies with Golemagg'),
(4090004, 1, 0, 15, 19637, 0, 0, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Firewalker - Fire Blossom at a random attacker (1 of 6)'),
(4090004, 2, 1, 15, 19637, 0, 0, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Firewalker - Fire Blossom at a random attacker (2 of 6)'),
(4090004, 3, 2, 15, 19637, 0, 0, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Firewalker - Fire Blossom at a random attacker (3 of 6)'),
(4090004, 4, 3, 15, 19637, 0, 0, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Firewalker - Fire Blossom at a random attacker (4 of 6)'),
(4090004, 5, 4, 15, 19637, 0, 0, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Firewalker - Fire Blossom at a random attacker (5 of 6)'),
(4090004, 6, 5, 15, 19637, 0, 0, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Firewalker - Fire Blossom at a random attacker (6 of 6)'),
(4090005, 10, 0, 94, 100, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 409010, 'Core Hound - whole again'),
(4090005, 10, 1, 28, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 409010, 'Core Hound - up'),
(4090005, 10, 2, 4, 143, 32, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 409010, 'Core Hound - alive'),
(4090005, 10, 3, 43, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 409010, 'Core Hound - moves again'),
(4090005, 10, 4, 42, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 409010, 'Core Hound - strikes again'),
(4090005, 10, 5, 15, 19823, 2, 0, 0, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, 409010, 'Core Hound - reignites'),
(4090005, 10, 6, 0, 2, 0, 0, 0, 0, 0, 0, 0, 409102, 0, 0, 0, 0, 0, 0, 0, 409010, 'Core Hound - "Core Hound reignites from the heat of another Core Hound!"'),
(4090005, 10, 7, 52, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 409011, 'Core Hound - none near: can die'),
(4090005, 10, 8, 48, 100, 1, 0, 0, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, 409011, 'Core Hound - none near: dead'),
(4090006, 0, 0, 44, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Ancient Core Hound - its breath 19364 (phase 1)'),
(4090007, 0, 0, 44, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Ancient Core Hound - its breath 19365 (phase 2)'),
(4090008, 0, 0, 44, 3, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Ancient Core Hound - its breath 19366 (phase 3)'),
(4090009, 0, 0, 44, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Ancient Core Hound - its breath 19367 (phase 4)'),
(4090010, 0, 0, 44, 5, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Ancient Core Hound - its breath 19369 (phase 5)'),
(4090011, 0, 0, 44, 6, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Ancient Core Hound - its breath 19372 (phase 6)'),
(4090012, 0, 0, 39, 4090006, 4090007, 4090008, 0, 0, 0, 0, 0, 33, 33, 34, 0, 0, 0, 0, 0, 0, 'Ancient Core Hound - one of three breaths (1 of 2)'),
(4090013, 0, 0, 39, 4090009, 4090010, 4090011, 0, 0, 0, 0, 0, 33, 33, 34, 0, 0, 0, 0, 0, 0, 'Ancient Core Hound - one of three breaths (2 of 2)'),
(4090014, 1, 0, 15, 42037, 0, 0, 0, 0, 0, 0, 12, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Incindis - Fire Nova, 1 s after his stomp'),
(4090015, 0, 0, 18, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Incendic Egg - gone'),
(4090016, 0, 0, 0, 6, 0, 0, 0, 0, 0, 0, 0, 409301, 0, 0, 0, 0, 0, 0, 0, 0, 'Majordomo Executus - "The runes of warding have been destroyed!"');

DELETE FROM `gameobject_scripts` WHERE `id` IN (232212, 232213, 232214, 232215, 232216, 232217, 232218);
INSERT INTO `gameobject_scripts`
(`id`, `delay`, `priority`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`)
VALUES
(232212, 0, 0, 37, 16, 3, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 230000, 'Rune of Koro (Sulfuron) - doused (16 = 3)'),
(232212, 0, 1, 81, 43157, 604800, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 230000, 'Rune of Koro (Sulfuron) - its circle gone'),
(232212, 0, 2, 10, 12018, 7200000, 1, 200, 0, 0, 0, 0, 4, 4090016, -1, 8, 758.089, -1176.71, -118.64, 3.12414, 409333, 'Rune of Koro (Sulfuron) - the last: Majordomo Executus called'),
(232212, 0, 3, 37, 23, 3, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 409333, 'Rune of Koro (Sulfuron) - Majordomo called (23 = 3)'),
(232213, 0, 0, 37, 17, 3, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 230000, 'Rune of Zeth (Geddon) - doused (17 = 3)'),
(232213, 0, 1, 81, 43158, 604800, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 230000, 'Rune of Zeth (Geddon) - its circle gone'),
(232213, 0, 2, 10, 12018, 7200000, 1, 200, 0, 0, 0, 0, 4, 4090016, -1, 8, 758.089, -1176.71, -118.64, 3.12414, 409333, 'Rune of Zeth (Geddon) - the last: Majordomo Executus called'),
(232213, 0, 3, 37, 23, 3, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 409333, 'Rune of Zeth (Geddon) - Majordomo called (23 = 3)'),
(232216, 0, 0, 37, 18, 3, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 230000, 'Rune of Mazj (Shazzrah) - doused (18 = 3)'),
(232216, 0, 1, 81, 43159, 604800, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 230000, 'Rune of Mazj (Shazzrah) - its circle gone'),
(232216, 0, 2, 10, 12018, 7200000, 1, 200, 0, 0, 0, 0, 4, 4090016, -1, 8, 758.089, -1176.71, -118.64, 3.12414, 409333, 'Rune of Mazj (Shazzrah) - the last: Majordomo Executus called'),
(232216, 0, 3, 37, 23, 3, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 409333, 'Rune of Mazj (Shazzrah) - Majordomo called (23 = 3)'),
(232215, 0, 0, 37, 19, 3, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 230000, 'Rune of Theri (Golemagg) - doused (19 = 3)'),
(232215, 0, 1, 81, 43160, 604800, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 230000, 'Rune of Theri (Golemagg) - its circle gone'),
(232215, 0, 2, 10, 12018, 7200000, 1, 200, 0, 0, 0, 0, 4, 4090016, -1, 8, 758.089, -1176.71, -118.64, 3.12414, 409333, 'Rune of Theri (Golemagg) - the last: Majordomo Executus called'),
(232215, 0, 3, 37, 23, 3, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 409333, 'Rune of Theri (Golemagg) - Majordomo called (23 = 3)'),
(232217, 0, 0, 37, 20, 3, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 230000, 'Rune of Blaz (Garr) - doused (20 = 3)'),
(232217, 0, 1, 81, 43165, 604800, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 230000, 'Rune of Blaz (Garr) - its circle gone'),
(232217, 0, 2, 10, 12018, 7200000, 1, 200, 0, 0, 0, 0, 4, 4090016, -1, 8, 758.089, -1176.71, -118.64, 3.12414, 409333, 'Rune of Blaz (Garr) - the last: Majordomo Executus called'),
(232217, 0, 3, 37, 23, 3, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 409333, 'Rune of Blaz (Garr) - Majordomo called (23 = 3)'),
(232214, 0, 0, 37, 21, 3, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 230000, 'Rune of Kress (Magmadar) - doused (21 = 3)'),
(232214, 0, 1, 81, 43161, 604800, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 230000, 'Rune of Kress (Magmadar) - its circle gone'),
(232214, 0, 2, 10, 12018, 7200000, 1, 200, 0, 0, 0, 0, 4, 4090016, -1, 8, 758.089, -1176.71, -118.64, 3.12414, 409333, 'Rune of Kress (Magmadar) - the last: Majordomo Executus called'),
(232214, 0, 3, 37, 23, 3, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 409333, 'Rune of Kress (Magmadar) - Majordomo called (23 = 3)'),
(232218, 0, 0, 37, 22, 3, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 230000, 'Rune of Mohn (Gehennas) - doused (22 = 3)'),
(232218, 0, 1, 81, 43163, 604800, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 230000, 'Rune of Mohn (Gehennas) - its circle gone'),
(232218, 0, 2, 10, 12018, 7200000, 1, 200, 0, 0, 0, 0, 4, 4090016, -1, 8, 758.089, -1176.71, -118.64, 3.12414, 409333, 'Rune of Mohn (Gehennas) - the last: Majordomo Executus called'),
(232218, 0, 3, 37, 23, 3, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 409333, 'Rune of Mohn (Gehennas) - Majordomo called (23 = 3)');

DELETE FROM `gameobject_requirement` WHERE `guid` = 232212;
INSERT INTO `gameobject_requirement`
(`guid`, `reqType`, `reqGuid`)
VALUES
(232212, 0, 56677);

DELETE FROM `gameobject_requirement` WHERE `guid` = 232213;
INSERT INTO `gameobject_requirement`
(`guid`, `reqType`, `reqGuid`)
VALUES
(232213, 0, 56655);

DELETE FROM `gameobject_requirement` WHERE `guid` = 232216;
INSERT INTO `gameobject_requirement`
(`guid`, `reqType`, `reqGuid`)
VALUES
(232216, 0, 56608);

DELETE FROM `gameobject_requirement` WHERE `guid` = 232215;
INSERT INTO `gameobject_requirement`
(`guid`, `reqType`, `reqGuid`)
VALUES
(232215, 0, 56684);

DELETE FROM `gameobject_requirement` WHERE `guid` = 232217;
INSERT INTO `gameobject_requirement`
(`guid`, `reqType`, `reqGuid`)
VALUES
(232217, 0, 56609);

DELETE FROM `gameobject_requirement` WHERE `guid` = 232214;
INSERT INTO `gameobject_requirement`
(`guid`, `reqType`, `reqGuid`)
VALUES
(232214, 0, 56683);

DELETE FROM `gameobject_requirement` WHERE `guid` = 232218;
INSERT INTO `gameobject_requirement`
(`guid`, `reqType`, `reqGuid`)
VALUES
(232218, 0, 56737);

UPDATE `spell_template` SET `maxAffectedTargets` = 1 WHERE `entry` = 42036;
