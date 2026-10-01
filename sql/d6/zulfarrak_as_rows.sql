-- Zul'Farrak (map 209), the pyramid's crew, the graves and Zum'rah: its C++ as rows -- EPIC10 tier 2.
-- Written by the trt repo's scripts/tier2/a37_zulfarrak.py from t1_world; zulfarrak_restore.sql puts
-- back what this replaces. R8: a person applies it, into the world database.
--
-- The C++ keeps its script names: mod-zulfarrak is the switch (AM1, handoff/manager-091).
-- Loaded, the C++ runs as before -- a script found by name comes first. Unloaded
-- (`module unload mod-zulfarrak`, which gives every creature standing a new AI at once),
-- the names find no script and the creatures run these rows (their ai_name).
--
-- Map 209 keeps the Ward of Zum'rah and the Tablet of Theka (the core); its instance and the Farraki arena are
-- rows since the second pass.
-- A grave opened again within 30 s does not raise a second creature there; after that it may (the C++ counted
-- its uses). Weegli shoots at a victim 5 yd off or more every 2 s (the C++: when his swing was ready and out of
-- reach); the charge lasts a day (the C++: never despawned). The crew's combat start positions are not set.
-- Second pass. A troll already fighting is not sent up the stairs (the C++ sent it anyway), each goes to a
-- random point within 5 yd of the top (the C++: one of eleven along it); a wave is dead when none of the seven
-- entries is alive within 150 yd of the last to die. The Sandfury Drudge and Nekrum Gutchewer run EventAI for
-- it (they had no ai_name). The arena: Juthza and Razjal go at the one who killed the last (the C++: the
-- challenger, kept across the fights), the zone's players into each fight; a reset and a new challenge within
-- 43 s can let the old timers bring Juthza or Razjal early; a scorpid may come at the place of the one before;
-- the sands' immunity is Immune All (29230), the C++'s list of mechanics and dispels aside; his Hellfire is 15
-- casts of its effect (11682) a second apart, 208 to himself each (he has no mana for 11684's channel).
-- An instance saved by the C++ before this pass keeps its end door broken only with the module loaded.

UPDATE `creature_template` SET `ai_name` = 'EventAI', `gossip_menu_id` = 760400 WHERE `entry` = 7604;
UPDATE `creature_template` SET `ai_name` = 'EventAI', `gossip_menu_id` = 760700 WHERE `entry` = 7607;
UPDATE `creature_template` SET `ai_name` = 'EventAI' WHERE `entry` = 7788;
UPDATE `creature_template` SET `ai_name` = 'EventAI' WHERE `entry` = 7796;
UPDATE `creature_template` SET `ai_name` = 'EventAI' WHERE `entry` = 62496;
UPDATE `creature_template` SET `ai_name` = 'EventAI' WHERE `entry` = 62497;
UPDATE `creature_template` SET `ai_name` = 'EventAI' WHERE `entry` = 62498;

DELETE FROM `conditions` WHERE `condition_entry` IN (209001, 209004, 209005, 209006, 209007, 209012, 209020, 209021, 209022, 209032, 209033, 209034, 209035, 209036, 209040, 209041, 209042, 209043, 209044, 209045, 209046, 209047, 209048, 209049, 209050, 209051, 209052, 209053, 209060, 209062, 209064, 209065, 209066, 209067, 209068, 209069, 209070);
INSERT INTO `conditions`
(`condition_entry`, `type`, `value1`, `value2`, `value3`, `value4`, `flags`)
VALUES
(209001, 34, 1, 0, 0, 0, 0),
(209004, 34, 1, 8, 0, 0, 0),
(209006, 34, 1, 0, 0, 0, 1),
(209007, 34, 1, 8, 0, 0, 1),
(209005, -1, 209006, 209007, 0, 0, 0),
(209012, 38, 5, 1, 0, 0, 0),
(209021, 20, 7271, 30, 0, 0, 0),
(209022, 34, 4, 0, 0, 0, 0),
(209020, -1, 209021, 209022, 0, 0, 0),
(209032, 34, 1, 4, 0, 0, 0),
(209033, 34, 1, 5, 0, 0, 0),
(209034, 34, 1, 6, 0, 0, 0),
(209035, 34, 1, 6, 1, 0, 0),
(209036, -1, 209035, 209007, 0, 0, 0),
(209040, 20, 7787, 150, 0, 0, 3),
(209041, 20, 7788, 150, 0, 0, 3),
(209042, 20, 7789, 150, 0, 0, 3),
(209043, 20, 8876, 150, 0, 0, 3),
(209044, 20, 8877, 150, 0, 0, 3),
(209045, 20, 7275, 150, 0, 0, 3),
(209046, 20, 7796, 150, 0, 0, 3),
(209048, -1, 209040, 209041, 209042, 209043, 0),
(209049, -1, 209044, 209045, 209046, 0, 0),
(209047, -1, 209048, 209049, 0, 0, 0),
(209050, -1, 209036, 209047, 0, 0, 0),
(209051, -1, 818012, 209047, 0, 0, 0),
(209052, 34, 2, 1, 1, 0, 0),
(209053, 34, 2, 0, 0, 0, 0),
(209060, 34, 5, 0, 0, 0, 0),
(209062, 34, 5, 2, 0, 0, 0),
(209064, 34, 5, 4, 0, 0, 0),
(209065, 34, 5, 5, 0, 0, 0),
(209070, 34, 5, 0, 0, 0, 1),
(209066, 20, 62497, 100, 0, 0, 3),
(209067, 20, 62496, 100, 0, 0, 3),
(209068, -1, 33004, 209066, 0, 0, 0),
(209069, -1, 33004, 209067, 0, 0, 0);

-- Conditions another tier-2 migration writes too, under the same entry: whichever comes first.
INSERT IGNORE INTO `conditions`
(`condition_entry`, `type`, `value1`, `value2`, `value3`, `value4`, `flags`)
VALUES
(230000, 62, 0, 0, 0, 0, 1),
(129001, 34, 1, 1, 0, 0, 0),
(532001, 34, 1, 3, 0, 0, 0),
(209009, -1, 1000, 999, 0, 0, 0),
(532003, 34, 3, 3, 0, 0, 0),
(818012, 34, 6, 1, 0, 0, 0),
(33004, 34, 5, 3, 0, 0, 0);

-- Existing rows taken away: the restore puts them back.
DELETE FROM `gossip_scripts` WHERE `id` = 6249801;
DELETE FROM `creature_ai_events` WHERE `id` IN (727311, 727312, 727511, 760401, 760402, 760701, 760702, 760703, 760704, 760705, 760706, 760711, 760712, 760713, 778711, 778811, 778911, 779611, 887611, 887711, 6249611, 6249612, 6249613, 6249614, 6249711, 6249714, 6249811, 6249812, 6249814);
INSERT INTO `creature_ai_events`
(`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`)
VALUES
(760701, 7607, 129001, 29, 14, 100, 1, 8, 1, 0, 0, 760701, 0, 0, 'Weegli Blastfuse - at the stairs: the pyramid (1 = 2), down he runs'),
(760702, 7607, 532001, 29, 14, 100, 1, 8, 2, 0, 0, 760702, 0, 0, 'Weegli Blastfuse - the first wave on: to his place'),
(760703, 7607, 209004, 1, 0, 100, 0, 1000, 1000, 0, 0, 760703, 0, 0, 'Weegli Blastfuse - all the trolls dead: the crew healed'),
(760704, 7607, 209007, 0, 0, 100, 1, 1000, 1000, 1000, 1000, 760704, 0, 0, 'Weegli Blastfuse - the crew join his fight while the trolls come'),
(760705, 7607, 0, 0, 0, 100, 1, 10000, 10000, 10000, 10000, 760705, 0, 0, 'Weegli Blastfuse - Bomb'),
(760706, 7607, 209012, 0, 0, 100, 1, 2000, 2000, 2000, 2000, 760706, 0, 0, 'Weegli Blastfuse - Shoot, his victim out of melee'),
(760711, 7607, 0, 29, 13, 100, 1, 8, 0, 0, 0, 760711, 0, 0, 'Weegli Blastfuse - at the door: the charge laid, off he runs'),
(760712, 7607, 0, 29, 11, 100, 1, 8, 1, 0, 0, 760712, 0, 0, 'Weegli Blastfuse - away: the charge goes, the end door broken (3 = 3)'),
(760713, 7607, 0, 29, 7, 100, 1, 8, 2, 0, 0, 760713, 0, 0, 'Weegli Blastfuse - gone'),
(760401, 7604, 0, 0, 0, 100, 1, 5000, 5000, 15000, 15000, 760401, 0, 0, 'Sergeant Bly - Shield Bash'),
(760402, 7604, 0, 0, 0, 100, 1, 8000, 8000, 10000, 10000, 760402, 0, 0, 'Sergeant Bly - Revenge'),
(778711, 7787, 209051, 6, 0, 100, 0, 0, 0, 0, 0, 778711, 0, 0, 'Sandfury Slave - the last of a wave dead: the pyramid goes on'),
(778811, 7788, 209051, 6, 0, 100, 0, 0, 0, 0, 0, 778811, 0, 0, 'Sandfury Drudge - the last of a wave dead: the pyramid goes on'),
(778911, 7789, 209051, 6, 0, 100, 0, 0, 0, 0, 0, 778911, 0, 0, 'Sandfury Cretin - the last of a wave dead: the pyramid goes on'),
(887611, 8876, 209051, 6, 0, 100, 0, 0, 0, 0, 0, 887611, 0, 0, 'Sandfury Acolyte - the last of a wave dead: the pyramid goes on'),
(887711, 8877, 209051, 6, 0, 100, 0, 0, 0, 0, 0, 887711, 0, 0, 'Sandfury Zealot - the last of a wave dead: the pyramid goes on'),
(727511, 7275, 209051, 6, 0, 100, 0, 0, 0, 0, 0, 727511, 0, 0, 'Shadowpriest Sezz''ziz - the last of a wave dead: the pyramid goes on'),
(779611, 7796, 209051, 6, 0, 100, 0, 0, 0, 0, 0, 779611, 0, 0, 'Nekrum Gutchewer - the last of a wave dead: the pyramid goes on'),
(727311, 7273, 209052, 11, 0, 100, 0, 0, 0, 0, 0, 727311, 0, 0, 'Gahz''rilla - called once already: gone'),
(727312, 7273, 209053, 11, 0, 100, 0, 0, 0, 0, 0, 727312, 0, 0, 'Gahz''rilla - called the first time (2 = 1)'),
(6249614, 62496, 209070, 7, 0, 100, 0, 0, 0, 0, 0, 6249614, 0, 0, 'Kath''zen the Brutal - out of the fight: the arena back'),
(6249714, 62497, 209070, 7, 0, 100, 0, 0, 0, 0, 0, 6249714, 0, 0, 'Juthza the Cunning - out of the fight: the arena back'),
(6249814, 62498, 209070, 7, 0, 100, 0, 0, 0, 0, 0, 6249814, 0, 0, 'Champion Razjal the Quick - out of the fight: the arena back'),
(6249611, 62496, 209062, 6, 0, 100, 0, 0, 0, 0, 0, 6249611, 0, 0, 'Kath''zen the Brutal - dead: Juthza'),
(6249612, 62496, 209068, 6, 0, 100, 0, 0, 0, 0, 0, 6249612, 0, 0, 'Kath''zen the Brutal - dead after Juthza: Razjal'),
(6249613, 62496, 0, 2, 0, 100, 0, 50, 0, 0, 0, 6249613, 0, 0, 'Kath''zen the Brutal - at half health: Enrage'),
(6249711, 62497, 209069, 6, 0, 100, 0, 0, 0, 0, 0, 6249711, 0, 0, 'Juthza the Cunning - dead after Kath''zen: Razjal'),
(6249811, 62498, 209064, 2, 0, 100, 0, 50, 0, 0, 0, 6249811, 0, 0, 'Champion Razjal the Quick - at half health: the sands'),
(6249812, 62498, 209064, 2, 2, 100, 1, 10, 0, 1000, 1000, 6249812, 0, 0, 'Champion Razjal the Quick - at a tenth: his Hellfire');

DELETE FROM `creature_ai_scripts` WHERE `id` IN (727311, 727312, 727511, 760401, 760402, 760701, 760702, 760703, 760704, 760705, 760706, 760711, 760712, 760713, 778711, 778811, 778911, 779611, 887611, 887711, 6249611, 6249612, 6249613, 6249614, 6249711, 6249714, 6249811, 6249812, 6249814);
INSERT INTO `creature_ai_scripts`
(`id`, `delay`, `priority`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`)
VALUES
(760701, 0, 0, 37, 1, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Weegli Blastfuse - at the stairs (1 = 2)'),
(760701, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 3744, 0, 0, 0, 0, 0, 0, 0, 0, 'Weegli Blastfuse - "Oh no! Here they come!"'),
(760701, 0, 2, 25, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Weegli Blastfuse - runs'),
(760701, 0, 3, 3, 0, 0, 0, 2, 0, 0, 0, 0, 2, 0, 0, 0, 1883.27, 1268.72, 41.73, 0, 0, 'Weegli Blastfuse - down the stairs (point 2)'),
(760702, 0, 0, 3, 0, 0, 0, 2, 0, 0, 0, 0, 3, 0, 0, 0, 1888.55, 1272.19, 41.67, 0, 0, 'Weegli Blastfuse - to his place (point 3)'),
(760702, 0, 1, 34, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1888.55, 1272.19, 41.67, 4.7, 0, 'Weegli Blastfuse - home at his place'),
(760702, 0, 2, 25, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Weegli Blastfuse - walks'),
(760703, 0, 0, 94, 100, 1, 0, 0, 81555, 0, 9, 2, 0, 0, 0, 0, 0, 0, 0, 0, 1000, 'Sergeant Bly - healed'),
(760703, 0, 1, 94, 100, 1, 0, 0, 81557, 0, 9, 2, 0, 0, 0, 0, 0, 0, 0, 0, 1000, 'Raven - healed'),
(760703, 0, 2, 94, 100, 1, 0, 0, 81554, 0, 9, 2, 0, 0, 0, 0, 0, 0, 0, 0, 1000, 'Oro Eyegouge - healed'),
(760703, 0, 3, 94, 100, 1, 0, 0, 81556, 0, 9, 2, 0, 0, 0, 0, 0, 0, 0, 0, 1000, 'Murta Grimgut - healed'),
(760703, 0, 4, 94, 100, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Weegli Blastfuse - healed'),
(760704, 0, 0, 72, 0, 0, 0, 0, 81555, 0, 9, 2, 0, 0, 0, 0, 0, 0, 0, 0, 209009, 'Sergeant Bly - joins Weegli''s fight'),
(760704, 0, 1, 72, 0, 0, 0, 0, 81554, 0, 9, 2, 0, 0, 0, 0, 0, 0, 0, 0, 209009, 'Oro Eyegouge - joins Weegli''s fight'),
(760704, 0, 2, 72, 0, 0, 0, 0, 81556, 0, 9, 2, 0, 0, 0, 0, 0, 0, 0, 0, 209009, 'Murta Grimgut - joins Weegli''s fight'),
(760705, 0, 0, 15, 8858, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Weegli Blastfuse - Bomb'),
(760706, 0, 0, 15, 6660, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Weegli Blastfuse - Shoot'),
(760711, 0, 0, 76, 144065, 86400, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1856.314209, 1144.990479, 15.486275, 5.6635, 0, 'Weegli Blastfuse - the explosive charge'),
(760711, 0, 1, 3, 0, 0, 0, 2, 0, 0, 0, 0, 1, 0, 0, 0, 1863.77, 1176.99, 9.993, 0, 0, 'Weegli Blastfuse - away (point 1)'),
(760711, 0, 2, 44, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Weegli Blastfuse - running off (phase 2)'),
(760712, 0, 0, 13, 0, 0, 0, 0, 144065, 60, 11, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Explosive Charge - goes off'),
(760712, 0, 1, 80, 2, 0, 0, 0, 27086, 0, 12, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'End door - broken'),
(760712, 0, 2, 37, 3, 3, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'End door - done (3 = 3)'),
(760712, 0, 3, 0, 6, 0, 0, 0, 37996, 0, 9, 2, 6067, 0, 0, 0, 0, 0, 0, 0, 0, 'Chief Ukorz Sandscalp - his yell'),
(760712, 0, 4, 3, 0, 0, 0, 2, 0, 0, 0, 0, 2, 0, 0, 0, 1827.1, 1184.0, 8.993, 0, 0, 'Weegli Blastfuse - gone (point 2)'),
(760712, 0, 5, 44, 3, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Weegli Blastfuse - leaving (phase 3)'),
(760713, 0, 0, 18, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Weegli Blastfuse - gone'),
(760401, 0, 0, 15, 11972, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Sergeant Bly - Shield Bash'),
(760402, 0, 0, 15, 12170, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Sergeant Bly - Revenge'),
(760701, 0, 4, 39, 2090012, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0, 0, 0, 0, 0, 0, 0, 'Weegli Blastfuse - the first wave'),
(778711, 0, 0, 39, 2090013, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0, 0, 0, 0, 0, 0, 532001, 'The pyramid - wave 1 dead'),
(778711, 0, 1, 39, 2090014, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0, 0, 0, 0, 0, 0, 209033, 'The pyramid - wave 2 dead'),
(778711, 0, 2, 39, 2090015, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0, 0, 0, 0, 0, 0, 209036, 'The pyramid - wave 3 dead'),
(778811, 0, 0, 39, 2090013, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0, 0, 0, 0, 0, 0, 532001, 'The pyramid - wave 1 dead'),
(778811, 0, 1, 39, 2090014, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0, 0, 0, 0, 0, 0, 209033, 'The pyramid - wave 2 dead'),
(778811, 0, 2, 39, 2090015, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0, 0, 0, 0, 0, 0, 209036, 'The pyramid - wave 3 dead'),
(778911, 0, 0, 39, 2090013, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0, 0, 0, 0, 0, 0, 532001, 'The pyramid - wave 1 dead'),
(778911, 0, 1, 39, 2090014, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0, 0, 0, 0, 0, 0, 209033, 'The pyramid - wave 2 dead'),
(778911, 0, 2, 39, 2090015, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0, 0, 0, 0, 0, 0, 209036, 'The pyramid - wave 3 dead'),
(887611, 0, 0, 39, 2090013, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0, 0, 0, 0, 0, 0, 532001, 'The pyramid - wave 1 dead'),
(887611, 0, 1, 39, 2090014, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0, 0, 0, 0, 0, 0, 209033, 'The pyramid - wave 2 dead'),
(887611, 0, 2, 39, 2090015, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0, 0, 0, 0, 0, 0, 209036, 'The pyramid - wave 3 dead'),
(887711, 0, 0, 39, 2090013, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0, 0, 0, 0, 0, 0, 532001, 'The pyramid - wave 1 dead'),
(887711, 0, 1, 39, 2090014, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0, 0, 0, 0, 0, 0, 209033, 'The pyramid - wave 2 dead'),
(887711, 0, 2, 39, 2090015, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0, 0, 0, 0, 0, 0, 209036, 'The pyramid - wave 3 dead'),
(727511, 0, 0, 39, 2090013, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0, 0, 0, 0, 0, 0, 532001, 'The pyramid - wave 1 dead'),
(727511, 0, 1, 39, 2090014, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0, 0, 0, 0, 0, 0, 209033, 'The pyramid - wave 2 dead'),
(727511, 0, 2, 39, 2090015, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0, 0, 0, 0, 0, 0, 209036, 'The pyramid - wave 3 dead'),
(779611, 0, 0, 39, 2090013, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0, 0, 0, 0, 0, 0, 532001, 'The pyramid - wave 1 dead'),
(779611, 0, 1, 39, 2090014, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0, 0, 0, 0, 0, 0, 209033, 'The pyramid - wave 2 dead'),
(779611, 0, 2, 39, 2090015, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0, 0, 0, 0, 0, 0, 209036, 'The pyramid - wave 3 dead'),
(727311, 0, 0, 18, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Gahz''rilla - gone'),
(727312, 0, 0, 37, 2, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Gahz''rilla - called (2 = 1)'),
(6249614, 0, 0, 39, 2090026, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0, 0, 0, 0, 0, 0, 0, 'Farraki arena - back'),
(6249714, 0, 0, 39, 2090026, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0, 0, 0, 0, 0, 0, 0, 'Farraki arena - back'),
(6249814, 0, 0, 39, 2090026, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0, 0, 0, 0, 0, 0, 0, 'Farraki arena - back'),
(6249611, 0, 0, 39, 2090017, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0, 0, 0, 0, 0, 0, 0, 'Farraki arena - Juthza'),
(6249612, 0, 0, 39, 2090016, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0, 0, 0, 0, 0, 0, 0, 'Farraki arena - Razjal'),
(6249613, 0, 0, 15, 15716, 0, 0, 0, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Kath''zen the Brutal - Enrage'),
(6249711, 0, 0, 39, 2090016, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0, 0, 0, 0, 0, 0, 0, 'Farraki arena - Razjal'),
(6249811, 0, 0, 39, 2090023, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0, 0, 0, 0, 0, 0, 0, 'Farraki arena - the sands'),
(6249812, 0, 0, 39, 2090024, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0, 0, 0, 0, 0, 0, 0, 'Farraki arena - his Hellfire');

DELETE FROM `generic_scripts` WHERE `id` IN (2090001, 2090002, 2090003, 2090004, 2090005, 2090006, 2090007, 2090008, 2090009, 2090010, 2090011, 2090012, 2090013, 2090014, 2090015, 2090016, 2090017, 2090018, 2090019, 2090020, 2090021, 2090022, 2090023, 2090024, 2090025, 2090026);
INSERT INTO `generic_scripts`
(`id`, `delay`, `priority`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`)
VALUES
(2090001, 0, 0, 37, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Troll Cage - the pyramid begins (1 = 1)'),
(2090001, 0, 1, 34, 0, 0, 0, 0, 81555, 0, 9, 2, 0, 0, 0, 0, 1887.17, 1263.72, 41.484, 4.7, 0, 'Sergeant Bly - home at the top of the stairs'),
(2090001, 0, 2, 3, 0, 0, 3, 2, 81555, 0, 9, 2, 1, 0, 0, 0, 1887.17, 1263.72, 41.484, 0, 0, 'Sergeant Bly - walks to the top of the stairs (point 1)'),
(2090001, 0, 3, 22, 250, 0, 0, 0, 81555, 0, 9, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Sergeant Bly - freed'),
(2090001, 0, 4, 34, 0, 0, 0, 0, 81557, 0, 9, 2, 0, 0, 0, 0, 1890.76, 1265.82, 41.43, 4.7, 0, 'Raven - home at the top of the stairs'),
(2090001, 0, 5, 3, 0, 0, 3, 2, 81557, 0, 9, 2, 1, 0, 0, 0, 1890.76, 1265.82, 41.43, 0, 0, 'Raven - walks to the top of the stairs (point 1)'),
(2090001, 0, 6, 22, 250, 0, 0, 0, 81557, 0, 9, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Raven - freed'),
(2090001, 0, 7, 34, 0, 0, 0, 0, 81554, 0, 9, 2, 0, 0, 0, 0, 1883.3, 1272.53, 41.87, 4.7, 0, 'Oro Eyegouge - home at the top of the stairs'),
(2090001, 0, 8, 3, 0, 0, 3, 2, 81554, 0, 9, 2, 1, 0, 0, 0, 1883.3, 1272.53, 41.87, 0, 0, 'Oro Eyegouge - walks to the top of the stairs (point 1)'),
(2090001, 0, 9, 22, 250, 0, 0, 0, 81554, 0, 9, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Oro Eyegouge - freed'),
(2090001, 0, 10, 34, 0, 0, 0, 0, 81553, 0, 9, 2, 0, 0, 0, 0, 1883.87, 1263.49, 41.55, 4.7, 0, 'Weegli Blastfuse - home at the top of the stairs'),
(2090001, 0, 11, 3, 0, 0, 3, 2, 81553, 0, 9, 2, 1, 0, 0, 0, 1883.87, 1263.49, 41.55, 0, 0, 'Weegli Blastfuse - walks to the top of the stairs (point 1)'),
(2090001, 0, 12, 22, 250, 0, 0, 0, 81553, 0, 9, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Weegli Blastfuse - freed'),
(2090001, 0, 13, 34, 0, 0, 0, 0, 81556, 0, 9, 2, 0, 0, 0, 0, 1886.48, 1272.76, 41.76, 4.7, 0, 'Murta Grimgut - home at the top of the stairs'),
(2090001, 0, 14, 3, 0, 0, 3, 2, 81556, 0, 9, 2, 1, 0, 0, 0, 1886.48, 1272.76, 41.76, 0, 0, 'Murta Grimgut - walks to the top of the stairs (point 1)'),
(2090001, 0, 15, 22, 250, 0, 0, 0, 81556, 0, 9, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Murta Grimgut - freed'),
(2090002, 0, 0, 22, 35, 0, 0, 0, 81553, 0, 9, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Weegli Blastfuse - friendly'),
(2090002, 0, 1, 25, 1, 0, 0, 0, 81553, 0, 9, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Weegli Blastfuse - runs'),
(2090002, 0, 2, 3, 0, 0, 0, 2, 81553, 0, 9, 2, 0, 0, 0, 0, 1858.57, 1146.35, 14.745, 0, 0, 'Weegli Blastfuse - to the door (point 0)'),
(2090002, 0, 3, 0, 0, 0, 0, 0, 81553, 0, 9, 2, 3785, 0, 0, 0, 0, 0, 0, 0, 0, 'Weegli Blastfuse - "Ok, here I go!"'),
(2090002, 0, 4, 44, 1, 0, 0, 0, 81553, 0, 9, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Weegli Blastfuse - on his way to the door (phase 1)'),
(2090003, 0, 0, 10, 7286, 30000, 1, 5, 0, 0, 0, 0, 65540, 0, -1, 1, 0, 0, 0, 0, 0, 'Shallow Grave - a Zombie'),
(2090004, 0, 0, 10, 7276, 30000, 1, 5, 0, 0, 0, 0, 65540, 0, -1, 1, 0, 0, 0, 0, 0, 'Shallow Grave - a Dead Hero'),
(2090005, 0, 0, 37, 4, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Witch Doctor Zum''rah - hostile (4 = 1)'),
(2090005, 0, 1, 22, 37, 0, 0, 0, 7271, 30, 8, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Witch Doctor Zum''rah - hostile'),
(2090005, 0, 2, 0, 0, 0, 0, 0, 7271, 30, 8, 2, 3622, 0, 0, 0, 0, 0, 0, 0, 0, 'Witch Doctor Zum''rah - "How dare you enter my sanctum!"'),
(2090006, 0, 0, 3, 3, 0, 5, 2, 0, 0, 0, 0, 0, 0, 0, 0, 1885, 1274, 42, 5, 999, 'Sandfury troll - up the stairs (batch 1, 2 of them)'),
(2090007, 10, 0, 3, 3, 0, 5, 2, 0, 0, 0, 0, 0, 0, 0, 0, 1885, 1274, 42, 5, 999, 'Sandfury troll - up the stairs (batch 2, 3 of them)'),
(2090008, 20, 0, 3, 3, 0, 5, 2, 0, 0, 0, 0, 0, 0, 0, 0, 1885, 1274, 42, 5, 999, 'Sandfury troll - up the stairs (batch 3, 4 of them)'),
(2090009, 30, 0, 3, 3, 0, 5, 2, 0, 0, 0, 0, 0, 0, 0, 0, 1885, 1274, 42, 5, 999, 'Sandfury troll - up the stairs (batch 4, 5 of them)'),
(2090010, 40, 0, 3, 3, 0, 5, 2, 0, 0, 0, 0, 0, 0, 0, 0, 1885, 1274, 42, 5, 999, 'Sandfury troll - up the stairs (batch 5, 6 of them)'),
(2090011, 50, 0, 3, 3, 0, 5, 2, 0, 0, 0, 0, 0, 0, 0, 0, 1885, 1274, 42, 5, 999, 'Sandfury troll - up the stairs (batch 6, 7 of them)'),
(2090012, 0, 0, 32, 1112, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'The pyramid - Weegli at the stairs, or nothing'),
(2090012, 0, 1, 37, 6, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'The pyramid - the rows drive it (6 = 1)'),
(2090012, 0, 2, 37, 1, 3, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'The pyramid - wave 1 (1 = 3)'),
(2090012, 0, 3, 10, 7789, 25000, 0, 0, 0, 0, 0, 0, 0, 2090006, -1, 7, 1894.64, 1206.29, 8.87, 0, 0, 'The pyramid - wave 1: Sandfury Cretin'),
(2090012, 0, 4, 10, 7787, 25000, 0, 0, 0, 0, 0, 0, 0, 2090006, -1, 7, 1890.08, 1218.68, 8.87, 0, 0, 'The pyramid - wave 1: Sandfury Slave'),
(2090012, 0, 5, 10, 8876, 25000, 0, 0, 0, 0, 0, 0, 0, 2090007, -1, 7, 1883.76, 1222.3, 8.87, 0, 0, 'The pyramid - wave 1: Sandfury Acolyte'),
(2090012, 0, 6, 10, 7789, 25000, 0, 0, 0, 0, 0, 0, 0, 2090007, -1, 7, 1874.18, 1221.24, 8.87, 0, 0, 'The pyramid - wave 1: Sandfury Cretin'),
(2090012, 0, 7, 10, 7787, 25000, 0, 0, 0, 0, 0, 0, 0, 2090007, -1, 7, 1892.28, 1225.49, 8.87, 0, 0, 'The pyramid - wave 1: Sandfury Slave'),
(2090012, 0, 8, 10, 7788, 25000, 0, 0, 0, 0, 0, 0, 0, 2090008, -1, 7, 1889.94, 1212.21, 8.87, 0, 0, 'The pyramid - wave 1: Sandfury Drudge'),
(2090012, 0, 9, 10, 7787, 25000, 0, 0, 0, 0, 0, 0, 0, 2090008, -1, 7, 1879.02, 1223.06, 8.87, 0, 0, 'The pyramid - wave 1: Sandfury Slave'),
(2090012, 0, 10, 10, 7789, 25000, 0, 0, 0, 0, 0, 0, 0, 2090008, -1, 7, 1874.45, 1204.44, 8.87, 0, 0, 'The pyramid - wave 1: Sandfury Cretin'),
(2090012, 0, 11, 10, 8876, 25000, 0, 0, 0, 0, 0, 0, 0, 2090008, -1, 7, 1898.23, 1217.97, 8.87, 0, 0, 'The pyramid - wave 1: Sandfury Acolyte'),
(2090012, 0, 12, 10, 7787, 25000, 0, 0, 0, 0, 0, 0, 0, 2090009, -1, 7, 1882.07, 1225.7, 8.87, 0, 0, 'The pyramid - wave 1: Sandfury Slave'),
(2090012, 0, 13, 10, 8877, 25000, 0, 0, 0, 0, 0, 0, 0, 2090009, -1, 7, 1896.46, 1205.62, 8.87, 0, 0, 'The pyramid - wave 1: Sandfury Zealot'),
(2090012, 0, 14, 10, 7787, 25000, 0, 0, 0, 0, 0, 0, 0, 2090009, -1, 7, 1886.97, 1225.86, 8.87, 0, 0, 'The pyramid - wave 1: Sandfury Slave'),
(2090012, 0, 15, 10, 7787, 25000, 0, 0, 0, 0, 0, 0, 0, 2090009, -1, 7, 1894.72, 1221.91, 8.87, 0, 0, 'The pyramid - wave 1: Sandfury Slave'),
(2090012, 0, 16, 10, 7787, 25000, 0, 0, 0, 0, 0, 0, 0, 2090009, -1, 7, 1883.5, 1218.25, 8.87, 0, 0, 'The pyramid - wave 1: Sandfury Slave'),
(2090012, 0, 17, 10, 7787, 25000, 0, 0, 0, 0, 0, 0, 0, 2090010, -1, 7, 1886.93, 1221.4, 8.87, 0, 0, 'The pyramid - wave 1: Sandfury Slave'),
(2090012, 0, 18, 10, 8876, 25000, 0, 0, 0, 0, 0, 0, 0, 2090010, -1, 7, 1889.82, 1222.51, 8.87, 0, 0, 'The pyramid - wave 1: Sandfury Acolyte'),
(2090012, 0, 19, 10, 7788, 25000, 0, 0, 0, 0, 0, 0, 0, 2090010, -1, 7, 1893.07, 1215.26, 8.87, 0, 0, 'The pyramid - wave 1: Sandfury Drudge'),
(2090012, 0, 20, 10, 7788, 25000, 0, 0, 0, 0, 0, 0, 0, 2090010, -1, 7, 1878.57, 1214.16, 8.87, 0, 0, 'The pyramid - wave 1: Sandfury Drudge'),
(2090012, 0, 21, 10, 7788, 25000, 0, 0, 0, 0, 0, 0, 0, 2090010, -1, 7, 1883.74, 1212.35, 8.87, 0, 0, 'The pyramid - wave 1: Sandfury Drudge'),
(2090012, 0, 22, 10, 8877, 25000, 0, 0, 0, 0, 0, 0, 0, 2090010, -1, 7, 1877, 1207.27, 8.87, 0, 0, 'The pyramid - wave 1: Sandfury Zealot'),
(2090012, 0, 23, 10, 8877, 25000, 0, 0, 0, 0, 0, 0, 0, 2090011, -1, 7, 1873.63, 1204.65, 8.87, 0, 0, 'The pyramid - wave 1: Sandfury Zealot'),
(2090012, 0, 24, 10, 8876, 25000, 0, 0, 0, 0, 0, 0, 0, 2090011, -1, 7, 1877.4, 1216.41, 8.87, 0, 0, 'The pyramid - wave 1: Sandfury Acolyte'),
(2090012, 0, 25, 10, 8877, 25000, 0, 0, 0, 0, 0, 0, 0, 2090011, -1, 7, 1899.63, 1202.52, 8.87, 0, 0, 'The pyramid - wave 1: Sandfury Zealot'),
(2090013, 0, 0, 32, 532001, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'The pyramid - wave 1 on, or nothing'),
(2090013, 0, 1, 37, 1, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'The pyramid - wave 1 dead (1 = 4)'),
(2090013, 10, 2, 32, 209032, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'The pyramid - still before wave 2, or nothing'),
(2090013, 10, 3, 10, 7789, 25000, 0, 0, 0, 0, 0, 0, 0, 2090006, -1, 7, 1902.83, 1223.41, 8.87, 0, 0, 'The pyramid - wave 2: Sandfury Cretin'),
(2090013, 10, 4, 10, 8876, 25000, 0, 0, 0, 0, 0, 0, 0, 2090006, -1, 7, 1889.82, 1222.51, 8.87, 0, 0, 'The pyramid - wave 2: Sandfury Acolyte'),
(2090013, 10, 5, 10, 7787, 25000, 0, 0, 0, 0, 0, 0, 0, 2090007, -1, 7, 1883.5, 1218.25, 8.87, 0, 0, 'The pyramid - wave 2: Sandfury Slave'),
(2090013, 10, 6, 10, 7788, 25000, 0, 0, 0, 0, 0, 0, 0, 2090007, -1, 7, 1883.74, 1212.35, 8.87, 0, 0, 'The pyramid - wave 2: Sandfury Drudge'),
(2090013, 10, 7, 10, 8877, 25000, 0, 0, 0, 0, 0, 0, 0, 2090007, -1, 7, 1877, 1207.27, 8.87, 0, 0, 'The pyramid - wave 2: Sandfury Zealot'),
(2090013, 10, 8, 10, 7787, 25000, 0, 0, 0, 0, 0, 0, 0, 2090008, -1, 7, 1890.08, 1218.68, 8.87, 0, 0, 'The pyramid - wave 2: Sandfury Slave'),
(2090013, 10, 9, 10, 7789, 25000, 0, 0, 0, 0, 0, 0, 0, 2090008, -1, 7, 1894.64, 1206.29, 8.87, 0, 0, 'The pyramid - wave 2: Sandfury Cretin'),
(2090013, 10, 10, 10, 8876, 25000, 0, 0, 0, 0, 0, 0, 0, 2090008, -1, 7, 1877.4, 1216.41, 8.87, 0, 0, 'The pyramid - wave 2: Sandfury Acolyte'),
(2090013, 10, 11, 10, 7787, 25000, 0, 0, 0, 0, 0, 0, 0, 2090008, -1, 7, 1892.28, 1225.49, 8.87, 0, 0, 'The pyramid - wave 2: Sandfury Slave'),
(2090013, 10, 12, 10, 7788, 25000, 0, 0, 0, 0, 0, 0, 0, 2090009, -1, 7, 1893.07, 1215.26, 8.87, 0, 0, 'The pyramid - wave 2: Sandfury Drudge'),
(2090013, 10, 13, 10, 8877, 25000, 0, 0, 0, 0, 0, 0, 0, 2090009, -1, 7, 1896.46, 1205.62, 8.87, 0, 0, 'The pyramid - wave 2: Sandfury Zealot'),
(2090013, 10, 14, 10, 7789, 25000, 0, 0, 0, 0, 0, 0, 0, 2090009, -1, 7, 1874.45, 1204.44, 8.87, 0, 0, 'The pyramid - wave 2: Sandfury Cretin'),
(2090013, 10, 15, 10, 7789, 25000, 0, 0, 0, 0, 0, 0, 0, 2090009, -1, 7, 1874.18, 1221.24, 8.87, 0, 0, 'The pyramid - wave 2: Sandfury Cretin'),
(2090013, 10, 16, 10, 7787, 25000, 0, 0, 0, 0, 0, 0, 0, 2090009, -1, 7, 1879.02, 1223.06, 8.87, 0, 0, 'The pyramid - wave 2: Sandfury Slave'),
(2090013, 10, 17, 10, 8876, 25000, 0, 0, 0, 0, 0, 0, 0, 2090010, -1, 7, 1898.23, 1217.97, 8.87, 0, 0, 'The pyramid - wave 2: Sandfury Acolyte'),
(2090013, 10, 18, 10, 7787, 25000, 0, 0, 0, 0, 0, 0, 0, 2090010, -1, 7, 1882.07, 1225.7, 8.87, 0, 0, 'The pyramid - wave 2: Sandfury Slave'),
(2090013, 10, 19, 10, 8877, 25000, 0, 0, 0, 0, 0, 0, 0, 2090010, -1, 7, 1873.63, 1204.65, 8.87, 0, 0, 'The pyramid - wave 2: Sandfury Zealot'),
(2090013, 10, 20, 10, 7787, 25000, 0, 0, 0, 0, 0, 0, 0, 2090010, -1, 7, 1886.97, 1225.86, 8.87, 0, 0, 'The pyramid - wave 2: Sandfury Slave'),
(2090013, 10, 21, 10, 7788, 25000, 0, 0, 0, 0, 0, 0, 0, 2090010, -1, 7, 1878.57, 1214.16, 8.87, 0, 0, 'The pyramid - wave 2: Sandfury Drudge'),
(2090013, 10, 22, 10, 7787, 25000, 0, 0, 0, 0, 0, 0, 0, 2090010, -1, 7, 1894.72, 1221.91, 8.87, 0, 0, 'The pyramid - wave 2: Sandfury Slave'),
(2090013, 10, 23, 10, 7787, 25000, 0, 0, 0, 0, 0, 0, 0, 2090011, -1, 7, 1886.93, 1221.4, 8.87, 0, 0, 'The pyramid - wave 2: Sandfury Slave'),
(2090013, 10, 24, 10, 8876, 25000, 0, 0, 0, 0, 0, 0, 0, 2090011, -1, 7, 1883.76, 1222.3, 8.87, 0, 0, 'The pyramid - wave 2: Sandfury Acolyte'),
(2090013, 10, 25, 10, 7788, 25000, 0, 0, 0, 0, 0, 0, 0, 2090011, -1, 7, 1889.94, 1212.21, 8.87, 0, 0, 'The pyramid - wave 2: Sandfury Drudge'),
(2090013, 10, 26, 10, 8877, 25000, 0, 0, 0, 0, 0, 0, 0, 2090011, -1, 7, 1899.63, 1202.52, 8.87, 0, 0, 'The pyramid - wave 2: Sandfury Zealot'),
(2090013, 10, 27, 37, 1, 5, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'The pyramid - wave 2 (1 = 5)'),
(2090014, 0, 0, 32, 209033, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'The pyramid - wave 2 on, or nothing'),
(2090014, 0, 1, 10, 7788, 25000, 0, 0, 0, 0, 0, 0, 0, 0, -1, 7, 1878.57, 1214.16, 8.87, 0, 0, 'The pyramid - wave 3: Sandfury Drudge'),
(2090014, 0, 2, 10, 7787, 25000, 0, 0, 0, 0, 0, 0, 0, 0, -1, 7, 1894.72, 1221.91, 8.87, 0, 0, 'The pyramid - wave 3: Sandfury Slave'),
(2090014, 0, 3, 10, 7787, 25000, 0, 0, 0, 0, 0, 0, 0, 0, -1, 7, 1886.93, 1221.4, 8.87, 0, 0, 'The pyramid - wave 3: Sandfury Slave'),
(2090014, 0, 4, 10, 8876, 25000, 0, 0, 0, 0, 0, 0, 0, 0, -1, 7, 1883.76, 1222.3, 8.87, 0, 0, 'The pyramid - wave 3: Sandfury Acolyte'),
(2090014, 0, 5, 10, 7788, 25000, 0, 0, 0, 0, 0, 0, 0, 0, -1, 7, 1889.94, 1212.21, 8.87, 0, 0, 'The pyramid - wave 3: Sandfury Drudge'),
(2090014, 0, 6, 10, 7275, 25000, 0, 0, 0, 0, 0, 0, 0, 0, -1, 7, 1889.23, 1207.72, 8.87, 0, 0, 'The pyramid - wave 3: Shadowpriest Sezz''ziz'),
(2090014, 0, 7, 10, 7796, 25000, 0, 0, 0, 0, 0, 0, 0, 0, -1, 7, 1879.77, 1207.96, 8.87, 0, 0, 'The pyramid - wave 3: Nekrum Gutchewer'),
(2090014, 0, 8, 37, 1, 6, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'The pyramid - wave 2 dead, wave 3 (1 = 6)'),
(2090014, 5, 9, 32, 209034, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'The pyramid - wave 3 still on, or nothing'),
(2090014, 5, 10, 3, 0, 0, 3, 2, 81555, 0, 9, 2, 5, 0, 0, 0, 1887.92, 1228.179, 9.98, 0, 1000, 'Sergeant Bly - walks to the foot of the stairs (point 5)'),
(2090014, 5, 11, 34, 0, 0, 0, 0, 81555, 0, 9, 2, 0, 0, 0, 0, 1887.92, 1228.179, 9.98, 4.78, 1000, 'Sergeant Bly - home to the foot of the stairs'),
(2090014, 5, 12, 3, 0, 0, 3, 2, 81556, 0, 9, 2, 5, 0, 0, 0, 1891.57, 1228.68, 9.69, 0, 1000, 'Murta Grimgut - walks to the foot of the stairs (point 5)'),
(2090014, 5, 13, 34, 0, 0, 0, 0, 81556, 0, 9, 2, 0, 0, 0, 0, 1891.57, 1228.68, 9.69, 4.78, 1000, 'Murta Grimgut - home to the foot of the stairs'),
(2090014, 5, 14, 3, 0, 0, 3, 2, 81554, 0, 9, 2, 5, 0, 0, 0, 1897.23, 1228.34, 9.43, 0, 1000, 'Oro Eyegouge - walks to the foot of the stairs (point 5)'),
(2090014, 5, 15, 34, 0, 0, 0, 0, 81554, 0, 9, 2, 0, 0, 0, 0, 1897.23, 1228.34, 9.43, 4.78, 1000, 'Oro Eyegouge - home to the foot of the stairs'),
(2090014, 5, 16, 3, 0, 0, 3, 2, 81557, 0, 9, 2, 5, 0, 0, 0, 1883.68, 1227.95, 9.543, 0, 1000, 'Raven - walks to the foot of the stairs (point 5)'),
(2090014, 5, 17, 34, 0, 0, 0, 0, 81557, 0, 9, 2, 0, 0, 0, 0, 1883.68, 1227.95, 9.543, 4.78, 1000, 'Raven - home to the foot of the stairs'),
(2090014, 5, 18, 3, 0, 0, 3, 2, 81553, 0, 9, 2, 5, 0, 0, 0, 1878.02, 1227.65, 9.485, 0, 1000, 'Weegli Blastfuse - walks to the foot of the stairs (point 5)'),
(2090014, 5, 19, 34, 0, 0, 0, 0, 81553, 0, 9, 2, 0, 0, 0, 0, 1878.02, 1227.65, 9.485, 4.78, 1000, 'Weegli Blastfuse - home to the foot of the stairs'),
(2090014, 5, 20, 37, 1, 7, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'The pyramid - the crew at the foot of the stairs (1 = 7)'),
(2090015, 0, 0, 32, 209050, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'The pyramid - wave 3 on and dead, or nothing'),
(2090015, 0, 1, 37, 1, 8, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'The pyramid - all the trolls dead (1 = 8)'),
(2090015, 0, 2, 3, 0, 0, 3, 2, 81555, 0, 9, 2, 6, 0, 0, 0, 1883.82, 1200.83, 8.87, 0, 1000, 'Sergeant Bly - walks to his place below (point 6)'),
(2090015, 0, 3, 34, 0, 0, 0, 0, 81555, 0, 9, 2, 0, 0, 0, 0, 1883.82, 1200.83, 8.87, 1.32, 1000, 'Sergeant Bly - home to his place below'),
(2090015, 0, 4, 3, 0, 0, 3, 2, 81556, 0, 9, 2, 6, 0, 0, 0, 1891.83, 1201.45, 8.87, 0, 1000, 'Murta Grimgut - walks to his place below (point 6)'),
(2090015, 0, 5, 34, 0, 0, 0, 0, 81556, 0, 9, 2, 0, 0, 0, 0, 1891.83, 1201.45, 8.87, 1.32, 1000, 'Murta Grimgut - home to his place below'),
(2090015, 0, 6, 3, 0, 0, 3, 2, 81554, 0, 9, 2, 6, 0, 0, 0, 1894.5, 1204.4, 8.87, 0, 1000, 'Oro Eyegouge - walks to his place below (point 6)'),
(2090015, 0, 7, 34, 0, 0, 0, 0, 81554, 0, 9, 2, 0, 0, 0, 0, 1894.5, 1204.4, 8.87, 1.32, 1000, 'Oro Eyegouge - home to his place below'),
(2090015, 0, 8, 3, 0, 0, 3, 2, 81557, 0, 9, 2, 6, 0, 0, 0, 1874.11, 1206.17, 8.87, 0, 1000, 'Raven - walks to his place below (point 6)'),
(2090015, 0, 9, 34, 0, 0, 0, 0, 81557, 0, 9, 2, 0, 0, 0, 0, 1874.11, 1206.17, 8.87, 1.32, 1000, 'Raven - home to his place below'),
(2090015, 0, 10, 3, 0, 0, 3, 2, 81553, 0, 9, 2, 6, 0, 0, 0, 1877.52, 1199.63, 8.87, 0, 1000, 'Weegli Blastfuse - walks to his place below (point 6)'),
(2090015, 0, 11, 34, 0, 0, 0, 0, 81553, 0, 9, 2, 0, 0, 0, 0, 1877.52, 1199.63, 8.87, 1.32, 1000, 'Weegli Blastfuse - home to his place below'),
(2090016, 0, 0, 32, 33004, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Farraki arena - Juthza on, or nothing'),
(2090016, 0, 1, 37, 5, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Farraki arena - Razjal (5 = 4)'),
(2090016, 0, 2, 22, 14, 3, 0, 0, 2589526, 0, 9, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Champion Razjal the Quick - hostile until the fight ends'),
(2090016, 0, 3, 0, 1, 0, 0, 0, 2589526, 0, 9, 2, 6249804, 0, 0, 0, 0, 0, 0, 0, 0, 'Champion Razjal the Quick - his line'),
(2090016, 0, 4, 49, 0, 0, 0, 0, 2589526, 0, 9, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Champion Razjal the Quick - the zone into the fight'),
(2090016, 0, 5, 26, 0, 0, 0, 0, 2589526, 0, 9, 3, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Champion Razjal the Quick - at the challenger'),
(2090017, 0, 0, 32, 209062, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Farraki arena - Kath''zen on, or nothing'),
(2090017, 0, 1, 37, 5, 3, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Farraki arena - Juthza (5 = 3)'),
(2090017, 0, 2, 22, 14, 3, 0, 0, 2589527, 0, 9, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Juthza the Cunning - hostile until the fight ends'),
(2090017, 0, 3, 0, 1, 0, 0, 0, 2589527, 0, 9, 2, 6249701, 0, 0, 0, 0, 0, 0, 0, 0, 'Juthza the Cunning - his line'),
(2090017, 0, 4, 49, 0, 0, 0, 0, 2589527, 0, 9, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Juthza the Cunning - the zone into the fight'),
(2090017, 0, 5, 26, 0, 0, 0, 0, 2589527, 0, 9, 3, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Juthza the Cunning - at the challenger'),
(2090017, 30, 6, 39, 2090016, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0, 0, 0, 0, 0, 0, 33004, 'Farraki arena - Razjal, 30 s on'),
(2090018, 0, 0, 22, 14, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Sandfury Scorpid - hostile'),
(2090018, 0, 1, 49, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Sandfury Scorpid - the zone into the fight'),
(2090019, 0, 0, 10, 62499, 120000, 0, 0, 0, 0, 0, 0, 0, 2090018, 1, 1, 1498.65, 1030.937, 11.6, 0, 0, 'Champion Razjal the Quick - a Sandfury Scorpid (1 of 4 places)'),
(2090020, 0, 0, 10, 62499, 120000, 0, 0, 0, 0, 0, 0, 0, 2090018, 1, 1, 1534.144, 1030.718, 11.826, 0, 0, 'Champion Razjal the Quick - a Sandfury Scorpid (2 of 4 places)'),
(2090021, 0, 0, 10, 62499, 120000, 0, 0, 0, 0, 0, 0, 0, 2090018, 1, 1, 1536.583, 1005.965, 11.6277, 0, 0, 'Champion Razjal the Quick - a Sandfury Scorpid (3 of 4 places)'),
(2090022, 0, 0, 10, 62499, 120000, 0, 0, 0, 0, 0, 0, 0, 2090018, 1, 1, 1499.567, 998.44, 11.756, 0, 0, 'Champion Razjal the Quick - a Sandfury Scorpid (4 of 4 places)'),
(2090023, 0, 0, 32, 209064, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Champion Razjal the Quick - fighting, or nothing'),
(2090023, 0, 1, 37, 5, 5, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Farraki arena - the sands (5 = 5)'),
(2090023, 0, 2, 15, 29230, 2, 0, 0, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Champion Razjal the Quick - Immune All'),
(2090024, 0, 4, 42, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Champion Razjal the Quick - no melee'),
(2090024, 0, 5, 43, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Champion Razjal the Quick - no chase'),
(2090024, 0, 6, 55, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Champion Razjal the Quick - no spells'),
(2090023, 0, 6, 59, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Champion Razjal the Quick - passive'),
(2090023, 0, 7, 6, 209, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1512.21, 1016.05, 11.678, 2.899, 0, 'Champion Razjal the Quick - to the middle'),
(2090023, 0, 8, 15, 13236, 2, 0, 0, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Champion Razjal the Quick - Nature Channeling'),
(2090023, 0, 9, 0, 1, 0, 0, 0, 0, 0, 0, 0, 6249805, 0, 0, 0, 0, 0, 0, 0, 0, 'Champion Razjal the Quick - "Be consumed by the sand!"'),
(2090023, 5, 10, 39, 2090019, 2090020, 2090021, 2090022, 0, 0, 0, 0, 25, 25, 25, 25, 0, 0, 0, 0, 209065, 'Champion Razjal the Quick - scorpid 1 of 10'),
(2090023, 7, 11, 39, 2090019, 2090020, 2090021, 2090022, 0, 0, 0, 0, 25, 25, 25, 25, 0, 0, 0, 0, 209065, 'Champion Razjal the Quick - scorpid 2 of 10'),
(2090023, 9, 12, 39, 2090019, 2090020, 2090021, 2090022, 0, 0, 0, 0, 25, 25, 25, 25, 0, 0, 0, 0, 209065, 'Champion Razjal the Quick - scorpid 3 of 10'),
(2090023, 11, 13, 39, 2090019, 2090020, 2090021, 2090022, 0, 0, 0, 0, 25, 25, 25, 25, 0, 0, 0, 0, 209065, 'Champion Razjal the Quick - scorpid 4 of 10'),
(2090023, 13, 14, 39, 2090019, 2090020, 2090021, 2090022, 0, 0, 0, 0, 25, 25, 25, 25, 0, 0, 0, 0, 209065, 'Champion Razjal the Quick - scorpid 5 of 10'),
(2090023, 15, 15, 39, 2090019, 2090020, 2090021, 2090022, 0, 0, 0, 0, 25, 25, 25, 25, 0, 0, 0, 0, 209065, 'Champion Razjal the Quick - scorpid 6 of 10'),
(2090023, 17, 16, 39, 2090019, 2090020, 2090021, 2090022, 0, 0, 0, 0, 25, 25, 25, 25, 0, 0, 0, 0, 209065, 'Champion Razjal the Quick - scorpid 7 of 10'),
(2090023, 19, 17, 39, 2090019, 2090020, 2090021, 2090022, 0, 0, 0, 0, 25, 25, 25, 25, 0, 0, 0, 0, 209065, 'Champion Razjal the Quick - scorpid 8 of 10'),
(2090023, 21, 18, 39, 2090019, 2090020, 2090021, 2090022, 0, 0, 0, 0, 25, 25, 25, 25, 0, 0, 0, 0, 209065, 'Champion Razjal the Quick - scorpid 9 of 10'),
(2090023, 23, 19, 39, 2090019, 2090020, 2090021, 2090022, 0, 0, 0, 0, 25, 25, 25, 25, 0, 0, 0, 0, 209065, 'Champion Razjal the Quick - scorpid 10 of 10'),
(2090023, 23, 20, 5, 0, 13236, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 209065, 'Champion Razjal the Quick - the channel ends'),
(2090023, 23, 21, 14, 13236, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 209065, 'Champion Razjal the Quick - Nature Channeling off'),
(2090023, 23, 22, 14, 29230, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 209065, 'Champion Razjal the Quick - Immune All off'),
(2090023, 23, 23, 59, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 209065, 'Champion Razjal the Quick - aggressive'),
(2090023, 23, 24, 42, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 209065, 'Champion Razjal the Quick - melee again'),
(2090023, 23, 25, 43, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 209065, 'Champion Razjal the Quick - chases again'),
(2090023, 23, 26, 55, 62498, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0, 0, 0, 0, 0, 0, 209065, 'Champion Razjal the Quick - his spells again'),
(2090023, 23, 27, 37, 5, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 209065, 'Farraki arena - the sands over (5 = 4)'),
(2090024, 0, 0, 32, 209064, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Champion Razjal the Quick - fighting, or nothing'),
(2090024, 0, 1, 44, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Champion Razjal the Quick - his Hellfire had (phase 1)'),
(2090024, 0, 2, 0, 1, 0, 0, 0, 0, 0, 0, 0, 6249806, 0, 0, 0, 0, 0, 0, 0, 0, 'Champion Razjal the Quick - "I am the only champion..."'),
(2090024, 0, 3, 5, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Champion Razjal the Quick - stops his casts'),
(2090024, 0, 4, 42, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Champion Razjal the Quick - no melee'),
(2090024, 0, 5, 43, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Champion Razjal the Quick - no chase'),
(2090024, 0, 6, 55, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Champion Razjal the Quick - no spells'),
(2090024, 1, 7, 15, 11682, 2, 0, 0, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Champion Razjal the Quick - Hellfire, tick 1 of 15'),
(2090024, 1, 8, 48, 208, 0, 0, 0, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Champion Razjal the Quick - Hellfire burns him too, tick 1'),
(2090024, 2, 9, 15, 11682, 2, 0, 0, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Champion Razjal the Quick - Hellfire, tick 2 of 15'),
(2090024, 2, 10, 48, 208, 0, 0, 0, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Champion Razjal the Quick - Hellfire burns him too, tick 2'),
(2090024, 3, 11, 15, 11682, 2, 0, 0, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Champion Razjal the Quick - Hellfire, tick 3 of 15'),
(2090024, 3, 12, 48, 208, 0, 0, 0, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Champion Razjal the Quick - Hellfire burns him too, tick 3'),
(2090024, 4, 13, 15, 11682, 2, 0, 0, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Champion Razjal the Quick - Hellfire, tick 4 of 15'),
(2090024, 4, 14, 48, 208, 0, 0, 0, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Champion Razjal the Quick - Hellfire burns him too, tick 4'),
(2090024, 5, 15, 15, 11682, 2, 0, 0, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Champion Razjal the Quick - Hellfire, tick 5 of 15'),
(2090024, 5, 16, 48, 208, 0, 0, 0, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Champion Razjal the Quick - Hellfire burns him too, tick 5'),
(2090024, 6, 17, 15, 11682, 2, 0, 0, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Champion Razjal the Quick - Hellfire, tick 6 of 15'),
(2090024, 6, 18, 48, 208, 0, 0, 0, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Champion Razjal the Quick - Hellfire burns him too, tick 6'),
(2090024, 7, 19, 15, 11682, 2, 0, 0, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Champion Razjal the Quick - Hellfire, tick 7 of 15'),
(2090024, 7, 20, 48, 208, 0, 0, 0, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Champion Razjal the Quick - Hellfire burns him too, tick 7'),
(2090024, 8, 21, 15, 11682, 2, 0, 0, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Champion Razjal the Quick - Hellfire, tick 8 of 15'),
(2090024, 8, 22, 48, 208, 0, 0, 0, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Champion Razjal the Quick - Hellfire burns him too, tick 8'),
(2090024, 9, 23, 15, 11682, 2, 0, 0, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Champion Razjal the Quick - Hellfire, tick 9 of 15'),
(2090024, 9, 24, 48, 208, 0, 0, 0, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Champion Razjal the Quick - Hellfire burns him too, tick 9'),
(2090024, 10, 25, 15, 11682, 2, 0, 0, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Champion Razjal the Quick - Hellfire, tick 10 of 15'),
(2090024, 10, 26, 48, 208, 0, 0, 0, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Champion Razjal the Quick - Hellfire burns him too, tick 10'),
(2090024, 11, 27, 15, 11682, 2, 0, 0, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Champion Razjal the Quick - Hellfire, tick 11 of 15'),
(2090024, 11, 28, 48, 208, 0, 0, 0, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Champion Razjal the Quick - Hellfire burns him too, tick 11'),
(2090024, 12, 29, 15, 11682, 2, 0, 0, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Champion Razjal the Quick - Hellfire, tick 12 of 15'),
(2090024, 12, 30, 48, 208, 0, 0, 0, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Champion Razjal the Quick - Hellfire burns him too, tick 12'),
(2090024, 13, 31, 15, 11682, 2, 0, 0, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Champion Razjal the Quick - Hellfire, tick 13 of 15'),
(2090024, 13, 32, 48, 208, 0, 0, 0, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Champion Razjal the Quick - Hellfire burns him too, tick 13'),
(2090024, 14, 33, 15, 11682, 2, 0, 0, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Champion Razjal the Quick - Hellfire, tick 14 of 15'),
(2090024, 14, 34, 48, 208, 0, 0, 0, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Champion Razjal the Quick - Hellfire burns him too, tick 14'),
(2090024, 15, 35, 15, 11682, 2, 0, 0, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Champion Razjal the Quick - Hellfire, tick 15 of 15'),
(2090024, 15, 36, 48, 208, 0, 0, 0, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Champion Razjal the Quick - Hellfire burns him too, tick 15'),
(2090024, 15, 37, 42, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Champion Razjal the Quick - melee again'),
(2090024, 15, 38, 43, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Champion Razjal the Quick - chases again'),
(2090024, 15, 39, 55, 62498, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0, 0, 0, 0, 0, 0, 0, 'Champion Razjal the Quick - his spells again'),
(2090025, 0, 0, 5, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Sandfury Scorpid - stops'),
(2090025, 0, 1, 73, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Sandfury Scorpid - out of the fight'),
(2090025, 0, 2, 33, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Sandfury Scorpid - back'),
(2090025, 0, 3, 18, 8000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Sandfury Scorpid - gone in 8 s'),
(2090026, 0, 0, 32, 209070, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Farraki arena - under way, or nothing'),
(2090026, 0, 1, 37, 5, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Farraki arena - back (5 = 0)'),
(2090026, 0, 2, 68, 2090025, 2, 62499, 150, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Farraki arena - the scorpids away'),
(2090026, 0, 3, 71, 1, 0, 0, 0, 2589528, 0, 9, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Kath''zen the Brutal - back as he was'),
(2090026, 0, 4, 71, 1, 0, 0, 0, 2589527, 0, 9, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Juthza the Cunning - back as he was'),
(2090026, 0, 5, 71, 1, 0, 0, 0, 2589526, 0, 9, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Champion Razjal the Quick - back as he was');

DELETE FROM `gameobject_scripts` WHERE `id` IN (27089, 27090, 27091, 27092, 27093, 27101, 27107, 27109, 27110, 27112, 27116, 27122, 27127, 27136);
INSERT INTO `gameobject_scripts`
(`id`, `delay`, `priority`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`)
VALUES
(27093, 0, 0, 39, 2090001, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0, 0, 0, 0, 0, 0, 230000, 'Troll Cage - opened: the crew freed'),
(27092, 0, 0, 39, 2090001, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0, 0, 0, 0, 0, 0, 230000, 'Troll Cage - opened: the crew freed'),
(27091, 0, 0, 39, 2090001, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0, 0, 0, 0, 0, 0, 230000, 'Troll Cage - opened: the crew freed'),
(27089, 0, 0, 39, 2090001, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0, 0, 0, 0, 0, 0, 230000, 'Troll Cage - opened: the crew freed'),
(27090, 0, 0, 39, 2090001, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0, 0, 0, 0, 0, 0, 230000, 'Troll Cage - opened: the crew freed'),
(27101, 0, 0, 39, 2090003, 2090004, 0, 0, 0, 0, 0, 0, 64, 10, 0, 0, 0, 0, 0, 0, 230000, 'Shallow Grave - opened: a zombie, a dead hero or nothing'),
(27107, 0, 0, 39, 2090003, 2090004, 0, 0, 0, 0, 0, 0, 64, 10, 0, 0, 0, 0, 0, 0, 230000, 'Shallow Grave - opened: a zombie, a dead hero or nothing'),
(27109, 0, 0, 39, 2090003, 2090004, 0, 0, 0, 0, 0, 0, 64, 10, 0, 0, 0, 0, 0, 0, 230000, 'Shallow Grave - opened: a zombie, a dead hero or nothing'),
(27110, 0, 0, 39, 2090003, 2090004, 0, 0, 0, 0, 0, 0, 64, 10, 0, 0, 0, 0, 0, 0, 230000, 'Shallow Grave - opened: a zombie, a dead hero or nothing'),
(27112, 0, 0, 39, 2090003, 2090004, 0, 0, 0, 0, 0, 0, 64, 10, 0, 0, 0, 0, 0, 0, 230000, 'Shallow Grave - opened: a zombie, a dead hero or nothing'),
(27116, 0, 0, 39, 2090003, 2090004, 0, 0, 0, 0, 0, 0, 64, 10, 0, 0, 0, 0, 0, 0, 230000, 'Shallow Grave - opened: a zombie, a dead hero or nothing'),
(27122, 0, 0, 39, 2090003, 2090004, 0, 0, 0, 0, 0, 0, 64, 10, 0, 0, 0, 0, 0, 0, 230000, 'Shallow Grave - opened: a zombie, a dead hero or nothing'),
(27127, 0, 0, 39, 2090003, 2090004, 0, 0, 0, 0, 0, 0, 64, 10, 0, 0, 0, 0, 0, 0, 230000, 'Shallow Grave - opened: a zombie, a dead hero or nothing'),
(27136, 0, 0, 39, 2090003, 2090004, 0, 0, 0, 0, 0, 0, 64, 10, 0, 0, 0, 0, 0, 0, 230000, 'Shallow Grave - opened: a zombie, a dead hero or nothing');

DELETE FROM `gossip_scripts` WHERE `id` IN (760401, 760701, 6249801);
INSERT INTO `gossip_scripts`
(`id`, `delay`, `priority`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`)
VALUES
(760701, 0, 0, 39, 2090002, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0, 0, 0, 0, 0, 0, 0, 'Weegli Blastfuse - off to the door'),
(760401, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 3882, 0, 0, 0, 0, 0, 0, 0, 0, 'Sergeant Bly - "What? How dare you say that to me?!?"'),
(760401, 5, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 3884, 0, 0, 0, 0, 0, 0, 0, 0, 'Sergeant Bly - "After all we''ve been through?..."'),
(760401, 10, 0, 22, 14, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Sergeant Bly - hostile'),
(760401, 10, 1, 26, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Sergeant Bly - at the player'),
(760401, 10, 2, 39, 2090002, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0, 0, 0, 0, 0, 0, 0, 'Weegli Blastfuse - off to the door'),
(760401, 10, 3, 0, 0, 0, 0, 0, 81553, 0, 9, 2, 3811, 0, 0, 0, 0, 0, 0, 0, 0, 'Weegli Blastfuse - "I''m out of here!"'),
(760401, 10, 4, 22, 14, 0, 0, 0, 81557, 0, 9, 2, 0, 0, 0, 0, 0, 0, 0, 0, 1000, 'Raven - hostile'),
(760401, 10, 5, 22, 14, 0, 0, 0, 81554, 0, 9, 2, 0, 0, 0, 0, 0, 0, 0, 0, 1000, 'Oro Eyegouge - hostile'),
(760401, 10, 6, 22, 14, 0, 0, 0, 81556, 0, 9, 2, 0, 0, 0, 0, 0, 0, 0, 0, 1000, 'Murta Grimgut - hostile'),
(6249801, 0, 0, 32, 209060, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Champion Razjal the Quick - the arena idle, or nothing'),
(6249801, 0, 1, 37, 5, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Farraki arena - the challenge (5 = 1)'),
(6249801, 0, 2, 4, 147, 1, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Champion Razjal the Quick - no more gossip'),
(6249801, 5, 3, 0, 1, 0, 0, 0, 0, 0, 0, 0, 6249803, 0, 0, 0, 0, 0, 0, 0, 9938, 'Champion Razjal the Quick - "You challenge me?..."'),
(6249801, 5, 4, 37, 5, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 9938, 'Farraki arena - Kath''zen (5 = 2)'),
(6249801, 13, 5, 22, 14, 3, 0, 0, 2589528, 0, 9, 2, 0, 0, 0, 0, 0, 0, 0, 0, 209062, 'Kath''zen the Brutal - hostile until the fight ends'),
(6249801, 13, 6, 0, 1, 0, 0, 0, 2589528, 0, 9, 2, 6249601, 0, 0, 0, 0, 0, 0, 0, 209062, 'Kath''zen the Brutal - his line'),
(6249801, 13, 7, 49, 0, 0, 0, 0, 2589528, 0, 9, 2, 0, 0, 0, 0, 0, 0, 0, 0, 209062, 'Kath''zen the Brutal - the zone into the fight'),
(6249801, 13, 8, 26, 0, 0, 0, 0, 2589528, 0, 9, 3, 0, 0, 0, 0, 0, 0, 0, 0, 209062, 'Kath''zen the Brutal - at the challenger'),
(6249801, 43, 9, 39, 2090017, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0, 0, 0, 0, 0, 0, 209062, 'Farraki arena - Juthza, 30 s on');

DELETE FROM `gossip_menu` WHERE `entry` = 760700 AND `text_id` = 1511;
INSERT INTO `gossip_menu`
(`entry`, `text_id`, `script_id`, `condition_id`)
VALUES
(760700, 1511, 0, 209001);

DELETE FROM `gossip_menu` WHERE `entry` = 760700 AND `text_id` = 1513;
INSERT INTO `gossip_menu`
(`entry`, `text_id`, `script_id`, `condition_id`)
VALUES
(760700, 1513, 0, 209005);

DELETE FROM `gossip_menu` WHERE `entry` = 760700 AND `text_id` = 1514;
INSERT INTO `gossip_menu`
(`entry`, `text_id`, `script_id`, `condition_id`)
VALUES
(760700, 1514, 0, 209004);

DELETE FROM `gossip_menu_option` WHERE `menu_id` = 760700 AND `id` = 0;
INSERT INTO `gossip_menu_option`
(`menu_id`, `id`, `option_icon`, `option_text`, `option_broadcast_text`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `box_broadcast_text`, `condition_id`)
VALUES
(760700, 0, 0, 'Will you blow up that door now?', 3805, 1, 1, -1, 0, 760701, 0, 0, NULL, 0, 209004);

DELETE FROM `gossip_menu` WHERE `entry` = 760400 AND `text_id` = 1515;
INSERT INTO `gossip_menu`
(`entry`, `text_id`, `script_id`, `condition_id`)
VALUES
(760400, 1515, 0, 209001);

DELETE FROM `gossip_menu` WHERE `entry` = 760400 AND `text_id` = 1516;
INSERT INTO `gossip_menu`
(`entry`, `text_id`, `script_id`, `condition_id`)
VALUES
(760400, 1516, 0, 209005);

DELETE FROM `gossip_menu` WHERE `entry` = 760400 AND `text_id` = 1517;
INSERT INTO `gossip_menu`
(`entry`, `text_id`, `script_id`, `condition_id`)
VALUES
(760400, 1517, 0, 209004);

DELETE FROM `gossip_menu_option` WHERE `menu_id` = 760400 AND `id` = 0;
INSERT INTO `gossip_menu_option`
(`menu_id`, `id`, `option_icon`, `option_text`, `option_broadcast_text`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `box_broadcast_text`, `condition_id`)
VALUES
(760400, 0, 0, 'That''s it! I''m tired of helping you out.  It''s time we settled things on the battlefield!', 4165, 1, 1, -1, 0, 760401, 0, 0, NULL, 0, 209004);

DELETE FROM `areatrigger_generic_script` WHERE `trigger_id` = 962 AND `script_id` = 2090005;
INSERT INTO `areatrigger_generic_script`
(`trigger_id`, `script_id`, `condition_id`, `flags`, `comment`)
VALUES
(962, 2090005, 209020, 1, 'Zum''rah''s sanctum: the witch doctor turns on the first player near, alive');

-- A gameobject's state as it spawns (AC3; the table from ac3_gameobject_spawn_state_whole.sql).
DELETE FROM `gameobject_spawn_state` WHERE `guid` = 27086 AND `ord` = 0;
INSERT INTO `gameobject_spawn_state`
(`guid`, `ord`, `condition_id`, `state`, `flags_set`, `flags_clear`, `despawn`, `script_id`, `comment`)
VALUES
(27086, 0, 532003, 2, 0, 0, 0, 0, 'the end door: broken once Weegli''s charge went off');

-- The generic store's slots (AC7; the table from ac7_instance_data_slot.sql).
DELETE FROM `instance_data_slot` WHERE `map` = 209 AND `slot` = 1;
DELETE FROM `instance_data_slot` WHERE `map` = 209 AND `slot` = 2;
DELETE FROM `instance_data_slot` WHERE `map` = 209 AND `slot` = 3;
DELETE FROM `instance_data_slot` WHERE `map` = 209 AND `slot` = 4;
DELETE FROM `instance_data_slot` WHERE `map` = 209 AND `slot` = 5;
DELETE FROM `instance_data_slot` WHERE `map` = 209 AND `slot` = 6;
INSERT INTO `instance_data_slot`
(`map`, `slot`, `flags`, `name`)
VALUES
(209, 1, 4, 'the pyramid''s phase (0-8)'),
(209, 2, 4, 'Gahz''rilla summoned (1)'),
(209, 3, 0, 'the end door broken (3)'),
(209, 4, 4, 'Zum''rah hostile (1)'),
(209, 5, 4, 'the Farraki arena''s phase (0-5)'),
(209, 6, 4, 'the rows drive the pyramid (1)');

