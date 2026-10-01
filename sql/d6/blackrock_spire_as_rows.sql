-- Blackrock Spire (map 229), its bosses and the Blackhand trash: its C++ as rows -- EPIC10 tier 2.
-- Written by the trt repo's scripts/tier2/a18_blackrock_spire.py from t1_world; blackrock_spire_restore.sql puts
-- back what this replaces. R8: a person applies it, into the world database.
--
-- The C++ keeps its script names: mod-blackrock-spire is the switch (AM1, handoff/manager-091).
-- Loaded, the C++ runs as before -- a script found by name comes first. Unloaded
-- (`module unload mod-blackrock-spire`, which gives every creature standing a new AI at once),
-- the names find no script and the creatures run these rows (their ai_name).
--
-- Map 229 keeps instance_blackrock_spire, Pyroguard Emberseer and Urok's challenge (the core). The Blackhand
-- Veteran's own EventAI rules (981901-981904, flee at 15%) were dead under the C++ and are taken away, the
-- restore puts them back. The bosses' height leashes (evading above or below their floor) are gone: the
-- core's own leash stays. The Veteran's Shield Bash goes at his victim while it casts, one time in four (the
-- C++ looked for any caster among his attackers); the Summoner's summon timer re-arms whether the cast took.
-- Voone's axes come back as he evades (the C++ never gave them back).

UPDATE `creature_template` SET `ai_name` = 'EventAI' WHERE `entry` = 9196;
UPDATE `creature_template` SET `ai_name` = 'EventAI' WHERE `entry` = 9236;
UPDATE `creature_template` SET `ai_name` = 'EventAI' WHERE `entry` = 9237;
UPDATE `creature_template` SET `ai_name` = 'EventAI' WHERE `entry` = 9568;
UPDATE `creature_template` SET `ai_name` = 'EventAI' WHERE `entry` = 9736;
UPDATE `creature_template` SET `ai_name` = 'EventAI' WHERE `entry` = 9818;
UPDATE `creature_template` SET `ai_name` = 'EventAI' WHERE `entry` = 9819;
UPDATE `creature_template` SET `ai_name` = 'EventAI' WHERE `entry` = 10220;
UPDATE `creature_template` SET `ai_name` = 'EventAI' WHERE `entry` = 10430;

DELETE FROM `conditions` WHERE `condition_entry` IN (229000, 229010);
INSERT INTO `conditions`
(`condition_entry`, `type`, `value1`, `value2`, `value3`, `value4`, `flags`)
VALUES
(229000, 1, 16076, 0, 0, 0, 3),
(229010, 38, 10, 2, 0, 0, 0);

DELETE FROM `broadcast_text` WHERE `entry` IN (229101, 229102);
INSERT INTO `broadcast_text`
(`entry`, `male_text`, `female_text`, `chat_type`, `sound_id`, `language_id`, `emote_id1`, `emote_id2`, `emote_id3`, `emote_delay1`, `emote_delay2`, `emote_delay3`)
VALUES
(229101, '%s begins to summon in a Blackhand Dreadweaver!', '%s begins to summon in a Blackhand Dreadweaver!', 2, 0, 0, 0, 0, 0, 0, 0, 0),
(229102, '%s begins to summon in a Blackhand Veteran!', '%s begins to summon in a Blackhand Veteran!', 2, 0, 0, 0, 0, 0, 0, 0, 0);

-- Existing rows taken away: the restore puts them back.
DELETE FROM `creature_ai_events` WHERE `id` = 981901;
DELETE FROM `creature_ai_scripts` WHERE `id` = 981901;
DELETE FROM `creature_ai_events` WHERE `id` = 981902;
DELETE FROM `creature_ai_scripts` WHERE `id` = 981902;
DELETE FROM `creature_ai_events` WHERE `id` = 981903;
DELETE FROM `creature_ai_scripts` WHERE `id` = 981903;
DELETE FROM `creature_ai_events` WHERE `id` = 981904;
DELETE FROM `creature_ai_scripts` WHERE `id` = 981904;
DELETE FROM `creature_ai_events` WHERE `id` IN (919601, 919602, 919603, 919604, 919605, 919606, 923601, 923602, 923603, 923701, 923702, 923703, 923704, 923705, 923711, 923712, 923713, 923714, 956801, 956802, 956803, 956804, 956811, 973601, 973602, 981801, 981802, 981803, 981811, 981911, 981921, 981922, 981923, 981924, 1022001, 1022002, 1022011, 1043001, 1043002, 1043003, 1043004, 1043005, 1043011, 1043012, 1043021, 1043022, 1043023, 1043024);
INSERT INTO `creature_ai_events`
(`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`)
VALUES
(1022001, 10220, 0, 0, 0, 100, 1, 8000, 8000, 14000, 14000, 1022001, 0, 0, 'Halycon - Crowd Pummel'),
(1022002, 10220, 0, 0, 0, 100, 1, 14000, 14000, 10000, 10000, 1022002, 0, 0, 'Halycon - Mighty Blow'),
(919601, 9196, 0, 0, 0, 100, 1, 15000, 15000, 14000, 14000, 919601, 0, 0, 'Highlord Omokk - War Stomp'),
(919602, 9196, 0, 0, 0, 100, 1, 10000, 10000, 10000, 10000, 919602, 0, 0, 'Highlord Omokk - Strike'),
(919603, 9196, 0, 0, 0, 100, 1, 14000, 14000, 18000, 18000, 919603, 0, 0, 'Highlord Omokk - Rend'),
(919604, 9196, 0, 0, 0, 100, 1, 2000, 2000, 25000, 25000, 919604, 0, 0, 'Highlord Omokk - Sunder Armor'),
(919605, 9196, 0, 0, 0, 100, 1, 18000, 18000, 12000, 12000, 919605, 0, 0, 'Highlord Omokk - Knock Away'),
(919606, 9196, 0, 0, 0, 100, 1, 24000, 24000, 18000, 18000, 919606, 0, 0, 'Highlord Omokk - Slow'),
(956801, 9568, 0, 0, 0, 100, 1, 20000, 20000, 20000, 20000, 956801, 0, 0, 'Overlord Wyrmthalak - Blast Wave'),
(956802, 9568, 0, 0, 0, 100, 1, 2000, 2000, 10000, 10000, 956802, 0, 0, 'Overlord Wyrmthalak - Shout'),
(956803, 9568, 0, 0, 0, 100, 1, 6000, 6000, 7000, 7000, 956803, 0, 0, 'Overlord Wyrmthalak - Cleave'),
(956804, 9568, 0, 0, 0, 100, 1, 12000, 12000, 14000, 14000, 956804, 0, 0, 'Overlord Wyrmthalak - Knock Away'),
(973601, 9736, 0, 0, 0, 100, 1, 1000, 1000, 1750, 1750, 973601, 0, 0, 'Quartermaster Zigris - Shoot'),
(973602, 9736, 0, 0, 0, 100, 1, 16000, 16000, 14000, 14000, 973602, 0, 0, 'Quartermaster Zigris - Stun Bomb'),
(923601, 9236, 0, 0, 0, 100, 1, 2000, 2000, 45000, 45000, 923601, 0, 0, 'Shadow Hunter Vosh''gajin - Curse of Blood'),
(923602, 9236, 0, 0, 0, 100, 1, 8000, 8000, 15000, 15000, 923602, 0, 0, 'Shadow Hunter Vosh''gajin - Hex'),
(923603, 9236, 0, 0, 0, 100, 1, 14000, 14000, 7000, 7000, 923603, 0, 0, 'Shadow Hunter Vosh''gajin - Cleave'),
(1043001, 10430, 0, 0, 0, 100, 9, 8000, 12000, 14000, 20000, 1043001, 0, 0, 'The Beast - Flamebreak'),
(1043002, 10430, 0, 0, 0, 100, 9, 13000, 13000, 16000, 18000, 1043002, 0, 0, 'The Beast - Terrifying Roar'),
(1043003, 10430, 0, 0, 0, 100, 9, 15000, 20000, 15000, 20000, 1043003, 0, 0, 'The Beast - Berserker Charge at an attacker but the first'),
(1043004, 10430, 0, 0, 0, 100, 9, 10000, 10000, 10000, 12000, 1043004, 0, 0, 'The Beast - Fireball at an attacker but the first'),
(1043005, 10430, 0, 0, 0, 100, 9, 8000, 11000, 14000, 20000, 1043005, 0, 0, 'The Beast - Fire Blast'),
(923701, 9237, 0, 0, 0, 100, 1, 8000, 8000, 6000, 6000, 923701, 0, 0, 'Warmaster Voone - Snap Kick'),
(923702, 9237, 0, 0, 0, 100, 1, 14000, 14000, 12000, 12000, 923702, 0, 0, 'Warmaster Voone - Cleave'),
(923703, 9237, 0, 0, 0, 100, 1, 20000, 20000, 14000, 14000, 923703, 0, 0, 'Warmaster Voone - Uppercut'),
(923704, 9237, 0, 0, 0, 100, 1, 12000, 12000, 10000, 10000, 923704, 0, 0, 'Warmaster Voone - Mortal Strike'),
(923705, 9237, 0, 0, 0, 100, 1, 32000, 32000, 16000, 16000, 923705, 0, 0, 'Warmaster Voone - Pummel'),
(1022011, 10220, 0, 6, 0, 100, 0, 0, 0, 0, 0, 1022011, 0, 0, 'Halycon - dead: her growl, Gizrul the Slavener'),
(956811, 9568, 0, 2, 0, 100, 0, 50, 0, 0, 0, 956811, 0, 0, 'Overlord Wyrmthalak - under half health: a warlord and a berserker'),
(1043011, 10430, 0, 27, 0, 100, 1, 15506, 1, 1000, 1000, 1043011, 0, 0, 'The Beast - his aura (15506) kept up'),
(1043012, 10430, 0, 4, 0, 100, 0, 0, 0, 0, 0, 1043012, 0, 0, 'The Beast - aggro: Berserker Charge at his victim'),
(1043021, 10430, 0, 8, 0, 100, 1, 8613, -1, 0, 0, 1043021, 0, 0, 'The Beast - skinned (8613): "Finkle is Einhorn" on the skinner'),
(1043022, 10430, 0, 8, 0, 100, 1, 8617, -1, 0, 0, 1043022, 0, 0, 'The Beast - skinned (8617): "Finkle is Einhorn" on the skinner'),
(1043023, 10430, 0, 8, 0, 100, 1, 8618, -1, 0, 0, 1043023, 0, 0, 'The Beast - skinned (8618): "Finkle is Einhorn" on the skinner'),
(1043024, 10430, 0, 8, 0, 100, 1, 10768, -1, 0, 0, 1043024, 0, 0, 'The Beast - skinned (10768): "Finkle is Einhorn" on the skinner'),
(923711, 9237, 229000, 0, 0, 100, 9, 10000, 30000, 5000, 15000, 923711, 0, 0, 'Warmaster Voone - Throw Axe while he holds an axe'),
(923712, 9237, 0, 36, 6, 100, 1, 16075, 0, 0, 0, 923712, 0, 0, 'Warmaster Voone - the first axe thrown: one hand empty'),
(923713, 9237, 0, 36, 5, 100, 1, 16075, 0, 0, 0, 923713, 0, 0, 'Warmaster Voone - the second axe thrown: unarmed'),
(923714, 9237, 0, 7, 0, 100, 0, 0, 0, 0, 0, 923714, 0, 0, 'Warmaster Voone - evading: his axes back'),
(981811, 9818, 0, 6, 0, 100, 0, 0, 0, 0, 0, 981811, 0, 0, 'Blackhand Summoner - dead: his guid to the room event (0)'),
(981911, 9819, 0, 6, 0, 100, 0, 0, 0, 0, 0, 981911, 0, 0, 'Blackhand Veteran - dead: his guid to the room event (0)'),
(981801, 9818, 0, 0, 0, 100, 5, 0, 0, 15000, 15000, 981801, 0, 0, 'Blackhand Summoner - a Dreadweaver or a Veteran'),
(981802, 9818, 0, 0, 0, 100, 13, 7000, 7000, 6000, 6000, 981802, 0, 0, 'Blackhand Summoner - Fireball'),
(981803, 9818, 229010, 0, 0, 100, 13, 10000, 10000, 6000, 6000, 981803, 0, 0, 'Blackhand Summoner - Frost Nova with his victim within 10 yd'),
(981921, 9819, 0, 4, 0, 100, 0, 0, 0, 0, 0, 981921, 0, 0, 'Blackhand Veteran - aggro: Shield Charge at his victim'),
(981922, 9819, 0, 0, 0, 100, 9, 8000, 14000, 8000, 14000, 981922, 0, 0, 'Blackhand Veteran - Shield Charge at a random attacker'),
(981923, 9819, 0, 13, 0, 25, 9, 10000, 10000, 0, 0, 981923, 0, 0, 'Blackhand Veteran - Shield Bash his casting victim, one time in four'),
(981924, 9819, 0, 0, 0, 100, 9, 5000, 5000, 6000, 6000, 981924, 0, 0, 'Blackhand Veteran - Strike at a random attacker');

DELETE FROM `creature_ai_scripts` WHERE `id` IN (919601, 919602, 919603, 919604, 919605, 919606, 923601, 923602, 923603, 923701, 923702, 923703, 923704, 923705, 923711, 923712, 923713, 923714, 956801, 956802, 956803, 956804, 956811, 973601, 973602, 981801, 981802, 981803, 981811, 981911, 981921, 981922, 981923, 981924, 1022001, 1022002, 1022011, 1043001, 1043002, 1043003, 1043004, 1043005, 1043011, 1043012, 1043021, 1043022, 1043023, 1043024);
INSERT INTO `creature_ai_scripts`
(`id`, `delay`, `priority`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`)
VALUES
(1022001, 0, 0, 15, 10887, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Halycon - Crowd Pummel'),
(1022002, 0, 0, 15, 14099, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Halycon - Mighty Blow'),
(919601, 0, 0, 15, 24375, 0, 0, 0, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Highlord Omokk - War Stomp'),
(919602, 0, 0, 15, 18368, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Highlord Omokk - Strike'),
(919603, 0, 0, 15, 18106, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Highlord Omokk - Rend'),
(919604, 0, 0, 15, 24317, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Highlord Omokk - Sunder Armor'),
(919605, 0, 0, 15, 20686, 0, 0, 0, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Highlord Omokk - Knock Away'),
(919606, 0, 0, 15, 22356, 0, 0, 0, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Highlord Omokk - Slow'),
(956801, 0, 0, 15, 11130, 0, 0, 0, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Overlord Wyrmthalak - Blast Wave'),
(956802, 0, 0, 15, 23511, 0, 0, 0, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Overlord Wyrmthalak - Shout'),
(956803, 0, 0, 15, 20691, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Overlord Wyrmthalak - Cleave'),
(956804, 0, 0, 15, 20686, 0, 0, 0, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Overlord Wyrmthalak - Knock Away'),
(973601, 0, 0, 15, 16496, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Quartermaster Zigris - Shoot'),
(973602, 0, 0, 15, 16497, 0, 0, 0, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Quartermaster Zigris - Stun Bomb'),
(923601, 0, 0, 15, 24673, 0, 0, 0, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Shadow Hunter Vosh''gajin - Curse of Blood'),
(923602, 0, 0, 15, 16708, 0, 0, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Shadow Hunter Vosh''gajin - Hex'),
(923603, 0, 0, 15, 20691, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Shadow Hunter Vosh''gajin - Cleave'),
(1043001, 0, 0, 15, 16785, 0, 0, 0, 0, 0, 0, 12, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'The Beast - Flamebreak'),
(1043002, 0, 0, 15, 14100, 0, 0, 0, 0, 0, 0, 12, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'The Beast - Terrifying Roar'),
(1043003, 0, 0, 15, 16636, 0, 0, 0, 0, 0, 5, 8, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'The Beast - Berserker Charge at an attacker but the first'),
(1043004, 0, 0, 15, 16788, 0, 0, 0, 0, 0, 5, 8, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'The Beast - Fireball at an attacker but the first'),
(1043005, 0, 0, 15, 14144, 0, 0, 0, 0, 0, 1, 8, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'The Beast - Fire Blast'),
(923701, 0, 0, 15, 15618, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Warmaster Voone - Snap Kick'),
(923702, 0, 0, 15, 15284, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Warmaster Voone - Cleave'),
(923703, 0, 0, 15, 10966, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Warmaster Voone - Uppercut'),
(923704, 0, 0, 15, 15708, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Warmaster Voone - Mortal Strike'),
(923705, 0, 0, 15, 15615, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Warmaster Voone - Pummel'),
(1022011, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0, 5548, 0, 0, 0, 0, 0, 0, 0, 0, 'Halycon - "%s lets loose a guttural growl..."'),
(1022011, 0, 1, 10, 10268, 0, 0, 0, 0, 0, 0, 0, 0, 2290001, -1, 7, -167.58, -382.41, 64.401, 1.563, 0, 'Halycon - Gizrul the Slavener'),
(956811, 0, 0, 10, 9216, 10000, 0, 0, 0, 0, 0, 0, 0, 0, 4, 4, -39.355381, -513.456482, 88.472046, 4.679872, 0, 'Overlord Wyrmthalak - a Spirestone Warlord'),
(956811, 0, 1, 10, 9268, 10000, 0, 0, 0, 0, 0, 0, 0, 0, 4, 4, -49.875881, -511.896942, 88.19516, 4.613114, 0, 'Overlord Wyrmthalak - a Smolderthorn Berserker'),
(1043011, 0, 0, 15, 15506, 2, 0, 0, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'The Beast - his aura'),
(1043012, 0, 0, 15, 16636, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'The Beast - Berserker Charge at his victim'),
(1043021, 0, 0, 15, 16710, 2, 0, 0, 0, 0, 0, 6, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'The Beast - the skinner casts Finkle is Einhorn on himself'),
(1043022, 0, 0, 15, 16710, 2, 0, 0, 0, 0, 0, 6, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'The Beast - the skinner casts Finkle is Einhorn on himself'),
(1043023, 0, 0, 15, 16710, 2, 0, 0, 0, 0, 0, 6, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'The Beast - the skinner casts Finkle is Einhorn on himself'),
(1043024, 0, 0, 15, 16710, 2, 0, 0, 0, 0, 0, 6, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'The Beast - the skinner casts Finkle is Einhorn on himself'),
(923711, 0, 0, 15, 16075, 0, 0, 0, 0, 0, 1, 8, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Warmaster Voone - Throw Axe while he holds an axe'),
(923712, 0, 0, 19, 0, 0, 0, 0, 0, 0, 0, 0, 12348, 0, -1, 0, 0, 0, 0, 0, 0, 'Warmaster Voone - the main hand axe, the off hand empty'),
(923712, 0, 1, 44, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Warmaster Voone - phase 1'),
(923713, 0, 0, 19, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, -1, 0, 0, 0, 0, 0, 0, 'Warmaster Voone - both hands empty'),
(923713, 0, 1, 15, 16076, 2, 0, 0, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Warmaster Voone - Unarmed'),
(923713, 0, 2, 44, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Warmaster Voone - phase 2'),
(923714, 0, 0, 19, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Warmaster Voone - his own equipment'),
(981811, 0, 0, 38, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Blackhand Summoner - off his room''s list'),
(981911, 0, 0, 38, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Blackhand Veteran - off his room''s list'),
(981801, 0, 0, 39, 2290002, 2290003, 0, 0, 0, 0, 0, 0, 50, 50, 0, 0, 0, 0, 0, 0, 0, 'Blackhand Summoner - one of the two'),
(981802, 0, 0, 15, 12466, 0, 0, 0, 0, 0, 4, 8, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Blackhand Summoner - Fireball'),
(981803, 0, 0, 15, 15532, 0, 0, 0, 0, 0, 1, 8, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Blackhand Summoner - Frost Nova with his victim within 10 yd'),
(981921, 0, 0, 15, 15749, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Blackhand Veteran - Shield Charge at his victim'),
(981922, 0, 0, 15, 15749, 0, 0, 0, 0, 0, 4, 8, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Blackhand Veteran - Shield Charge at a random attacker'),
(981923, 0, 0, 15, 11972, 0, 0, 0, 0, 0, 1, 8, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Blackhand Veteran - Shield Bash'),
(981924, 0, 0, 15, 14516, 0, 0, 0, 0, 0, 4, 8, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Blackhand Veteran - Strike at a random attacker');

DELETE FROM `generic_scripts` WHERE `id` IN (2290001, 2290002, 2290003);
INSERT INTO `generic_scripts`
(`id`, `delay`, `priority`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`)
VALUES
(2290001, 0, 0, 34, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, -172.633, -324.253, 64.401, 4.74, 0, 'Gizrul the Slavener - his home'),
(2290001, 0, 1, 49, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Gizrul the Slavener - into the fight'),
(2290002, 0, 0, 15, 15794, 0, 0, 0, 0, 0, 4, 8, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Blackhand Summoner - Summon Blackhand Dreadweaver'),
(2290002, 0, 1, 0, 2, 0, 0, 0, 0, 0, 0, 0, 229101, 0, 0, 0, 0, 0, 0, 0, 0, 'Blackhand Summoner - "%s begins to summon in a Blackhand Dreadweaver!"'),
(2290003, 0, 0, 15, 15792, 0, 0, 0, 0, 0, 4, 8, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Blackhand Summoner - Summon Blackhand Veteran'),
(2290003, 0, 1, 0, 2, 0, 0, 0, 0, 0, 0, 0, 229102, 0, 0, 0, 0, 0, 0, 0, 0, 'Blackhand Summoner - "%s begins to summon in a Blackhand Veteran!"');

