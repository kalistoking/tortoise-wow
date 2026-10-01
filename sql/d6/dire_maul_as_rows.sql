-- Dire Maul (map 429), first pass: Tendris, Zevrim, Ironbark, Immol'thar, Pusillin, King Gordok and Cho'Rush: its C++ as rows -- EPIC10 tier 2.
-- Written by the trt repo's scripts/tier2/a26_dire_maul.py from t1_world; dire_maul_restore.sql puts
-- back what this replaces. R8: a person applies it, into the world database.
--
-- The C++ keeps its script names: mod-dire-maul is the switch (AM1, handoff/manager-091).
-- Loaded, the C++ runs as before -- a script found by name comes first. Unloaded
-- (`module unload mod-dire-maul`, which gives every creature standing a new AI at once),
-- the names find no script and the creatures run these rows (their ai_name).
--
-- Map 429 keeps instance_dire_maul (and the Dreadsteed ritual): the rows write slots 2, 4, 5 and 9 into it as
-- the C++ did. Loaded, mod-dire-maul's C++ runs these creatures; unloaded, these rows.
-- Not as the C++: Immol'thar's 5 s no-target reset and the Mana Fiend visual (25681) of his and Tendris's
-- pulls are left out; Pusillin's menus show his own npc_texts (6877-6881, the C++ sent missing ones);
-- Cho'Rush's heals take a friend missing 40 % (the C++ 15000 health), his range is the 3D distance, and his
-- sets' weapons (equipment 12070-12072, which the world lacks) were never loaded; King Gordok's Sunder Armor
-- keeps its 5-15 s pace on a victim with five stacks (the C++ 15-25 s).

UPDATE `creature_template` SET `ai_name` = 'EventAI' WHERE `entry` = 11490;
UPDATE `creature_template` SET `ai_name` = 'EventAI' WHERE `entry` = 11491;
UPDATE `creature_template` SET `ai_name` = 'EventAI' WHERE `entry` = 11496;
UPDATE `creature_template` SET `ai_name` = 'EventAI' WHERE `entry` = 11501;
UPDATE `creature_template` SET `gossip_menu_id` = 1424100 WHERE `entry` = 14241;
UPDATE `creature_template` SET `ai_name` = 'EventAI' WHERE `entry` = 14324;
UPDATE `creature_template` SET `ai_name` = 'EventAI', `faction` = 35, `scale` = 0.5, `gossip_menu_id` = 1435400 WHERE `entry` = 14354;

DELETE FROM `conditions` WHERE `condition_entry` IN (429002, 429004, 429005, 429007, 429014, 429016, 429017, 429018, 429019, 429020);
INSERT INTO `conditions`
(`condition_entry`, `type`, `value1`, `value2`, `value3`, `value4`, `flags`)
VALUES
(429002, 16, 11491, 0, 0, 0, 0),
(429004, -1, 33003, 429002, 0, 0, 0),
(429005, 38, 7, 1, 0, 0, 0),
(429007, -1, 999, 1000, 0, 0, 0),
(429014, 38, 30, 2, 0, 0, 0),
(429016, 42, 5, 1, 0, 0, 2),
(429017, -1, 209012, 429014, 189002, 429016, 0),
(429018, -1, 429017, 429017, 0, 0, 1),
(429019, 56, 1, 6, 0, 0, 2),
(429020, 56, 1, 8, 0, 0, 2);

-- Conditions another tier-2 migration writes too, under the same entry: whichever comes first.
INSERT IGNORE INTO `conditions`
(`condition_entry`, `type`, `value1`, `value2`, `value3`, `value4`, `flags`)
VALUES
(33003, 34, 4, 3, 0, 0, 0),
(229240, 34, 9, 0, 0, 0, 0),
(229241, 34, 9, 1, 0, 0, 0),
(229242, 34, 9, 2, 0, 0, 0),
(229243, 34, 9, 3, 0, 0, 0),
(209012, 38, 5, 1, 0, 0, 0),
(189002, 37, 0, 0, 0, 0, 0);

DELETE FROM `broadcast_text` WHERE `entry` IN (1148910, 1150110);
INSERT INTO `broadcast_text`
(`entry`, `male_text`, `female_text`, `chat_type`, `sound_id`, `language_id`, `emote_id1`, `emote_id2`, `emote_id3`, `emote_delay1`, `emote_delay2`, `emote_delay3`)
VALUES
(1148910, 'You do not belong here!  Ancients, rise against these intruders!', 'You do not belong here!  Ancients, rise against these intruders!', 1, 0, 0, 0, 0, 0, 0, 0, 0),
(1150110, 'You no challenge me, scrubs! I''m da king now, and I stay king FOREVER!!!', 'You no challenge me, scrubs! I''m da king now, and I stay king FOREVER!!!', 0, 0, 0, 0, 0, 0, 0, 0, 0);

-- Existing rows taken away: the restore puts them back.
DELETE FROM `creature_ai_events` WHERE `id` = 1149001;
DELETE FROM `creature_ai_scripts` WHERE `id` = 1149001;
DELETE FROM `creature_ai_events` WHERE `id` = 1149002;
DELETE FROM `creature_ai_scripts` WHERE `id` = 1149002;
DELETE FROM `creature_ai_events` WHERE `id` = 1148905;
DELETE FROM `creature_ai_scripts` WHERE `id` = 1148905;
DELETE FROM `creature_ai_events` WHERE `id` = 1149601;
DELETE FROM `creature_ai_scripts` WHERE `id` = 1149601;
DELETE FROM `creature_ai_events` WHERE `id` = 1149602;
DELETE FROM `creature_ai_scripts` WHERE `id` = 1149602;
DELETE FROM `creature_ai_events` WHERE `id` = 1149603;
DELETE FROM `creature_ai_scripts` WHERE `id` = 1149603;
DELETE FROM `creature_ai_events` WHERE `id` = 1149604;
DELETE FROM `creature_ai_scripts` WHERE `id` = 1149604;
DELETE FROM `creature_ai_events` WHERE `id` = 1149605;
DELETE FROM `creature_ai_scripts` WHERE `id` = 1149605;
DELETE FROM `creature_ai_events` WHERE `id` = 1150101;
DELETE FROM `creature_ai_scripts` WHERE `id` = 1150101;
DELETE FROM `creature_ai_events` WHERE `id` = 1150102;
DELETE FROM `creature_ai_scripts` WHERE `id` = 1150102;
DELETE FROM `creature_ai_events` WHERE `id` = 1150103;
DELETE FROM `creature_ai_scripts` WHERE `id` = 1150103;
DELETE FROM `creature_ai_events` WHERE `id` = 1150104;
DELETE FROM `creature_ai_scripts` WHERE `id` = 1150104;
DELETE FROM `creature_ai_events` WHERE `id` = 1150105;
DELETE FROM `creature_ai_scripts` WHERE `id` = 1150105;
DELETE FROM `creature_ai_events` WHERE `id` = 1150106;
DELETE FROM `creature_ai_scripts` WHERE `id` = 1150106;
DELETE FROM `creature_ai_events` WHERE `id` IN (1148910, 1148911, 1148912, 1148913, 1148914, 1148915, 1148916, 1149010, 1149011, 1149012, 1149101, 1149102, 1149610, 1149611, 1149612, 1149613, 1149614, 1149615, 1149616, 1150110, 1150111, 1150112, 1150113, 1150114, 1150115, 1432401, 1432402, 1432403, 1432404, 1432405, 1432410, 1432411, 1432412, 1432414, 1432415, 1432416, 1432417, 1432418, 1432419, 1432420, 1432421, 1432422, 1432423, 1432424, 1432425, 1432426, 1435401, 1435402);
INSERT INTO `creature_ai_events`
(`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`)
VALUES
(1149010, 11490, 0, 0, 0, 100, 5, 5000, 9000, 20000, 26000, 1149010, 0, 0, 'Zevrim Thornhoof - Intense Pain'),
(1149011, 11490, 0, 0, 0, 100, 13, 9000, 12000, 15000, 18000, 1149011, 0, 0, 'Zevrim Thornhoof - Sacrifice at a random player, until it takes'),
(1149012, 11490, 0, 6, 0, 100, 0, 0, 0, 0, 0, 1149012, 0, 0, 'Zevrim Thornhoof - dead (4 = DONE)'),
(1149101, 11491, 429004, 1, 0, 100, 1, 1000, 1000, 1000, 1000, 1149101, 0, 0, 'Old Ironbark - Zevrim dead (4 = DONE): Ironbark the Redeemed'),
(1149102, 11491, 0, 29, 0, 100, 1, 8, 1, 0, 0, 1149102, 0, 0, 'Ironbark the Redeemed - at the door (point 1): breaks it and dies'),
(1148910, 11489, 0, 4, 0, 100, 0, 0, 0, 0, 0, 1148910, 0, 0, 'Tendris Warpwood - aggro: his yell, every Ironbark Protector into the fight'),
(1148911, 11489, 0, 0, 0, 100, 5, 5000, 9000, 9000, 14000, 1148911, 0, 0, 'Tendris Warpwood - Trample'),
(1148912, 11489, 0, 0, 0, 100, 5, 2000, 4000, 12000, 15000, 1148912, 0, 0, 'Tendris Warpwood - Uppercut'),
(1148913, 11489, 0, 0, 0, 100, 5, 9000, 12000, 17000, 22000, 1148913, 0, 0, 'Tendris Warpwood - Grasping Vines'),
(1148914, 11489, 0, 2, 0, 100, 1, 30, 0, 1000, 1000, 1148914, 0, 0, 'Tendris Warpwood - under 30 %: Enrage, kept up'),
(1148915, 11489, 429005, 0, 0, 100, 9, 0, 0, 10000, 15000, 1148915, 0, 0, 'Tendris Warpwood - a victim more than 7 yd away pulled to him and entangled'),
(1148916, 11489, 0, 6, 0, 100, 0, 0, 0, 0, 0, 1148916, 0, 0, 'Tendris Warpwood - dead: the spirit at his killer for a minute'),
(1149610, 11496, 0, 0, 0, 100, 5, 5000, 9000, 9000, 14000, 1149610, 0, 0, 'Immol''thar - Trample'),
(1149611, 11496, 0, 0, 0, 100, 5, 2000, 4000, 8000, 12000, 1149611, 0, 0, 'Immol''thar - Infected Bite'),
(1149612, 11496, 0, 0, 0, 100, 5, 7000, 12000, 15000, 22000, 1149612, 0, 0, 'Immol''thar - an Eye of Immol''thar at his victim'),
(1149613, 11496, 0, 0, 0, 100, 5, 10000, 14000, 17000, 24000, 1149613, 0, 0, 'Immol''thar - a random player pulled to him, threat wiped'),
(1149614, 11496, 0, 0, 0, 100, 1, 50000, 50000, 1000, 1000, 1149614, 0, 0, 'Immol''thar - after 50 s: Enrage, kept up'),
(1149615, 11496, 0, 7, 0, 100, 1, 0, 0, 0, 0, 1149615, 0, 0, 'Immol''thar - evading: his eyes gone'),
(1149616, 11496, 0, 6, 0, 100, 0, 0, 0, 0, 0, 1149616, 0, 0, 'Immol''thar - dead (2 = DONE)'),
(1435401, 14354, 0, 4, 0, 100, 0, 0, 0, 0, 0, 1435401, 0, 0, 'Pusillin - aggro: the imps within 100 yd join'),
(1435402, 14354, 0, 0, 254, 100, 1, 0, 0, 100, 100, 1435402, 1435403, 1435404, 'Pusillin - one of Fireball, Fire Blast and Blast Wave, then its pause'),
(1150110, 11501, 0, 4, 0, 100, 0, 0, 0, 0, 0, 1150110, 0, 0, 'King Gordok - aggro: his line'),
(1150111, 11501, 0, 0, 0, 100, 1, 4000, 8000, 5000, 15000, 1150111, 0, 0, 'King Gordok - Sunder Armor'),
(1150112, 11501, 0, 0, 0, 100, 9, 15000, 25000, 12000, 20000, 1150112, 0, 0, 'King Gordok - Mortal Strike, until it takes'),
(1150113, 11501, 0, 0, 0, 100, 9, 7000, 8000, 20000, 30000, 1150113, 0, 0, 'King Gordok - War Stomp, until it takes'),
(1150114, 11501, 0, 0, 0, 100, 9, 9000, 12000, 25000, 30000, 1150114, 0, 0, 'King Gordok - Berserker Charge at a player not his victim, until it takes'),
(1150115, 11501, 0, 0, 0, 100, 1, 2500, 2500, 2500, 2500, 1150115, 0, 0, 'King Gordok - Cho''Rush the Observer into his fight, out of one'),
(1432401, 14324, 0, 0, 0, 100, 1, 2500, 2500, 2500, 2500, 1432401, 0, 0, 'Cho''Rush the Observer - King Gordok into his fight, out of one'),
(1432402, 14324, 0, 11, 0, 100, 1, 0, 0, 0, 0, 1432402, 0, 0, 'Cho''Rush the Observer - spawned: his set, drawn once per instance'),
(1432403, 14324, 429017, 0, 171, 100, 1, 500, 500, 500, 500, 1432403, 0, 0, 'Cho''Rush the Observer - at range: he stands'),
(1432404, 14324, 429018, 0, 87, 100, 1, 500, 500, 500, 500, 1432404, 0, 0, 'Cho''Rush the Observer - out of range: he closes in'),
(1432405, 14324, 0, 7, 87, 100, 1, 0, 0, 0, 0, 1432405, 0, 0, 'Cho''Rush the Observer - evading at range: in melee again'),
(1432410, 14324, 0, 0, 251, 100, 9, 1000, 2000, 7000, 10000, 1432410, 0, 0, 'Cho''Rush the Observer - Fireball (melee), until it takes'),
(1432411, 14324, 0, 0, 247, 100, 9, 1000, 2000, 3000, 4000, 1432411, 0, 0, 'Cho''Rush the Observer - Fireball (at range), until it takes'),
(1432412, 14324, 0, 0, 243, 100, 9, 1000, 2000, 10000, 20000, 1432412, 1432413, 0, 'Cho''Rush the Observer - Bloodlust on himself or King Gordok within 30 yd, until it takes'),
(1432414, 14324, 429020, 0, 251, 100, 9, 1000, 2000, 9000, 13000, 1432414, 0, 0, 'Cho''Rush the Observer - Arcane Explosion (melee), until it takes'),
(1432415, 14324, 429020, 0, 247, 100, 9, 1000, 2000, 15000, 25000, 1432415, 0, 0, 'Cho''Rush the Observer - Arcane Explosion (at range), until it takes'),
(1432416, 14324, 429020, 0, 243, 100, 9, 1000, 2000, 20000, 30000, 1432416, 0, 0, 'Cho''Rush the Observer - Frost Nova, until it takes'),
(1432417, 14324, 429019, 0, 207, 100, 9, 1000, 2000, 20000, 30000, 1432417, 0, 0, 'Cho''Rush the Observer - Earthgrab Totem, until it takes'),
(1432418, 14324, 0, 0, 207, 100, 9, 1000, 2000, 10000, 15000, 1432418, 0, 0, 'Cho''Rush the Observer - Healing Wave on the most hurt friend within 40 yd, until it takes'),
(1432419, 14324, 0, 0, 239, 100, 9, 1000, 2000, 7000, 10000, 1432419, 0, 0, 'Cho''Rush the Observer - Lightning Bolt (melee), until it takes'),
(1432420, 14324, 0, 0, 223, 100, 9, 1000, 2000, 3000, 4000, 1432420, 0, 0, 'Cho''Rush the Observer - Lightning Bolt (at range), until it takes'),
(1432421, 14324, 0, 0, 207, 100, 9, 1000, 2000, 15000, 25000, 1432421, 0, 0, 'Cho''Rush the Observer - Chain Lightning, until it takes'),
(1432422, 14324, 0, 0, 63, 100, 9, 1000, 2000, 10000, 15000, 1432422, 0, 0, 'Cho''Rush the Observer - Heal on the most hurt friend within 40 yd, until it takes'),
(1432423, 14324, 0, 0, 191, 100, 9, 1000, 2000, 7000, 10000, 1432423, 0, 0, 'Cho''Rush the Observer - Mind Blast (melee), until it takes'),
(1432424, 14324, 0, 0, 127, 100, 9, 1000, 2000, 2000, 3000, 1432424, 0, 0, 'Cho''Rush the Observer - Mind Blast (at range), until it takes'),
(1432425, 14324, 0, 0, 63, 100, 9, 1000, 2000, 17000, 22000, 1432425, 0, 0, 'Cho''Rush the Observer - Power Word: Shield on the most hurt friend within 40 yd, until it takes'),
(1432426, 14324, 429020, 0, 63, 100, 9, 1000, 2000, 15000, 20000, 1432426, 0, 0, 'Cho''Rush the Observer - Psychic Scream, until it takes');

DELETE FROM `creature_ai_scripts` WHERE `id` IN (1148910, 1148911, 1148912, 1148913, 1148914, 1148915, 1148916, 1149010, 1149011, 1149012, 1149101, 1149102, 1149610, 1149611, 1149612, 1149613, 1149614, 1149615, 1149616, 1150110, 1150111, 1150112, 1150113, 1150114, 1150115, 1432401, 1432402, 1432403, 1432404, 1432405, 1432410, 1432411, 1432412, 1432413, 1432414, 1432415, 1432416, 1432417, 1432418, 1432419, 1432420, 1432421, 1432422, 1432423, 1432424, 1432425, 1432426, 1435401, 1435402, 1435403, 1435404);
INSERT INTO `creature_ai_scripts`
(`id`, `delay`, `priority`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`)
VALUES
(1149010, 0, 0, 15, 22478, 0, 0, 0, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Zevrim Thornhoof - Intense Pain'),
(1149011, 0, 0, 15, 22651, 0, 0, 0, 258, 0, 4, 8, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Zevrim Thornhoof - Sacrifice'),
(1149012, 0, 0, 37, 4, 3, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Dire Maul - Zevrim Thornhoof dead (4 = DONE)'),
(1149101, 0, 0, 27, 14241, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Old Ironbark - becomes Ironbark the Redeemed'),
(1149101, 0, 1, 0, 1, 0, 0, 0, 0, 0, 0, 0, 9104, 0, 0, 0, 0, 0, 0, 0, 0, 'Ironbark the Redeemed - yells "At last... Freed from his cursed grasp!"'),
(1149102, 0, 0, 80, 2, 0, 0, 0, 176907, 10, 11, 8, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Ironbark the Redeemed - the door within 10 yd broken'),
(1149102, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 9100, 0, 0, 0, 0, 0, 0, 0, 0, 'Ironbark the Redeemed - says "My strength wanes, mortal..."'),
(1149102, 0, 2, 1, 35, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Ironbark the Redeemed - strikes'),
(1149102, 0, 3, 48, 100, 1, 0, 0, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Ironbark the Redeemed - dies'),
(1148910, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 1148910, 0, 0, 0, 0, 0, 0, 0, 0, 'Tendris Warpwood - yells "You do not belong here!..."'),
(1148910, 0, 1, 68, 1148950, 2, 11459, 1800, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Tendris Warpwood - every Ironbark Protector into the fight'),
(1148911, 0, 0, 15, 5568, 0, 0, 0, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Tendris Warpwood - Trample'),
(1148912, 0, 0, 15, 22916, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Tendris Warpwood - Uppercut'),
(1148913, 0, 0, 15, 22924, 0, 0, 0, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Tendris Warpwood - Grasping Vines'),
(1148914, 0, 0, 15, 8269, 34, 0, 0, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Tendris Warpwood - Enrage'),
(1148915, 0, 0, 39, 1148951, 0, 0, 0, 0, 0, 1, 0, 100, 0, 0, 0, 0, 0, 0, 0, 0, 'Tendris Warpwood - his victim pulled to him'),
(1148916, 0, 0, 10, 14566, 60000, 0, 0, 0, 0, 0, 0, 65536, 0, -1, 6, 0, 0, 0, 0, 0, 'Tendris Warpwood - the spirit (14566) at his killer'),
(1149610, 0, 0, 15, 5568, 0, 0, 0, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Immol''thar - Trample'),
(1149611, 0, 0, 15, 16128, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Immol''thar - Infected Bite'),
(1149612, 0, 0, 10, 14396, 5000, 0, 0, 0, 0, 0, 0, 262144, 0, 1, 4, 0, 0, 0, 0, 0, 'Immol''thar - an Eye of Immol''thar, at his victim'),
(1149613, 0, 0, 39, 1149650, 0, 0, 0, 0, 0, 4, 0, 100, 0, 0, 0, 0, 0, 0, 0, 0, 'Immol''thar - a random player pulled to him'),
(1149614, 0, 0, 15, 8269, 34, 0, 0, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Immol''thar - Enrage'),
(1149615, 0, 0, 56, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Immol''thar - his eyes gone'),
(1149616, 0, 0, 37, 2, 3, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Dire Maul - Immol''thar dead (2 = DONE)'),
(1435401, 0, 0, 68, 1435450, 2, 13276, 100, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Pusillin - every Wildspawn Imp within 100 yd joins'),
(1435402, 0, 0, 15, 15228, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Pusillin - Fireball'),
(1435402, 0, 1, 44, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Pusillin - Fireball: a pause (phase 1)'),
(1435402, 0, 2, 39, 1435452, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0, 0, 0, 0, 0, 0, 0, 'Pusillin - Fireball: the pause ends in 6 s'),
(1435403, 0, 0, 15, 14145, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Pusillin - Fire Blast'),
(1435403, 0, 1, 44, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Pusillin - Fire Blast: a pause (phase 1)'),
(1435403, 0, 2, 39, 1435453, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0, 0, 0, 0, 0, 0, 0, 'Pusillin - Fire Blast: the pause ends in 4 s'),
(1435404, 0, 0, 15, 22424, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Pusillin - Blast Wave'),
(1435404, 0, 1, 44, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Pusillin - Blast Wave: a pause (phase 1)'),
(1435404, 0, 2, 39, 1435454, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0, 0, 0, 0, 0, 0, 0, 'Pusillin - Blast Wave: the pause ends in 9 s'),
(1150110, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1150110, 0, 0, 0, 0, 0, 0, 0, 0, 'King Gordok - says "You no challenge me, scrubs!..."'),
(1150111, 0, 0, 15, 15572, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'King Gordok - Sunder Armor'),
(1150112, 0, 0, 15, 15708, 0, 0, 0, 0, 0, 1, 8, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'King Gordok - Mortal Strike'),
(1150113, 0, 0, 15, 16727, 0, 0, 0, 0, 0, 0, 12, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'King Gordok - War Stomp'),
(1150114, 0, 0, 15, 22886, 0, 0, 0, 2, 0, 5, 8, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'King Gordok - Berserker Charge'),
(1150115, 0, 0, 72, 0, 0, 0, 0, 56945, 0, 9, 18, 0, 0, 0, 0, 0, 0, 0, 0, 429007, 'King Gordok - Cho''Rush the Observer joins him'),
(1432401, 0, 0, 72, 0, 0, 0, 0, 128489, 0, 9, 18, 0, 0, 0, 0, 0, 0, 0, 0, 429007, 'Cho''Rush the Observer - King Gordok joins him'),
(1432402, 0, 0, 39, 1432451, 1432452, 1432453, 0, 0, 0, 0, 0, 33, 33, 34, 0, 0, 0, 0, 0, 229240, 'Cho''Rush the Observer - his set drawn'),
(1432402, 0, 1, 44, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 229241, 'Cho''Rush the Observer - the mage (phase 2)'),
(1432402, 0, 2, 44, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 229242, 'Cho''Rush the Observer - the shaman (phase 4)'),
(1432402, 0, 3, 44, 6, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 229243, 'Cho''Rush the Observer - the priest (phase 6)'),
(1432403, 0, 0, 43, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Cho''Rush the Observer - stands'),
(1432403, 0, 1, 44, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Cho''Rush the Observer - at range (phase +1)'),
(1432404, 0, 0, 43, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Cho''Rush the Observer - closes in'),
(1432404, 0, 1, 44, 1, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Cho''Rush the Observer - in melee (phase -1)'),
(1432405, 0, 0, 43, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Cho''Rush the Observer - closes in'),
(1432405, 0, 1, 44, 1, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Cho''Rush the Observer - in melee (phase -1)'),
(1432410, 0, 0, 15, 17290, 0, 0, 0, 0, 0, 1, 8, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Cho''Rush the Observer - Fireball'),
(1432411, 0, 0, 15, 17290, 0, 0, 0, 0, 0, 1, 8, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Cho''Rush the Observer - Fireball'),
(1432412, 0, 0, 15, 16170, 32, 0, 0, 0, 0, 0, 12, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Cho''Rush the Observer - Bloodlust on himself or King Gordok within 30 yd'),
(1432413, 0, 0, 15, 16170, 32, 0, 0, 11501, 30, 8, 8, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Cho''Rush the Observer - Bloodlust on himself or King Gordok within 30 yd'),
(1432414, 0, 0, 15, 13745, 0, 0, 0, 0, 0, 0, 12, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Cho''Rush the Observer - Arcane Explosion'),
(1432415, 0, 0, 15, 13745, 0, 0, 0, 0, 0, 0, 12, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Cho''Rush the Observer - Arcane Explosion'),
(1432416, 0, 0, 15, 15331, 0, 0, 0, 0, 0, 0, 12, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Cho''Rush the Observer - Frost Nova'),
(1432417, 0, 0, 15, 8376, 0, 0, 0, 0, 0, 0, 12, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Cho''Rush the Observer - Earthgrab Totem'),
(1432418, 0, 0, 15, 15982, 0, 0, 0, 40, 40, 15, 8, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Cho''Rush the Observer - Healing Wave on the most hurt friend within 40 yd'),
(1432419, 0, 0, 15, 15234, 0, 0, 0, 0, 0, 1, 8, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Cho''Rush the Observer - Lightning Bolt'),
(1432420, 0, 0, 15, 15234, 0, 0, 0, 0, 0, 1, 8, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Cho''Rush the Observer - Lightning Bolt'),
(1432421, 0, 0, 15, 15305, 0, 0, 0, 0, 0, 1, 8, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Cho''Rush the Observer - Chain Lightning'),
(1432422, 0, 0, 15, 22883, 0, 0, 0, 40, 40, 15, 8, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Cho''Rush the Observer - Heal on the most hurt friend within 40 yd'),
(1432423, 0, 0, 15, 17194, 0, 0, 0, 0, 0, 1, 8, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Cho''Rush the Observer - Mind Blast'),
(1432424, 0, 0, 15, 17194, 0, 0, 0, 0, 0, 1, 8, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Cho''Rush the Observer - Mind Blast'),
(1432425, 0, 0, 15, 17139, 0, 0, 0, 40, 1, 15, 8, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Cho''Rush the Observer - Power Word: Shield on the most hurt friend within 40 yd'),
(1432426, 0, 0, 15, 22884, 0, 0, 0, 0, 0, 0, 12, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Cho''Rush the Observer - Psychic Scream');

DELETE FROM `generic_scripts` WHERE `id` IN (1148950, 1148951, 1149650, 1432451, 1432452, 1432453, 1435450, 1435451, 1435452, 1435453, 1435454);
INSERT INTO `generic_scripts`
(`id`, `delay`, `priority`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`)
VALUES
(1148950, 0, 0, 49, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Ironbark Protector - into the fight'),
(1148951, 0, 0, 6, 429, 0, 1, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 1, 0, 0, 'Tendris Warpwood - the player pulled to him'),
(1148951, 0, 1, 15, 22994, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Tendris Warpwood - Entangle at the player'),
(1149650, 0, 0, 6, 429, 0, 1, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 1, 0, 0, 'Immol''thar - the player pulled to him'),
(1149650, 0, 1, 29, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, -100, 0, 0, 0, 0, 'Immol''thar - the player''s threat wiped'),
(1435451, 0, 0, 34, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 18.19, -701.15, -12.64, 0, 0, 'Wildspawn Imp - home where Pusillin makes his stand'),
(1435450, 0, 0, 26, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Wildspawn Imp - joins Pusillin'),
(1435452, 6, 0, 44, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Pusillin - Fireball cast: on to the next spell (6 s)'),
(1435453, 4, 0, 44, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Pusillin - Fire Blast cast: on to the next spell (4 s)'),
(1435454, 9, 0, 44, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Pusillin - Blast Wave cast: on to the next spell (9 s)'),
(1432451, 0, 0, 37, 9, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Dire Maul - Cho''Rush''s set drawn: mage (9 = 1)'),
(1432451, 0, 1, 44, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Cho''Rush the Observer - the mage (phase 2)'),
(1432452, 0, 0, 37, 9, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Dire Maul - Cho''Rush''s set drawn: shaman (9 = 2)'),
(1432452, 0, 1, 44, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Cho''Rush the Observer - the shaman (phase 4)'),
(1432453, 0, 0, 37, 9, 3, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Dire Maul - Cho''Rush''s set drawn: priest (9 = 3)'),
(1432453, 0, 1, 44, 6, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Cho''Rush the Observer - the priest (phase 6)');

DELETE FROM `gossip_scripts` WHERE `id` IN (1424100, 1435400, 1435401, 1435402, 1435403, 1435404);
INSERT INTO `gossip_scripts`
(`id`, `delay`, `priority`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`)
VALUES
(1424100, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 66104, 0, 0, 0, 0, 0, 0, 0, 0, 'Ironbark the Redeemed - says "As you wish..."'),
(1424100, 0, 1, 3, 0, 18056, 65, 2, 0, 0, 0, 0, 1, 0, 0, 0, 123.706, -278.828, -55.868, 0, 0, 'Ironbark the Redeemed - to the door (point 1)'),
(1424100, 0, 2, 37, 5, 3, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Dire Maul - Ironbark opens the door (5 = DONE)'),
(1435400, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 9349, 0, 0, 0, 0, 0, 0, 0, 0, 'Pusillin - says "If you want the key, you''ll have to catch me!"'),
(1435400, 0, 1, 3, 0, 12436, 65, 0, 0, 0, 0, 0, 0, 0, 0, 0, -145, -296.9, -4.12, 0, 0, 'Pusillin - runs on (1 of 4)'),
(1435400, 0, 2, 84, 1435401, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Pusillin - his menu 2 of 5'),
(1435401, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 9353, 0, 0, 0, 0, 0, 0, 0, 0, 'Pusillin - says "Chase me if you dare! I run without a care!"'),
(1435401, 0, 1, 3, 0, 13196, 65, 0, 0, 0, 0, 0, 0, 0, 0, 0, 112.7, -353.87, -4.12, 0, 0, 'Pusillin - runs on (2 of 4)'),
(1435401, 0, 2, 84, 1435402, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Pusillin - his menu 3 of 5'),
(1435402, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 9357, 0, 0, 0, 0, 0, 0, 0, 0, 'Pusillin - says "Why would you ever want to harm me!? Come. Friends we can be!"'),
(1435402, 0, 1, 3, 0, 14278, 65, 0, 0, 0, 0, 0, 0, 0, 0, 0, 50.99, -632.68, -25.12, 0, 0, 'Pusillin - runs on (3 of 4)'),
(1435402, 0, 2, 84, 1435403, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Pusillin - his menu 4 of 5'),
(1435403, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 9360, 0, 0, 0, 0, 0, 0, 0, 0, 'Pusillin - says "DIE?! You make Pusillin cry!"'),
(1435403, 0, 1, 3, 0, 3940, 65, 0, 0, 0, 0, 0, 0, 0, 0, 0, 19.091084, -704.739746, -12.642583, 0, 0, 'Pusillin - runs on (4 of 4)'),
(1435403, 0, 2, 84, 1435404, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Pusillin - his menu 5 of 5'),
(1435404, 0, 0, 34, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 18.19, -701.15, -12.64, 0, 0, 'Pusillin - home where he makes his stand'),
(1435404, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 9363, 0, 0, 0, 0, 0, 0, 0, 0, 'Pusillin - says "Say hello to my little friends!"'),
(1435404, 0, 2, 22, 14, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Pusillin - hostile'),
(1435404, 0, 3, 2, 4, 1060320051, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Pusillin - grown (scale 0.7)'),
(1435404, 0, 4, 15, 22735, 0, 0, 0, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Pusillin - Spirit of Runn Tum'),
(1435404, 0, 5, 26, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Pusillin - attacks the player'),
(1435404, 0, 6, 10, 13276, 0, 0, 0, 0, 0, 0, 0, 1, 1435451, 0, 7, 6.562, -712.43, -12.64, 4.25, 0, 'Pusillin - a Wildspawn Imp (1 of 5) at the player'),
(1435404, 0, 7, 10, 13276, 0, 0, 0, 0, 0, 0, 0, 1, 1435451, 0, 7, 23.994, -697.89, -12.64, 4.25, 0, 'Pusillin - a Wildspawn Imp (2 of 5) at the player'),
(1435404, 0, 8, 10, 13276, 0, 0, 0, 0, 0, 0, 0, 1, 1435451, 0, 7, 22.216, -688.01, -12.64, 4.25, 0, 'Pusillin - a Wildspawn Imp (3 of 5) at the player'),
(1435404, 0, 9, 10, 13276, 0, 0, 0, 0, 0, 0, 0, 1, 1435451, 0, 7, 17.943, -679.68, -12.64, 4.25, 0, 'Pusillin - a Wildspawn Imp (4 of 5) at the player'),
(1435404, 0, 10, 10, 13276, 0, 0, 0, 0, 0, 0, 0, 1, 1435451, 0, 7, 9.54, -671.08, -12.64, 4.25, 0, 'Pusillin - a Wildspawn Imp (5 of 5) at the player');

DELETE FROM `gossip_menu` WHERE `entry` = 1424100 AND `text_id` = 6695;
INSERT INTO `gossip_menu`
(`entry`, `text_id`, `script_id`, `condition_id`)
VALUES
(1424100, 6695, 0, 0);

DELETE FROM `gossip_menu_option` WHERE `menu_id` = 1424100 AND `id` = 0;
INSERT INTO `gossip_menu_option`
(`menu_id`, `id`, `option_icon`, `option_text`, `option_broadcast_text`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `box_broadcast_text`, `condition_id`)
VALUES
(1424100, 0, 0, 'Thank you, Ironbark. We are ready for you to open the door.', 9103, 1, 1, -1, 0, 1424100, 0, 0, NULL, 0, 3705);

DELETE FROM `gossip_menu` WHERE `entry` = 1435400 AND `text_id` = 6877;
INSERT INTO `gossip_menu`
(`entry`, `text_id`, `script_id`, `condition_id`)
VALUES
(1435400, 6877, 0, 0);

DELETE FROM `gossip_menu_option` WHERE `menu_id` = 1435400 AND `id` = 0;
INSERT INTO `gossip_menu_option`
(`menu_id`, `id`, `option_icon`, `option_text`, `option_broadcast_text`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `box_broadcast_text`, `condition_id`)
VALUES
(1435400, 0, 0, 'Game? Are you crazy?', 9352, 1, 1, -1, 0, 1435400, 0, 0, NULL, 0, 0);

DELETE FROM `gossip_menu` WHERE `entry` = 1435401 AND `text_id` = 6878;
INSERT INTO `gossip_menu`
(`entry`, `text_id`, `script_id`, `condition_id`)
VALUES
(1435401, 6878, 0, 0);

DELETE FROM `gossip_menu_option` WHERE `menu_id` = 1435401 AND `id` = 0;
INSERT INTO `gossip_menu_option`
(`menu_id`, `id`, `option_icon`, `option_text`, `option_broadcast_text`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `box_broadcast_text`, `condition_id`)
VALUES
(1435401, 0, 0, 'Why you little...', 9355, 1, 1, -1, 0, 1435401, 0, 0, NULL, 0, 0);

DELETE FROM `gossip_menu` WHERE `entry` = 1435402 AND `text_id` = 6879;
INSERT INTO `gossip_menu`
(`entry`, `text_id`, `script_id`, `condition_id`)
VALUES
(1435402, 6879, 0, 0);

DELETE FROM `gossip_menu_option` WHERE `menu_id` = 1435402 AND `id` = 0;
INSERT INTO `gossip_menu_option`
(`menu_id`, `id`, `option_icon`, `option_text`, `option_broadcast_text`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `box_broadcast_text`, `condition_id`)
VALUES
(1435402, 0, 0, 'Mark my words, I will catch you, imp. And when I do!', 9356, 1, 1, -1, 0, 1435402, 0, 0, NULL, 0, 0);

DELETE FROM `gossip_menu` WHERE `entry` = 1435403 AND `text_id` = 6880;
INSERT INTO `gossip_menu`
(`entry`, `text_id`, `script_id`, `condition_id`)
VALUES
(1435403, 6880, 0, 0);

DELETE FROM `gossip_menu_option` WHERE `menu_id` = 1435403 AND `id` = 0;
INSERT INTO `gossip_menu_option`
(`menu_id`, `id`, `option_icon`, `option_text`, `option_broadcast_text`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `box_broadcast_text`, `condition_id`)
VALUES
(1435403, 0, 0, 'DIE!', 9359, 1, 1, -1, 0, 1435403, 0, 0, NULL, 0, 0);

DELETE FROM `gossip_menu` WHERE `entry` = 1435404 AND `text_id` = 6881;
INSERT INTO `gossip_menu`
(`entry`, `text_id`, `script_id`, `condition_id`)
VALUES
(1435404, 6881, 0, 0);

DELETE FROM `gossip_menu_option` WHERE `menu_id` = 1435404 AND `id` = 0;
INSERT INTO `gossip_menu_option`
(`menu_id`, `id`, `option_icon`, `option_text`, `option_broadcast_text`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `box_broadcast_text`, `condition_id`)
VALUES
(1435404, 0, 0, 'Prepare to meet your maker.', 9362, 1, 1, -1, 0, 1435404, 0, 0, NULL, 0, 0);

