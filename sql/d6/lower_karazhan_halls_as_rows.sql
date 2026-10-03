-- Lower Karazhan Halls (map 532), its instance, trash and five bosses: its C++ as rows -- EPIC10 tier 2.
-- Written by the trt repo's scripts/tier2/a14_lower_karazhan_halls.py from d6_world; lower_karazhan_halls_restore.sql puts
-- back what this replaces. R8: a person applies it, into the world database.
--
-- The C++ keeps its script names: mod-lower-karazhan-halls is the switch (AM1, handoff/manager-091).
-- Loaded, the C++ runs as before -- a script found by name comes first. Unloaded
-- (`module unload mod-lower-karazhan-halls`, which gives every creature standing a new AI at once),
-- the names find no script and the creatures run these rows (their ai_name).
--
-- The C++ brought Lord Blackwald back also when the instance loaded with the champion dead and Blackwald
-- not: rows have no instance-load hook, so a reload after the champion leaves him away. The leaper leaps
-- at a random player out of melee (the C++: the farthest). The apprentices are not raised again while
-- the champion stands out of combat. Moroes's kick counts its two timers apart across half health.

UPDATE `creature_template` SET `ai_name` = 'EventAI' WHERE `entry` = 30008;
UPDATE `creature_template` SET `ai_name` = 'EventAI' WHERE `entry` = 61191;
UPDATE `creature_template` SET `ai_name` = 'EventAI' WHERE `entry` = 61192;
UPDATE `creature_template` SET `ai_name` = 'EventAI' WHERE `entry` = 61193;
UPDATE `creature_template` SET `ai_name` = 'EventAI' WHERE `entry` = 61194;
UPDATE `creature_template` SET `ai_name` = 'EventAI' WHERE `entry` = 61195;
UPDATE `creature_template` SET `ai_name` = 'EventAI' WHERE `entry` = 61196;
UPDATE `creature_template` SET `ai_name` = 'EventAI' WHERE `entry` = 61197;
UPDATE `creature_template` SET `ai_name` = 'EventAI' WHERE `entry` = 61198;
UPDATE `creature_template` SET `ai_name` = 'EventAI' WHERE `entry` = 61199;
UPDATE `creature_template` SET `ai_name` = 'EventAI' WHERE `entry` = 61200;
UPDATE `creature_template` SET `ai_name` = 'EventAI' WHERE `entry` = 61201;
UPDATE `creature_template` SET `ai_name` = 'EventAI' WHERE `entry` = 61202;
UPDATE `creature_template` SET `ai_name` = 'EventAI' WHERE `entry` = 61203;
UPDATE `creature_template` SET `ai_name` = 'EventAI' WHERE `entry` = 61204;
UPDATE `creature_template` SET `ai_name` = 'EventAI' WHERE `entry` = 61205;
UPDATE `creature_template` SET `ai_name` = 'EventAI' WHERE `entry` = 61206;
UPDATE `creature_template` SET `ai_name` = 'EventAI' WHERE `entry` = 61207;
UPDATE `creature_template` SET `ai_name` = 'EventAI' WHERE `entry` = 61208;
UPDATE `creature_template` SET `ai_name` = 'EventAI' WHERE `entry` = 61209;
UPDATE `creature_template` SET `ai_name` = 'EventAI' WHERE `entry` = 61210;
UPDATE `creature_template` SET `ai_name` = 'EventAI' WHERE `entry` = 61211;
UPDATE `creature_template` SET `ai_name` = 'EventAI' WHERE `entry` = 61221;
UPDATE `creature_template` SET `ai_name` = 'EventAI' WHERE `entry` = 61222;
UPDATE `creature_template` SET `ai_name` = 'EventAI' WHERE `entry` = 61223;
UPDATE `creature_template` SET `ai_name` = 'EventAI' WHERE `entry` = 61224;
UPDATE `creature_template` SET `ai_name` = 'EventAI', `gossip_menu_id` = 6122500 WHERE `entry` = 61225;

-- Conditions another tier-2 migration writes too, under the same entry: whichever comes first.
INSERT IGNORE INTO `conditions`
(`condition_entry`, `type`, `value1`, `value2`, `value3`, `value4`, `flags`)
VALUES
(532000, 34, 0, 3, 0, 0, 0),
(532001, 34, 1, 3, 0, 0, 0),
(532003, 34, 3, 3, 0, 0, 0),
(532004, -1, 532000, 532001, 3704, 532003, 0);

DELETE FROM `broadcast_text` WHERE `entry` IN (532101, 532102, 532103, 532104, 532105, 532106, 532107, 532108, 532109, 532110, 532111, 532112, 532113, 532114, 532115, 532116);
INSERT INTO `broadcast_text`
(`entry`, `male_text`, `female_text`, `chat_type`, `sound_id`, `language_id`, `emote_id1`, `emote_id2`, `emote_id3`, `emote_delay1`, `emote_delay2`, `emote_delay3`)
VALUES
(532101, 'I sense a disturbance here, who dares intrude?!', 'I sense a disturbance here, who dares intrude?!', 1, 0, 0, 0, 0, 0, 0, 0, 0),
(532102, 'What goes there, new prey to be entangled?', 'What goes there, new prey to be entangled?', 1, 60421, 0, 0, 0, 0, 0, 0, 0),
(532103, 'My Brood... Destroyed.', 'My Brood... Destroyed.', 1, 60419, 0, 0, 0, 0, 0, 0, 0),
(532104, 'My minions shall consume you!', 'My minions shall consume you!', 1, 60420, 0, 0, 0, 0, 0, 0, 0),
(532105, 'You dare disturb the Dark Rider Lord?', 'You dare disturb the Dark Rider Lord?', 1, 60412, 0, 0, 0, 0, 0, 0, 0),
(532106, 'Master, this was not fortold, this was not supposed to be my fate...', 'Master, this was not fortold, this was not supposed to be my fate...', 1, 60414, 0, 0, 0, 0, 0, 0, 0),
(532107, 'I call upon the Scythe of Elune, grant me your power!', 'I call upon the Scythe of Elune, grant me your power!', 1, 60413, 0, 0, 0, 0, 0, 0, 0),
(532108, 'So it was you I smelled! Such a foul taint.', 'So it was you I smelled! Such a foul taint.', 1, 60415, 0, 0, 0, 0, 0, 0, 0),
(532109, 'You vile, disgusting creatures, how could I lose to you?', 'You vile, disgusting creatures, how could I lose to you?', 1, 60417, 0, 0, 0, 0, 0, 0, 0),
(532110, 'My pack shall tear you apart, bone by bone!', 'My pack shall tear you apart, bone by bone!', 1, 60416, 0, 0, 0, 0, 0, 0, 0),
(532111, 'Whats this? You''re here for the orb?! ITS MINE, Grellkin, get them!', 'Whats this? You''re here for the orb?! ITS MINE, Grellkin, get them!', 1, 60409, 0, 0, 0, 0, 0, 0, 0),
(532112, 'Orb is mine, no take orb...', 'Orb is mine, no take orb...', 1, 60411, 0, 0, 0, 0, 0, 0, 0),
(532113, 'You-you-you no defeat me, I am strong!', 'You-you-you no defeat me, I am strong!', 1, 60410, 0, 0, 0, 0, 0, 0, 0),
(532114, 'Medivh, I have failed you...', 'Medivh, I have failed you...', 1, 60408, 0, 0, 0, 0, 0, 0, 0),
(532115, 'New guests? It has been a while since we have had those. I assume your arrival has taken -some- effort even if you were uninvited!', 'New guests? It has been a while since we have had those. I assume your arrival has taken -some- effort even if you were uninvited!', 1, 60402, 0, 0, 0, 0, 0, 0, 0),
(532116, 'Most impressive, it would appear your skills do match your bravery.', 'Most impressive, it would appear your skills do match your bravery.', 1, 60403, 0, 0, 0, 0, 0, 0, 0);

DELETE FROM `creature_ai_events` WHERE `id` IN (3000801, 6119101, 6119110, 6119111, 6119201, 6119301, 6119310, 6119401, 6119410, 6119501, 6119502, 6119601, 6119602, 6119603, 6119701, 6119702, 6119710, 6119801, 6119901, 6120001, 6120002, 6120101, 6120201, 6120301, 6120401, 6120402, 6120403, 6120410, 6120411, 6120501, 6120510, 6120601, 6120701, 6120702, 6120710, 6120801, 6120802, 6120910, 6121001, 6121101, 6121102, 6122101, 6122102, 6122103, 6122104, 6122105, 6122106, 6122201, 6122202, 6122203, 6122204, 6122205, 6122206, 6122207, 6122301, 6122302, 6122303, 6122304, 6122305, 6122306, 6122307, 6122308, 6122401, 6122402, 6122403, 6122404, 6122405, 6122406, 6122407, 6122501, 6122502, 6122503, 6122504, 6122505, 6122506, 6122507, 6122508, 6122509, 6122510, 6122511, 6122512, 6122513, 6122514);
INSERT INTO `creature_ai_events`
(`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`)
VALUES
(6121101, 61211, 0, 0, 0, 100, 9, 12000, 15000, 12000, 15000, 6121101, 0, 0, 'Shadowbane Glutton - Slavering Bite'),
(6121102, 61211, 0, 0, 0, 100, 9, 15000, 25000, 15000, 25000, 6121102, 0, 0, 'Shadowbane Glutton - Devouring Hunger'),
(6121001, 61210, 0, 0, 0, 100, 9, 15000, 30000, 15000, 30000, 6121001, 0, 0, 'Phantom Cook - Fire Blast'),
(6119101, 61191, 0, 0, 0, 100, 9, 14000, 20000, 14000, 20000, 6119101, 0, 0, 'Shadowbane Alpha - Roar'),
(6119201, 61192, 0, 0, 0, 100, 9, 8000, 8000, 8000, 8000, 6119201, 0, 0, 'Shadowbane Darkcaster - Darkbolt'),
(6119401, 61194, 0, 0, 0, 100, 9, 11000, 14000, 11000, 14000, 6119401, 0, 0, 'Shadowbane Ragefang - Claw Flurry'),
(6120201, 61202, 0, 0, 0, 100, 9, 6000, 9000, 6000, 9000, 6120201, 0, 0, 'Haunted Blacksmith - Spectral Armor on a friend lacking it'),
(6120001, 61200, 0, 0, 0, 100, 9, 5000, 5000, 5000, 5000, 6120001, 0, 0, 'Phantom Guardsman - Shield Block'),
(6120002, 61200, 0, 0, 0, 100, 9, 14000, 20000, 14000, 20000, 6120002, 0, 0, 'Phantom Guardsman - Curse of Weakness'),
(6120101, 61201, 0, 0, 0, 100, 9, 14000, 18000, 14000, 18000, 6120101, 0, 0, 'Haunted Stable Tender - Call Spectral Steed'),
(6119801, 61198, 0, 0, 0, 100, 9, 10000, 12000, 10000, 12000, 6119801, 0, 0, 'Shattercage Spearman - Impale'),
(6119901, 61199, 0, 0, 0, 100, 9, 8000, 12000, 8000, 12000, 6119901, 0, 0, 'Shattercage Magiskull - Arcane Explosion'),
(6120601, 61206, 0, 0, 0, 100, 9, 2000, 5000, 15000, 15000, 6120601, 0, 0, 'Skitterweb Crawler - Leeching Bite'),
(6120701, 61207, 0, 0, 0, 100, 9, 1000, 1000, 5000, 7000, 6120701, 0, 0, 'Skitterweb Darkfang - Darkfang Venom'),
(6120702, 61207, 0, 0, 0, 100, 9, 5000, 5000, 12000, 14000, 6120702, 0, 0, 'Skitterweb Darkfang - Venom Influx'),
(6120801, 61208, 0, 0, 0, 100, 9, 14000, 18000, 23000, 26000, 6120801, 0, 0, 'Skitterweb Venomfang - Venom Spit'),
(6120802, 61208, 0, 0, 0, 100, 9, 2000, 2000, 6000, 8000, 6120802, 0, 0, 'Skitterweb Venomfang - Corrosive Bolt'),
(6120501, 61205, 0, 0, 0, 100, 9, 7000, 12000, 11000, 11000, 6120501, 0, 0, 'Phantom Servant - Phantom Scream'),
(6119301, 61193, 0, 0, 0, 100, 9, 1000, 1000, 7000, 13000, 6119301, 0, 0, 'Shadowbane Ambusher - Rend'),
(6119501, 61195, 0, 0, 0, 100, 9, 6000, 9000, 8000, 11000, 6119501, 0, 0, 'Grellkin Shadow Weaver - Drain Mana'),
(6119502, 61195, 0, 0, 0, 100, 9, 2000, 4000, 5000, 7000, 6119502, 0, 0, 'Grellkin Shadow Weaver - Darkbolt'),
(6119601, 61196, 0, 0, 0, 100, 9, 1000, 2000, 12000, 17000, 6119601, 0, 0, 'Grellkin Primalist - Earth Shield on a friend lacking it'),
(6119602, 61196, 0, 0, 0, 100, 9, 3000, 5000, 5000, 7000, 6119602, 0, 0, 'Grellkin Primalist - Frost Shock'),
(6119603, 61196, 0, 0, 0, 100, 9, 25000, 25000, 28000, 36000, 6119603, 0, 0, 'Grellkin Primalist - Lightning Storm'),
(6119701, 61197, 0, 0, 0, 100, 9, 9000, 11000, 9000, 11000, 6119701, 0, 0, 'Grellkin Channeler - Grellkin Heal on the friend missing most'),
(6119702, 61197, 0, 0, 0, 100, 9, 1000, 3000, 8000, 14000, 6119702, 0, 0, 'Grellkin Channeler - Grellfire'),
(6120401, 61204, 0, 0, 0, 100, 9, 3000, 5000, 7000, 7000, 6120401, 0, 0, 'Dark Rider Champion - Reaver Storm'),
(6120402, 61204, 0, 0, 0, 100, 9, 15000, 20000, 20000, 24000, 6120402, 0, 0, 'Dark Rider Champion - Scream'),
(6120403, 61204, 0, 0, 0, 100, 9, 8000, 12000, 11000, 14000, 6120403, 0, 0, 'Dark Rider Champion - Hamstring'),
(6119110, 61191, 0, 11, 0, 100, 0, 0, 0, 0, 0, 6119110, 0, 0, 'Shadowbane Alpha - Alpha Presence, at spawn'),
(6119111, 61191, 0, 21, 0, 100, 0, 0, 0, 0, 0, 6119111, 0, 0, 'Shadowbane Alpha - Alpha Presence, at home again'),
(6120710, 61207, 0, 1, 0, 100, 1, 2000, 2000, 2000, 2000, 6120710, 0, 0, 'Skitterweb Darkfang - stealthed out of combat'),
(6119310, 61193, 0, 1, 0, 100, 1, 2000, 2000, 2000, 2000, 6119310, 0, 0, 'Shadowbane Ambusher - stealthed out of combat'),
(6119410, 61194, 0, 2, 0, 100, 0, 30, 0, 0, 0, 6119410, 0, 0, 'Shadowbane Ragefang - Bloodfrenzy once, at 30 %'),
(6119710, 61197, 0, 2, 0, 100, 0, 50, 0, 0, 0, 6119710, 0, 0, 'Grellkin Channeler - Divine Shield once, at half health'),
(6120910, 61209, 0, 0, 0, 100, 8, 15000, 22000, 0, 0, 6120910, 0, 0, 'Skitterweb Leaper - Skitter Leap once, at a player out of melee'),
(6120510, 61205, 0, 0, 0, 100, 8, 25000, 35000, 0, 0, 6120510, 0, 0, 'Phantom Servant - Servant''s Curse once'),
(6120410, 61204, 0, 11, 0, 100, 0, 0, 0, 0, 0, 6120410, 0, 0, 'Dark Rider Champion - his two apprentices'),
(6120411, 61204, 0, 6, 0, 100, 0, 0, 0, 0, 0, 6120411, 0, 0, 'Dark Rider Champion - dead: slot 5 done, Lord Blackwald II comes'),
(6120301, 61203, 0, 0, 0, 100, 1, 7000, 14000, 7000, 14000, 6120301, 0, 0, 'Dark Rider Apprentice - Soul Exchange on the champion'),
(6122101, 61221, 0, 4, 0, 100, 0, 0, 0, 0, 0, 6122101, 0, 0, 'Brood Queen Araxxna - aggro'),
(6122102, 61221, 0, 6, 0, 100, 0, 0, 0, 0, 0, 6122102, 0, 0, 'Brood Queen Araxxna - dead'),
(6122103, 61221, 0, 7, 0, 100, 0, 0, 0, 0, 0, 6122103, 0, 0, 'Brood Queen Araxxna - evading: not started'),
(6122104, 61221, 0, 0, 0, 100, 9, 9000, 11000, 9000, 12000, 6122104, 0, 0, 'Brood Queen Araxxna - Brood Venom Volley'),
(6122105, 61221, 0, 0, 0, 100, 9, 11000, 11000, 12000, 15000, 6122105, 0, 0, 'Brood Queen Araxxna - Leeching Bite'),
(6122106, 61221, 0, 0, 0, 100, 1, 30000, 30000, 28000, 34000, 6122106, 0, 0, 'Brood Queen Araxxna - an egg pair'),
(3000801, 30008, 0, 11, 0, 100, 0, 0, 0, 0, 0, 3000801, 0, 0, 'Skitterweb Egg - laid: hatches in 20 s unless killed'),
(6122201, 61222, 0, 4, 0, 100, 0, 0, 0, 0, 0, 6122201, 0, 0, 'Lord Blackwald II - aggro'),
(6122202, 61222, 0, 6, 0, 100, 0, 0, 0, 0, 0, 6122202, 0, 0, 'Lord Blackwald II - dead'),
(6122203, 61222, 0, 7, 0, 100, 0, 0, 0, 0, 0, 6122203, 0, 0, 'Lord Blackwald II - evading: not started'),
(6122204, 61222, 0, 0, 0, 100, 9, 6000, 11000, 6000, 12000, 6122204, 0, 0, 'Lord Blackwald II - Reaver Storm'),
(6122205, 61222, 0, 0, 0, 100, 9, 20000, 20000, 22000, 22000, 6122205, 0, 0, 'Lord Blackwald II - the boon pair, both or again'),
(6122206, 61222, 0, 0, 0, 100, 9, 27000, 40000, 26000, 42000, 6122206, 0, 0, 'Lord Blackwald II - Empowered Soul'),
(6122207, 61222, 0, 0, 0, 100, 1, 31000, 31000, 44000, 51000, 6122207, 0, 0, 'Lord Blackwald II - his call for help'),
(6122301, 61223, 0, 4, 0, 100, 0, 0, 0, 0, 0, 6122301, 0, 0, 'Clawlord Howlfang - aggro'),
(6122302, 61223, 0, 6, 0, 100, 0, 0, 0, 0, 0, 6122302, 0, 0, 'Clawlord Howlfang - dead'),
(6122303, 61223, 0, 7, 0, 100, 0, 0, 0, 0, 0, 6122303, 0, 0, 'Clawlord Howlfang - evading: not started'),
(6122304, 61223, 0, 2, 0, 100, 0, 50, 0, 0, 0, 6122304, 0, 0, 'Clawlord Howlfang - his pack line at half health'),
(6122305, 61223, 0, 2, 0, 100, 0, 30, 0, 0, 0, 6122305, 0, 0, 'Clawlord Howlfang - Bloodfrenzy once, at 30 %'),
(6122306, 61223, 0, 0, 0, 100, 9, 2000, 2000, 1000, 1000, 6122306, 0, 0, 'Clawlord Howlfang - Terrifying Presence'),
(6122307, 61223, 0, 0, 0, 100, 9, 8000, 10000, 8000, 11000, 6122307, 0, 0, 'Clawlord Howlfang - Slavering Bite'),
(6122308, 61223, 0, 0, 0, 100, 9, 50000, 50000, 48000, 48000, 6122308, 0, 0, 'Clawlord Howlfang - Shadowbane Curse'),
(6122401, 61224, 0, 4, 0, 100, 0, 0, 0, 0, 0, 6122401, 0, 0, 'Grizikil - aggro'),
(6122402, 61224, 0, 6, 0, 100, 0, 0, 0, 0, 0, 6122402, 0, 0, 'Grizikil - dead'),
(6122403, 61224, 0, 7, 0, 100, 0, 0, 0, 0, 0, 6122403, 0, 0, 'Grizikil - evading: not started'),
(6122404, 61224, 0, 2, 0, 100, 0, 50, 0, 0, 0, 6122404, 0, 0, 'Grizikil - his line at half health'),
(6122405, 61224, 0, 0, 0, 100, 9, 2000, 2000, 4000, 6000, 6122405, 0, 0, 'Grizikil - Fireball'),
(6122406, 61224, 0, 0, 0, 100, 9, 15000, 15000, 11000, 14000, 6122406, 0, 0, 'Grizikil - Rain of Fire'),
(6122407, 61224, 0, 0, 0, 100, 9, 30000, 30000, 25000, 34000, 6122407, 0, 0, 'Grizikil - Flamewave'),
(6122501, 61225, 0, 4, 0, 100, 0, 0, 0, 0, 0, 6122501, 0, 0, 'Moroes - aggro'),
(6122502, 61225, 0, 6, 0, 100, 0, 0, 0, 0, 0, 6122502, 0, 0, 'Moroes - dead'),
(6122503, 61225, 0, 7, 0, 100, 0, 0, 0, 0, 0, 6122503, 0, 0, 'Moroes - evading: not started'),
(6122510, 61225, 0, 11, 0, 100, 0, 0, 0, 0, 0, 6122510, 0, 0, 'Moroes - his ghost visual and gossip, at spawn'),
(6122511, 61225, 0, 21, 0, 100, 0, 0, 0, 0, 0, 6122511, 0, 0, 'Moroes - his ghost visual and gossip, at home again'),
(6122504, 61225, 0, 0, 0, 100, 9, 20000, 26000, 20000, 26000, 6122504, 0, 0, 'Moroes - Glittering Dust, then the second on his threat list'),
(6122505, 61225, 0, 0, 0, 100, 9, 15000, 18000, 15000, 18000, 6122505, 0, 0, 'Moroes - Smoke Bomb'),
(6122506, 61225, 0, 0, 2, 100, 9, 7000, 13000, 7000, 13000, 6122506, 0, 0, 'Moroes - Shuffle Kick'),
(6122507, 61225, 0, 0, 1, 100, 9, 7000, 13000, 9000, 15000, 6122507, 0, 0, 'Moroes - Shuffle Kick, past half'),
(6122508, 61225, 0, 36, 0, 100, 1, 57097, 1, 0, 0, 6122508, 0, 0, 'Moroes - Agonizing Concussion on the one his kick hit'),
(6122509, 61225, 0, 2, 0, 100, 0, 50, 0, 0, 0, 6122509, 0, 0, 'Moroes - half health: his line, three spells more'),
(6122512, 61225, 0, 0, 1, 100, 9, 10000, 16000, 8000, 15000, 6122512, 0, 0, 'Moroes - Shadow Blast'),
(6122513, 61225, 0, 0, 1, 100, 9, 35000, 48000, 43000, 49000, 6122513, 0, 0, 'Moroes - Moroes Curse'),
(6122514, 61225, 0, 0, 1, 100, 9, 25000, 25000, 33000, 45000, 6122514, 0, 0, 'Moroes - Reflection');

DELETE FROM `creature_ai_scripts` WHERE `id` IN (3000801, 6119101, 6119110, 6119111, 6119201, 6119301, 6119310, 6119401, 6119410, 6119501, 6119502, 6119601, 6119602, 6119603, 6119701, 6119702, 6119710, 6119801, 6119901, 6120001, 6120002, 6120101, 6120201, 6120301, 6120401, 6120402, 6120403, 6120410, 6120411, 6120501, 6120510, 6120601, 6120701, 6120702, 6120710, 6120801, 6120802, 6120910, 6121001, 6121101, 6121102, 6122101, 6122102, 6122103, 6122104, 6122105, 6122106, 6122201, 6122202, 6122203, 6122204, 6122205, 6122206, 6122207, 6122301, 6122302, 6122303, 6122304, 6122305, 6122306, 6122307, 6122308, 6122401, 6122402, 6122403, 6122404, 6122405, 6122406, 6122407, 6122501, 6122502, 6122503, 6122504, 6122505, 6122506, 6122507, 6122508, 6122509, 6122510, 6122511, 6122512, 6122513, 6122514);
INSERT INTO `creature_ai_scripts`
(`id`, `delay`, `priority`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`)
VALUES
(6121101, 0, 0, 15, 57076, 0, 0, 0, 66, 0, 4, 8, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Shadowbane Glutton - Slavering Bite'),
(6121102, 0, 0, 15, 57077, 0, 0, 0, 0, 0, 1, 8, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Shadowbane Glutton - Devouring Hunger'),
(6121001, 0, 0, 15, 20623, 0, 0, 0, 2, 0, 4, 8, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Phantom Cook - Fire Blast'),
(6119101, 0, 0, 15, 57079, 0, 0, 0, 0, 0, 0, 12, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Shadowbane Alpha - Roar'),
(6119201, 0, 0, 15, 57080, 0, 0, 0, 2, 0, 4, 8, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Shadowbane Darkcaster - Darkbolt'),
(6119401, 0, 0, 15, 57081, 0, 0, 0, 0, 0, 0, 12, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Shadowbane Ragefang - Claw Flurry'),
(6120201, 0, 0, 15, 57068, 32, 0, 0, 20, 0, 14, 8, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Haunted Blacksmith - Spectral Armor on a friend lacking it'),
(6120001, 0, 0, 15, 2565, 6, 0, 0, 0, 0, 0, 12, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Phantom Guardsman - Shield Block'),
(6120002, 0, 0, 15, 12493, 6, 0, 0, 2, 0, 4, 8, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Phantom Guardsman - Curse of Weakness'),
(6120101, 0, 0, 15, 57070, 0, 0, 0, 0, 0, 0, 12, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Haunted Stable Tender - Call Spectral Steed'),
(6119801, 0, 0, 15, 57071, 0, 0, 0, 2, 0, 4, 8, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Shattercage Spearman - Impale'),
(6119901, 0, 0, 15, 25679, 0, 0, 0, 0, 0, 0, 12, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Shattercage Magiskull - Arcane Explosion'),
(6120601, 0, 0, 15, 57056, 0, 0, 0, 0, 0, 1, 8, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Skitterweb Crawler - Leeching Bite'),
(6120701, 0, 0, 15, 57058, 0, 0, 0, 2, 0, 4, 8, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Skitterweb Darkfang - Darkfang Venom'),
(6120702, 0, 0, 15, 57059, 0, 0, 0, 2, 0, 4, 8, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Skitterweb Darkfang - Venom Influx'),
(6120801, 0, 0, 15, 57063, 0, 0, 0, 0, 0, 0, 12, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Skitterweb Venomfang - Venom Spit'),
(6120802, 0, 0, 15, 56507, 0, 0, 0, 2, 0, 4, 8, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Skitterweb Venomfang - Corrosive Bolt'),
(6120501, 0, 0, 15, 57062, 0, 0, 0, 0, 0, 0, 12, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Phantom Servant - Phantom Scream'),
(6119301, 0, 0, 15, 18106, 0, 0, 0, 66, 0, 4, 8, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Shadowbane Ambusher - Rend'),
(6119501, 0, 0, 15, 17682, 0, 0, 0, 6, 0, 4, 8, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Grellkin Shadow Weaver - Drain Mana'),
(6119502, 0, 0, 15, 57080, 0, 0, 0, 2, 0, 4, 8, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Grellkin Shadow Weaver - Darkbolt'),
(6119601, 0, 0, 15, 57087, 32, 0, 0, 50, 0, 14, 8, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Grellkin Primalist - Earth Shield on a friend lacking it'),
(6119602, 0, 0, 15, 23115, 0, 0, 0, 2, 0, 4, 8, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Grellkin Primalist - Frost Shock'),
(6119603, 0, 0, 15, 57088, 0, 0, 0, 2, 0, 4, 8, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Grellkin Primalist - Lightning Storm'),
(6119701, 0, 0, 15, 57090, 0, 0, 0, 50, 30, 15, 8, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Grellkin Channeler - Grellkin Heal on the friend missing most'),
(6119702, 0, 0, 15, 57089, 0, 0, 0, 2, 0, 4, 8, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Grellkin Channeler - Grellfire'),
(6120401, 0, 0, 15, 57066, 0, 0, 0, 0, 0, 0, 12, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Dark Rider Champion - Reaver Storm'),
(6120402, 0, 0, 15, 57067, 0, 0, 0, 0, 0, 0, 12, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Dark Rider Champion - Scream'),
(6120403, 0, 0, 15, 26211, 0, 0, 0, 0, 0, 1, 8, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Dark Rider Champion - Hamstring'),
(6119110, 0, 0, 15, 57078, 34, 0, 0, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Shadowbane Alpha - Alpha Presence'),
(6119111, 0, 0, 15, 57078, 34, 0, 0, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Shadowbane Alpha - Alpha Presence'),
(6120710, 0, 0, 15, 8216, 38, 0, 0, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Skitterweb Darkfang - Stealth'),
(6119310, 0, 0, 15, 8216, 38, 0, 0, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Shadowbane Ambusher - Stealth'),
(6119410, 0, 0, 15, 57082, 0, 0, 0, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Shadowbane Ragefang - Bloodfrenzy'),
(6119710, 0, 0, 15, 13874, 0, 0, 0, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Grellkin Channeler - Divine Shield'),
(6120910, 0, 0, 15, 57060, 0, 0, 0, 130, 0, 4, 8, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Skitterweb Leaper - Skitter Leap'),
(6120510, 0, 0, 15, 57061, 0, 0, 0, 0, 0, 0, 12, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Phantom Servant - Servant''s Curse'),
(6120410, 0, 0, 10, 61203, 0, 0, 0, 0, 0, 0, 0, 262144, 6120430, -1, 7, 0, 0, 0, 0, 0, 'Dark Rider Champion - an apprentice (1 of 2)'),
(6120410, 0, 1, 10, 61203, 0, 0, 0, 0, 0, 0, 0, 262144, 6120431, -1, 7, 0, 0, 0, 0, 0, 'Dark Rider Champion - an apprentice (2 of 2)'),
(6120411, 0, 0, 37, 5, 3, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Dark Rider Champion - done (slot 5)'),
(6120411, 0, 1, 10, 61222, 86400000, 0, 0, 0, 0, 0, 0, 0, 6120432, -1, 1, -11088.2, -1995.74, 76.1774, 1.72157, 0, 'Dark Rider Champion - Lord Blackwald II'),
(6120301, 0, 0, 15, 57065, 0, 0, 0, 2574092, 0, 9, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Dark Rider Apprentice - Soul Exchange'),
(6122101, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 532102, 0, 0, 0, 0, 0, 0, 0, 0, 'Brood Queen Araxxna - aggro yell'),
(6122101, 0, 1, 37, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Brood Queen Araxxna - in progress (slot 0)'),
(6122102, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 532103, 0, 0, 0, 0, 0, 0, 0, 0, 'Brood Queen Araxxna - death yell'),
(6122102, 0, 1, 37, 0, 3, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Brood Queen Araxxna - done (slot 0)'),
(6122103, 0, 0, 37, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Brood Queen Araxxna - not started (slot 0)'),
(6122103, 0, 1, 68, 6122130, 2, 30008, 200, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Brood Queen Araxxna - her eggs gone'),
(6122104, 0, 0, 15, 57063, 0, 0, 0, 0, 0, 0, 12, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Brood Queen Araxxna - Brood Venom Volley'),
(6122105, 0, 0, 15, 57056, 0, 0, 0, 66, 0, 4, 8, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Brood Queen Araxxna - Leeching Bite'),
(6122106, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 532104, 0, 0, 0, 0, 0, 0, 0, 0, 'Brood Queen Araxxna - the eggs line'),
(6122106, 0, 1, 10, 30008, 2000, 0, 0, 0, 0, 0, 0, 589824, 0, -1, 6, 15, 0, 0, 0, 0, 'Brood Queen Araxxna - a Skitterweb Egg within 15 yd (1 of 2)'),
(6122106, 0, 2, 10, 30008, 2000, 0, 0, 0, 0, 0, 0, 589824, 0, -1, 6, 15, 0, 0, 0, 0, 'Brood Queen Araxxna - a Skitterweb Egg within 15 yd (2 of 2)'),
(3000801, 0, 0, 43, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Skitterweb Egg - does not move'),
(3000801, 0, 1, 39, 3000830, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0, 0, 0, 0, 0, 0, 0, 'Skitterweb Egg - the hatching'),
(6122201, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 532105, 0, 0, 0, 0, 0, 0, 0, 0, 'Lord Blackwald II - aggro yell'),
(6122201, 0, 1, 37, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Lord Blackwald II - in progress (slot 1)'),
(6122202, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 532106, 0, 0, 0, 0, 0, 0, 0, 0, 'Lord Blackwald II - death yell'),
(6122202, 0, 1, 37, 1, 3, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Lord Blackwald II - done (slot 1)'),
(6122203, 0, 0, 37, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Lord Blackwald II - not started (slot 1)'),
(6122204, 0, 0, 15, 57066, 0, 0, 0, 0, 0, 0, 12, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Lord Blackwald II - Reaver Storm'),
(6122205, 0, 0, 15, 57073, 0, 0, 0, 2, 0, 4, 8, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Lord Blackwald II - his boon on a random player'),
(6122205, 0, 1, 15, 57074, 2, 0, 0, 0, 0, 0, 12, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Lord Blackwald II - its counterpart on himself'),
(6122206, 0, 0, 15, 57075, 0, 0, 0, 2, 0, 4, 8, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Lord Blackwald II - Empowered Soul'),
(6122207, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 532107, 0, 0, 0, 0, 0, 0, 0, 0, 'Lord Blackwald II - the call'),
(6122207, 0, 1, 39, 6122230, 6122231, 6122232, 6122233, 0, 0, 0, 0, 25, 25, 25, 25, 0, 0, 0, 0, 0, 'Lord Blackwald II - one of four comes'),
(6122301, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 532108, 0, 0, 0, 0, 0, 0, 0, 0, 'Clawlord Howlfang - aggro yell'),
(6122301, 0, 1, 37, 2, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Clawlord Howlfang - in progress (slot 2)'),
(6122302, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 532109, 0, 0, 0, 0, 0, 0, 0, 0, 'Clawlord Howlfang - death yell'),
(6122302, 0, 1, 37, 2, 3, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Clawlord Howlfang - done (slot 2)'),
(6122303, 0, 0, 37, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Clawlord Howlfang - not started (slot 2)'),
(6122304, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 532110, 0, 0, 0, 0, 0, 0, 0, 0, 'Clawlord Howlfang - the pack line'),
(6122305, 0, 0, 15, 57082, 0, 0, 0, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Clawlord Howlfang - Bloodfrenzy'),
(6122306, 0, 0, 15, 57083, 0, 0, 0, 0, 0, 0, 12, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Clawlord Howlfang - Terrifying Presence'),
(6122307, 0, 0, 15, 57076, 0, 0, 0, 66, 0, 4, 8, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Clawlord Howlfang - Slavering Bite'),
(6122308, 0, 0, 15, 57084, 0, 0, 0, 0, 0, 0, 12, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Clawlord Howlfang - Shadowbane Curse'),
(6122401, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 532111, 0, 0, 0, 0, 0, 0, 0, 0, 'Grizikil - aggro yell'),
(6122401, 0, 1, 37, 3, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Grizikil - in progress (slot 3)'),
(6122402, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 532112, 0, 0, 0, 0, 0, 0, 0, 0, 'Grizikil - death yell'),
(6122402, 0, 1, 37, 3, 3, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Grizikil - done (slot 3)'),
(6122403, 0, 0, 37, 3, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Grizikil - not started (slot 3)'),
(6122401, 0, 2, 68, 6122430, 2, 61195, 190, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Grizikil - his grellkin (61195) pulled'),
(6122401, 0, 3, 68, 6122430, 2, 61196, 190, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Grizikil - his grellkin (61196) pulled'),
(6122401, 0, 4, 68, 6122430, 2, 61197, 190, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Grizikil - his grellkin (61197) pulled'),
(6122404, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 532113, 0, 0, 0, 0, 0, 0, 0, 0, 'Grizikil - the half health line'),
(6122405, 0, 0, 15, 57094, 0, 0, 0, 0, 0, 1, 8, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Grizikil - Fireball'),
(6122406, 0, 0, 15, 57093, 0, 0, 0, 2, 0, 4, 8, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Grizikil - Rain of Fire'),
(6122407, 0, 0, 15, 57091, 0, 0, 0, 0, 0, 0, 12, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Grizikil - Flamewave'),
(6122501, 0, 0, 37, 4, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Moroes - in progress (slot 4)'),
(6122502, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 532114, 0, 0, 0, 0, 0, 0, 0, 0, 'Moroes - death yell'),
(6122502, 0, 1, 37, 4, 3, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Moroes - done (slot 4)'),
(6122503, 0, 0, 37, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Moroes - not started (slot 4)'),
(6122501, 0, 1, 49, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Moroes - SetInCombatWithZone'),
(6122510, 0, 0, 74, 9617, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Moroes - Ghost Visual'),
(6122510, 0, 1, 4, 147, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Moroes - gossip on'),
(6122511, 0, 0, 74, 9617, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Moroes - Ghost Visual'),
(6122511, 0, 1, 4, 147, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Moroes - gossip on'),
(6122504, 0, 0, 15, 57095, 0, 0, 0, 0, 0, 1, 8, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Moroes - Glittering Dust'),
(6122504, 0, 1, 29, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, -100, 0, 0, 0, 0, 'Moroes - his victim''s threat gone'),
(6122504, 0, 2, 26, 0, 0, 0, 0, 2, 0, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Moroes - at the second on his threat list'),
(6122505, 0, 0, 15, 57096, 0, 0, 0, 2, 0, 4, 8, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Moroes - Smoke Bomb'),
(6122506, 0, 0, 15, 57097, 0, 0, 0, 66, 0, 4, 8, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Moroes - Shuffle Kick'),
(6122507, 0, 0, 15, 57097, 0, 0, 0, 66, 0, 4, 8, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Moroes - Shuffle Kick, past half'),
(6122508, 0, 0, 15, 57098, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Moroes - Agonizing Concussion'),
(6122509, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 532116, 0, 0, 0, 0, 0, 0, 0, 0, 'Moroes - the half line'),
(6122509, 0, 1, 44, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Moroes - past half (phase 1)'),
(6122512, 0, 0, 15, 57099, 0, 0, 0, 2, 0, 4, 8, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Moroes - Shadow Blast'),
(6122513, 0, 0, 15, 57100, 0, 0, 0, 0, 0, 0, 12, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Moroes - Moroes Curse'),
(6122514, 0, 0, 15, 27564, 0, 0, 0, 0, 0, 0, 12, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Moroes - Reflection'),
(6122503, 0, 1, 44, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Moroes - phase 0');

DELETE FROM `generic_scripts` WHERE `id` IN (3000830, 3000831, 3000832, 3000833, 3000834, 6120430, 6120431, 6120432, 6122130, 6122230, 6122231, 6122232, 6122233, 6122430);
INSERT INTO `generic_scripts`
(`id`, `delay`, `priority`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`)
VALUES
(6120430, 0, 0, 20, 14, 0, 0, 0, 2574092, 0, 9, 0, 0, 0, 0, 0, 2, 0, 0, 4.712, 0, 'Dark Rider Apprentice - follows the champion at 4.712 rad'),
(6120431, 0, 0, 20, 14, 0, 0, 0, 2574092, 0, 9, 0, 0, 0, 0, 0, 2, 0, 0, 1.571, 0, 'Dark Rider Apprentice - follows the champion at 1.571 rad'),
(6120432, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 532101, 0, 0, 0, 0, 0, 0, 0, 0, 'Lord Blackwald II - his arrival'),
(6122130, 0, 0, 18, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Skitterweb Egg - gone, the queen evading'),
(3000830, 20, 0, 39, 3000831, 3000832, 3000833, 0, 0, 0, 0, 4, 33, 33, 34, 0, 0, 0, 0, 0, 116, 'Skitterweb Egg - a spider of three'),
(3000830, 20, 1, 48, 100, 1, 0, 0, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, 116, 'Skitterweb Egg - broken by its spider'),
(3000831, 0, 0, 10, 61206, 5000, 0, 0, 0, 0, 0, 0, 262144, 3000834, -1, 4, 0, 0, 0, 0, 0, 'Skitterweb Egg - a Skitterweb Crawler'),
(3000832, 0, 0, 10, 61207, 5000, 0, 0, 0, 0, 0, 0, 262144, 3000834, -1, 4, 0, 0, 0, 0, 0, 'Skitterweb Egg - a Skitterweb Darkfang'),
(3000833, 0, 0, 10, 61209, 5000, 0, 0, 0, 0, 0, 0, 262144, 3000834, -1, 4, 0, 0, 0, 0, 0, 'Skitterweb Egg - a Skitterweb Leaper'),
(3000834, 0, 0, 49, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Skitterweb spider - hatched into the fight'),
(6122230, 0, 0, 10, 61192, 5000, 0, 0, 0, 0, 0, 0, 589824, 3000834, -1, 4, 15, 0, 0, 0, 0, 'Lord Blackwald II - a helper within 15 yd (61192)'),
(6122231, 0, 0, 10, 61193, 5000, 0, 0, 0, 0, 0, 0, 589824, 3000834, -1, 4, 15, 0, 0, 0, 0, 'Lord Blackwald II - a helper within 15 yd (61193)'),
(6122232, 0, 0, 10, 61194, 5000, 0, 0, 0, 0, 0, 0, 589824, 3000834, -1, 4, 15, 0, 0, 0, 0, 'Lord Blackwald II - a helper within 15 yd (61194)'),
(6122233, 0, 0, 10, 61211, 5000, 0, 0, 0, 0, 0, 0, 589824, 3000834, -1, 4, 15, 0, 0, 0, 0, 'Lord Blackwald II - a helper within 15 yd (61211)'),
(6122430, 0, 0, 49, 1, 0, 0, 0, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, 116, 'Grellkin - pulled by Grizikil''s call');

DELETE FROM `gossip_scripts` WHERE `id` IN (6122530);
INSERT INTO `gossip_scripts`
(`id`, `delay`, `priority`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`)
VALUES
(6122530, 0, 0, 4, 147, 1, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Moroes - gossip off'),
(6122530, 0, 1, 0, 1, 0, 0, 0, 0, 0, 0, 0, 532115, 0, 0, 0, 0, 0, 0, 0, 0, 'Moroes - the challenge accepted'),
(6122530, 0, 2, 22, 14, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Moroes - hostile until combat stops'),
(6122530, 0, 3, 49, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Moroes - SetInCombatWithZone'),
(6122530, 0, 4, 16, 60418, 8, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Moroes - his music');

DELETE FROM `gossip_menu` WHERE `entry` = 6122500 AND `text_id` = 61225;
INSERT INTO `gossip_menu`
(`entry`, `text_id`, `script_id`, `condition_id`)
VALUES
(6122500, 61225, 0, 0);

DELETE FROM `gossip_menu` WHERE `entry` = 6122500 AND `text_id` = 61226;
INSERT INTO `gossip_menu`
(`entry`, `text_id`, `script_id`, `condition_id`)
VALUES
(6122500, 61226, 0, 532004);

DELETE FROM `gossip_menu_option` WHERE `menu_id` = 6122500 AND `id` = 0;
INSERT INTO `gossip_menu_option`
(`menu_id`, `id`, `option_icon`, `option_text`, `option_broadcast_text`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `box_broadcast_text`, `condition_id`)
VALUES
(6122500, 0, 0, 'I am here to challenge you.', 0, 1, 1, -1, 0, 6122530, 0, 0, NULL, 0, 532004);

-- The generic store's slots (AC7; the table from ac7_instance_data_slot.sql).
DELETE FROM `instance_data_slot` WHERE `map` = 532 AND `slot` = 0;
DELETE FROM `instance_data_slot` WHERE `map` = 532 AND `slot` = 1;
DELETE FROM `instance_data_slot` WHERE `map` = 532 AND `slot` = 2;
DELETE FROM `instance_data_slot` WHERE `map` = 532 AND `slot` = 3;
DELETE FROM `instance_data_slot` WHERE `map` = 532 AND `slot` = 4;
DELETE FROM `instance_data_slot` WHERE `map` = 532 AND `slot` = 5;
INSERT INTO `instance_data_slot`
(`map`, `slot`, `flags`, `name`)
VALUES
(532, 0, 3, 'Brood Queen Araxxna (1 in progress, 3 done)'),
(532, 1, 3, 'Lord Blackwald II (1 in progress, 3 done)'),
(532, 2, 3, 'Clawlord Howlfang (1 in progress, 3 done)'),
(532, 3, 3, 'Grizikil (1 in progress, 3 done)'),
(532, 4, 3, 'Moroes (1 in progress, 3 done)'),
(532, 5, 3, 'the Dark Rider Champion (1 in progress, 3 done)');

