-- Blackrock Spire (map 229), its bosses and the Blackhand trash: its C++ as rows -- EPIC10 tier 2.
-- Written by the trt repo's scripts/tier2/a18_blackrock_spire.py from d6_world; blackrock_spire_restore.sql puts
-- back what this replaces. R8: a person applies it, into the world database.
--
-- The C++ keeps its script names: mod-blackrock-spire is the switch (AM1, handoff/manager-091).
-- Loaded, the C++ runs as before -- a script found by name comes first. Unloaded
-- (`module unload mod-blackrock-spire`, which gives every creature standing a new AI at once),
-- the names find no script and the creatures run these rows (their ai_name).
--
-- The Blackhand
-- Veteran's own EventAI rules (981901-981904, flee at 15%) were dead under the C++ and are taken away, the
-- restore puts them back. The bosses' height leashes (evading above or below their floor) are gone: the
-- core's own leash stays. The Veteran's Shield Bash goes at his victim while it casts, one time in four (the
-- C++ looked for any caster among his attackers); the Summoner's summon timer re-arms whether the cast took.
-- Voone's axes come back as he evades (the C++ never gave them back).
-- Second pass: Pyroguard Emberseer. The freed incarcerators go into the fight with the whole zone (the C++
-- sent each at a random one of the altar's users); Emberseer, freed, joins the zone's fight (the C++
-- attacked the players within 50 yd). The altar's own row for event 4884, a second Emberseer summoned at
-- his place, never ran under the C++ and is taken away; the restore puts it back.
-- Third pass: the instance and Urok's challenge. A room is cleared as its whole group dies, Dreadweavers
-- included (the C++ counted the summoners and veterans it had sorted to the nearest rune). Slots 7, 8, 9
-- and 20 are transient: a server restart forgets Bannok's roll (he may come again) and a stadium or challenge
-- half done. Bannok rolls as a grunt spawns or respawns (the C++: as it was created). The stadium's
-- spectators are defensive and go only from the stands (the C++ despawned them all); the waves come from
-- fixed points behind the combat door (the C++: random within 7 yd), the rookery's waves at fixed seconds.
-- The challenge's trap fires every 30 s (its template's data5, the cooldown the C++ kept itself) and its
-- Kill Urok Minion takes both ogre types (spell_script_target, for the C++ too), within the spell's own
-- range (the C++: 20 yd). Its circles last an hour at most; a second use of the item while the challenge
-- runs leaves a second banner; the challenge can be fought again once over. An ogre beats on the banner
-- whether or not a challenge runs.

UPDATE `creature_template` SET `ai_name` = 'EventAI' WHERE `entry` = 9196;
UPDATE `creature_template` SET `ai_name` = 'EventAI' WHERE `entry` = 9236;
UPDATE `creature_template` SET `ai_name` = 'EventAI' WHERE `entry` = 9237;
UPDATE `creature_template` SET `ai_name` = 'EventAI' WHERE `entry` = 9568;
UPDATE `creature_template` SET `ai_name` = 'EventAI' WHERE `entry` = 9736;
UPDATE `creature_template` SET `ai_name` = 'EventAI' WHERE `entry` = 9816;
UPDATE `creature_template` SET `ai_name` = 'EventAI' WHERE `entry` = 9818;
UPDATE `creature_template` SET `ai_name` = 'EventAI' WHERE `entry` = 9819;
UPDATE `creature_template` SET `ai_name` = 'EventAI' WHERE `entry` = 10220;
UPDATE `creature_template` SET `ai_name` = 'EventAI' WHERE `entry` = 10316;
UPDATE `creature_template` SET `ai_name` = 'EventAI' WHERE `entry` = 10430;
UPDATE `creature_template` SET `ai_name` = 'EventAI' WHERE `entry` = 10442;
UPDATE `creature_template` SET `ai_name` = 'EventAI' WHERE `entry` = 10447;
UPDATE `creature_template` SET `ai_name` = 'EventAI' WHERE `entry` = 10602;

DELETE FROM `conditions` WHERE `condition_entry` IN (229000, 229010, 229100, 229101, 229213, 229216, 229220, 229221, 229222, 229223, 229224, 229225, 229226, 229228, 229232, 229236, 229238, 229245, 229246, 229247, 229248, 229249, 229250, 229251, 229252, 229253, 229254, 229255, 229256, 229257, 229258, 229259, 229260, 229261, 229262, 229263, 229264, 229265, 229267, 229268, 229269, 229270, 229271, 229272, 229404, 229406, 229408, 229409, 229411, 229412, 229413, 229414, 229415, 229416, 229418, 229420, 229421, 229423, 229424, 229425, 10229401, 10229402, 10229403, 10229407, 10229410, 10229417, 10229419, 10229422);
INSERT INTO `conditions`
(`condition_entry`, `type`, `value1`, `value2`, `value3`, `value4`, `flags`)
VALUES
(229000, 1, 16076, 0, 0, 0, 3),
(229010, 38, 10, 2, 0, 0, 0),
(229100, 34, 1, 4, 0, 0, 1),
(229101, 20, 10316, 60, 0, 0, 3),
(229213, 34, 11, 1, 0, 0, 0),
(229216, 34, 14, 1, 0, 0, 0),
(10229401, -1, 8504, 229213, 309010, 14351, 0),
(10229402, -1, 229216, 229217, 229218, 349002, 0),
(10229403, -1, 10229401, 10229402, 0, 0, 0),
(229220, 57, 40272, 0, 0, 0, 0),
(229221, 57, 40269, 0, 0, 0, 0),
(229222, 57, 45833, 0, 0, 0, 0),
(229223, 57, 40262, 0, 0, 0, 0),
(229224, 57, 40261, 0, 0, 0, 0),
(229225, 57, 40259, 0, 0, 0, 0),
(229226, 57, 40251, 0, 0, 0, 0),
(229228, 2, 12344, 1, 0, 0, 0),
(229404, -1, 229228, 3705, 0, 0, 0),
(229232, 52, 44020, 43764, 44327, 0, 0),
(229406, -1, 229232, 8502, 0, 0, 0),
(229236, 34, 6, 1, 0, 0, 1),
(229238, 20, 10363, 80, 0, 0, 0),
(10229407, -1, 230000, 229236, 229237, 229238, 0),
(229245, 34, 9, 5, 0, 0, 0),
(229246, 34, 9, 6, 0, 0, 0),
(229247, 34, 9, 7, 0, 0, 0),
(229248, 34, 9, 9, 0, 0, 0),
(229249, 54, 153, -396, 122, 16, 0),
(229408, -1, 4623, 229246, 0, 0, 0),
(229409, -1, 4623, 229245, 0, 0, 0),
(10229410, -1, 4623, 329006, 0, 0, 0),
(229411, -1, 4623, 229243, 0, 0, 0),
(229412, -1, 4623, 229242, 0, 0, 0),
(229413, -1, 4623, 229241, 0, 0, 0),
(229414, -1, 4623, 229240, 0, 0, 0),
(229415, -1, 4623, 229247, 0, 0, 0),
(229250, 34, 3, 1, 0, 0, 1),
(229251, 34, 3, 3, 0, 0, 1),
(229416, -1, 229250, 229251, 0, 0, 0),
(10229417, -1, 4623, 818013, 0, 0, 0),
(229252, 20, 10442, 150, 0, 0, 3),
(229253, 20, 10447, 150, 0, 0, 3),
(229254, 20, 10742, 150, 0, 0, 3),
(229255, 20, 10339, 150, 0, 0, 3),
(229256, 20, 10429, 150, 0, 0, 3),
(229418, -1, 229252, 229253, 229254, 0, 0),
(10229419, -1, 10229417, 229247, 229418, 0, 0),
(229420, -1, 229255, 229256, 0, 0, 0),
(229421, -1, 229248, 4623, 229420, 0, 0),
(229257, 52, 41809, 0, 0, 0, 1),
(10229422, -1, 10229417, 229257, 0, 0, 0),
(229258, 34, 20, 0, 0, 0, 0),
(229259, 34, 20, 99, 0, 0, 0),
(229423, -2, 229258, 229259, 0, 0, 0),
(229260, 34, 20, 1, 1, 0, 0),
(229261, 34, 20, 8, 2, 0, 0),
(229424, -1, 229260, 229261, 0, 0, 0),
(229262, 21, 175584, 3, 0, 0, 2),
(229263, 21, 175584, 50, 0, 0, 2),
(229264, 21, 175584, 3, 0, 0, 3),
(229425, -1, 229263, 229264, 0, 0, 0),
(229265, 34, 20, 2, 0, 0, 0),
(229267, 34, 20, 4, 0, 0, 0),
(229268, 34, 20, 5, 0, 0, 0),
(229269, 34, 20, 6, 0, 0, 0),
(229270, 34, 20, 7, 0, 0, 0),
(229271, 34, 20, 8, 0, 0, 0),
(229272, 34, 20, 9, 0, 0, 0);

-- Conditions another tier-2 migration writes too, under the same entry: whichever comes first.
INSERT IGNORE INTO `conditions`
(`condition_entry`, `type`, `value1`, `value2`, `value3`, `value4`, `flags`)
VALUES
(818013, 34, 7, 1, 0, 0, 0),
(532000, 34, 0, 3, 0, 0, 0),
(532001, 34, 1, 3, 0, 0, 0),
(532003, 34, 3, 3, 0, 0, 0),
(33004, 34, 5, 3, 0, 0, 0),
(309010, 34, 12, 1, 0, 0, 0),
(229217, 34, 15, 1, 0, 0, 0),
(229218, 34, 16, 1, 0, 0, 0),
(349002, 34, 0, 3, 0, 0, 1),
(209009, -1, 1000, 999, 0, 0, 0),
(818012, 34, 6, 1, 0, 0, 0),
(230000, 62, 0, 0, 0, 0, 1),
(229237, 34, 6, 3, 0, 0, 1),
(229240, 34, 9, 0, 0, 0, 0),
(229241, 34, 9, 1, 0, 0, 0),
(229242, 34, 9, 2, 0, 0, 0),
(229243, 34, 9, 3, 0, 0, 0),
(329006, 34, 9, 4, 0, 0, 0),
(409320, 34, 20, 3, 0, 0, 0);

DELETE FROM `broadcast_text` WHERE `entry` IN (229101, 229102, 229103);
INSERT INTO `broadcast_text`
(`entry`, `male_text`, `female_text`, `chat_type`, `sound_id`, `language_id`, `emote_id1`, `emote_id2`, `emote_id3`, `emote_delay1`, `emote_delay2`, `emote_delay3`)
VALUES
(229101, '%s begins to summon in a Blackhand Dreadweaver!', '%s begins to summon in a Blackhand Dreadweaver!', 2, 0, 0, 0, 0, 0, 0, 0, 0),
(229102, '%s begins to summon in a Blackhand Veteran!', '%s begins to summon in a Blackhand Veteran!', 2, 0, 0, 0, 0, 0, 0, 0, 0),
(229103, 'Intruders are destroying our eggs!  Stop!!', 'Intruders are destroying our eggs!  Stop!!', 1, 0, 0, 0, 0, 0, 0, 0, 0);

-- Existing rows taken away: the restore puts them back.
DELETE FROM `creature_ai_events` WHERE `id` = 981901;
DELETE FROM `creature_ai_scripts` WHERE `id` = 981901;
DELETE FROM `creature_ai_events` WHERE `id` = 981902;
DELETE FROM `creature_ai_scripts` WHERE `id` = 981902;
DELETE FROM `creature_ai_events` WHERE `id` = 981903;
DELETE FROM `creature_ai_scripts` WHERE `id` = 981903;
DELETE FROM `creature_ai_events` WHERE `id` = 981904;
DELETE FROM `creature_ai_scripts` WHERE `id` = 981904;
DELETE FROM `event_scripts` WHERE `id` = 4884;
DELETE FROM `creature_ai_events` WHERE `id` IN (919601, 919602, 919603, 919604, 919605, 919606, 923601, 923602, 923603, 923701, 923702, 923703, 923704, 923705, 923711, 923712, 923713, 923714, 925911, 956801, 956802, 956803, 956804, 956811, 973601, 973602, 981601, 981602, 981603, 981604, 981611, 981612, 981613, 981711, 981801, 981802, 981803, 981811, 981911, 981921, 981922, 981923, 981924, 1022001, 1022002, 1022011, 1031601, 1031602, 1031603, 1031611, 1031612, 1031613, 1031614, 1033911, 1033912, 1042911, 1042912, 1043001, 1043002, 1043003, 1043004, 1043005, 1043011, 1043012, 1043021, 1043022, 1043023, 1043024, 1044211, 1044212, 1044213, 1044214, 1044711, 1044712, 1044713, 1044714, 1060111, 1060112, 1060113, 1060114, 1060211, 1060212, 1060213, 1060214, 1074211, 1074212, 1074213, 1074214);
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
(981801, 9818, 0, 0, 0, 100, 5, 0, 0, 15000, 15000, 981801, 0, 0, 'Blackhand Summoner - a Dreadweaver or a Veteran'),
(981802, 9818, 0, 0, 0, 100, 13, 7000, 7000, 6000, 6000, 981802, 0, 0, 'Blackhand Summoner - Fireball'),
(981803, 9818, 229010, 0, 0, 100, 13, 10000, 10000, 6000, 6000, 981803, 0, 0, 'Blackhand Summoner - Frost Nova with his victim within 10 yd'),
(981921, 9819, 0, 4, 0, 100, 0, 0, 0, 0, 0, 981921, 0, 0, 'Blackhand Veteran - aggro: Shield Charge at his victim'),
(981922, 9819, 0, 0, 0, 100, 9, 8000, 14000, 8000, 14000, 981922, 0, 0, 'Blackhand Veteran - Shield Charge at a random attacker'),
(981923, 9819, 0, 13, 0, 25, 9, 10000, 10000, 0, 0, 981923, 0, 0, 'Blackhand Veteran - Shield Bash his casting victim, one time in four'),
(981924, 9819, 0, 0, 0, 100, 9, 5000, 5000, 6000, 6000, 981924, 0, 0, 'Blackhand Veteran - Strike at a random attacker'),
(981601, 9816, 0, 11, 0, 100, 0, 0, 0, 0, 0, 981601, 0, 0, 'Pyroguard Emberseer - spawned: caged'),
(981602, 9816, 0, 7, 0, 100, 0, 0, 0, 0, 0, 981602, 0, 0, 'Pyroguard Emberseer - evading: caged'),
(981603, 9816, 0, 4, 0, 100, 0, 0, 0, 0, 0, 981603, 0, 0, 'Pyroguard Emberseer - aggro: his encounter in progress'),
(981604, 9816, 0, 6, 0, 100, 0, 0, 0, 0, 0, 981604, 0, 0, 'Pyroguard Emberseer - dead: his encounter done, the way on open, his runes out'),
(981611, 9816, 0, 0, 0, 100, 1, 6000, 6000, 6000, 6000, 981611, 0, 0, 'Pyroguard Emberseer - Fire Nova'),
(981612, 9816, 0, 0, 0, 100, 1, 3000, 3000, 14000, 14000, 981612, 0, 0, 'Pyroguard Emberseer - Flame Buffet'),
(981613, 9816, 0, 0, 0, 100, 1, 14000, 14000, 15000, 15000, 981613, 0, 0, 'Pyroguard Emberseer - Pyroblast at a random attacker'),
(1031601, 10316, 0, 11, 0, 100, 0, 0, 0, 0, 0, 1031601, 0, 0, 'Blackhand Incarcerator - spawned: not to be attacked'),
(1031602, 10316, 0, 7, 0, 100, 0, 0, 0, 0, 0, 1031602, 0, 0, 'Blackhand Incarcerator - evading: not to be attacked'),
(1031603, 10316, 229100, 1, 0, 100, 5, 1000, 1000, 1000, 1000, 1031603, 0, 0, 'Blackhand Incarcerator - Encage Emberseer, while the altar has not freed him'),
(1031611, 10316, 0, 0, 0, 100, 9, 5000, 40000, 20000, 40000, 1031611, 0, 0, 'Blackhand Incarcerator - Encage at a random attacker without it'),
(1031612, 10316, 0, 0, 0, 100, 9, 2000, 12100, 7900, 14000, 1031612, 0, 0, 'Blackhand Incarcerator - Strike'),
(1031613, 10316, 0, 2, 0, 100, 0, 14, 0, 0, 0, 1031613, 0, 0, 'Blackhand Incarcerator - under 15 %: flees'),
(1031614, 10316, 229101, 6, 0, 100, 0, 0, 0, 0, 0, 1031614, 0, 0, 'Blackhand Incarcerator - the last dead: Emberseer free'),
(981711, 9817, 302, 6, 0, 100, 0, 0, 0, 0, 0, 981711, 0, 0, 'Blackhand Dreadweaver - the last of his room dead: the room cleared'),
(981811, 9818, 302, 6, 0, 100, 0, 0, 0, 0, 0, 981811, 0, 0, 'Blackhand Summoner - the last of his room dead: the room cleared'),
(981911, 9819, 302, 6, 0, 100, 0, 0, 0, 0, 0, 981911, 0, 0, 'Blackhand Veteran - the last of his room dead: the room cleared'),
(925911, 9259, 229406, 11, 0, 5, 0, 0, 0, 0, 0, 925911, 0, 0, 'Firebrand Grunt - one of three, one time in twenty: Bannok Grimaxe, once an instance'),
(1044211, 10442, 10229419, 6, 0, 100, 0, 0, 0, 0, 0, 1044211, 0, 0, 'Chromatic Whelp - the last of the last wave dead: Gyth''s intro'),
(1044212, 10442, 10229417, 6, 0, 5, 0, 0, 0, 0, 0, 1044212, 0, 0, 'Chromatic Whelp - dead in the stadium, one time in twenty: Nefarius taunts'),
(1044213, 10442, 10229417, 6, 0, 5, 0, 0, 0, 0, 0, 1044213, 0, 0, 'Chromatic Whelp - dead in the stadium, one time in twenty: Rend taunts'),
(1044214, 10442, 10229417, 7, 0, 100, 0, 0, 0, 0, 0, 1044214, 0, 0, 'Chromatic Whelp - evading in the stadium: it fails'),
(1044711, 10447, 10229419, 6, 0, 100, 0, 0, 0, 0, 0, 1044711, 0, 0, 'Chromatic Dragonspawn - the last of the last wave dead: Gyth''s intro'),
(1044712, 10447, 10229417, 6, 0, 5, 0, 0, 0, 0, 0, 1044712, 0, 0, 'Chromatic Dragonspawn - dead in the stadium, one time in twenty: Nefarius taunts'),
(1044713, 10447, 10229417, 6, 0, 5, 0, 0, 0, 0, 0, 1044713, 0, 0, 'Chromatic Dragonspawn - dead in the stadium, one time in twenty: Rend taunts'),
(1044714, 10447, 10229417, 7, 0, 100, 0, 0, 0, 0, 0, 1044714, 0, 0, 'Chromatic Dragonspawn - evading in the stadium: it fails'),
(1074211, 10742, 10229419, 6, 0, 100, 0, 0, 0, 0, 0, 1074211, 0, 0, 'Blackhand Dragon Handler - the last of the last wave dead: Gyth''s intro'),
(1074212, 10742, 10229417, 6, 0, 5, 0, 0, 0, 0, 0, 1074212, 0, 0, 'Blackhand Dragon Handler - dead in the stadium, one time in twenty: Nefarius taunts'),
(1074213, 10742, 10229417, 6, 0, 5, 0, 0, 0, 0, 0, 1074213, 0, 0, 'Blackhand Dragon Handler - dead in the stadium, one time in twenty: Rend taunts'),
(1074214, 10742, 10229417, 7, 0, 100, 0, 0, 0, 0, 0, 1074214, 0, 0, 'Blackhand Dragon Handler - evading in the stadium: it fails'),
(1033911, 10339, 229421, 6, 0, 100, 0, 0, 0, 0, 0, 1033911, 0, 0, 'Gyth - Gyth and Rend dead: the stadium done'),
(1042911, 10429, 229421, 6, 0, 100, 0, 0, 0, 0, 0, 1042911, 0, 0, 'Warchief Rend Blackhand - Gyth and Rend dead: the stadium done'),
(1033912, 10339, 10229417, 7, 0, 100, 0, 0, 0, 0, 0, 1033912, 0, 0, 'Gyth - evading in the stadium: it fails'),
(1042912, 10429, 10229422, 7, 0, 100, 0, 0, 0, 0, 0, 1042912, 0, 0, 'Warchief Rend Blackhand - Gyth''s, evading in the stadium: it fails'),
(1060111, 10601, 229424, 6, 0, 100, 0, 0, 0, 0, 0, 1060111, 0, 0, 'Urok Enforcer - dead in Urok''s challenge: the next ogre, the eighth Urok'),
(1060112, 10601, 229425, 1, 0, 100, 1, 1000, 1000, 10000, 10000, 1060112, 0, 0, 'Urok Enforcer - out of a fight, the banner within 50 yd: at it'),
(1060113, 10601, 229262, 1, 0, 100, 1, 1000, 1000, 11000, 11000, 1060113, 0, 0, 'Urok Enforcer - out of a fight at the banner: Destroy Spear'),
(1060114, 10601, 229262, 29, 0, 100, 1, 8, 2, 0, 0, 1060114, 0, 0, 'Urok Enforcer - at the banner (point 2): Destroy Spear'),
(1060211, 10602, 229424, 6, 0, 100, 0, 0, 0, 0, 0, 1060211, 0, 0, 'Urok Ogre Magus - dead in Urok''s challenge: the next ogre, the eighth Urok'),
(1060212, 10602, 229425, 1, 0, 100, 1, 1000, 1000, 10000, 10000, 1060212, 0, 0, 'Urok Ogre Magus - out of a fight, the banner within 50 yd: at it'),
(1060213, 10602, 229262, 1, 0, 100, 1, 1000, 1000, 11000, 11000, 1060213, 0, 0, 'Urok Ogre Magus - out of a fight at the banner: Destroy Spear'),
(1060214, 10602, 229262, 29, 0, 100, 1, 8, 2, 0, 0, 1060214, 0, 0, 'Urok Ogre Magus - at the banner (point 2): Destroy Spear');

DELETE FROM `creature_ai_scripts` WHERE `id` IN (919601, 919602, 919603, 919604, 919605, 919606, 923601, 923602, 923603, 923701, 923702, 923703, 923704, 923705, 923711, 923712, 923713, 923714, 925911, 956801, 956802, 956803, 956804, 956811, 973601, 973602, 981601, 981602, 981603, 981604, 981611, 981612, 981613, 981711, 981801, 981802, 981803, 981811, 981911, 981921, 981922, 981923, 981924, 1022001, 1022002, 1022011, 1031601, 1031602, 1031603, 1031611, 1031612, 1031613, 1031614, 1033911, 1033912, 1042911, 1042912, 1043001, 1043002, 1043003, 1043004, 1043005, 1043011, 1043012, 1043021, 1043022, 1043023, 1043024, 1044211, 1044212, 1044213, 1044214, 1044711, 1044712, 1044713, 1044714, 1060111, 1060112, 1060113, 1060114, 1060211, 1060212, 1060213, 1060214, 1074211, 1074212, 1074213, 1074214);
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
(923714, 0, 1, 44, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Warmaster Voone - phase 0 again, no axe thrown'),
(981801, 0, 0, 39, 2290002, 2290003, 0, 0, 0, 0, 0, 0, 50, 50, 0, 0, 0, 0, 0, 0, 0, 'Blackhand Summoner - one of the two'),
(981802, 0, 0, 15, 12466, 0, 0, 0, 0, 0, 4, 8, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Blackhand Summoner - Fireball'),
(981803, 0, 0, 15, 15532, 0, 0, 0, 0, 0, 1, 8, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Blackhand Summoner - Frost Nova with his victim within 10 yd'),
(981921, 0, 0, 15, 15749, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Blackhand Veteran - Shield Charge at his victim'),
(981922, 0, 0, 15, 15749, 0, 0, 0, 0, 0, 4, 8, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Blackhand Veteran - Shield Charge at a random attacker'),
(981923, 0, 0, 15, 11972, 0, 0, 0, 0, 0, 1, 8, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Blackhand Veteran - Shield Bash'),
(981924, 0, 0, 15, 14516, 0, 0, 0, 0, 0, 4, 8, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Blackhand Veteran - Strike at a random attacker'),
(981601, 0, 0, 4, 46, 33555200, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Pyroguard Emberseer - not to be attacked'),
(981601, 0, 1, 15, 15282, 32, 0, 0, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Pyroguard Emberseer - his cage'),
(981602, 0, 0, 4, 46, 33555200, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Pyroguard Emberseer - not to be attacked'),
(981602, 0, 1, 15, 15282, 32, 0, 0, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Pyroguard Emberseer - his cage'),
(981602, 0, 2, 37, 1, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Pyroguard Emberseer - his encounter 2'),
(981602, 0, 3, 68, 2290007, 2, 10316, 60, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Pyroguard Emberseer - the dead incarcerators back'),
(981603, 0, 0, 37, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Pyroguard Emberseer - his encounter 1'),
(981604, 0, 0, 37, 1, 3, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Pyroguard Emberseer - his encounter 3'),
(981604, 0, 1, 80, 0, 0, 0, 0, 261637, 0, 12, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Emberseer Out - open'),
(981604, 0, 2, 68, 2290008, 0, 175187, 100, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Pyroguard Emberseer - rune 175187 out'),
(981604, 0, 3, 68, 2290008, 0, 175267, 100, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Pyroguard Emberseer - rune 175267 out'),
(981604, 0, 4, 68, 2290008, 0, 175268, 100, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Pyroguard Emberseer - rune 175268 out'),
(981604, 0, 5, 68, 2290008, 0, 175269, 100, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Pyroguard Emberseer - rune 175269 out'),
(981604, 0, 6, 68, 2290008, 0, 175270, 100, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Pyroguard Emberseer - rune 175270 out'),
(981604, 0, 7, 68, 2290008, 0, 175271, 100, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Pyroguard Emberseer - rune 175271 out'),
(981604, 0, 8, 68, 2290008, 0, 175272, 100, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Pyroguard Emberseer - rune 175272 out'),
(981611, 0, 0, 15, 23462, 0, 0, 0, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Pyroguard Emberseer - Fire Nova'),
(981612, 0, 0, 15, 23341, 0, 0, 0, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Pyroguard Emberseer - Flame Buffet'),
(981613, 0, 0, 15, 20228, 0, 0, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Pyroguard Emberseer - Pyroblast at a random attacker'),
(1031601, 0, 0, 4, 46, 768, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Blackhand Incarcerator - not to be attacked'),
(1031602, 0, 0, 4, 46, 768, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Blackhand Incarcerator - not to be attacked'),
(1031603, 0, 0, 15, 15281, 0, 0, 0, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Blackhand Incarcerator - Encage Emberseer'),
(1031611, 0, 0, 15, 16045, 32, 0, 0, 0, 0, 4, 8, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Blackhand Incarcerator - Encage at a random attacker without it'),
(1031612, 0, 0, 15, 15580, 0, 0, 0, 0, 0, 1, 8, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Blackhand Incarcerator - Strike'),
(1031613, 0, 0, 47, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Blackhand Incarcerator - flees'),
(1031614, 0, 0, 68, 2290006, 2, 9816, 60, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Blackhand Incarcerator - Emberseer liberated'),
(981711, 0, 0, 39, 2290010, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0, 0, 0, 0, 0, 0, 229220, 'Blackhand Dreadweaver - Room 7 cleared'),
(981711, 0, 1, 39, 2290011, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0, 0, 0, 0, 0, 0, 229221, 'Blackhand Dreadweaver - Room 3 cleared'),
(981711, 0, 2, 39, 2290012, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0, 0, 0, 0, 0, 0, 229222, 'Blackhand Dreadweaver - Room 6 cleared'),
(981711, 0, 3, 39, 2290013, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0, 0, 0, 0, 0, 0, 229223, 'Blackhand Dreadweaver - Room 1 cleared'),
(981711, 0, 4, 39, 2290014, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0, 0, 0, 0, 0, 0, 229224, 'Blackhand Dreadweaver - Room 5 cleared'),
(981711, 0, 5, 39, 2290015, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0, 0, 0, 0, 0, 0, 229225, 'Blackhand Dreadweaver - Room 2 cleared'),
(981711, 0, 6, 39, 2290016, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0, 0, 0, 0, 0, 0, 229226, 'Blackhand Dreadweaver - Room 4 cleared'),
(981811, 0, 0, 39, 2290010, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0, 0, 0, 0, 0, 0, 229220, 'Blackhand Summoner - Room 7 cleared'),
(981811, 0, 1, 39, 2290011, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0, 0, 0, 0, 0, 0, 229221, 'Blackhand Summoner - Room 3 cleared'),
(981811, 0, 2, 39, 2290012, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0, 0, 0, 0, 0, 0, 229222, 'Blackhand Summoner - Room 6 cleared'),
(981811, 0, 3, 39, 2290013, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0, 0, 0, 0, 0, 0, 229223, 'Blackhand Summoner - Room 1 cleared'),
(981811, 0, 4, 39, 2290014, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0, 0, 0, 0, 0, 0, 229224, 'Blackhand Summoner - Room 5 cleared'),
(981811, 0, 5, 39, 2290015, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0, 0, 0, 0, 0, 0, 229225, 'Blackhand Summoner - Room 2 cleared'),
(981811, 0, 6, 39, 2290016, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0, 0, 0, 0, 0, 0, 229226, 'Blackhand Summoner - Room 4 cleared'),
(981911, 0, 0, 39, 2290010, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0, 0, 0, 0, 0, 0, 229220, 'Blackhand Veteran - Room 7 cleared'),
(981911, 0, 1, 39, 2290011, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0, 0, 0, 0, 0, 0, 229221, 'Blackhand Veteran - Room 3 cleared'),
(981911, 0, 2, 39, 2290012, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0, 0, 0, 0, 0, 0, 229222, 'Blackhand Veteran - Room 6 cleared'),
(981911, 0, 3, 39, 2290013, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0, 0, 0, 0, 0, 0, 229223, 'Blackhand Veteran - Room 1 cleared'),
(981911, 0, 4, 39, 2290014, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0, 0, 0, 0, 0, 0, 229224, 'Blackhand Veteran - Room 5 cleared'),
(981911, 0, 5, 39, 2290015, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0, 0, 0, 0, 0, 0, 229225, 'Blackhand Veteran - Room 2 cleared'),
(981911, 0, 6, 39, 2290016, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0, 0, 0, 0, 0, 0, 229226, 'Blackhand Veteran - Room 4 cleared'),
(925911, 0, 0, 37, 7, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Firebrand Grunt - the rows drive the instance? (7 = 1)'),
(925911, 0, 1, 32, 818013, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Firebrand Grunt - the C++ instance answers: nothing'),
(925911, 0, 2, 37, 8, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Firebrand Grunt - Bannok rolled (8 = 1)'),
(925911, 0, 3, 27, 9596, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Firebrand Grunt - Bannok Grimaxe'),
(1044211, 0, 0, 39, 2290045, 0, 0, 0, 41877, 0, 9, 2, 100, 0, 0, 0, 0, 0, 0, 0, 0, 'The stadium - Gyth''s intro'),
(1044212, 0, 0, 39, 2290062, 2290063, 0, 0, 0, 0, 0, 0, 50, 50, 0, 0, 0, 0, 0, 0, 0, 'Lord Victor Nefarius - one of eight taunts'),
(1044213, 0, 0, 0, 1, 0, 0, 0, 41809, 0, 9, 2, 5672, 5678, 5673, 5674, 0, 0, 0, 0, 0, 'Warchief Rend Blackhand - a taunt'),
(1044214, 0, 0, 39, 2290047, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0, 0, 0, 0, 0, 0, 0, 'The stadium - failed'),
(1044711, 0, 0, 39, 2290045, 0, 0, 0, 41877, 0, 9, 2, 100, 0, 0, 0, 0, 0, 0, 0, 0, 'The stadium - Gyth''s intro'),
(1044712, 0, 0, 39, 2290062, 2290063, 0, 0, 0, 0, 0, 0, 50, 50, 0, 0, 0, 0, 0, 0, 0, 'Lord Victor Nefarius - one of eight taunts'),
(1044713, 0, 0, 0, 1, 0, 0, 0, 41809, 0, 9, 2, 5672, 5678, 5673, 5674, 0, 0, 0, 0, 0, 'Warchief Rend Blackhand - a taunt'),
(1044714, 0, 0, 39, 2290047, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0, 0, 0, 0, 0, 0, 0, 'The stadium - failed'),
(1074211, 0, 0, 39, 2290045, 0, 0, 0, 41877, 0, 9, 2, 100, 0, 0, 0, 0, 0, 0, 0, 0, 'The stadium - Gyth''s intro'),
(1074212, 0, 0, 39, 2290062, 2290063, 0, 0, 0, 0, 0, 0, 50, 50, 0, 0, 0, 0, 0, 0, 0, 'Lord Victor Nefarius - one of eight taunts'),
(1074213, 0, 0, 0, 1, 0, 0, 0, 41809, 0, 9, 2, 5672, 5678, 5673, 5674, 0, 0, 0, 0, 0, 'Warchief Rend Blackhand - a taunt'),
(1074214, 0, 0, 39, 2290047, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0, 0, 0, 0, 0, 0, 0, 'The stadium - failed'),
(1033911, 0, 0, 39, 2290046, 0, 0, 0, 41877, 0, 9, 2, 100, 0, 0, 0, 0, 0, 0, 0, 0, 'The stadium - done'),
(1042911, 0, 0, 39, 2290046, 0, 0, 0, 41877, 0, 9, 2, 100, 0, 0, 0, 0, 0, 0, 0, 0, 'The stadium - done'),
(1033912, 0, 0, 39, 2290047, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0, 0, 0, 0, 0, 0, 0, 'The stadium - failed'),
(1042912, 0, 0, 39, 2290047, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0, 0, 0, 0, 0, 0, 0, 'The stadium - failed'),
(1060111, 0, 0, 37, 20, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Urok''s challenge - one more dead (20 + 1)'),
(1060111, 0, 1, 39, 2290067, 2290068, 0, 0, 0, 0, 0, 0, 50, 50, 0, 0, 0, 0, 0, 0, 229265, 'Urok''s challenge - 1 dead: an ogre at circle 1'),
(1060111, 0, 2, 39, 2290073, 2290074, 0, 0, 0, 0, 0, 0, 50, 50, 0, 0, 0, 0, 0, 0, 409320, 'Urok''s challenge - 2 dead: an ogre at circle 4'),
(1060111, 0, 3, 39, 2290075, 2290076, 0, 0, 0, 0, 0, 0, 50, 50, 0, 0, 0, 0, 0, 0, 229267, 'Urok''s challenge - 3 dead: an ogre at circle 5'),
(1060111, 0, 4, 39, 2290067, 2290068, 0, 0, 0, 0, 0, 0, 50, 50, 0, 0, 0, 0, 0, 0, 229268, 'Urok''s challenge - 4 dead: an ogre at circle 1'),
(1060111, 0, 5, 39, 2290069, 2290070, 0, 0, 0, 0, 0, 0, 50, 50, 0, 0, 0, 0, 0, 0, 229269, 'Urok''s challenge - 5 dead: an ogre at circle 2'),
(1060111, 0, 6, 39, 2290071, 2290072, 0, 0, 0, 0, 0, 0, 50, 50, 0, 0, 0, 0, 0, 0, 229270, 'Urok''s challenge - 6 dead: an ogre at circle 3'),
(1060111, 0, 7, 39, 2290075, 2290076, 0, 0, 0, 0, 0, 0, 50, 50, 0, 0, 0, 0, 0, 0, 229271, 'Urok''s challenge - 7 dead: an ogre at circle 5'),
(1060111, 0, 8, 39, 2290078, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0, 0, 0, 0, 0, 0, 229272, 'Urok''s challenge - 8 dead: Urok Doomhowl'),
(1060112, 0, 0, 3, 2, 0, 1, 2, 175584, 50, 11, 0, 2, 0, 0, 0, 1, 0, 0, -1, 0, 'Urok Enforcer - to the banner (point 2)'),
(1060113, 0, 0, 15, 16557, 0, 0, 0, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Urok Enforcer - Destroy Spear'),
(1060114, 0, 0, 15, 16557, 0, 0, 0, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Urok Enforcer - Destroy Spear'),
(1060211, 0, 0, 37, 20, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Urok''s challenge - one more dead (20 + 1)'),
(1060211, 0, 1, 39, 2290067, 2290068, 0, 0, 0, 0, 0, 0, 50, 50, 0, 0, 0, 0, 0, 0, 229265, 'Urok''s challenge - 1 dead: an ogre at circle 1'),
(1060211, 0, 2, 39, 2290073, 2290074, 0, 0, 0, 0, 0, 0, 50, 50, 0, 0, 0, 0, 0, 0, 409320, 'Urok''s challenge - 2 dead: an ogre at circle 4'),
(1060211, 0, 3, 39, 2290075, 2290076, 0, 0, 0, 0, 0, 0, 50, 50, 0, 0, 0, 0, 0, 0, 229267, 'Urok''s challenge - 3 dead: an ogre at circle 5'),
(1060211, 0, 4, 39, 2290067, 2290068, 0, 0, 0, 0, 0, 0, 50, 50, 0, 0, 0, 0, 0, 0, 229268, 'Urok''s challenge - 4 dead: an ogre at circle 1'),
(1060211, 0, 5, 39, 2290069, 2290070, 0, 0, 0, 0, 0, 0, 50, 50, 0, 0, 0, 0, 0, 0, 229269, 'Urok''s challenge - 5 dead: an ogre at circle 2'),
(1060211, 0, 6, 39, 2290071, 2290072, 0, 0, 0, 0, 0, 0, 50, 50, 0, 0, 0, 0, 0, 0, 229270, 'Urok''s challenge - 6 dead: an ogre at circle 3'),
(1060211, 0, 7, 39, 2290075, 2290076, 0, 0, 0, 0, 0, 0, 50, 50, 0, 0, 0, 0, 0, 0, 229271, 'Urok''s challenge - 7 dead: an ogre at circle 5'),
(1060211, 0, 8, 39, 2290078, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0, 0, 0, 0, 0, 0, 229272, 'Urok''s challenge - 8 dead: Urok Doomhowl'),
(1060212, 0, 0, 3, 2, 0, 1, 2, 175584, 50, 11, 0, 2, 0, 0, 0, 1, 0, 0, -1, 0, 'Urok Ogre Magus - to the banner (point 2)'),
(1060213, 0, 0, 15, 16557, 0, 0, 0, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Urok Ogre Magus - Destroy Spear'),
(1060214, 0, 0, 15, 16557, 0, 0, 0, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Urok Ogre Magus - Destroy Spear');

DELETE FROM `generic_scripts` WHERE `id` IN (2290001, 2290002, 2290003, 2290004, 2290005, 2290006, 2290007, 2290008, 2290009, 2290010, 2290011, 2290012, 2290013, 2290014, 2290015, 2290016, 2290017, 2290018, 2290019, 2290020, 2290021, 2290022, 2290023, 2290024, 2290025, 2290026, 2290027, 2290028, 2290029, 2290030, 2290031, 2290032, 2290033, 2290034, 2290035, 2290036, 2290037, 2290038, 2290039, 2290040, 2290041, 2290042, 2290043, 2290044, 2290045, 2290046, 2290047, 2290048, 2290049, 2290050, 2290051, 2290052, 2290053, 2290054, 2290055, 2290056, 2290057, 2290058, 2290059, 2290060, 2290061, 2290062, 2290063, 2290064, 2290065, 2290066, 2290067, 2290068, 2290069, 2290070, 2290071, 2290072, 2290073, 2290074, 2290075, 2290076, 2290077, 2290078);
INSERT INTO `generic_scripts`
(`id`, `delay`, `priority`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`)
VALUES
(2290001, 0, 0, 34, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, -172.633, -324.253, 64.401, 4.74, 0, 'Gizrul the Slavener - his home'),
(2290001, 0, 1, 49, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Gizrul the Slavener - into the fight'),
(2290002, 0, 0, 15, 15794, 0, 0, 0, 0, 0, 4, 8, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Blackhand Summoner - Summon Blackhand Dreadweaver'),
(2290002, 0, 1, 0, 2, 0, 0, 0, 0, 0, 0, 0, 229101, 0, 0, 0, 0, 0, 0, 0, 0, 'Blackhand Summoner - "%s begins to summon in a Blackhand Dreadweaver!"'),
(2290003, 0, 0, 15, 15792, 0, 0, 0, 0, 0, 4, 8, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Blackhand Summoner - Summon Blackhand Veteran'),
(2290003, 0, 1, 0, 2, 0, 0, 0, 0, 0, 0, 0, 229102, 0, 0, 0, 0, 0, 0, 0, 0, 'Blackhand Summoner - "%s begins to summon in a Blackhand Veteran!"'),
(2290004, 0, 0, 4, 46, 768, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Blackhand Incarcerator - attackable'),
(2290004, 0, 1, 5, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Blackhand Incarcerator - his channel broken'),
(2290004, 0, 2, 49, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Blackhand Incarcerator - into the fight'),
(2290005, 0, 0, 80, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Emberseer rune - lit'),
(2290006, 0, 0, 14, 15282, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Pyroguard Emberseer - out of his cage'),
(2290006, 0, 1, 15, 16047, 2, 0, 0, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Pyroguard Emberseer - Fiery Burst (liberation)'),
(2290006, 0, 2, 15, 16048, 2, 0, 0, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Pyroguard Emberseer - Growth'),
(2290006, 0, 3, 0, 0, 0, 0, 0, 0, 0, 0, 0, 5268, 0, 0, 0, 0, 0, 0, 0, 0, 'Pyroguard Emberseer - "Thank you for freeing me, fools..."'),
(2290006, 0, 4, 4, 46, 33555200, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Pyroguard Emberseer - attackable'),
(2290006, 0, 5, 68, 2290005, 0, 175187, 100, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Pyroguard Emberseer - rune 175187 lit'),
(2290006, 0, 6, 68, 2290005, 0, 175267, 100, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Pyroguard Emberseer - rune 175267 lit'),
(2290006, 0, 7, 68, 2290005, 0, 175268, 100, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Pyroguard Emberseer - rune 175268 lit'),
(2290006, 0, 8, 68, 2290005, 0, 175269, 100, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Pyroguard Emberseer - rune 175269 lit'),
(2290006, 0, 9, 68, 2290005, 0, 175270, 100, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Pyroguard Emberseer - rune 175270 lit'),
(2290006, 0, 10, 68, 2290005, 0, 175271, 100, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Pyroguard Emberseer - rune 175271 lit'),
(2290006, 0, 11, 68, 2290005, 0, 175272, 100, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Pyroguard Emberseer - rune 175272 lit'),
(2290006, 0, 12, 49, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Pyroguard Emberseer - at the players'),
(2290007, 0, 0, 71, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Blackhand Incarcerator - back, if dead'),
(2290008, 0, 0, 80, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Emberseer rune - out'),
(2290009, 0, 0, 32, 10229403, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'The room event - every room cleared and the door shut, or nothing'),
(2290009, 0, 1, 37, 0, 3, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'The room event - done (0 = 3)'),
(2290009, 0, 2, 80, 0, 0, 0, 0, 260283, 0, 12, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Emberseer In - open'),
(2290010, 0, 0, 37, 7, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'The room event - Room 7 - the rows drive the instance? (7 = 1)'),
(2290010, 0, 1, 32, 818013, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'The room event - Room 7 - the C++ instance answers: nothing'),
(2290010, 0, 2, 37, 10, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'The room event - Room 7 cleared (10 = 1)'),
(2290010, 0, 3, 80, 1, 0, 0, 0, 200001, 0, 12, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Room 7 Rune - out'),
(2290010, 0, 4, 39, 2290009, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0, 0, 0, 0, 0, 0, 0, 'The room event - every room?'),
(2290011, 0, 0, 37, 7, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'The room event - Room 3 - the rows drive the instance? (7 = 1)'),
(2290011, 0, 1, 32, 818013, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'The room event - Room 3 - the C++ instance answers: nothing'),
(2290011, 0, 2, 37, 11, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'The room event - Room 3 cleared (11 = 1)'),
(2290011, 0, 3, 80, 1, 0, 0, 0, 200002, 0, 12, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Room 3 Rune - out'),
(2290011, 0, 4, 39, 2290009, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0, 0, 0, 0, 0, 0, 0, 'The room event - every room?'),
(2290012, 0, 0, 37, 7, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'The room event - Room 6 - the rows drive the instance? (7 = 1)'),
(2290012, 0, 1, 32, 818013, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'The room event - Room 6 - the C++ instance answers: nothing'),
(2290012, 0, 2, 37, 12, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'The room event - Room 6 cleared (12 = 1)'),
(2290012, 0, 3, 80, 1, 0, 0, 0, 200003, 0, 12, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Room 6 Rune - out'),
(2290012, 0, 4, 39, 2290009, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0, 0, 0, 0, 0, 0, 0, 'The room event - every room?'),
(2290013, 0, 0, 37, 7, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'The room event - Room 1 - the rows drive the instance? (7 = 1)'),
(2290013, 0, 1, 32, 818013, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'The room event - Room 1 - the C++ instance answers: nothing'),
(2290013, 0, 2, 37, 13, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'The room event - Room 1 cleared (13 = 1)'),
(2290013, 0, 3, 80, 1, 0, 0, 0, 200004, 0, 12, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Room 1 Rune - out'),
(2290013, 0, 4, 39, 2290009, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0, 0, 0, 0, 0, 0, 0, 'The room event - every room?'),
(2290014, 0, 0, 37, 7, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'The room event - Room 5 - the rows drive the instance? (7 = 1)'),
(2290014, 0, 1, 32, 818013, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'The room event - Room 5 - the C++ instance answers: nothing'),
(2290014, 0, 2, 37, 14, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'The room event - Room 5 cleared (14 = 1)'),
(2290014, 0, 3, 80, 1, 0, 0, 0, 200005, 0, 12, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Room 5 Rune - out'),
(2290014, 0, 4, 39, 2290009, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0, 0, 0, 0, 0, 0, 0, 'The room event - every room?'),
(2290015, 0, 0, 37, 7, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'The room event - Room 2 - the rows drive the instance? (7 = 1)'),
(2290015, 0, 1, 32, 818013, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'The room event - Room 2 - the C++ instance answers: nothing'),
(2290015, 0, 2, 37, 15, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'The room event - Room 2 cleared (15 = 1)'),
(2290015, 0, 3, 80, 1, 0, 0, 0, 200006, 0, 12, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Room 2 Rune - out'),
(2290015, 0, 4, 39, 2290009, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0, 0, 0, 0, 0, 0, 0, 'The room event - every room?'),
(2290016, 0, 0, 37, 7, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'The room event - Room 4 - the rows drive the instance? (7 = 1)'),
(2290016, 0, 1, 32, 818013, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'The room event - Room 4 - the C++ instance answers: nothing'),
(2290016, 0, 2, 37, 16, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'The room event - Room 4 cleared (16 = 1)'),
(2290016, 0, 3, 80, 1, 0, 0, 0, 200007, 0, 12, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Room 4 Rune - out'),
(2290016, 0, 4, 39, 2290009, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0, 0, 0, 0, 0, 0, 0, 'The room event - every room?'),
(2290017, 0, 0, 37, 7, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'The UBRS door - the rows drive the instance? (7 = 1)'),
(2290017, 0, 1, 32, 818013, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'The UBRS door - the C++ instance answers: nothing'),
(2290017, 0, 2, 37, 5, 3, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'The UBRS door - opened (5 = 3)'),
(2290017, 2, 3, 80, 0, 0, 0, 0, 397168, 0, 12, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'The UBRS door - brazier 1 lit'),
(2290017, 2, 4, 80, 0, 0, 0, 0, 397169, 0, 12, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'The UBRS door - brazier 2 lit'),
(2290017, 5, 5, 80, 0, 0, 0, 0, 397171, 0, 12, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'The UBRS door - brazier 3 lit'),
(2290017, 5, 6, 80, 0, 0, 0, 0, 397170, 0, 12, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'The UBRS door - brazier 4 lit'),
(2290017, 8, 7, 80, 0, 0, 0, 0, 397172, 0, 12, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'The UBRS door - brazier 5 lit'),
(2290017, 8, 8, 80, 0, 0, 0, 0, 397174, 0, 12, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'The UBRS door - brazier 6 lit'),
(2290017, 11, 9, 80, 0, 0, 0, 0, 82597, 0, 12, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'The UBRS door - open'),
(2290018, 0, 0, 37, 7, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'The Beast - the rows drive the instance? (7 = 1)'),
(2290018, 0, 1, 32, 818013, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'The Beast - the C++ instance answers: nothing'),
(2290018, 0, 2, 26, 0, 0, 0, 0, 42613, 0, 9, 3, 0, 0, 0, 0, 0, 0, 0, 0, 209009, 'The Beast - at the player'),
(2290019, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 229103, 0, 0, 0, 0, 0, 0, 0, 0, 'Rookery Hatcher - "Intruders are destroying our eggs! Stop!!"'),
(2290020, 0, 0, 10, 10258, 3600000, 0, 0, 40153, 0, 9, 2, 0, 0, -1, 7, 55.232342, -265.751282, 93.883, 5, 818012, 'The rookery - a Rookery Guardian'),
(2290020, 0, 1, 10, 10258, 3600000, 0, 0, 40153, 0, 9, 2, 0, 0, -1, 7, 60.011333, -263.914703, 94.022, 5, 818012, 'The rookery - a Rookery Guardian'),
(2290021, 0, 0, 10, 10683, 3600000, 0, 0, 40153, 0, 9, 2, 0, 0, -1, 7, 55.232342, -265.751282, 93.883, 5, 818012, 'The rookery - a Rookery Hatcher'),
(2290021, 0, 1, 10, 10683, 3600000, 0, 0, 40153, 0, 9, 2, 0, 0, -1, 7, 60.011333, -263.914703, 94.022, 5, 818012, 'The rookery - a Rookery Hatcher'),
(2290022, 0, 0, 10, 10258, 3600000, 0, 0, 40153, 0, 9, 2, 0, 0, -1, 7, 55.232342, -265.751282, 93.883, 5, 818012, 'The rookery - a Rookery Guardian'),
(2290022, 0, 1, 10, 10683, 3600000, 0, 0, 40153, 0, 9, 2, 0, 0, -1, 7, 60.011333, -263.914703, 94.022, 5, 818012, 'The rookery - a Rookery Hatcher'),
(2290023, 0, 0, 37, 7, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Father Flame - the rows drive the instance? (7 = 1)'),
(2290023, 0, 1, 32, 818013, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Father Flame - the C++ instance answers: nothing'),
(2290023, 0, 2, 37, 6, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'The rookery - on (6 = 1)'),
(2290023, 5, 3, 10, 10683, 3600000, 0, 0, 40153, 0, 9, 2, 0, 2290019, -1, 7, 55.232342, -265.751282, 93.883, 5, 818012, 'The rookery - a Rookery Hatcher'),
(2290023, 5, 4, 10, 10683, 3600000, 0, 0, 40153, 0, 9, 2, 0, 0, -1, 7, 60.011333, -263.914703, 94.022, 5, 818012, 'The rookery - a Rookery Hatcher'),
(2290023, 40, 5, 39, 2290020, 2290021, 2290022, 0, 0, 0, 0, 0, 33, 33, 34, 0, 0, 0, 0, 0, 818012, 'The rookery - wave 2'),
(2290023, 75, 6, 39, 2290020, 2290021, 2290022, 0, 0, 0, 0, 0, 33, 33, 34, 0, 0, 0, 0, 0, 818012, 'The rookery - wave 3'),
(2290023, 110, 7, 39, 2290020, 2290021, 2290022, 0, 0, 0, 0, 0, 33, 33, 34, 0, 0, 0, 0, 0, 818012, 'The rookery - wave 4'),
(2290023, 145, 8, 39, 2290020, 2290021, 2290022, 0, 0, 0, 0, 0, 33, 33, 34, 0, 0, 0, 0, 0, 818012, 'The rookery - wave 5'),
(2290023, 180, 9, 10, 10264, 3600000, 0, 0, 40153, 0, 9, 2, 0, 0, -1, 7, 43.7685, -259.82, 91.6483, 0, 818012, 'The rookery - Solakar Flamewreath'),
(2290023, 180, 10, 37, 6, 3, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 818012, 'The rookery - Solakar come (6 = 3)'),
(2290024, 0, 0, 18, 0, 0, 0, 0, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, 229249, 'Stadium spectator - gone, if in the stands'),
(2290025, 0, 0, 18, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Stadium creature - gone'),
(2290026, 0, 0, 78, 3, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 4, 0, 0, 1, 0, 'Stadium wave - follows its leader (angle 1)'),
(2290027, 0, 0, 78, 3, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 4, 0, 0, 2, 0, 'Stadium wave - follows its leader (angle 2)'),
(2290028, 0, 0, 78, 3, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 4, 0, 0, 3, 0, 'Stadium wave - follows its leader (angle 3)'),
(2290029, 0, 0, 78, 3, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 4, 0, 0, 4, 0, 'Stadium wave - follows its leader (angle 4)'),
(2290030, 0, 0, 60, 3, 0, 0, 1, 0, 0, 0, 0, 0, 10442, 0, 0, 0, 0, 0, 0, 0, 'Stadium wave 7 - its leader into the stadium (path 10442)'),
(2290030, 0, 1, 10, 10442, 3600000, 0, 0, 0, 0, 0, 4, 1, 2290026, -1, 7, 210.0, -415.3, 110.94, 3.14, 0, 'Stadium wave 7 - a Chromatic Whelp behind its leader'),
(2290030, 0, 2, 10, 10447, 3600000, 0, 0, 0, 0, 0, 4, 1, 2290027, -1, 7, 206.46, -416.76, 110.94, 3.14, 0, 'Stadium wave 7 - a Chromatic Dragonspawn behind its leader'),
(2290030, 0, 3, 10, 10447, 3600000, 0, 0, 0, 0, 0, 4, 1, 2290028, -1, 7, 206.46, -423.84, 110.94, 3.14, 0, 'Stadium wave 7 - a Chromatic Dragonspawn behind its leader'),
(2290030, 0, 4, 10, 10742, 3600000, 0, 0, 0, 0, 0, 4, 1, 2290029, -1, 7, 210.0, -425.3, 110.94, 3.14, 0, 'Stadium wave 7 - a Blackhand Dragon Handler behind its leader'),
(2290031, 0, 0, 32, 229408, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'The stadium - on and before wave 7, or nothing'),
(2290031, 0, 1, 37, 9, 7, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'The stadium - wave 7 (9 = 7)'),
(2290031, 0, 2, 11, 258803, 10, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'The stadium - the combat door open 10 s'),
(2290031, 0, 3, 10, 10442, 3600000, 0, 0, 0, 0, 0, 0, 1, 2290030, -1, 7, 205.0, -420.3, 110.94, 3.14, 0, 'Lord Victor Nefarius - wave 7: a Chromatic Whelp leading'),
(2290032, 0, 0, 60, 3, 0, 0, 1, 0, 0, 0, 0, 0, 10442, 0, 0, 0, 0, 0, 0, 0, 'Stadium wave 6 - its leader into the stadium (path 10442)'),
(2290032, 0, 1, 10, 10442, 3600000, 0, 0, 0, 0, 0, 4, 1, 2290026, -1, 7, 210.0, -415.3, 110.94, 3.14, 0, 'Stadium wave 6 - a Chromatic Whelp behind its leader'),
(2290032, 0, 2, 10, 10447, 3600000, 0, 0, 0, 0, 0, 4, 1, 2290027, -1, 7, 206.46, -416.76, 110.94, 3.14, 0, 'Stadium wave 6 - a Chromatic Dragonspawn behind its leader'),
(2290032, 0, 3, 10, 10447, 3600000, 0, 0, 0, 0, 0, 4, 1, 2290028, -1, 7, 206.46, -423.84, 110.94, 3.14, 0, 'Stadium wave 6 - a Chromatic Dragonspawn behind its leader'),
(2290032, 0, 4, 10, 10742, 3600000, 0, 0, 0, 0, 0, 4, 1, 2290029, -1, 7, 210.0, -425.3, 110.94, 3.14, 0, 'Stadium wave 6 - a Blackhand Dragon Handler behind its leader'),
(2290033, 0, 0, 32, 229409, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'The stadium - on and before wave 6, or nothing'),
(2290033, 0, 1, 37, 9, 6, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'The stadium - wave 6 (9 = 6)'),
(2290033, 0, 2, 11, 258803, 10, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'The stadium - the combat door open 10 s'),
(2290033, 0, 3, 10, 10442, 3600000, 0, 0, 0, 0, 0, 0, 1, 2290032, -1, 7, 205.0, -420.3, 110.94, 3.14, 0, 'Lord Victor Nefarius - wave 6: a Chromatic Whelp leading'),
(2290033, 60, 4, 39, 2290031, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0, 0, 0, 0, 0, 0, 0, 'The stadium - wave 7 in a minute'),
(2290034, 0, 0, 60, 3, 0, 0, 1, 0, 0, 0, 0, 0, 10442, 0, 0, 0, 0, 0, 0, 0, 'Stadium wave 5 - its leader into the stadium (path 10442)'),
(2290034, 0, 1, 10, 10442, 3600000, 0, 0, 0, 0, 0, 4, 1, 2290026, -1, 7, 210.0, -415.3, 110.94, 3.14, 0, 'Stadium wave 5 - a Chromatic Whelp behind its leader'),
(2290034, 0, 2, 10, 10442, 3600000, 0, 0, 0, 0, 0, 4, 1, 2290027, -1, 7, 206.46, -416.76, 110.94, 3.14, 0, 'Stadium wave 5 - a Chromatic Whelp behind its leader'),
(2290034, 0, 3, 10, 10447, 3600000, 0, 0, 0, 0, 0, 4, 1, 2290028, -1, 7, 206.46, -423.84, 110.94, 3.14, 0, 'Stadium wave 5 - a Chromatic Dragonspawn behind its leader'),
(2290034, 0, 4, 10, 10742, 3600000, 0, 0, 0, 0, 0, 4, 1, 2290029, -1, 7, 210.0, -425.3, 110.94, 3.14, 0, 'Stadium wave 5 - a Blackhand Dragon Handler behind its leader'),
(2290035, 0, 0, 32, 10229410, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'The stadium - on and before wave 5, or nothing'),
(2290035, 0, 1, 37, 9, 5, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'The stadium - wave 5 (9 = 5)'),
(2290035, 0, 2, 11, 258803, 10, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'The stadium - the combat door open 10 s'),
(2290035, 0, 3, 10, 10442, 3600000, 0, 0, 0, 0, 0, 0, 1, 2290034, -1, 7, 205.0, -420.3, 110.94, 3.14, 0, 'Lord Victor Nefarius - wave 5: a Chromatic Whelp leading'),
(2290035, 60, 4, 39, 2290033, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0, 0, 0, 0, 0, 0, 0, 'The stadium - wave 6 in a minute'),
(2290036, 0, 0, 60, 3, 0, 0, 1, 0, 0, 0, 0, 0, 10442, 0, 0, 0, 0, 0, 0, 0, 'Stadium wave 4 - its leader into the stadium (path 10442)'),
(2290036, 0, 1, 10, 10442, 3600000, 0, 0, 0, 0, 0, 4, 1, 2290026, -1, 7, 210.0, -415.3, 110.94, 3.14, 0, 'Stadium wave 4 - a Chromatic Whelp behind its leader'),
(2290036, 0, 2, 10, 10447, 3600000, 0, 0, 0, 0, 0, 4, 1, 2290027, -1, 7, 206.46, -416.76, 110.94, 3.14, 0, 'Stadium wave 4 - a Chromatic Dragonspawn behind its leader'),
(2290036, 0, 3, 10, 10742, 3600000, 0, 0, 0, 0, 0, 4, 1, 2290028, -1, 7, 206.46, -423.84, 110.94, 3.14, 0, 'Stadium wave 4 - a Blackhand Dragon Handler behind its leader'),
(2290037, 0, 0, 32, 229411, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'The stadium - on and before wave 4, or nothing'),
(2290037, 0, 1, 37, 9, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'The stadium - wave 4 (9 = 4)'),
(2290037, 0, 2, 11, 258803, 10, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'The stadium - the combat door open 10 s'),
(2290037, 0, 3, 10, 10442, 3600000, 0, 0, 0, 0, 0, 0, 1, 2290036, -1, 7, 205.0, -420.3, 110.94, 3.14, 0, 'Lord Victor Nefarius - wave 4: a Chromatic Whelp leading'),
(2290037, 60, 4, 39, 2290035, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0, 0, 0, 0, 0, 0, 0, 'The stadium - wave 5 in a minute'),
(2290038, 0, 0, 60, 3, 0, 0, 1, 0, 0, 0, 0, 0, 10442, 0, 0, 0, 0, 0, 0, 0, 'Stadium wave 3 - its leader into the stadium (path 10442)'),
(2290038, 0, 1, 10, 10442, 3600000, 0, 0, 0, 0, 0, 4, 1, 2290026, -1, 7, 210.0, -415.3, 110.94, 3.14, 0, 'Stadium wave 3 - a Chromatic Whelp behind its leader'),
(2290038, 0, 2, 10, 10447, 3600000, 0, 0, 0, 0, 0, 4, 1, 2290027, -1, 7, 206.46, -416.76, 110.94, 3.14, 0, 'Stadium wave 3 - a Chromatic Dragonspawn behind its leader'),
(2290038, 0, 3, 10, 10742, 3600000, 0, 0, 0, 0, 0, 4, 1, 2290028, -1, 7, 206.46, -423.84, 110.94, 3.14, 0, 'Stadium wave 3 - a Blackhand Dragon Handler behind its leader'),
(2290039, 0, 0, 32, 229412, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'The stadium - on and before wave 3, or nothing'),
(2290039, 0, 1, 37, 9, 3, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'The stadium - wave 3 (9 = 3)'),
(2290039, 0, 2, 11, 258803, 10, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'The stadium - the combat door open 10 s'),
(2290039, 0, 3, 10, 10442, 3600000, 0, 0, 0, 0, 0, 0, 1, 2290038, -1, 7, 205.0, -420.3, 110.94, 3.14, 0, 'Lord Victor Nefarius - wave 3: a Chromatic Whelp leading'),
(2290039, 60, 4, 39, 2290037, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0, 0, 0, 0, 0, 0, 0, 'The stadium - wave 4 in a minute'),
(2290040, 0, 0, 60, 3, 0, 0, 1, 0, 0, 0, 0, 0, 10442, 0, 0, 0, 0, 0, 0, 0, 'Stadium wave 2 - its leader into the stadium (path 10442)'),
(2290040, 0, 1, 10, 10442, 3600000, 0, 0, 0, 0, 0, 4, 1, 2290026, -1, 7, 210.0, -415.3, 110.94, 3.14, 0, 'Stadium wave 2 - a Chromatic Whelp behind its leader'),
(2290040, 0, 2, 10, 10442, 3600000, 0, 0, 0, 0, 0, 4, 1, 2290027, -1, 7, 206.46, -416.76, 110.94, 3.14, 0, 'Stadium wave 2 - a Chromatic Whelp behind its leader'),
(2290040, 0, 3, 10, 10447, 3600000, 0, 0, 0, 0, 0, 4, 1, 2290028, -1, 7, 206.46, -423.84, 110.94, 3.14, 0, 'Stadium wave 2 - a Chromatic Dragonspawn behind its leader'),
(2290041, 0, 0, 32, 229413, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'The stadium - on and before wave 2, or nothing'),
(2290041, 0, 1, 37, 9, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'The stadium - wave 2 (9 = 2)'),
(2290041, 0, 2, 11, 258803, 10, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'The stadium - the combat door open 10 s'),
(2290041, 0, 3, 10, 10442, 3600000, 0, 0, 0, 0, 0, 0, 1, 2290040, -1, 7, 205.0, -420.3, 110.94, 3.14, 0, 'Lord Victor Nefarius - wave 2: a Chromatic Whelp leading'),
(2290041, 60, 4, 39, 2290039, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0, 0, 0, 0, 0, 0, 0, 'The stadium - wave 3 in a minute'),
(2290042, 0, 0, 60, 3, 0, 0, 1, 0, 0, 0, 0, 0, 10442, 0, 0, 0, 0, 0, 0, 0, 'Stadium wave 1 - its leader into the stadium (path 10442)'),
(2290042, 0, 1, 10, 10442, 3600000, 0, 0, 0, 0, 0, 4, 1, 2290026, -1, 7, 210.0, -415.3, 110.94, 3.14, 0, 'Stadium wave 1 - a Chromatic Whelp behind its leader'),
(2290042, 0, 2, 10, 10442, 3600000, 0, 0, 0, 0, 0, 4, 1, 2290027, -1, 7, 206.46, -416.76, 110.94, 3.14, 0, 'Stadium wave 1 - a Chromatic Whelp behind its leader'),
(2290042, 0, 3, 10, 10447, 3600000, 0, 0, 0, 0, 0, 4, 1, 2290028, -1, 7, 206.46, -423.84, 110.94, 3.14, 0, 'Stadium wave 1 - a Chromatic Dragonspawn behind its leader'),
(2290043, 0, 0, 32, 229414, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'The stadium - on and before wave 1, or nothing'),
(2290043, 0, 1, 37, 9, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'The stadium - wave 1 (9 = 1)'),
(2290043, 0, 2, 11, 258803, 10, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'The stadium - the combat door open 10 s'),
(2290043, 0, 3, 10, 10442, 3600000, 0, 0, 0, 0, 0, 0, 1, 2290042, -1, 7, 205.0, -420.3, 110.94, 3.14, 0, 'Lord Victor Nefarius - wave 1: a Chromatic Whelp leading'),
(2290043, 60, 4, 39, 2290041, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0, 0, 0, 0, 0, 0, 0, 'The stadium - wave 2 in a minute'),
(2290044, 0, 0, 60, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Gyth - his path into the stadium'),
(2290045, 0, 0, 32, 229415, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'The stadium - the last wave on, or nothing'),
(2290045, 0, 1, 37, 9, 8, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'The stadium - Gyth''s intro (9 = 8)'),
(2290045, 0, 2, 0, 1, 0, 0, 0, 0, 0, 0, 0, 5709, 0, 0, 0, 0, 0, 0, 0, 0, 'Lord Victor Nefarius - "THIS CANNOT BE!!! Rend, deal with these insects."'),
(2290045, 3, 3, 0, 1, 0, 0, 0, 41809, 0, 9, 2, 5722, 0, 0, 0, 0, 0, 0, 0, 4623, 'Warchief Rend Blackhand - "With pleasure..."'),
(2290045, 5, 4, 0, 1, 0, 0, 0, 0, 0, 0, 0, 5720, 0, 0, 0, 0, 0, 0, 0, 4623, 'Lord Victor Nefarius - "The Warchief shall make quick work of you..."'),
(2290045, 5, 5, 25, 1, 0, 0, 0, 41809, 0, 9, 2, 0, 0, 0, 0, 0, 0, 0, 0, 4623, 'Warchief Rend Blackhand - runs'),
(2290045, 5, 6, 3, 0, 0, 1, 2, 41809, 0, 9, 2, 1, 0, 0, 0, 165.74, -466.46, 116.8, 0, 4623, 'Warchief Rend Blackhand - away to Gyth (point 1)'),
(2290045, 5, 7, 18, 5000, 0, 0, 0, 41809, 0, 9, 2, 0, 0, 0, 0, 0, 0, 0, 0, 4623, 'Warchief Rend Blackhand - gone 5 s on'),
(2290045, 8, 8, 0, 2, 0, 0, 0, 0, 0, 0, 0, 5721, 0, 0, 0, 0, 0, 0, 0, 4623, 'Lord Victor Nefarius - paces back and forth'),
(2290045, 8, 9, 60, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 4623, 'Lord Victor Nefarius - paces'),
(2290045, 35, 10, 20, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 4623, 'Lord Victor Nefarius - stops pacing'),
(2290045, 35, 11, 3, 0, 0, 0, 2, 0, 0, 0, 0, 1, 0, 0, 0, 164.64, -443.3, 121.97, 1.61, 4623, 'Lord Victor Nefarius - back to his place (point 1)'),
(2290045, 35, 12, 10, 10339, 3600000, 0, 0, 0, 0, 0, 0, 1, 2290044, -1, 7, 211.762, -397.58, 111.18, 4.74, 4623, 'Lord Victor Nefarius - Gyth'),
(2290045, 35, 13, 37, 9, 9, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 4623, 'The stadium - Gyth (9 = 9)'),
(2290045, 35, 14, 11, 258803, 10, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 4623, 'The stadium - the combat door open 10 s'),
(2290046, 0, 0, 32, 229248, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'The stadium - Gyth out, or nothing'),
(2290046, 0, 1, 37, 9, 10, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'The stadium - over (9 = 10)'),
(2290046, 0, 2, 0, 1, 0, 0, 0, 0, 0, 0, 0, 5824, 0, 0, 0, 0, 0, 0, 0, 0, 'Lord Victor Nefarius - "Your victory shall be short lived..."'),
(2290046, 0, 3, 37, 3, 3, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'The stadium - done (3 = 3)'),
(2290046, 0, 4, 80, 0, 0, 0, 0, 258805, 0, 12, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'The stadium''s exit - open'),
(2290046, 0, 5, 68, 2290024, 2, 9819, 150, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'The stadium - done: the spectators (9819) gone'),
(2290046, 0, 6, 68, 2290024, 2, 10317, 150, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'The stadium - done: the spectators (10317) gone'),
(2290046, 5, 7, 3, 0, 0, 1, 2, 0, 0, 0, 0, 1, 0, 0, 0, 165.74, -466.46, 116.8, 0, 0, 'Lord Victor Nefarius - away (point 1)'),
(2290046, 5, 8, 18, 5000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Lord Victor Nefarius - gone 5 s on'),
(2290047, 0, 0, 37, 7, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'The stadium - the rows drive the instance? (7 = 1)'),
(2290047, 0, 1, 32, 818013, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'The stadium - the C++ instance answers: nothing'),
(2290047, 0, 2, 32, 4623, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'The stadium - on, or nothing'),
(2290047, 0, 3, 37, 3, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'The stadium - failed (3 = 2)'),
(2290047, 0, 4, 37, 9, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'The stadium - from the start (9 = 0)'),
(2290047, 0, 5, 18, 0, 0, 0, 0, 41877, 0, 9, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Lord Victor Nefarius - gone'),
(2290047, 0, 6, 18, 0, 0, 0, 0, 41809, 0, 9, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Warchief Rend Blackhand - gone'),
(2290047, 0, 7, 68, 2290025, 2, 10442, 150, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'The stadium - failed: every Chromatic Whelp gone'),
(2290047, 0, 8, 68, 2290025, 2, 10447, 150, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'The stadium - failed: every Chromatic Dragonspawn gone'),
(2290047, 0, 9, 68, 2290025, 2, 10742, 150, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'The stadium - failed: every Blackhand Dragon Handler gone'),
(2290047, 0, 10, 68, 2290025, 2, 10339, 150, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'The stadium - failed: every Gyth gone'),
(2290047, 0, 11, 68, 2290025, 2, 10429, 150, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'The stadium - failed: every Warchief Rend Blackhand gone'),
(2290047, 0, 12, 68, 2290024, 2, 9819, 150, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'The stadium - failed: the spectators (9819) gone'),
(2290047, 0, 13, 68, 2290024, 2, 10317, 150, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'The stadium - failed: the spectators (10317) gone'),
(2290049, 0, 0, 59, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Blackhand Veteran (spectator 1) - defensive'),
(2290049, 0, 1, 34, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 160.619, -395.826, 121.9752, 4.780588, 0, 'Blackhand Veteran (spectator 1) - home in the stands'),
(2290049, 0, 2, 3, 0, 0, 1, 2, 0, 0, 0, 0, 1, 0, 0, 0, 160.619, -395.826, 121.9752, 4.780588, 0, 'Blackhand Veteran (spectator 1) - to the stands (point 1)'),
(2290050, 0, 0, 59, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Blackhand Veteran (spectator 2) - defensive'),
(2290050, 0, 1, 34, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 162.1428, -395.1175, 121.9751, 4.605655, 0, 'Blackhand Veteran (spectator 2) - home in the stands'),
(2290050, 0, 2, 3, 0, 0, 1, 2, 0, 0, 0, 0, 1, 0, 0, 0, 162.1428, -395.1175, 121.9751, 4.605655, 0, 'Blackhand Veteran (spectator 2) - to the stands (point 1)'),
(2290051, 0, 0, 59, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Blackhand Veteran (spectator 3) - defensive'),
(2290051, 0, 1, 34, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 158.6822, -395.7097, 121.9753, 4.495208, 0, 'Blackhand Veteran (spectator 3) - home in the stands'),
(2290051, 0, 2, 3, 0, 0, 1, 2, 0, 0, 0, 0, 1, 0, 0, 0, 158.6822, -395.7097, 121.9753, 4.495208, 0, 'Blackhand Veteran (spectator 3) - to the stands (point 1)'),
(2290052, 0, 0, 59, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Blackhand Elite (spectator 4) - defensive'),
(2290052, 0, 1, 34, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 164.384, -395.3787, 121.9751, 4.780588, 0, 'Blackhand Elite (spectator 4) - home in the stands'),
(2290052, 0, 2, 3, 0, 0, 1, 2, 0, 0, 0, 0, 1, 0, 0, 0, 164.384, -395.3787, 121.9751, 4.780588, 0, 'Blackhand Elite (spectator 4) - to the stands (point 1)'),
(2290053, 0, 0, 59, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Blackhand Veteran (spectator 5) - defensive'),
(2290053, 0, 1, 34, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 156.9669, -395.2188, 121.9752, 4.604523, 0, 'Blackhand Veteran (spectator 5) - home in the stands'),
(2290053, 0, 2, 3, 0, 0, 1, 2, 0, 0, 0, 0, 1, 0, 0, 0, 156.9669, -395.2188, 121.9752, 4.604523, 0, 'Blackhand Veteran (spectator 5) - to the stands (point 1)'),
(2290054, 0, 0, 59, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Blackhand Veteran (spectator 6) - defensive'),
(2290054, 0, 1, 34, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 166.2515, -395.0366, 121.975, 4.491718, 0, 'Blackhand Veteran (spectator 6) - home in the stands'),
(2290054, 0, 2, 3, 0, 0, 1, 2, 0, 0, 0, 0, 1, 0, 0, 0, 166.2515, -395.0366, 121.975, 4.491718, 0, 'Blackhand Veteran (spectator 6) - to the stands (point 1)'),
(2290055, 0, 0, 59, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Blackhand Veteran (spectator 7) - defensive'),
(2290055, 0, 1, 34, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 143.814, -396.7092, 121.9753, 4.881825, 0, 'Blackhand Veteran (spectator 7) - home in the stands'),
(2290055, 0, 2, 3, 0, 0, 1, 2, 0, 0, 0, 0, 1, 0, 0, 0, 143.814, -396.7092, 121.9753, 4.881825, 0, 'Blackhand Veteran (spectator 7) - to the stands (point 1)'),
(2290056, 0, 0, 59, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Blackhand Veteran (spectator 8) - defensive'),
(2290056, 0, 1, 34, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 145.3893, -396.1959, 121.9752, 4.863706, 0, 'Blackhand Veteran (spectator 8) - home in the stands'),
(2290056, 0, 2, 3, 0, 0, 1, 2, 0, 0, 0, 0, 1, 0, 0, 0, 145.3893, -396.1959, 121.9752, 4.863706, 0, 'Blackhand Veteran (spectator 8) - to the stands (point 1)'),
(2290057, 0, 0, 59, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Blackhand Veteran (spectator 9) - defensive'),
(2290057, 0, 1, 34, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 142.1598, -396.0284, 121.9752, 4.621741, 0, 'Blackhand Veteran (spectator 9) - home in the stands'),
(2290057, 0, 2, 3, 0, 0, 1, 2, 0, 0, 0, 0, 1, 0, 0, 0, 142.1598, -396.0284, 121.9752, 4.621741, 0, 'Blackhand Veteran (spectator 9) - to the stands (point 1)'),
(2290058, 0, 0, 59, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Blackhand Elite (spectator 10) - defensive'),
(2290058, 0, 1, 34, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 147.7274, -396.3042, 121.9753, 4.881825, 0, 'Blackhand Elite (spectator 10) - home in the stands'),
(2290058, 0, 2, 3, 0, 0, 1, 2, 0, 0, 0, 0, 1, 0, 0, 0, 147.7274, -396.3042, 121.9753, 4.881825, 0, 'Blackhand Elite (spectator 10) - to the stands (point 1)'),
(2290059, 0, 0, 59, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Blackhand Veteran (spectator 11) - defensive'),
(2290059, 0, 1, 34, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 139.9446, -396.7277, 121.9753, 4.854771, 0, 'Blackhand Veteran (spectator 11) - home in the stands'),
(2290059, 0, 2, 3, 0, 0, 1, 2, 0, 0, 0, 0, 1, 0, 0, 0, 139.9446, -396.7277, 121.9753, 4.854771, 0, 'Blackhand Veteran (spectator 11) - to the stands (point 1)'),
(2290060, 0, 0, 59, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Blackhand Veteran (spectator 12) - defensive'),
(2290060, 0, 1, 34, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 149.3754, -395.7497, 121.9753, 4.568416, 0, 'Blackhand Veteran (spectator 12) - home in the stands'),
(2290060, 0, 2, 3, 0, 0, 1, 2, 0, 0, 0, 0, 1, 0, 0, 0, 149.3754, -395.7497, 121.9753, 4.568416, 0, 'Blackhand Veteran (spectator 12) - to the stands (point 1)'),
(2290048, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 5635, 0, 0, 0, 0, 0, 0, 0, 0, 'Lord Victor Nefarius - "Excellent... it would appear as if the meddlesome insects have arrived..."'),
(2290048, 7, 1, 0, 1, 0, 0, 0, 0, 0, 0, 0, 5640, 0, 0, 0, 0, 0, 0, 0, 4623, 'Lord Victor Nefarius - "Let not even a drop of their blood remain upon the arena floor..."'),
(2290048, 12, 2, 32, 4623, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'The stadium - still on, or nothing'),
(2290048, 12, 3, 35, 1, 0, 0, 0, 41809, 0, 9, 2, 0, 0, 0, 0, 0, 0, 0, 1.61, 0, 'Warchief Rend Blackhand - faces the arena'),
(2290048, 12, 4, 3, 0, 0, 0, 2, 0, 0, 0, 0, 1, 0, 0, 0, 164.64, -443.3, 121.97, 1.61, 0, 'Lord Victor Nefarius - to his place (point 1)'),
(2290048, 12, 5, 10, 9819, 3600000, 0, 0, 0, 0, 0, 0, 1, 2290049, -1, 7, 163.3209, -340.9818, 111.0216, 0, 0, 'Lord Victor Nefarius - spectator 1'),
(2290048, 12, 6, 10, 9819, 3600000, 0, 0, 0, 0, 0, 0, 1, 2290050, -1, 7, 164.2471, -339.0313, 111.0368, 0, 0, 'Lord Victor Nefarius - spectator 2'),
(2290048, 12, 7, 10, 9819, 3600000, 0, 0, 0, 0, 0, 0, 1, 2290051, -1, 7, 161.124, -339.5178, 111.0381, 0, 0, 'Lord Victor Nefarius - spectator 3'),
(2290048, 12, 8, 10, 10317, 3600000, 0, 0, 0, 0, 0, 0, 1, 2290052, -1, 7, 162.5045, -337.8101, 111.0367, 0, 0, 'Lord Victor Nefarius - spectator 4'),
(2290048, 12, 9, 10, 9819, 3600000, 0, 0, 0, 0, 0, 0, 1, 2290053, -1, 7, 160.9896, -337.7715, 111.0368, 0, 0, 'Lord Victor Nefarius - spectator 5'),
(2290048, 12, 10, 10, 9819, 3600000, 0, 0, 0, 0, 0, 0, 1, 2290054, -1, 7, 161.8347, -335.7923, 111.0352, 0, 0, 'Lord Victor Nefarius - spectator 6'),
(2290048, 12, 11, 10, 9819, 3600000, 0, 0, 0, 0, 0, 0, 1, 2290055, -1, 7, 113.9726, -366.0805, 116.9195, 0, 0, 'Lord Victor Nefarius - spectator 7'),
(2290048, 12, 12, 10, 9819, 3600000, 0, 0, 0, 0, 0, 0, 1, 2290056, -1, 7, 112.7245, -368.9635, 116.9307, 0, 0, 'Lord Victor Nefarius - spectator 8'),
(2290048, 12, 13, 10, 9819, 3600000, 0, 0, 0, 0, 0, 0, 1, 2290057, -1, 7, 110.5757, -368.2123, 116.9278, 0, 0, 'Lord Victor Nefarius - spectator 9'),
(2290048, 12, 14, 10, 10317, 3600000, 0, 0, 0, 0, 0, 0, 1, 2290058, -1, 7, 109.3343, -366.4785, 116.9261, 0, 0, 'Lord Victor Nefarius - spectator 10'),
(2290048, 12, 15, 10, 9819, 3600000, 0, 0, 0, 0, 0, 0, 1, 2290059, -1, 7, 110.1331, -363.9824, 116.9272, 0, 0, 'Lord Victor Nefarius - spectator 11'),
(2290048, 12, 16, 10, 9819, 3600000, 0, 0, 0, 0, 0, 0, 1, 2290060, -1, 7, 111.9971, -363.0948, 116.929, 0, 0, 'Lord Victor Nefarius - spectator 12'),
(2290048, 13, 17, 39, 2290043, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0, 0, 0, 0, 0, 0, 0, 'The stadium - wave 1'),
(2290061, 0, 0, 37, 7, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'The stadium - the rows drive the instance? (7 = 1)'),
(2290061, 0, 1, 32, 818013, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'The stadium - the C++ instance answers: nothing'),
(2290061, 0, 2, 37, 3, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'The stadium - on (3 = 1)'),
(2290061, 0, 3, 37, 9, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'The stadium - from the start (9 = 0)'),
(2290061, 0, 4, 71, 0, 0, 0, 0, 41877, 0, 9, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Lord Victor Nefarius - back, if dead'),
(2290061, 0, 5, 71, 0, 0, 0, 0, 41809, 0, 9, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Warchief Rend Blackhand - back, if dead'),
(2290061, 0, 6, 39, 2290048, 0, 0, 0, 41877, 0, 9, 2, 100, 0, 0, 0, 0, 0, 0, 0, 0, 'Lord Victor Nefarius - the stadium'),
(2290062, 0, 0, 0, 1, 0, 0, 0, 41877, 0, 9, 2, 5665, 5671, 5666, 5667, 0, 0, 0, 0, 0, 'Lord Victor Nefarius - a taunt'),
(2290063, 0, 0, 0, 1, 0, 0, 0, 41877, 0, 9, 2, 5668, 5669, 5664, 5719, 0, 0, 0, 0, 0, 'Lord Victor Nefarius - a taunt'),
(2290064, 0, 0, 15, 16562, 2, 0, 0, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Urok ogre - Urok Minions Vanish (its arrival)'),
(2290064, 0, 1, 49, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Urok ogre - at the players'),
(2290065, 0, 0, 15, 16473, 2, 0, 0, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Urok Doomhowl - Summoned Urok'),
(2290065, 0, 1, 49, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Urok Doomhowl - at the players'),
(2290066, 0, 0, 81, 0, 1, 0, 0, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Urok''s challenge - gone'),
(2290067, 0, 0, 10, 10602, 600000, 0, 0, 0, 0, 0, 0, 0, 2290064, -1, 4, -27.78, -385.75, 48.5, 0, 0, 'Urok''s challenge - an Urok Ogre Magus at circle 1'),
(2290068, 0, 0, 10, 10601, 600000, 0, 0, 0, 0, 0, 0, 0, 2290064, -1, 4, -27.78, -385.75, 48.5, 0, 0, 'Urok''s challenge - an Urok Enforcer at circle 1'),
(2290069, 0, 0, 10, 10602, 600000, 0, 0, 0, 0, 0, 0, 0, 2290064, -1, 4, -25.0, -369.9, 49.66, 0, 0, 'Urok''s challenge - an Urok Ogre Magus at circle 2'),
(2290070, 0, 0, 10, 10601, 600000, 0, 0, 0, 0, 0, 0, 0, 2290064, -1, 4, -25.0, -369.9, 49.66, 0, 0, 'Urok''s challenge - an Urok Enforcer at circle 2'),
(2290071, 0, 0, 10, 10602, 600000, 0, 0, 0, 0, 0, 0, 0, 2290064, -1, 4, -34.4, -370.6, 50.3, 0, 0, 'Urok''s challenge - an Urok Ogre Magus at circle 3'),
(2290072, 0, 0, 10, 10601, 600000, 0, 0, 0, 0, 0, 0, 0, 2290064, -1, 4, -34.4, -370.6, 50.3, 0, 0, 'Urok''s challenge - an Urok Enforcer at circle 3'),
(2290073, 0, 0, 10, 10602, 600000, 0, 0, 0, 0, 0, 0, 0, 2290064, -1, 4, -34.0, -370.4, 50.3, 0, 0, 'Urok''s challenge - an Urok Ogre Magus at circle 4'),
(2290074, 0, 0, 10, 10601, 600000, 0, 0, 0, 0, 0, 0, 0, 2290064, -1, 4, -34.0, -370.4, 50.3, 0, 0, 'Urok''s challenge - an Urok Enforcer at circle 4'),
(2290075, 0, 0, 10, 10602, 600000, 0, 0, 0, 0, 0, 0, 0, 2290064, -1, 4, -49.4, -368.5, 51.7, 0, 0, 'Urok''s challenge - an Urok Ogre Magus at circle 5'),
(2290076, 0, 0, 10, 10601, 600000, 0, 0, 0, 0, 0, 0, 0, 2290064, -1, 4, -49.4, -368.5, 51.7, 0, 0, 'Urok''s challenge - an Urok Enforcer at circle 5'),
(2290077, 0, 0, 37, 7, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Urok''s challenge - the rows drive the instance? (7 = 1)'),
(2290077, 0, 1, 32, 818013, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Urok''s challenge - the C++ instance answers: nothing'),
(2290077, 0, 2, 32, 229423, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Urok''s challenge - none on, or nothing'),
(2290077, 0, 3, 37, 20, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Urok''s challenge - on (20 = 1)'),
(2290077, 1, 4, 76, 175589, 3600, 0, 0, 175584, 60, 11, 2, 0, 0, 0, 0, -13.8113, -396.202, 48.536, 3.0208, 0, 'Urok''s challenge - the banner''s trap'),
(2290077, 1, 5, 76, 175571, 3600, 0, 0, 175584, 60, 11, 2, 0, 0, 0, 0, -13.7, -385.3, 48.95, 4.85, 0, 'Urok''s challenge - circle 0'),
(2290077, 1, 6, 76, 175571, 3600, 0, 0, 175584, 60, 11, 2, 0, 0, 0, 0, -27.78, -385.75, 48.5, 5.66, 0, 'Urok''s challenge - circle 1'),
(2290077, 1, 7, 76, 175571, 3600, 0, 0, 175584, 60, 11, 2, 0, 0, 0, 0, -25.0, -369.9, 49.66, 5.2, 0, 'Urok''s challenge - circle 2'),
(2290077, 1, 8, 76, 175571, 3600, 0, 0, 175584, 60, 11, 2, 0, 0, 0, 0, -34.4, -370.6, 50.3, 5.4, 0, 'Urok''s challenge - circle 3'),
(2290077, 1, 9, 76, 175571, 3600, 0, 0, 175584, 60, 11, 2, 0, 0, 0, 0, -34.0, -370.4, 50.3, 5.4, 0, 'Urok''s challenge - circle 4'),
(2290077, 1, 10, 76, 175571, 3600, 0, 0, 175584, 60, 11, 2, 0, 0, 0, 0, -49.4, -368.5, 51.7, 5.5, 0, 'Urok''s challenge - circle 5'),
(2290077, 4, 11, 10, 10602, 600000, 0, 0, 175584, 60, 11, 2, 0, 2290064, -1, 4, -13.7, -385.3, 48.95, 0, 0, 'Urok''s challenge - an Urok Ogre Magus at circle 0'),
(2290077, 4, 12, 10, 10601, 600000, 0, 0, 175584, 60, 11, 2, 0, 2290064, -1, 4, -25.0, -369.9, 49.66, 0, 0, 'Urok''s challenge - an Urok Enforcer at circle 2'),
(2290077, 4, 13, 10, 10601, 600000, 0, 0, 175584, 60, 11, 2, 0, 2290064, -1, 4, -34.4, -370.6, 50.3, 0, 0, 'Urok''s challenge - an Urok Enforcer at circle 3'),
(2290078, 0, 0, 10, 10584, 600000, 0, 0, 0, 0, 0, 0, 0, 2290065, -1, 7, -49.4, -368.5, 51.7, 0, 0, 'Urok''s challenge - Urok Doomhowl at circle 5'),
(2290078, 0, 1, 37, 20, 99, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Urok''s challenge - over (20 = 99)'),
(2290078, 0, 2, 68, 2290066, 0, 175571, 80, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Urok''s challenge - the circles gone');

DELETE FROM `gameobject_scripts` WHERE `id` IN (399066);
INSERT INTO `gameobject_scripts`
(`id`, `delay`, `priority`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`)
VALUES
(399066, 0, 0, 39, 2290023, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0, 0, 0, 0, 0, 0, 10229407, 'Father Flame - used: the rookery');

DELETE FROM `event_scripts` WHERE `id` IN (4777, 4884);
INSERT INTO `event_scripts`
(`id`, `delay`, `priority`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`)
VALUES
(4884, 0, 0, 37, 1, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Blackrock Altar - Emberseer''s guards freed (1 = SPECIAL)'),
(4884, 0, 1, 68, 2290004, 2, 10316, 80, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Blackrock Altar - the incarcerators into the fight'),
(4777, 0, 0, 37, 7, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Challenge to Urok destroyed - the rows drive the instance? (7 = 1)'),
(4777, 0, 1, 32, 818013, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Challenge to Urok destroyed - the C++ instance answers: nothing'),
(4777, 0, 2, 37, 20, 99, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Urok''s challenge - the banner destroyed: over (20 = 99)'),
(4777, 0, 3, 68, 2290066, 0, 175571, 60, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Urok''s challenge - the banner destroyed: every circle gone'),
(4777, 0, 4, 68, 2290066, 0, 175589, 60, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Urok''s challenge - the banner destroyed: every trap gone'),
(4777, 0, 5, 68, 2290066, 0, 175584, 60, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Urok''s challenge - the banner destroyed: every banner gone');

DELETE FROM `areatrigger_generic_script` WHERE `trigger_id` = 2046 AND `script_id` = 2290017;
INSERT INTO `areatrigger_generic_script`
(`trigger_id`, `script_id`, `condition_id`, `flags`, `comment`)
VALUES
(2046, 2290017, 229404, 3, 'The UBRS door: a player with the Seal of Ascension, the door shut');

DELETE FROM `areatrigger_generic_script` WHERE `trigger_id` = 2066 AND `script_id` = 2290018;
INSERT INTO `areatrigger_generic_script`
(`trigger_id`, `script_id`, `condition_id`, `flags`, `comment`)
VALUES
(2066, 2290018, 0, 1, 'The Beast''s hall: the Beast at the first player in, alive');

DELETE FROM `areatrigger_generic_script` WHERE `trigger_id` = 2026 AND `script_id` = 2290061;
INSERT INTO `areatrigger_generic_script`
(`trigger_id`, `script_id`, `condition_id`, `flags`, `comment`)
VALUES
(2026, 2290061, 229416, 3, 'The stadium: a player in, the stadium neither on nor done');

DELETE FROM `spell_script_target` WHERE `entry` = 16452 AND `type` = 1 AND `targetEntry` = 10601;
INSERT INTO `spell_script_target`
(`entry`, `type`, `targetEntry`, `conditionId`, `inverseEffectMask`)
VALUES
(16452, 1, 10601, 0, 0);

-- Steps added to scripts the migration does not own: each found by id, command, comments.
DELETE FROM `event_scripts` WHERE `id` = 4845 AND `command` = 39 AND `comments` = 'Challenge to Urok - the challenge (trt A18)';
INSERT INTO `event_scripts`
(`id`, `delay`, `priority`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`)
VALUES
(4845, 0, 1, 39, 2290077, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0, 0, 0, 0, 0, 0, 0, 'Challenge to Urok - the challenge (trt A18)');

UPDATE `gameobject_template` SET `data5` = 30 WHERE `entry` = 175589;
-- A gameobject's state as it spawns (AC3; the table from ac3_gameobject_spawn_state_whole.sql).
DELETE FROM `gameobject_spawn_state` WHERE `guid` = 260283 AND `ord` = 0;
DELETE FROM `gameobject_spawn_state` WHERE `guid` = 261637 AND `ord` = 0;
DELETE FROM `gameobject_spawn_state` WHERE `guid` = 258805 AND `ord` = 0;
DELETE FROM `gameobject_spawn_state` WHERE `guid` = 82597 AND `ord` = 0;
DELETE FROM `gameobject_spawn_state` WHERE `guid` = 397168 AND `ord` = 0;
DELETE FROM `gameobject_spawn_state` WHERE `guid` = 397169 AND `ord` = 0;
DELETE FROM `gameobject_spawn_state` WHERE `guid` = 397171 AND `ord` = 0;
DELETE FROM `gameobject_spawn_state` WHERE `guid` = 397170 AND `ord` = 0;
DELETE FROM `gameobject_spawn_state` WHERE `guid` = 397172 AND `ord` = 0;
DELETE FROM `gameobject_spawn_state` WHERE `guid` = 397174 AND `ord` = 0;
INSERT INTO `gameobject_spawn_state`
(`guid`, `ord`, `condition_id`, `state`, `flags_set`, `flags_clear`, `despawn`, `script_id`, `comment`)
VALUES
(260283, 0, 532000, 0, 0, 0, 0, 0, 'Emberseer In: open once every room is cleared'),
(261637, 0, 532001, 0, 0, 0, 0, 0, 'Emberseer Out: open once Pyroguard Emberseer is dead'),
(258805, 0, 532003, 0, 0, 0, 0, 0, 'the stadium''s exit: open once the stadium is done'),
(82597, 0, 33004, 0, 0, 0, 0, 0, 'the UBRS door (the door): open once opened'),
(397168, 0, 33004, 0, 0, 0, 0, 0, 'the UBRS door (brazier 1): open once opened'),
(397169, 0, 33004, 0, 0, 0, 0, 0, 'the UBRS door (brazier 2): open once opened'),
(397171, 0, 33004, 0, 0, 0, 0, 0, 'the UBRS door (brazier 3): open once opened'),
(397170, 0, 33004, 0, 0, 0, 0, 0, 'the UBRS door (brazier 4): open once opened'),
(397172, 0, 33004, 0, 0, 0, 0, 0, 'the UBRS door (brazier 5): open once opened'),
(397174, 0, 33004, 0, 0, 0, 0, 0, 'the UBRS door (brazier 6): open once opened');

-- The generic store's slots (AC7; the table from ac7_instance_data_slot.sql).
DELETE FROM `instance_data_slot` WHERE `map` = 229 AND `slot` = 0;
DELETE FROM `instance_data_slot` WHERE `map` = 229 AND `slot` = 1;
DELETE FROM `instance_data_slot` WHERE `map` = 229 AND `slot` = 2;
DELETE FROM `instance_data_slot` WHERE `map` = 229 AND `slot` = 3;
DELETE FROM `instance_data_slot` WHERE `map` = 229 AND `slot` = 4;
DELETE FROM `instance_data_slot` WHERE `map` = 229 AND `slot` = 5;
DELETE FROM `instance_data_slot` WHERE `map` = 229 AND `slot` = 6;
DELETE FROM `instance_data_slot` WHERE `map` = 229 AND `slot` = 7;
DELETE FROM `instance_data_slot` WHERE `map` = 229 AND `slot` = 8;
DELETE FROM `instance_data_slot` WHERE `map` = 229 AND `slot` = 9;
DELETE FROM `instance_data_slot` WHERE `map` = 229 AND `slot` = 10;
DELETE FROM `instance_data_slot` WHERE `map` = 229 AND `slot` = 11;
DELETE FROM `instance_data_slot` WHERE `map` = 229 AND `slot` = 12;
DELETE FROM `instance_data_slot` WHERE `map` = 229 AND `slot` = 13;
DELETE FROM `instance_data_slot` WHERE `map` = 229 AND `slot` = 14;
DELETE FROM `instance_data_slot` WHERE `map` = 229 AND `slot` = 15;
DELETE FROM `instance_data_slot` WHERE `map` = 229 AND `slot` = 16;
DELETE FROM `instance_data_slot` WHERE `map` = 229 AND `slot` = 20;
INSERT INTO `instance_data_slot`
(`map`, `slot`, `flags`, `name`)
VALUES
(229, 0, 1, 'the room event: every room cleared (3)'),
(229, 1, 1, 'Pyroguard Emberseer''s encounter (1-4)'),
(229, 2, 1, 'Solakar Flamewreath summoned once (unused by the rows)'),
(229, 3, 1, 'the stadium''s encounter (1 on, 2 failed, 3 done)'),
(229, 4, 1, 'Valthalak summoned once (unused by the rows)'),
(229, 5, 1, 'the UBRS door opened (3)'),
(229, 6, 1, 'the rookery (1 on, 3 Solakar come)'),
(229, 7, 4, 'the rows drive the instance (1)'),
(229, 8, 4, 'Bannok Grimaxe rolled (1)'),
(229, 9, 4, 'the stadium''s step: its wave (1-7), Gyth''s intro (8), Gyth (9), over (10)'),
(229, 10, 0, 'room event: rune 200001 room cleared (1)'),
(229, 11, 0, 'room event: rune 200002 room cleared (1)'),
(229, 12, 0, 'room event: rune 200003 room cleared (1)'),
(229, 13, 0, 'room event: rune 200004 room cleared (1)'),
(229, 14, 0, 'room event: rune 200005 room cleared (1)'),
(229, 15, 0, 'room event: rune 200006 room cleared (1)'),
(229, 16, 0, 'room event: rune 200007 room cleared (1)'),
(229, 20, 4, 'Urok''s challenge: its deaths + 1 (1-9), over (99)');

