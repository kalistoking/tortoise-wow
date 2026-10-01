-- Naxxramas (map 533), the creatures around its bosses: its C++ as rows -- EPIC10 tier 2.
-- Written by the trt repo's scripts/tier2/a30_naxxramas.py from t1_world; naxxramas_restore.sql puts
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
-- Map 533 keeps instance_naxxramas and every boss (the core). Anub'Rekhan's door says his line only with the
-- C++ gone (CONDITION_SCRIPT_LOADED reversed: go_anub_door returns false). The worshippers kneel and pray each
-- on its own, alive and out of a fight (the C++ held the whole group once the first of it fought). The Shade's
-- and Spirit's portal is summoned without the C++'s Portal of Shadows visual (a spell go no row sends), and
-- casts its own spell once, from its row (the C++ cast it a second time). A Plague Slime's scale is set as the
-- field's float bits. The Shades' own Shadow Bolt Volley rule, dead under the C++ and unlike it, is taken away.

UPDATE `creature_template` SET `ai_name` = 'EventAI', `detection_range` = 1.5, `call_for_help_range` = 0, `leash_range` = 40 WHERE `entry` = 16056;
UPDATE `creature_template` SET `ai_name` = 'EventAI', `detection_range` = 1.5, `call_for_help_range` = 0, `leash_range` = 40 WHERE `entry` = 16057;
UPDATE `creature_template` SET `ai_name` = 'EventAI' WHERE `entry` = 16129;
UPDATE `creature_template` SET `ai_name` = 'EventAI' WHERE `entry` = 16156;
UPDATE `creature_template` SET `ai_name` = 'EventAI' WHERE `entry` = 16164;
UPDATE `creature_template` SET `ai_name` = 'EventAI' WHERE `entry` = 16168;
UPDATE `creature_template` SET `ai_name` = 'EventAI' WHERE `entry` = 16243;
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

DELETE FROM `conditions` WHERE `condition_entry` IN (533010, 533011, 533012, 533013);
INSERT INTO `conditions`
(`condition_entry`, `type`, `value1`, `value2`, `value3`, `value4`, `flags`)
VALUES
(533011, 52, 88092, 88093, 88096, 88097, 0),
(533012, 52, 88098, 88099, 0, 0, 0),
(533010, -2, 533011, 533012, 0, 0, 0),
(533013, 52, 88095, 0, 0, 0, 1);

-- Conditions another tier-2 migration writes too, under the same entry: whichever comes first.
INSERT IGNORE INTO `conditions`
(`condition_entry`, `type`, `value1`, `value2`, `value3`, `value4`, `flags`)
VALUES
(230000, 62, 0, 0, 0, 0, 1),
(209009, -1, 1000, 999, 0, 0, 0),
(33003, 34, 4, 3, 0, 0, 0);

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
DELETE FROM `creature_ai_events` WHERE `id` IN (1605611, 1605612, 1605613, 1605711, 1605712, 1612901, 1615611, 1616411, 1616412, 1616413, 1616414, 1616415, 1616811, 1616812, 1616813, 1616814, 1616815, 1624311, 1624312, 1624313, 1624314, 1636011, 1636012, 1640011, 1640012, 1640013, 1640014, 1644613, 1644614, 1644615, 1644911, 1644912, 1644913, 1644914, 1644915, 1657301, 1657302, 1657303, 1657304, 1657305, 1678311, 1678312, 1678313, 1678314, 1678411, 1678412, 1678413, 1678414, 1678511, 1678512, 1678513, 1678514, 5339001, 5339002, 5339003, 5339004, 5339005);
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
(1636011, 16360, 0, 7, 0, 100, 0, 0, 0, 0, 0, 1636011, 0, 0, 'Zombie Chow - reset: Infected Wound'),
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
(1616811, 16168, 533010, 11, 0, 100, 0, 0, 0, 0, 0, 1616811, 0, 0, 'Stoneskin Gargoyle - standing still: stealth detection, stoneform'),
(1616812, 16168, 533010, 21, 0, 100, 1, 0, 0, 0, 0, 1616812, 0, 0, 'Stoneskin Gargoyle - home, standing still: stoneform again'),
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
(1615611, 16156, 0, 2, 0, 100, 0, 49, 0, 0, 0, 1615611, 0, 0, 'Dark Touched Warrior - under half health: flees for help, once');

DELETE FROM `creature_ai_scripts` WHERE `id` IN (1605611, 1605612, 1605613, 1605711, 1605712, 1612901, 1615611, 1616411, 1616412, 1616413, 1616414, 1616415, 1616811, 1616812, 1616813, 1616814, 1616815, 1624311, 1624312, 1624313, 1624314, 1636011, 1636012, 1640011, 1640012, 1640013, 1640014, 1644613, 1644614, 1644615, 1644911, 1644912, 1644913, 1644914, 1644915, 1657301, 1657302, 1657303, 1657304, 1657305, 1678311, 1678312, 1678313, 1678314, 1678411, 1678412, 1678413, 1678414, 1678511, 1678512, 1678513, 1678514, 5339001, 5339002, 5339003, 5339004, 5339005);
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
(1636012, 0, 0, 59, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Zombie Chow - passive'),
(1636012, 0, 1, 73, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Zombie Chow - out of the fight'),
(1636012, 0, 2, 20, 14, 0, 0, 0, 15932, 200, 8, 0, 0, 0, 0, 0, 5, 0, 0, 0, 0, 'Zombie Chow - following Gluth'),
(1636012, 0, 3, 15, 28375, 2, 0, 0, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Zombie Chow - Decimate, on itself'),
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
(1615611, 0, 0, 47, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Dark Touched Warrior - flees for help');

DELETE FROM `generic_scripts` WHERE `id` IN (5330001, 5330002, 5330003, 5330004, 5330005, 5330006, 5330007, 5330008, 5330009, 5330010, 5330011, 5330012, 5330013, 5330014, 5330015);
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
(5330015, 5, 0, 33, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Toxic Tunnel - out of the fight');

DELETE FROM `gameobject_scripts` WHERE `id` IN (533008);
INSERT INTO `gameobject_scripts`
(`id`, `delay`, `priority`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`)
VALUES
(533008, 0, 0, 39, 5330002, 5330003, 0, 0, 0, 0, 0, 0, 40, 60, 0, 0, 0, 0, 0, 0, 230000, 'Anub''Rekhan''s door - used: one of his five lines'),
(533008, 0, 1, 4, 9, 16, 1, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0, 0, 230000, 'Anub''Rekhan''s door - not usable again');

