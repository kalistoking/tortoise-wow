-- Blackrock Depths (map 230), its bosses, the arena, the Tomb of Seven and its objects: its C++ as rows -- EPIC10 tier 2.
-- Written by the trt repo's scripts/tier2/a12_blackrock_depths.py from t1_world; blackrock_depths_restore.sql puts
-- back what this replaces. R8: a person applies it, into the world database.
--
-- The C++ keeps its script names: mod-blackrock-depths is the switch (AM1, handoff/manager-091).
-- Loaded, the C++ runs as before -- a script found by name comes first. Unloaded
-- (`module unload mod-blackrock-depths`, which gives every creature standing a new AI at once),
-- the names find no script and the creatures run these rows (their ai_name).
--
-- Map 230 keeps instance_blackrock_depths, Grimstone and the Ring of Law, the Grim Guzzler and the jail break
-- (blackrock_depths.cpp). The objects' rows wait for their C++ to go (CONDITION_SCRIPT_LOADED reversed): it
-- returns false, so they would run beside it. The Tomb dwarves' reached-home rows wrote slot 4, the Lyceum;
-- they write the Tomb (3) now, and only while it is in progress. A failed Tomb sets the seven back with
-- IMMUNE_TO_PLAYER again (the C++ left it off); a call still due when the Tomb was started again within 30 s
-- runs with the new one. A dwarf fails the Tomb as it reaches home (the C++ also checked the last one called
-- for a victim). The Emperor's Hand of Thaurissan goes at his victim, as the C++ cast it, without its check for
-- a second player. The braziers do not repeat the Lyceum's yell once it is done; the portrait's keeper, the
-- relic coffer's Doomgrip and the kegs' Hurley come once (the C++ could summon more after). The bridge's
-- second guardsman runs at the player too (the C++ had him follow the first); Angerforge's Anvilrage follow
-- the nearest general within 100 yd. Gnashjaw and the voidwalkers fight as summons do.

UPDATE `creature_template` SET `ai_name` = 'EventAI' WHERE `entry` = 8929;
UPDATE `creature_template` SET `ai_name` = 'EventAI' WHERE `entry` = 9018;
UPDATE `creature_template` SET `ai_name` = 'EventAI' WHERE `entry` = 9019;
UPDATE `creature_template` SET `gossip_menu_id` = 902100 WHERE `entry` = 9021;
UPDATE `creature_template` SET `ai_name` = 'EventAI' WHERE `entry` = 9027;
UPDATE `creature_template` SET `ai_name` = 'EventAI' WHERE `entry` = 9028;
UPDATE `creature_template` SET `ai_name` = 'EventAI' WHERE `entry` = 9031;
UPDATE `creature_template` SET `ai_name` = 'EventAI' WHERE `entry` = 9033;
UPDATE `creature_template` SET `gossip_menu_id` = 903700 WHERE `entry` = 9037;
UPDATE `creature_template` SET `ai_name` = 'EventAI', `gossip_menu_id` = 903900 WHERE `entry` = 9039;
UPDATE `creature_template` SET `ai_name` = 'EventAI' WHERE `entry` = 9476;
UPDATE `creature_template` SET `ai_name` = 'EventAI' WHERE `entry` = 9537;
UPDATE `creature_template` SET `ai_name` = 'EventAI' WHERE `entry` = 9541;
UPDATE `creature_template` SET `ai_name` = 'EventAI' WHERE `entry` = 9938;
UPDATE `creature_template` SET `ai_name` = 'EventAI' WHERE `entry` = 10076;
UPDATE `creature_template` SET `ai_name` = 'EventAI' WHERE `entry` = 16049;
UPDATE `creature_template` SET `ai_name` = 'EventAI' WHERE `entry` = 16051;
UPDATE `creature_template` SET `ai_name` = 'EventAI' WHERE `entry` = 16052;
UPDATE `creature_template` SET `ai_name` = 'EventAI' WHERE `entry` = 16053;
UPDATE `creature_template` SET `ai_name` = 'EventAI' WHERE `entry` = 16055;
UPDATE `creature_template` SET `ai_name` = 'EventAI' WHERE `entry` = 16058;
UPDATE `creature_template` SET `ai_name` = 'EventAI' WHERE `entry` = 16059;

DELETE FROM `conditions` WHERE `condition_entry` IN (230004, 230005, 230012, 230014, 230020, 230021, 230022, 230023, 230024, 230025, 230032, 230033, 230041, 230042, 230050, 230051, 230052, 230060, 230062, 230063, 230070, 230080);
INSERT INTO `conditions`
(`condition_entry`, `type`, `value1`, `value2`, `value3`, `value4`, `flags`)
VALUES
(230004, -1, 116, 230003, 0, 0, 0),
(230005, 20, 9019, 200, 1, 0, 2),
(230012, 34, 3, 2, 0, 0, 0),
(230014, -1, 4623, 1000, 0, 0, 0),
(230020, 17, 14891, 1, 0, 0, 0),
(230021, 8, 4083, 0, 0, 0, 0),
(230022, 8, 4083, 0, 0, 0, 1),
(230023, 7, 186, 230, 0, 0, 0),
(230024, -1, 3600104, 230021, 230023, 230020, 0),
(230025, -1, 3600104, 230022, 230023, 0, 0),
(230032, 9, 4001, 1, 0, 0, 0),
(230033, 9, 4342, 1, 0, 0, 0),
(230042, 34, 6, 0, 0, 0, 0),
(230041, -1, 230000, 230042, 0, 0, 0),
(230050, 34, 7, 3, 0, 0, 0),
(230052, 34, 7, 3, 0, 0, 1),
(230051, -1, 230000, 230052, 0, 0, 0),
(230060, -1, 230000, 298, 0, 0, 0),
(230063, 34, 4, 1, 0, 0, 1),
(230062, -1, 230000, 230063, 230064, 0, 0),
(230070, -1, 230000, 349003, 0, 0, 0),
(230080, 34, 33, 3, 0, 0, 1);

-- Conditions another tier-2 migration writes too, under the same entry: whichever comes first.
INSERT IGNORE INTO `conditions`
(`condition_entry`, `type`, `value1`, `value2`, `value3`, `value4`, `flags`)
VALUES
(230000, 62, 0, 0, 0, 0, 1),
(230003, 41, 99, 2, 0, 0, 0),
(230040, 34, 6, 3, 0, 0, 0),
(230064, 34, 4, 3, 0, 0, 1),
(349003, 34, 1, 3, 0, 0, 1);

DELETE FROM `broadcast_text` WHERE `entry` IN (230101, 230102);
INSERT INTO `broadcast_text`
(`entry`, `male_text`, `female_text`, `chat_type`, `sound_id`, `language_id`, `emote_id1`, `emote_id2`, `emote_id3`, `emote_delay1`, `emote_delay2`, `emote_delay3`)
VALUES
(230101, 'Come to aid the Throne!', 'Come to aid the Throne!', 1, 0, 0, 0, 0, 0, 0, 0, 0),
(230102, 'Don''t let them take the moutain hearth!', 'Don''t let them take the moutain hearth!', 1, 0, 0, 0, 0, 0, 0, 0, 0);

DELETE FROM `creature_ai_events` WHERE `id` IN (892901, 892902, 892903, 892911, 892912, 898311, 898312, 898313, 898314, 898315, 901801, 901802, 901803, 901804, 901901, 901911, 901912, 901913, 901914, 901915, 902701, 902702, 902711, 902801, 902811, 903101, 903102, 903103, 903104, 903105, 903301, 903311, 903901, 903902, 903903, 903904, 903911, 903921, 903922, 903923, 903924, 947611, 947612, 947613, 947614, 953711, 953712, 953713, 953721, 953722, 953723, 993801, 993811, 993821, 993822, 993823, 1007601, 1007602, 1007603, 1007611, 1007612, 1604901, 1605101, 1605102, 1605103, 1605104, 1605201, 1605202, 1605211, 1605212, 1605213, 1605301, 1605302, 1605303, 1605501, 1605502, 1605503, 1605504, 1605505, 1605506, 1605801, 1605802, 1605901, 1605902, 1605903);
INSERT INTO `creature_ai_events`
(`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`)
VALUES
(903101, 9031, 0, 0, 0, 100, 1, 7000, 7000, 7000, 7000, 903101, 0, 0, 'Anub''shiah - Shadow Bolt'),
(903102, 9031, 0, 0, 0, 100, 1, 24000, 24000, 18000, 18000, 903102, 0, 0, 'Anub''shiah - Curse of Tongues'),
(903103, 9031, 0, 0, 0, 100, 1, 12000, 12000, 45000, 45000, 903103, 0, 0, 'Anub''shiah - Curse of Weakness'),
(903104, 9031, 0, 0, 0, 100, 1, 3000, 3000, 300000, 300000, 903104, 0, 0, 'Anub''shiah - Demon Armor'),
(903105, 9031, 0, 0, 0, 100, 1, 16000, 16000, 12000, 12000, 903105, 0, 0, 'Anub''shiah - Enveloping Web'),
(902701, 9027, 0, 0, 0, 100, 1, 12000, 12000, 15000, 15000, 902701, 0, 0, 'Gorosh the Dervish - Whirlwind'),
(902702, 9027, 0, 0, 0, 100, 1, 22000, 22000, 15000, 15000, 902702, 0, 0, 'Gorosh the Dervish - Mortal Strike'),
(902801, 9028, 0, 0, 0, 100, 1, 12000, 12000, 8000, 8000, 902801, 0, 0, 'Grizzle - Ground Tremor'),
(901801, 9018, 0, 0, 0, 100, 1, 4000, 4000, 7000, 7000, 901801, 0, 0, 'High Interrogator Gerstahn - Shadow Word: Pain'),
(901802, 9018, 0, 0, 0, 100, 1, 14000, 14000, 10000, 10000, 901802, 0, 0, 'High Interrogator Gerstahn - Mana Burn'),
(901803, 9018, 0, 0, 0, 100, 1, 32000, 32000, 30000, 30000, 901803, 0, 0, 'High Interrogator Gerstahn - Psychic Scream'),
(901804, 9018, 0, 0, 0, 100, 1, 8000, 8000, 25000, 25000, 901804, 0, 0, 'High Interrogator Gerstahn - Shadow Shield'),
(903301, 9033, 0, 0, 0, 100, 9, 5000, 10000, 5000, 15000, 903301, 0, 0, 'General Angerforge - Sunder Armor'),
(993801, 9938, 0, 0, 0, 100, 1, 5000, 5000, 6000, 6000, 993801, 0, 0, 'Magmus - Fiery Burst'),
(901901, 9019, 0, 0, 0, 100, 1, 18000, 18000, 18000, 18000, 901901, 0, 0, 'Emperor Dagran Thaurissan - Avatar of Flame'),
(1605901, 16059, 0, 0, 0, 100, 9, 10000, 10000, 20000, 30000, 1605901, 0, 0, 'Theldren - Charge at a player out of melee'),
(1605902, 16059, 0, 0, 0, 100, 9, 10000, 10000, 8000, 15000, 1605902, 0, 0, 'Theldren - Mortal Strike'),
(1605903, 16059, 0, 0, 0, 100, 9, 30000, 30000, 30000, 40000, 1605903, 0, 0, 'Theldren - Intimidating Shout'),
(1605301, 16053, 0, 0, 0, 100, 9, 10000, 10000, 10000, 12000, 1605301, 0, 0, 'Korv - Frost Shock'),
(1605302, 16053, 0, 0, 0, 100, 9, 20000, 20000, 20000, 20000, 1605302, 0, 0, 'Korv - Earthbind Totem'),
(1605303, 16053, 0, 0, 0, 100, 9, 20000, 20000, 20000, 20000, 1605303, 0, 0, 'Korv - Fire Nova Totem'),
(1604901, 16049, 0, 0, 0, 100, 9, 2000, 2000, 2000, 3000, 1604901, 0, 0, 'Lefty - Five Fat Finger Exploding Heart Technique'),
(1605101, 16051, 0, 0, 0, 100, 9, 15000, 15000, 10000, 20000, 1605101, 0, 0, 'Snokh Blackspine - Pyroblast'),
(1605102, 16051, 0, 0, 0, 100, 9, 4000, 4000, 3000, 5000, 1605102, 0, 0, 'Snokh Blackspine - Scorch'),
(1605103, 16051, 0, 0, 0, 100, 9, 20000, 20000, 10000, 20000, 1605103, 0, 0, 'Snokh Blackspine - Flamestrike'),
(1605104, 16051, 0, 0, 0, 100, 9, 30000, 30000, 25000, 30000, 1605104, 0, 0, 'Snokh Blackspine - Polymorph'),
(1605801, 16058, 0, 0, 0, 100, 9, 4000, 4000, 14000, 18000, 1605801, 0, 0, 'Volida - Blizzard'),
(1605802, 16058, 0, 0, 0, 100, 9, 20000, 20000, 20000, 20000, 1605802, 0, 0, 'Volida - Cone of Cold'),
(1605201, 16052, 0, 0, 0, 100, 9, 8000, 8000, 18000, 24000, 1605201, 0, 0, 'Malgen Longspear - Aimed Shot at a player out of melee'),
(1605202, 16052, 0, 0, 0, 100, 9, 15000, 15000, 20000, 20000, 1605202, 0, 0, 'Malgen Longspear - Multi-Shot at a player out of melee'),
(902711, 9027, 0, 2, 0, 100, 1, 50, 0, 45000, 45000, 902711, 0, 0, 'Gorosh the Dervish - Bloodlust under half health'),
(902811, 9028, 0, 2, 0, 100, 9, 50, 0, 15000, 15000, 902811, 0, 0, 'Grizzle - Frenzy under half health, with its emote'),
(993811, 9938, 0, 2, 0, 100, 1, 50, 0, 8000, 8000, 993811, 0, 0, 'Magmus - War Stomp under half health'),
(903311, 9033, 0, 2, 0, 100, 1, 29, 0, 180000, 180000, 903311, 0, 0, 'General Angerforge - under 30%: his alarm, ten Anvilrage'),
(993821, 9938, 0, 4, 0, 100, 0, 0, 0, 0, 0, 993821, 0, 0, 'Magmus - aggro: the Iron Hall in progress (5)'),
(993822, 9938, 0, 7, 0, 100, 0, 0, 0, 0, 0, 993822, 0, 0, 'Magmus - evading: the Iron Hall failed (5)'),
(993823, 9938, 0, 6, 0, 100, 0, 0, 0, 0, 0, 993823, 0, 0, 'Magmus - dead: the Iron Hall done (5)'),
(901911, 9019, 0, 4, 0, 100, 0, 0, 0, 0, 0, 901911, 0, 0, 'Emperor Dagran Thaurissan - aggro: his line, a call for help'),
(901912, 9019, 0, 0, 0, 100, 1, 8000, 8000, 20000, 20000, 901912, 0, 0, 'Emperor Dagran Thaurissan - calls for help'),
(901913, 9019, 0, 0, 0, 100, 9, 5000, 7500, 10000, 15000, 901913, 0, 0, 'Emperor Dagran Thaurissan - Hand of Thaurissan'),
(901914, 9019, 0, 5, 0, 100, 1, 0, 0, 0, 0, 901914, 0, 0, 'Emperor Dagran Thaurissan - kill: "Hail to the king, baby!"'),
(901915, 9019, 0, 6, 0, 100, 0, 0, 0, 0, 0, 901915, 0, 0, 'Emperor Dagran Thaurissan - dead: the princess friendly, back home'),
(892901, 8929, 0, 0, 0, 100, 1, 16000, 16000, 14000, 14000, 892901, 0, 0, 'Princess Moira Bronzebeard - Mind Blast'),
(892902, 8929, 0, 0, 0, 100, 1, 2000, 2000, 18000, 18000, 892902, 0, 0, 'Princess Moira Bronzebeard - Shadow Word: Pain'),
(892903, 8929, 0, 0, 0, 100, 1, 8000, 8000, 10000, 10000, 892903, 0, 0, 'Princess Moira Bronzebeard - Smite'),
(892911, 8929, 0, 0, 0, 100, 1, 12000, 12000, 10000, 10000, 892911, 0, 0, 'Princess Moira Bronzebeard - Heal on the Emperor while he lives and is hurt'),
(892912, 8929, 230005, 21, 0, 100, 0, 0, 0, 0, 0, 892912, 0, 0, 'Princess Moira Bronzebeard - home with the Emperor dead: the portal'),
(1007601, 10076, 0, 0, 0, 100, 1, 16000, 16000, 14000, 14000, 1007601, 0, 0, 'High Priestess of Thaurissan - Mind Blast'),
(1007602, 10076, 0, 0, 0, 100, 1, 2000, 2000, 18000, 18000, 1007602, 0, 0, 'High Priestess of Thaurissan - Shadow Word: Pain'),
(1007603, 10076, 0, 0, 0, 100, 1, 8000, 8000, 10000, 10000, 1007603, 0, 0, 'High Priestess of Thaurissan - Smite'),
(1007611, 10076, 0, 0, 0, 100, 1, 12000, 12000, 10000, 10000, 1007611, 0, 0, 'High Priestess of Thaurissan - Heal on the Emperor while he lives and is hurt'),
(1007612, 10076, 230005, 21, 0, 100, 0, 0, 0, 0, 0, 1007612, 0, 0, 'High Priestess of Thaurissan - home with the Emperor dead: the portal'),
(903921, 9039, 230012, 1, 0, 100, 1, 1000, 1000, 1000, 1000, 903921, 0, 0, 'Doom''rel - the Tomb failed (out of combat): the seven set back'),
(903922, 9039, 230012, 0, 0, 100, 1, 1000, 1000, 1000, 1000, 903922, 0, 0, 'Doom''rel - the Tomb failed (in combat): the seven set back'),
(903923, 9039, 0, 21, 0, 100, 0, 0, 0, 0, 0, 903923, 0, 0, 'Doom''rel - home: the Tomb failed (3)'),
(903924, 9039, 0, 6, 0, 100, 0, 0, 0, 0, 0, 903924, 0, 0, 'Doom''rel - dead: the Tomb done (3) -- the chest, the doors'),
(903901, 9039, 0, 0, 0, 100, 1, 10000, 10000, 12000, 12000, 903901, 0, 0, 'Doom''rel - Shadow Bolt Volley'),
(903902, 9039, 0, 0, 0, 100, 1, 18000, 18000, 25000, 25000, 903902, 0, 0, 'Doom''rel - Immolate'),
(903903, 9039, 0, 0, 0, 100, 1, 5000, 5000, 45000, 45000, 903903, 0, 0, 'Doom''rel - Curse of Weakness'),
(903904, 9039, 0, 0, 0, 100, 1, 16000, 16000, 300000, 300000, 903904, 0, 0, 'Doom''rel - Demon Armor'),
(903911, 9039, 0, 2, 0, 100, 0, 50, 0, 0, 0, 903911, 0, 0, 'Doom''rel - Summon Voidwalkers at half health'),
(947611, 9476, 0, 4, 0, 100, 0, 0, 0, 0, 0, 947611, 0, 0, 'Watchman Doomgrip - aggro: the Warbringer Constructs within 20 yd'),
(947612, 9476, 0, 2, 0, 100, 1, 50, 0, 15000, 15000, 947612, 0, 0, 'Watchman Doomgrip - Drink Healing Potion under half health'),
(947613, 9476, 0, 0, 0, 100, 1, 1000, 1000, 10000, 10000, 947613, 0, 0, 'Watchman Doomgrip - Sunder Armor'),
(947614, 9476, 0, 6, 0, 100, 0, 0, 0, 0, 0, 947614, 0, 0, 'Watchman Doomgrip - dead: the secret door (8)'),
(898311, 8983, 0, 4, 0, 100, 0, 0, 0, 0, 0, 898311, 0, 0, 'Golem Lord Argelmach - aggro: to his golems, the protectors called (10)'),
(898312, 8983, 0, 6, 0, 100, 0, 0, 0, 0, 0, 898312, 0, 0, 'Golem Lord Argelmach - dead (10)'),
(898313, 8983, 0, 0, 0, 100, 9, 1000, 1000, 15000, 15000, 898313, 0, 0, 'Golem Lord Argelmach - Lightning Shield when it is gone'),
(898314, 8983, 0, 0, 0, 100, 9, 5000, 5000, 14000, 14000, 898314, 0, 0, 'Golem Lord Argelmach - Chain Lightning'),
(898315, 8983, 0, 0, 0, 100, 9, 2000, 2000, 6000, 6000, 898315, 0, 0, 'Golem Lord Argelmach - Shock'),
(1605501, 16055, 0, 0, 0, 100, 9, 10000, 10000, 8000, 14000, 1605501, 0, 0, 'Va''jashni - Flash Heal on the friend missing most'),
(1605502, 16055, 0, 1, 0, 100, 9, 10000, 10000, 8000, 14000, 1605502, 0, 0, 'Va''jashni - Flash Heal on the friend missing most (out of combat)'),
(1605503, 16055, 0, 0, 0, 100, 9, 20000, 20000, 40000, 50000, 1605503, 0, 0, 'Va''jashni - Power Word: Shield on the friend missing most'),
(1605504, 16055, 0, 1, 0, 100, 9, 20000, 20000, 40000, 50000, 1605504, 0, 0, 'Va''jashni - Power Word: Shield on the friend missing most (out of combat)'),
(1605505, 16055, 0, 0, 0, 100, 9, 30000, 30000, 55000, 65000, 1605505, 0, 0, 'Va''jashni - Renew on the friend missing most'),
(1605506, 16055, 0, 1, 0, 100, 9, 30000, 30000, 55000, 65000, 1605506, 0, 0, 'Va''jashni - Renew on the friend missing most (out of combat)'),
(1605211, 16052, 0, 4, 0, 100, 0, 0, 0, 0, 0, 1605211, 0, 0, 'Malgen Longspear - aggro: Gnashjaw'),
(1605212, 16052, 0, 7, 0, 100, 0, 0, 0, 0, 0, 1605212, 0, 0, 'Malgen Longspear - evading: Gnashjaw gone'),
(1605213, 16052, 0, 0, 0, 100, 9, 10000, 10000, 50000, 60000, 1605213, 0, 0, 'Malgen Longspear - Feign Death, up again 1 s on with a Frost Trap'),
(953721, 9537, 0, 29, 0, 100, 1, 8, 0, 0, 0, 953721, 0, 0, 'Hurley Blackbreath - point 0 reached: on to point 1'),
(953722, 9537, 0, 29, 0, 100, 1, 8, 1, 0, 0, 953722, 0, 0, 'Hurley Blackbreath - point 1 reached: on to point 2'),
(953723, 9537, 0, 29, 0, 100, 1, 8, 2, 0, 0, 953723, 0, 0, 'Hurley Blackbreath - point 2 reached: on to point 3'),
(953711, 9537, 0, 4, 0, 100, 0, 0, 0, 0, 0, 953711, 0, 0, 'Hurley Blackbreath - aggro: "You''ll pay for that!"'),
(953712, 9537, 0, 0, 0, 100, 9, 5000, 5000, 8000, 12000, 953712, 0, 0, 'Hurley Blackbreath - Flame Breath'),
(953713, 9537, 0, 2, 0, 100, 0, 30, 0, 0, 0, 953713, 0, 0, 'Hurley Blackbreath - Drunken Rage at 30%');

DELETE FROM `creature_ai_scripts` WHERE `id` IN (892901, 892902, 892903, 892911, 892912, 898311, 898312, 898313, 898314, 898315, 901801, 901802, 901803, 901804, 901901, 901911, 901912, 901913, 901914, 901915, 902701, 902702, 902711, 902801, 902811, 903101, 903102, 903103, 903104, 903105, 903301, 903311, 903901, 903902, 903903, 903904, 903911, 903921, 903922, 903923, 903924, 947611, 947612, 947613, 947614, 953711, 953712, 953713, 953721, 953722, 953723, 993801, 993811, 993821, 993822, 993823, 1007601, 1007602, 1007603, 1007611, 1007612, 1604901, 1605101, 1605102, 1605103, 1605104, 1605201, 1605202, 1605211, 1605212, 1605213, 1605301, 1605302, 1605303, 1605501, 1605502, 1605503, 1605504, 1605505, 1605506, 1605801, 1605802, 1605901, 1605902, 1605903);
INSERT INTO `creature_ai_scripts`
(`id`, `delay`, `priority`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`)
VALUES
(903101, 0, 0, 15, 15472, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Anub''shiah - Shadow Bolt'),
(903102, 0, 0, 15, 15470, 0, 0, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Anub''shiah - Curse of Tongues'),
(903103, 0, 0, 15, 12493, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Anub''shiah - Curse of Weakness'),
(903104, 0, 0, 15, 13787, 0, 0, 0, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Anub''shiah - Demon Armor'),
(903105, 0, 0, 15, 15471, 0, 0, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Anub''shiah - Enveloping Web'),
(902701, 0, 0, 15, 15589, 0, 0, 0, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Gorosh the Dervish - Whirlwind'),
(902702, 0, 0, 15, 15708, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Gorosh the Dervish - Mortal Strike'),
(902801, 0, 0, 15, 6524, 0, 0, 0, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Grizzle - Ground Tremor'),
(901801, 0, 0, 15, 14032, 0, 0, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'High Interrogator Gerstahn - Shadow Word: Pain'),
(901802, 0, 0, 15, 14033, 0, 0, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'High Interrogator Gerstahn - Mana Burn'),
(901803, 0, 0, 15, 13704, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'High Interrogator Gerstahn - Psychic Scream'),
(901804, 0, 0, 15, 12040, 0, 0, 0, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'High Interrogator Gerstahn - Shadow Shield'),
(903301, 0, 0, 15, 15572, 0, 0, 0, 0, 0, 1, 8, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'General Angerforge - Sunder Armor'),
(993801, 0, 0, 15, 13900, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Magmus - Fiery Burst'),
(901901, 0, 0, 15, 15636, 0, 0, 0, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Emperor Dagran Thaurissan - Avatar of Flame'),
(1605901, 0, 0, 15, 22911, 0, 0, 0, 130, 0, 4, 8, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Theldren - Charge at a player out of melee'),
(1605902, 0, 0, 15, 17547, 0, 0, 0, 0, 0, 1, 8, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Theldren - Mortal Strike'),
(1605903, 0, 0, 15, 19134, 0, 0, 0, 0, 0, 1, 8, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Theldren - Intimidating Shout'),
(1605301, 0, 0, 15, 21401, 0, 0, 0, 0, 0, 4, 8, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Korv - Frost Shock'),
(1605302, 0, 0, 15, 15786, 0, 0, 0, 0, 0, 0, 12, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Korv - Earthbind Totem'),
(1605303, 0, 0, 15, 11314, 0, 0, 0, 0, 0, 0, 12, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Korv - Fire Nova Totem'),
(1604901, 0, 0, 15, 27673, 0, 0, 0, 0, 0, 1, 8, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Lefty - Five Fat Finger Exploding Heart Technique'),
(1605101, 0, 0, 15, 17273, 0, 0, 0, 0, 0, 1, 8, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Snokh Blackspine - Pyroblast'),
(1605102, 0, 0, 15, 13878, 0, 0, 0, 0, 0, 1, 8, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Snokh Blackspine - Scorch'),
(1605103, 0, 0, 15, 18399, 0, 0, 0, 0, 0, 4, 8, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Snokh Blackspine - Flamestrike'),
(1605104, 0, 0, 15, 13323, 0, 0, 0, 0, 0, 4, 8, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Snokh Blackspine - Polymorph'),
(1605801, 0, 0, 15, 27618, 0, 0, 0, 0, 0, 4, 8, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Volida - Blizzard'),
(1605802, 0, 0, 15, 12557, 0, 0, 0, 0, 0, 1, 8, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Volida - Cone of Cold'),
(1605201, 0, 0, 15, 20902, 0, 0, 0, 130, 0, 4, 8, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Malgen Longspear - Aimed Shot at a player out of melee'),
(1605202, 0, 0, 15, 20735, 0, 0, 0, 130, 0, 4, 8, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Malgen Longspear - Multi-Shot at a player out of melee'),
(902711, 0, 0, 15, 21049, 0, 0, 0, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Gorosh the Dervish - Bloodlust'),
(902811, 0, 0, 15, 8269, 0, 0, 0, 0, 0, 0, 12, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Grizzle - Frenzy'),
(902811, 0, 1, 0, 2, 0, 0, 0, 0, 0, 0, 0, 7797, 0, 0, 0, 0, 0, 0, 0, 0, 'Grizzle - "%s goes into a killing frenzy!"'),
(993811, 0, 0, 15, 24375, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Magmus - War Stomp'),
(903311, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0, 5286, 0, 0, 0, 0, 0, 0, 0, 0, 'General Angerforge - "%s cries out an alarm!"'),
(903311, 0, 1, 10, 8901, 30000, 0, 0, 0, 0, 0, 0, 0, 2300001, -1, 2, 716.8168, 23.03471, -45.34414, 3.159046, 0, 'General Angerforge - an Anvilrage Reservist (1 of 10)'),
(903311, 0, 2, 10, 8901, 30000, 0, 0, 0, 0, 0, 0, 0, 2300001, -1, 2, 719.8195, 25.4425, -45.32854, 3.193953, 0, 'General Angerforge - an Anvilrage Reservist (2 of 10)'),
(903311, 0, 3, 10, 8901, 30000, 0, 0, 0, 0, 0, 0, 0, 2300001, -1, 2, 720.0683, 22.93752, -45.3414, 3.159046, 0, 'General Angerforge - an Anvilrage Reservist (3 of 10)'),
(903311, 0, 4, 10, 8901, 30000, 0, 0, 0, 0, 0, 0, 0, 2300001, -1, 2, 719.9299, 19.80474, -45.35873, 3.106686, 0, 'General Angerforge - an Anvilrage Reservist (4 of 10)'),
(903311, 0, 5, 10, 8901, 30000, 0, 0, 0, 0, 0, 0, 0, 2300001, -1, 2, 724.4819, 25.27536, -45.31646, 3.193953, 0, 'General Angerforge - an Anvilrage Reservist (5 of 10)'),
(903311, 0, 6, 10, 8901, 30000, 0, 0, 0, 0, 0, 0, 0, 2300001, -1, 2, 724.4958, 22.62163, -45.32786, 3.159046, 0, 'General Angerforge - an Anvilrage Reservist (6 of 10)'),
(903311, 0, 7, 10, 8901, 30000, 0, 0, 0, 0, 0, 0, 0, 2300001, -1, 2, 724.7056, 19.89114, -45.33829, 3.124139, 0, 'General Angerforge - an Anvilrage Reservist (7 of 10)'),
(903311, 0, 8, 10, 8901, 30000, 0, 0, 0, 0, 0, 0, 0, 2300001, -1, 2, 728.701, 18.92765, -46.00228, 3.106686, 0, 'General Angerforge - an Anvilrage Reservist (8 of 10)'),
(903311, 0, 9, 10, 8894, 30000, 0, 0, 0, 0, 0, 0, 0, 2300001, -1, 2, 728.5464, 21.52842, -45.8926, 3.141593, 0, 'General Angerforge - an Anvilrage Medic (9 of 10)'),
(903311, 0, 10, 10, 8894, 30000, 0, 0, 0, 0, 0, 0, 0, 2300001, -1, 2, 728.6478, 24.58055, -45.94735, 3.176499, 0, 'General Angerforge - an Anvilrage Medic (10 of 10)'),
(993821, 0, 0, 37, 5, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Magmus - the Iron Hall in progress'),
(993822, 0, 0, 37, 5, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Magmus - the Iron Hall failed'),
(993823, 0, 0, 37, 5, 3, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Magmus - the Iron Hall done'),
(901911, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 230101, 0, 0, 0, 0, 0, 0, 0, 0, 'Emperor Dagran Thaurissan - "Come to aid the Throne!"'),
(901911, 0, 1, 50, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 166, 0, 0, 0, 0, 'Emperor Dagran Thaurissan - calls for help'),
(901912, 0, 0, 50, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 166, 0, 0, 0, 0, 'Emperor Dagran Thaurissan - calls for help'),
(901913, 0, 0, 15, 17492, 0, 0, 0, 0, 0, 1, 8, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Emperor Dagran Thaurissan - Hand of Thaurissan'),
(901914, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 5431, 0, 0, 0, 0, 0, 0, 0, 0, 'Emperor Dagran Thaurissan - "Hail to the king, baby!"'),
(901915, 0, 0, 22, 35, 0, 0, 0, 47217, 0, 9, 2, 0, 0, 0, 0, 0, 0, 0, 0, 1000, 'Princess Moira Bronzebeard - friendly'),
(901915, 0, 1, 33, 0, 0, 0, 0, 47217, 0, 9, 2, 0, 0, 0, 0, 0, 0, 0, 0, 1000, 'Princess Moira Bronzebeard - back home'),
(892901, 0, 0, 15, 15587, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Princess Moira Bronzebeard - Mind Blast'),
(892902, 0, 0, 15, 15654, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Princess Moira Bronzebeard - Shadow Word: Pain'),
(892903, 0, 0, 15, 10934, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Princess Moira Bronzebeard - Smite'),
(892911, 0, 0, 15, 15586, 0, 0, 0, 47613, 0, 9, 0, 0, 0, 0, 0, 0, 0, 0, 0, 230004, 'Princess Moira Bronzebeard - Heal on the Emperor'),
(892912, 0, 0, 15, 13912, 0, 0, 0, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Princess Moira Bronzebeard - Open Portal'),
(1007601, 0, 0, 15, 15587, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'High Priestess of Thaurissan - Mind Blast'),
(1007602, 0, 0, 15, 15654, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'High Priestess of Thaurissan - Shadow Word: Pain'),
(1007603, 0, 0, 15, 10934, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'High Priestess of Thaurissan - Smite'),
(1007611, 0, 0, 15, 15586, 0, 0, 0, 47613, 0, 9, 0, 0, 0, 0, 0, 0, 0, 0, 0, 230004, 'High Priestess of Thaurissan - Heal on the Emperor'),
(1007612, 0, 0, 15, 13912, 0, 0, 0, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'High Priestess of Thaurissan - Open Portal'),
(903921, 0, 0, 39, 2300003, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0, 0, 0, 0, 0, 0, 0, 'Doom''rel - the seven set back'),
(903922, 0, 0, 39, 2300003, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0, 0, 0, 0, 0, 0, 0, 'Doom''rel - the seven set back'),
(903923, 0, 0, 37, 3, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 4623, 'Tomb of Seven - failed'),
(903924, 0, 0, 37, 3, 3, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Tomb of Seven - done'),
(903901, 0, 0, 15, 15245, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Doom''rel - Shadow Bolt Volley'),
(903902, 0, 0, 15, 12742, 0, 0, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Doom''rel - Immolate'),
(903903, 0, 0, 15, 12493, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Doom''rel - Curse of Weakness'),
(903904, 0, 0, 15, 13787, 0, 0, 0, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Doom''rel - Demon Armor'),
(903911, 0, 0, 15, 15092, 2, 0, 0, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Doom''rel - Summon Voidwalkers'),
(947611, 0, 0, 68, 2300004, 2, 8905, 20, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Watchman Doomgrip - the constructs woken'),
(947612, 0, 0, 15, 15504, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Watchman Doomgrip - Drink Healing Potion'),
(947613, 0, 0, 15, 11971, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Watchman Doomgrip - Sunder Armor'),
(947614, 0, 0, 37, 8, 3, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Watchman Doomgrip - done'),
(898311, 0, 0, 3, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0, 0, 846.801025, 16.2806, -53.6395, 0, 0, 'Golem Lord Argelmach - to the golems'),
(898311, 0, 1, 37, 10, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Golem Lord Argelmach - the protectors called'),
(898312, 0, 0, 37, 10, 3, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Golem Lord Argelmach - done'),
(898313, 0, 0, 15, 15507, 32, 0, 0, 0, 0, 0, 12, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Golem Lord Argelmach - Lightning Shield when it is gone'),
(898314, 0, 0, 15, 15305, 0, 0, 0, 0, 0, 1, 8, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Golem Lord Argelmach - Chain Lightning'),
(898315, 0, 0, 15, 15605, 0, 0, 0, 0, 0, 1, 8, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Golem Lord Argelmach - Shock'),
(1605501, 0, 0, 15, 17138, 0, 0, 0, 40, 99, 15, 8, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Va''jashni - Flash Heal on the friend missing most'),
(1605502, 0, 0, 15, 17138, 0, 0, 0, 40, 99, 15, 8, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Va''jashni - Flash Heal on the friend missing most (out of combat)'),
(1605503, 0, 0, 15, 20697, 0, 0, 0, 40, 99, 15, 8, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Va''jashni - Power Word: Shield on the friend missing most'),
(1605504, 0, 0, 15, 20697, 0, 0, 0, 40, 99, 15, 8, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Va''jashni - Power Word: Shield on the friend missing most (out of combat)'),
(1605505, 0, 0, 15, 23895, 0, 0, 0, 40, 99, 15, 8, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Va''jashni - Renew on the friend missing most'),
(1605506, 0, 0, 15, 23895, 0, 0, 0, 40, 99, 15, 8, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Va''jashni - Renew on the friend missing most (out of combat)'),
(1605211, 0, 0, 10, 16095, 10000, 1, 100, 0, 0, 0, 0, 262148, 0, -1, 4, 0, 0, 0, 0, 0, 'Malgen Longspear - Gnashjaw, unless he is here'),
(1605212, 0, 0, 68, 2300005, 2, 16095, 100, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Malgen Longspear - Gnashjaw gone'),
(1605213, 0, 0, 15, 5384, 2, 0, 0, 0, 0, 0, 12, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Malgen Longspear - Feign Death'),
(1605213, 0, 1, 39, 2300006, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0, 0, 0, 0, 0, 0, 0, 'Malgen Longspear - up again'),
(953721, 0, 0, 3, 0, 0, 0, 2, 0, 0, 0, 0, 1, 0, 0, 0, 902.31, -140.33, -49.75, 0, 0, 'Hurley Blackbreath - to point 1'),
(953722, 0, 0, 3, 0, 0, 0, 2, 0, 0, 0, 0, 2, 0, 0, 0, 910.31, -156.713, -49.759, 0, 0, 'Hurley Blackbreath - to point 2'),
(953723, 0, 0, 3, 0, 0, 0, 2, 0, 0, 0, 0, 3, 0, 0, 0, 856.087, -149.747, -49.672, 0, 0, 'Hurley Blackbreath - to point 3'),
(953711, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 4936, 0, 0, 0, 0, 0, 0, 0, 0, 'Hurley Blackbreath - "You''ll pay for that!"'),
(953712, 0, 0, 15, 9573, 0, 0, 0, 0, 0, 1, 8, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Hurley Blackbreath - Flame Breath'),
(953713, 0, 0, 15, 14872, 0, 0, 0, 0, 0, 0, 12, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Hurley Blackbreath - Drunken Rage');

DELETE FROM `generic_scripts` WHERE `id` IN (2300001, 2300002, 2300003, 2300004, 2300005, 2300006, 2300007, 2300008, 2300009, 2300010, 2300011, 2300012, 2300013, 2300014, 2300015, 2300016, 2300017, 2300018, 2300019, 2300020, 2300021, 2300022, 2300023, 2300024);
INSERT INTO `generic_scripts`
(`id`, `delay`, `priority`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`)
VALUES
(2300001, 0, 0, 20, 14, 0, 0, 0, 9033, 100, 8, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Angerforge''s alarm - follows the general'),
(2300002, 0, 0, 32, 4623, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Tomb of Seven - over unless in progress (call 1)'),
(2300002, 0, 1, 4, 46, 256, 2, 0, 91025, 0, 9, 2, 0, 0, 0, 0, 0, 0, 0, 0, 230014, 'Anger''rel - attackable'),
(2300002, 0, 2, 22, 54, 0, 0, 0, 91025, 0, 9, 2, 0, 0, 0, 0, 0, 0, 0, 0, 230014, 'Anger''rel - hostile'),
(2300002, 0, 3, 49, 0, 0, 0, 0, 91025, 0, 9, 2, 0, 0, 0, 0, 0, 0, 0, 0, 230014, 'Anger''rel - into the fight'),
(2300002, 30, 4, 32, 4623, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Tomb of Seven - over unless in progress (call 2)'),
(2300002, 30, 5, 4, 46, 256, 2, 0, 91026, 0, 9, 2, 0, 0, 0, 0, 0, 0, 0, 0, 230014, 'Seeth''rel - attackable'),
(2300002, 30, 6, 22, 54, 0, 0, 0, 91026, 0, 9, 2, 0, 0, 0, 0, 0, 0, 0, 0, 230014, 'Seeth''rel - hostile'),
(2300002, 30, 7, 49, 0, 0, 0, 0, 91026, 0, 9, 2, 0, 0, 0, 0, 0, 0, 0, 0, 230014, 'Seeth''rel - into the fight'),
(2300002, 60, 8, 32, 4623, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Tomb of Seven - over unless in progress (call 3)'),
(2300002, 60, 9, 4, 46, 256, 2, 0, 91023, 0, 9, 2, 0, 0, 0, 0, 0, 0, 0, 0, 230014, 'Dope''rel - attackable'),
(2300002, 60, 10, 22, 54, 0, 0, 0, 91023, 0, 9, 2, 0, 0, 0, 0, 0, 0, 0, 0, 230014, 'Dope''rel - hostile'),
(2300002, 60, 11, 49, 0, 0, 0, 0, 91023, 0, 9, 2, 0, 0, 0, 0, 0, 0, 0, 0, 230014, 'Dope''rel - into the fight'),
(2300002, 90, 12, 32, 4623, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Tomb of Seven - over unless in progress (call 4)'),
(2300002, 90, 13, 4, 46, 256, 2, 0, 91022, 0, 9, 2, 0, 0, 0, 0, 0, 0, 0, 0, 230014, 'Gloom''rel - attackable'),
(2300002, 90, 14, 22, 54, 0, 0, 0, 91022, 0, 9, 2, 0, 0, 0, 0, 0, 0, 0, 0, 230014, 'Gloom''rel - hostile'),
(2300002, 90, 15, 49, 0, 0, 0, 0, 91022, 0, 9, 2, 0, 0, 0, 0, 0, 0, 0, 0, 230014, 'Gloom''rel - into the fight'),
(2300002, 120, 16, 32, 4623, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Tomb of Seven - over unless in progress (call 5)'),
(2300002, 120, 17, 4, 46, 256, 2, 0, 91024, 0, 9, 2, 0, 0, 0, 0, 0, 0, 0, 0, 230014, 'Vile''rel - attackable'),
(2300002, 120, 18, 22, 54, 0, 0, 0, 91024, 0, 9, 2, 0, 0, 0, 0, 0, 0, 0, 0, 230014, 'Vile''rel - hostile'),
(2300002, 120, 19, 49, 0, 0, 0, 0, 91024, 0, 9, 2, 0, 0, 0, 0, 0, 0, 0, 0, 230014, 'Vile''rel - into the fight'),
(2300002, 150, 20, 32, 4623, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Tomb of Seven - over unless in progress (call 6)'),
(2300002, 150, 21, 4, 46, 256, 2, 0, 91021, 0, 9, 2, 0, 0, 0, 0, 0, 0, 0, 0, 230014, 'Hate''rel - attackable'),
(2300002, 150, 22, 22, 54, 0, 0, 0, 91021, 0, 9, 2, 0, 0, 0, 0, 0, 0, 0, 0, 230014, 'Hate''rel - hostile'),
(2300002, 150, 23, 49, 0, 0, 0, 0, 91021, 0, 9, 2, 0, 0, 0, 0, 0, 0, 0, 0, 230014, 'Hate''rel - into the fight'),
(2300002, 180, 24, 32, 4623, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Tomb of Seven - over unless in progress (call 7)'),
(2300002, 180, 25, 4, 46, 256, 2, 0, 91020, 0, 9, 2, 0, 0, 0, 0, 0, 0, 0, 0, 230014, 'Doom''rel - attackable'),
(2300002, 180, 26, 22, 54, 0, 0, 0, 91020, 0, 9, 2, 0, 0, 0, 0, 0, 0, 0, 0, 230014, 'Doom''rel - hostile'),
(2300002, 180, 27, 49, 0, 0, 0, 0, 91020, 0, 9, 2, 0, 0, 0, 0, 0, 0, 0, 0, 230014, 'Doom''rel - into the fight'),
(2300003, 0, 0, 71, 0, 0, 0, 0, 91025, 0, 9, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Anger''rel - back if dead'),
(2300003, 0, 1, 22, 734, 0, 0, 0, 91025, 0, 9, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Anger''rel - neutral again'),
(2300003, 0, 2, 4, 46, 256, 1, 0, 91025, 0, 9, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Anger''rel - not attackable again'),
(2300003, 0, 3, 71, 0, 0, 0, 0, 91026, 0, 9, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Seeth''rel - back if dead'),
(2300003, 0, 4, 22, 734, 0, 0, 0, 91026, 0, 9, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Seeth''rel - neutral again'),
(2300003, 0, 5, 4, 46, 256, 1, 0, 91026, 0, 9, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Seeth''rel - not attackable again'),
(2300003, 0, 6, 71, 0, 0, 0, 0, 91023, 0, 9, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Dope''rel - back if dead'),
(2300003, 0, 7, 22, 734, 0, 0, 0, 91023, 0, 9, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Dope''rel - neutral again'),
(2300003, 0, 8, 4, 46, 256, 1, 0, 91023, 0, 9, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Dope''rel - not attackable again'),
(2300003, 0, 9, 71, 0, 0, 0, 0, 91022, 0, 9, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Gloom''rel - back if dead'),
(2300003, 0, 10, 22, 734, 0, 0, 0, 91022, 0, 9, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Gloom''rel - neutral again'),
(2300003, 0, 11, 4, 46, 256, 1, 0, 91022, 0, 9, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Gloom''rel - not attackable again'),
(2300003, 0, 12, 71, 0, 0, 0, 0, 91024, 0, 9, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Vile''rel - back if dead'),
(2300003, 0, 13, 22, 734, 0, 0, 0, 91024, 0, 9, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Vile''rel - neutral again'),
(2300003, 0, 14, 4, 46, 256, 1, 0, 91024, 0, 9, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Vile''rel - not attackable again'),
(2300003, 0, 15, 71, 0, 0, 0, 0, 91021, 0, 9, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Hate''rel - back if dead'),
(2300003, 0, 16, 22, 734, 0, 0, 0, 91021, 0, 9, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Hate''rel - neutral again'),
(2300003, 0, 17, 4, 46, 256, 1, 0, 91021, 0, 9, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Hate''rel - not attackable again'),
(2300003, 0, 18, 71, 0, 0, 0, 0, 91020, 0, 9, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Doom''rel - back if dead'),
(2300003, 0, 19, 22, 734, 0, 0, 0, 91020, 0, 9, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Doom''rel - neutral again'),
(2300003, 0, 20, 4, 46, 256, 1, 0, 91020, 0, 9, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Doom''rel - not attackable again'),
(2300003, 0, 21, 37, 3, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Tomb of Seven - not started again'),
(2300004, 0, 0, 14, 10255, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1000, 'Warbringer Construct - awake'),
(2300004, 0, 1, 4, 46, 33554946, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1000, 'Warbringer Construct - selectable, attackable'),
(2300004, 0, 2, 26, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1000, 'Warbringer Construct - at the watchman''s attacker'),
(2300005, 0, 0, 18, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Gnashjaw - gone with his master'),
(2300006, 1, 0, 14, 5384, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Malgen Longspear - up again'),
(2300006, 1, 1, 15, 13809, 2, 0, 0, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Malgen Longspear - Frost Trap'),
(2300006, 1, 2, 26, 0, 0, 0, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Malgen Longspear - at a random attacker'),
(2300007, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 4934, 0, 0, 0, 0, 0, 0, 0, 0, 'Hurley Blackbreath - "Get away from those kegs!"'),
(2300007, 0, 1, 3, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0, 0, 886.652, -152.042, -49.76, 0, 0, 'Hurley Blackbreath - runs along the bar (point 0)'),
(2300008, 0, 0, 20, 14, 0, 0, 0, 9537, 20, 8, 0, 0, 0, 0, 0, 2, 0, 0, 0, 0, 'Blackbreath Crony - follows Hurley'),
(2300009, 0, 0, 10, 9537, 300000, 0, 0, 0, 0, 0, 0, 1, 2300007, -1, 1, 856.087, -149.747, -49.672, 0.059, 0, 'Thunderbrew kegs - Hurley Blackbreath'),
(2300009, 0, 1, 10, 9541, 0, 0, 0, 0, 0, 0, 0, 196608, 2300008, -1, 7, 856.087, -149.747, -49.672, 2, 0, 'Thunderbrew kegs - a Blackbreath Crony by him (1 of 4)'),
(2300009, 0, 2, 10, 9541, 0, 0, 0, 0, 0, 0, 0, 196608, 2300008, -1, 7, 856.087, -149.747, -49.672, 2, 0, 'Thunderbrew kegs - a Blackbreath Crony by him (2 of 4)'),
(2300009, 0, 3, 10, 9541, 0, 0, 0, 0, 0, 0, 0, 196608, 2300008, -1, 7, 856.087, -149.747, -49.672, 2, 0, 'Thunderbrew kegs - a Blackbreath Crony by him (3 of 4)'),
(2300009, 0, 4, 10, 9541, 0, 0, 0, 0, 0, 0, 0, 196608, 2300008, -1, 7, 856.087, -149.747, -49.672, 2, 0, 'Thunderbrew kegs - a Blackbreath Crony by him (4 of 4)'),
(2300010, 0, 0, 37, 6, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Thunderbrew Lager Keg - one more broken (the instance counts to 3)'),
(2300010, 0, 1, 39, 2300009, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0, 0, 0, 0, 0, 0, 230040, 'Thunderbrew Lager Keg - the third: Hurley comes'),
(2300011, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 230102, 0, 0, 0, 0, 0, 0, 0, 0, 'Watchman Doomgrip - "Don''t let them take the moutain hearth!"'),
(2300012, 0, 0, 10, 9476, 300000, 0, 0, 0, 0, 0, 0, 0, 2300011, 6, 1, 819.45, -348.96, -50.49, 0.35, 0, 'Relic Coffer Doors - Watchman Doomgrip, at the player'),
(2300013, 0, 0, 37, 7, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Relic Coffer Door - one more open (the instance counts to 12)'),
(2300013, 0, 1, 39, 2300012, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0, 0, 0, 0, 0, 0, 230050, 'Relic Coffer Door - the twelfth: Doomgrip comes'),
(2300014, 0, 0, 10, 9437, 0, 0, 0, 0, 0, 0, 0, 0, 0, -1, 7, 815.6, -168.54, -49.75, 5.97, 0, 'Dark Keeper Portrait - Dark Keeper Vorfalk'),
(2300014, 0, 1, 76, 164820, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 831.54, -339.529, -46.682, 0.802851, 0, 'Dark Keeper Portrait - his nameplate'),
(2300014, 0, 2, 37, 1, 3, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Dark Keeper Portrait - the vault done (1)'),
(2300015, 0, 0, 10, 9438, 0, 0, 0, 0, 0, 0, 0, 0, 0, -1, 7, 846.66, -317.18, -50.29, 3.9, 0, 'Dark Keeper Portrait - Dark Keeper Bethek'),
(2300015, 0, 1, 76, 164821, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 831.54, -339.529, -46.682, 0.802851, 0, 'Dark Keeper Portrait - his nameplate'),
(2300015, 0, 2, 37, 1, 3, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Dark Keeper Portrait - the vault done (1)'),
(2300016, 0, 0, 10, 9439, 0, 0, 0, 0, 0, 0, 0, 0, 0, -1, 7, 963.27, -343.73, -71.74, 2.22, 0, 'Dark Keeper Portrait - Dark Keeper Uggel'),
(2300016, 0, 1, 76, 164822, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 831.54, -339.529, -46.682, 0.802851, 0, 'Dark Keeper Portrait - his nameplate'),
(2300016, 0, 2, 37, 1, 3, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Dark Keeper Portrait - the vault done (1)'),
(2300017, 0, 0, 10, 9441, 0, 0, 0, 0, 0, 0, 0, 0, 0, -1, 7, 545.49, -162.49, -35.46, 5.86, 0, 'Dark Keeper Portrait - Dark Keeper Zimrel'),
(2300017, 0, 1, 76, 164823, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 831.54, -339.529, -46.682, 0.802851, 0, 'Dark Keeper Portrait - his nameplate'),
(2300017, 0, 2, 37, 1, 3, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Dark Keeper Portrait - the vault done (1)'),
(2300018, 0, 0, 10, 9442, 0, 0, 0, 0, 0, 0, 0, 0, 0, -1, 7, 681.52, -11.55, -60.06, 1.98, 0, 'Dark Keeper Portrait - Dark Keeper Ofgut'),
(2300018, 0, 1, 76, 164824, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 831.54, -339.529, -46.682, 0.802851, 0, 'Dark Keeper Portrait - his nameplate'),
(2300018, 0, 2, 37, 1, 3, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Dark Keeper Portrait - the vault done (1)'),
(2300019, 0, 0, 10, 9443, 0, 0, 0, 0, 0, 0, 0, 0, 0, -1, 7, 803.64, -248.0, -43.3, 2.6, 0, 'Dark Keeper Portrait - Dark Keeper Pelver'),
(2300019, 0, 1, 76, 164825, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 831.54, -339.529, -46.682, 0.802851, 0, 'Dark Keeper Portrait - his nameplate'),
(2300019, 0, 2, 37, 1, 3, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Dark Keeper Portrait - the vault done (1)'),
(2300020, 0, 0, 39, 2300014, 2300015, 2300016, 0, 0, 0, 0, 0, 33, 33, 34, 0, 0, 0, 0, 0, 0, 'Dark Keeper Portrait - one of three (1 of 2)'),
(2300021, 0, 0, 39, 2300017, 2300018, 2300019, 0, 0, 0, 0, 0, 33, 33, 34, 0, 0, 0, 0, 0, 0, 'Dark Keeper Portrait - one of three (2 of 2)'),
(2300022, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 5271, 0, 0, 0, 0, 0, 0, 0, 0, 'Anvilrage Guardsman - "You can''t hide from us. Prepare to burn!"'),
(2300022, 0, 1, 3, 2, 0, 0, 2, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, -1, 0, 'Anvilrage Guardsman - at the player'),
(2300023, 0, 0, 3, 2, 0, 0, 2, 0, 0, 0, 0, 1, 0, 0, 0, 2, 0, 0, -1, 0, 'Anvilrage Guardsman - the second, at the player too'),
(2300024, 0, 0, 10, 8891, 0, 0, 0, 0, 0, 0, 0, 1, 2300022, -1, 7, 642.366, -274.5155, -43.10918, 0.4712389, 0, 'Shadowforge bridge - the first Anvilrage Guardsman'),
(2300024, 0, 1, 10, 8891, 0, 0, 0, 0, 0, 0, 0, 0, 2300023, -1, 7, 740.1137, -283.3448, -42.75082, 2.86234, 0, 'Shadowforge bridge - the second Anvilrage Guardsman'),
(2300024, 0, 2, 37, 33, 3, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Shadowforge bridge - done (33)');

DELETE FROM `gameobject_scripts` WHERE `id` IN (15229, 15306, 15329, 15330, 15331, 15363, 15364, 15365, 15536, 15544, 17904, 35801, 35864, 39924, 43097, 43098, 43099, 43130);
INSERT INTO `gameobject_scripts`
(`id`, `delay`, `priority`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`)
VALUES
(43097, 0, 0, 39, 2300010, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0, 0, 0, 0, 0, 0, 230041, 'Thunderbrew Lager Keg - used'),
(43098, 0, 0, 39, 2300010, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0, 0, 0, 0, 0, 0, 230041, 'Thunderbrew Lager Keg - used'),
(43099, 0, 0, 39, 2300010, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0, 0, 0, 0, 0, 0, 230041, 'Thunderbrew Lager Keg - used'),
(17904, 0, 0, 39, 2300013, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0, 0, 0, 0, 0, 0, 230051, 'Relic Coffer Door - used'),
(15329, 0, 0, 39, 2300013, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0, 0, 0, 0, 0, 0, 230051, 'Relic Coffer Door - used'),
(15330, 0, 0, 39, 2300013, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0, 0, 0, 0, 0, 0, 230051, 'Relic Coffer Door - used'),
(15331, 0, 0, 39, 2300013, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0, 0, 0, 0, 0, 0, 230051, 'Relic Coffer Door - used'),
(35864, 0, 0, 39, 2300013, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0, 0, 0, 0, 0, 0, 230051, 'Relic Coffer Door - used'),
(39924, 0, 0, 39, 2300013, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0, 0, 0, 0, 0, 0, 230051, 'Relic Coffer Door - used'),
(15363, 0, 0, 39, 2300013, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0, 0, 0, 0, 0, 0, 230051, 'Relic Coffer Door - used'),
(15364, 0, 0, 39, 2300013, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0, 0, 0, 0, 0, 0, 230051, 'Relic Coffer Door - used'),
(15365, 0, 0, 39, 2300013, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0, 0, 0, 0, 0, 0, 230051, 'Relic Coffer Door - used'),
(35801, 0, 0, 39, 2300013, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0, 0, 0, 0, 0, 0, 230051, 'Relic Coffer Door - used'),
(15536, 0, 0, 39, 2300013, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0, 0, 0, 0, 0, 0, 230051, 'Relic Coffer Door - used'),
(15306, 0, 0, 39, 2300013, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0, 0, 0, 0, 0, 0, 230051, 'Relic Coffer Door - used'),
(15229, 0, 0, 37, 4, 3, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 230060, 'Shadowforge Brazier - the second: the Lyceum done (4)'),
(15229, 0, 1, 37, 4, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 230062, 'Shadowforge Brazier - the first: the Lyceum in progress (4)'),
(15544, 0, 0, 37, 4, 3, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 230060, 'Shadowforge Brazier - the second: the Lyceum done (4)'),
(15544, 0, 1, 37, 4, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 230062, 'Shadowforge Brazier - the first: the Lyceum in progress (4)'),
(43130, 0, 0, 39, 2300020, 2300021, 0, 0, 0, 0, 0, 0, 50, 50, 0, 0, 0, 0, 0, 0, 230070, 'Dark Keeper Portrait - one of the six keepers');

DELETE FROM `gossip_scripts` WHERE `id` IN (902109, 903702, 903704, 903901);
INSERT INTO `gossip_scripts`
(`id`, `delay`, `priority`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`)
VALUES
(903901, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 4894, 0, 0, 0, 0, 0, 0, 0, 0, 'Doom''rel - "You have challenged the Seven, and now you will die!"'),
(903901, 0, 1, 37, 3, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Tomb of Seven - in progress (3): the instance opens the way'),
(903901, 0, 2, 39, 2300002, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0, 0, 0, 0, 0, 0, 0, 'Tomb of Seven - the seven called 30 s apart'),
(903702, 0, 0, 15, 14894, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Gloom''rel - Learn Smelt Dark Iron on the player'),
(903704, 0, 0, 9, 252540, 300, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Gloom''rel - the Spectral Chalice for 5 min'),
(902109, 0, 0, 7, 4001, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2, 'Kharan Mighthammer - Horde: The Princess''s Surprise explored (4001)'),
(902109, 0, 1, 7, 4342, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 3, 'Kharan Mighthammer - Alliance: the quest explored (4342)');

DELETE FROM `gossip_menu` WHERE `entry` = 903900 AND `text_id` = 2601;
INSERT INTO `gossip_menu`
(`entry`, `text_id`, `script_id`, `condition_id`)
VALUES
(903900, 2601, 0, 0);

DELETE FROM `gossip_menu_option` WHERE `menu_id` = 903900 AND `id` = 0;
INSERT INTO `gossip_menu_option`
(`menu_id`, `id`, `option_icon`, `option_text`, `option_broadcast_text`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `box_broadcast_text`, `condition_id`)
VALUES
(903900, 0, 0, 'Your bondage is at an end, Doom''rel. I challenge you!', 0, 1, 1, -1, 0, 903901, 0, 0, NULL, 0, 3600104);

DELETE FROM `gossip_menu_option` WHERE `menu_id` = 903700 AND `id` = 0;
INSERT INTO `gossip_menu_option`
(`menu_id`, `id`, `option_icon`, `option_text`, `option_broadcast_text`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `box_broadcast_text`, `condition_id`)
VALUES
(903700, 0, 0, 'Teach me the art of smelting dark iron', 0, 1, 1, 903701, 0, 0, 0, 0, NULL, 0, 230024);

DELETE FROM `gossip_menu_option` WHERE `menu_id` = 903700 AND `id` = 1;
INSERT INTO `gossip_menu_option`
(`menu_id`, `id`, `option_icon`, `option_text`, `option_broadcast_text`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `box_broadcast_text`, `condition_id`)
VALUES
(903700, 1, 0, 'I want to pay tribute', 0, 1, 1, 903703, 0, 0, 0, 0, NULL, 0, 230025);

DELETE FROM `gossip_menu` WHERE `entry` = 903701 AND `text_id` = 2606;
INSERT INTO `gossip_menu`
(`entry`, `text_id`, `script_id`, `condition_id`)
VALUES
(903701, 2606, 0, 0);

DELETE FROM `gossip_menu_option` WHERE `menu_id` = 903701 AND `id` = 0;
INSERT INTO `gossip_menu_option`
(`menu_id`, `id`, `option_icon`, `option_text`, `option_broadcast_text`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `box_broadcast_text`, `condition_id`)
VALUES
(903701, 0, 0, 'Continue...', 0, 1, 1, -1, 0, 903702, 0, 0, NULL, 0, 0);

DELETE FROM `gossip_menu` WHERE `entry` = 903703 AND `text_id` = 2604;
INSERT INTO `gossip_menu`
(`entry`, `text_id`, `script_id`, `condition_id`)
VALUES
(903703, 2604, 0, 0);

DELETE FROM `gossip_menu_option` WHERE `menu_id` = 903703 AND `id` = 0;
INSERT INTO `gossip_menu_option`
(`menu_id`, `id`, `option_icon`, `option_text`, `option_broadcast_text`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `box_broadcast_text`, `condition_id`)
VALUES
(903703, 0, 0, '[PH] Continue...', 0, 1, 1, -1, 0, 903704, 0, 0, NULL, 0, 0);

DELETE FROM `gossip_menu` WHERE `entry` = 902100 AND `text_id` = 2473;
INSERT INTO `gossip_menu`
(`entry`, `text_id`, `script_id`, `condition_id`)
VALUES
(902100, 2473, 0, 2);

DELETE FROM `gossip_menu` WHERE `entry` = 902100 AND `text_id` = 2474;
INSERT INTO `gossip_menu`
(`entry`, `text_id`, `script_id`, `condition_id`)
VALUES
(902100, 2474, 0, 3);

DELETE FROM `gossip_menu_option` WHERE `menu_id` = 902100 AND `id` = 0;
INSERT INTO `gossip_menu_option`
(`menu_id`, `id`, `option_icon`, `option_text`, `option_broadcast_text`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `box_broadcast_text`, `condition_id`)
VALUES
(902100, 0, 0, 'I need to know where the princess are, Kharan!', 0, 1, 1, 902101, 0, 0, 0, 0, NULL, 0, 230032);

DELETE FROM `gossip_menu_option` WHERE `menu_id` = 902100 AND `id` = 1;
INSERT INTO `gossip_menu_option`
(`menu_id`, `id`, `option_icon`, `option_text`, `option_broadcast_text`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `box_broadcast_text`, `condition_id`)
VALUES
(902100, 1, 0, 'All is not lost, Kharan!', 0, 1, 1, 902103, 0, 0, 0, 0, NULL, 0, 230033);

DELETE FROM `gossip_menu` WHERE `entry` = 902101 AND `text_id` = 2475;
INSERT INTO `gossip_menu`
(`entry`, `text_id`, `script_id`, `condition_id`)
VALUES
(902101, 2475, 0, 0);

DELETE FROM `gossip_menu_option` WHERE `menu_id` = 902101 AND `id` = 0;
INSERT INTO `gossip_menu_option`
(`menu_id`, `id`, `option_icon`, `option_text`, `option_broadcast_text`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `box_broadcast_text`, `condition_id`)
VALUES
(902101, 0, 0, 'Gor''shak is my friend, you can trust me.', 0, 1, 1, 902102, 0, 0, 0, 0, NULL, 0, 0);

DELETE FROM `gossip_menu` WHERE `entry` = 902102 AND `text_id` = 2476;
INSERT INTO `gossip_menu`
(`entry`, `text_id`, `script_id`, `condition_id`)
VALUES
(902102, 2476, 0, 0);

DELETE FROM `gossip_menu_option` WHERE `menu_id` = 902102 AND `id` = 0;
INSERT INTO `gossip_menu_option`
(`menu_id`, `id`, `option_icon`, `option_text`, `option_broadcast_text`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `box_broadcast_text`, `condition_id`)
VALUES
(902102, 0, 0, 'Not enough, you need to tell me more.', 0, 1, 1, 902103, 0, 0, 0, 0, NULL, 0, 0);

DELETE FROM `gossip_menu` WHERE `entry` = 902103 AND `text_id` = 2477;
INSERT INTO `gossip_menu`
(`entry`, `text_id`, `script_id`, `condition_id`)
VALUES
(902103, 2477, 0, 0);

DELETE FROM `gossip_menu_option` WHERE `menu_id` = 902103 AND `id` = 0;
INSERT INTO `gossip_menu_option`
(`menu_id`, `id`, `option_icon`, `option_text`, `option_broadcast_text`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `box_broadcast_text`, `condition_id`)
VALUES
(902103, 0, 0, 'So what happened?', 0, 1, 1, 902104, 0, 0, 0, 0, NULL, 0, 0);

DELETE FROM `gossip_menu` WHERE `entry` = 902104 AND `text_id` = 2478;
INSERT INTO `gossip_menu`
(`entry`, `text_id`, `script_id`, `condition_id`)
VALUES
(902104, 2478, 0, 0);

DELETE FROM `gossip_menu_option` WHERE `menu_id` = 902104 AND `id` = 0;
INSERT INTO `gossip_menu_option`
(`menu_id`, `id`, `option_icon`, `option_text`, `option_broadcast_text`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `box_broadcast_text`, `condition_id`)
VALUES
(902104, 0, 0, 'Continue...', 0, 1, 1, 902105, 0, 0, 0, 0, NULL, 0, 0);

DELETE FROM `gossip_menu` WHERE `entry` = 902105 AND `text_id` = 2479;
INSERT INTO `gossip_menu`
(`entry`, `text_id`, `script_id`, `condition_id`)
VALUES
(902105, 2479, 0, 0);

DELETE FROM `gossip_menu_option` WHERE `menu_id` = 902105 AND `id` = 0;
INSERT INTO `gossip_menu_option`
(`menu_id`, `id`, `option_icon`, `option_text`, `option_broadcast_text`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `box_broadcast_text`, `condition_id`)
VALUES
(902105, 0, 0, 'So you suspect that someone on the inside was involved? That they were tipped off?', 0, 1, 1, 902106, 0, 0, 0, 0, NULL, 0, 0);

DELETE FROM `gossip_menu` WHERE `entry` = 902106 AND `text_id` = 2480;
INSERT INTO `gossip_menu`
(`entry`, `text_id`, `script_id`, `condition_id`)
VALUES
(902106, 2480, 0, 0);

DELETE FROM `gossip_menu_option` WHERE `menu_id` = 902106 AND `id` = 0;
INSERT INTO `gossip_menu_option`
(`menu_id`, `id`, `option_icon`, `option_text`, `option_broadcast_text`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `box_broadcast_text`, `condition_id`)
VALUES
(902106, 0, 0, 'Continue with your story please.', 0, 1, 1, 902107, 0, 0, 0, 0, NULL, 0, 0);

DELETE FROM `gossip_menu` WHERE `entry` = 902107 AND `text_id` = 2481;
INSERT INTO `gossip_menu`
(`entry`, `text_id`, `script_id`, `condition_id`)
VALUES
(902107, 2481, 0, 0);

DELETE FROM `gossip_menu_option` WHERE `menu_id` = 902107 AND `id` = 0;
INSERT INTO `gossip_menu_option`
(`menu_id`, `id`, `option_icon`, `option_text`, `option_broadcast_text`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `box_broadcast_text`, `condition_id`)
VALUES
(902107, 0, 0, 'Indeed.', 0, 1, 1, 902108, 0, 0, 0, 0, NULL, 0, 0);

DELETE FROM `gossip_menu` WHERE `entry` = 902108 AND `text_id` = 2482;
INSERT INTO `gossip_menu`
(`entry`, `text_id`, `script_id`, `condition_id`)
VALUES
(902108, 2482, 0, 0);

DELETE FROM `gossip_menu_option` WHERE `menu_id` = 902108 AND `id` = 0;
INSERT INTO `gossip_menu_option`
(`menu_id`, `id`, `option_icon`, `option_text`, `option_broadcast_text`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `box_broadcast_text`, `condition_id`)
VALUES
(902108, 0, 0, 'The door is open, Kharan. You are a free man.', 0, 1, 1, -1, 0, 902109, 0, 0, NULL, 0, 0);

DELETE FROM `areatrigger_generic_script` WHERE `trigger_id` = 1786 AND `script_id` = 2300024;
INSERT INTO `areatrigger_generic_script`
(`trigger_id`, `script_id`, `condition_id`, `flags`, `comment`)
VALUES
(1786, 2300024, 230080, 3, 'Shadowforge bridge: two Anvilrage Guardsmen at the first player across, alive and no game master');

UPDATE `creature_ai_scripts` SET `datalong` = 3, `condition_id` = 4623 WHERE `id` = 903401 AND `command` = 37;
UPDATE `creature_ai_scripts` SET `datalong` = 3, `condition_id` = 4623 WHERE `id` = 903508 AND `command` = 37;
UPDATE `creature_ai_scripts` SET `datalong` = 3, `condition_id` = 4623 WHERE `id` = 903601 AND `command` = 37;
UPDATE `creature_ai_scripts` SET `datalong` = 3, `condition_id` = 4623 WHERE `id` = 903705 AND `command` = 37;
UPDATE `creature_ai_scripts` SET `datalong` = 3, `condition_id` = 4623 WHERE `id` = 903803 AND `command` = 37;
UPDATE `creature_ai_scripts` SET `datalong` = 3, `condition_id` = 4623 WHERE `id` = 904008 AND `command` = 37;
