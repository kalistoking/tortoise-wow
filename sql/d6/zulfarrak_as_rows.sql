-- Zul'Farrak (map 209), the pyramid's crew, the graves and Zum'rah: its C++ as rows -- EPIC10 tier 2.
-- Written by the trt repo's scripts/tier2/a37_zulfarrak.py from t1_world; zulfarrak_restore.sql puts
-- back what this replaces. R8: a person applies it, into the world database.
--
-- The C++ keeps its script names: mod-zulfarrak is the switch (AM1, handoff/manager-091).
-- Loaded, the C++ runs as before -- a script found by name comes first. Unloaded
-- (`module unload mod-zulfarrak`, which gives every creature standing a new AI at once),
-- the names find no script and the creatures run these rows (their ai_name).
--
-- Map 209 keeps instance_zulfarrak, the Farraki arena, the Ward of Zum'rah and the Tablet of Theka (the core).
-- A grave opened again within 30 s does not raise a second creature there; after that it may (the C++ counted
-- its uses). Weegli shoots at a victim 5 yd off or more every 2 s (the C++: when his swing was ready and out of
-- reach); the charge lasts a day (the C++: never despawned). The crew's combat start positions are not set.

UPDATE `creature_template` SET `ai_name` = 'EventAI', `gossip_menu_id` = 760400 WHERE `entry` = 7604;
UPDATE `creature_template` SET `ai_name` = 'EventAI', `gossip_menu_id` = 760700 WHERE `entry` = 7607;

DELETE FROM `conditions` WHERE `condition_entry` IN (209001, 209004, 209005, 209006, 209007, 209009, 209012, 209020, 209021, 209022);
INSERT INTO `conditions`
(`condition_entry`, `type`, `value1`, `value2`, `value3`, `value4`, `flags`)
VALUES
(209001, 34, 1, 0, 0, 0, 0),
(209004, 34, 1, 8, 0, 0, 0),
(209006, 34, 1, 0, 0, 0, 1),
(209007, 34, 1, 8, 0, 0, 1),
(209005, -1, 209006, 209007, 0, 0, 0),
(209009, -1, 1000, 999, 0, 0, 0),
(209012, 38, 5, 1, 0, 0, 0),
(209021, 20, 7271, 30, 0, 0, 0),
(209022, 34, 4, 0, 0, 0, 0),
(209020, -1, 209021, 209022, 0, 0, 0);

-- Conditions another tier-2 migration writes too, under the same entry: whichever comes first.
INSERT IGNORE INTO `conditions`
(`condition_entry`, `type`, `value1`, `value2`, `value3`, `value4`, `flags`)
VALUES
(230000, 62, 0, 0, 0, 0, 1),
(129001, 34, 1, 1, 0, 0, 0),
(532001, 34, 1, 3, 0, 0, 0);

DELETE FROM `creature_ai_events` WHERE `id` IN (760401, 760402, 760701, 760702, 760703, 760704, 760705, 760706, 760711, 760712, 760713);
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
(760402, 7604, 0, 0, 0, 100, 1, 8000, 8000, 10000, 10000, 760402, 0, 0, 'Sergeant Bly - Revenge');

DELETE FROM `creature_ai_scripts` WHERE `id` IN (760401, 760402, 760701, 760702, 760703, 760704, 760705, 760706, 760711, 760712, 760713);
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
(760402, 0, 0, 15, 12170, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Sergeant Bly - Revenge');

DELETE FROM `generic_scripts` WHERE `id` IN (2090001, 2090002, 2090003, 2090004, 2090005);
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
(2090005, 0, 2, 0, 0, 0, 0, 0, 7271, 30, 8, 2, 3622, 0, 0, 0, 0, 0, 0, 0, 0, 'Witch Doctor Zum''rah - "How dare you enter my sanctum!"');

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

DELETE FROM `gossip_scripts` WHERE `id` IN (760401, 760701);
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
(760401, 10, 6, 22, 14, 0, 0, 0, 81556, 0, 9, 2, 0, 0, 0, 0, 0, 0, 0, 0, 1000, 'Murta Grimgut - hostile');

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

