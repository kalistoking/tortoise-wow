-- Zul'Gurub (map 309), the gong, Gahz'ranka, Venoxis and the trash: its C++ as rows -- EPIC10 tier 2.
-- Written by the trt repo's scripts/tier2/a25_zulgurub.py from t1_world; zulgurub_restore.sql puts
-- back what this replaces. R8: a person applies it, into the world database.
--
-- The C++ keeps its script names: mod-zulgurub is the switch (AM1, handoff/manager-091).
-- Loaded, the C++ runs as before -- a script found by name comes first. Unloaded
-- (`module unload mod-zulgurub`, which gives every creature standing a new AI at once),
-- the names find no script and the creatures run these rows (their ai_name).
--
-- Second pass: Jeklik, her bomb bats, the Shade of Jin'do, the brazier's lightning and the tablets. Jeklik's
-- Charge goes at a random player out of melee (the C++: the nearest at 10-40 yd); her bats from the cave come
-- at random points of it, facing as she does; her casts keep no global cooldown of their own. The bomb bats
-- take the zone into their own sight and throw at their own random attacker (the C++: Jeklik's); the Inferno
-- lies 15 s. The Shade's hexed victim loses its threat within half a second. The brazier's lightning strikes
-- on the half-second. The tablets' recipe is learned as their text shows (the C++: before it, even with none).
-- Ohgan stays C++: Mandokir levels up and raises its kills through his AI.
-- Map 309 keeps instance_zulgurub, Arlokk, Jeklik, Hakkar, Jin'do, Mandokir, Mar'li, Renataki, Thekal and the
-- Pile of Dirt (the core). The gong's event runs and is stopped at once while Arlokk is up or done (the C++ kept
-- the gong from being struck). Venoxis keeps his size in the snake form and has no height leash; his parasitic
-- serpents go at a random attacker. The doctor aims at a player out of melee (the C++: the farthest within
-- 10-20 yd); the bat rider is not made fear-immune at 40 %. The berserkers' and bat riders' own EventAI rules,
-- dead under the C++ and different from it, are taken away.

UPDATE `creature_template` SET `ai_name` = 'EventAI' WHERE `entry` = 11831;
UPDATE `creature_template` SET `ai_name` = 'EventAI' WHERE `entry` = 14507;
UPDATE `creature_template` SET `ai_name` = 'EventAI' WHERE `entry` = 14517;
UPDATE `creature_template` SET `ai_name` = 'EventAI' WHERE `entry` = 14965;
UPDATE `creature_template` SET `ai_name` = 'EventAI' WHERE `entry` = 14986;
UPDATE `creature_template` SET `ai_name` = 'EventAI' WHERE `entry` = 15009;
UPDATE `creature_template` SET `ai_name` = 'EventAI' WHERE `entry` = 15114;
UPDATE `creature_template` SET `ai_name` = 'EventAI' WHERE `entry` = 987800;

DELETE FROM `conditions` WHERE `condition_entry` IN (309011, 309310, 309311, 309312, 309330, 309331, 309332, 309350, 309352, 309354, 309356, 309357, 10309001, 10309004, 10309351, 10309353, 10309355);
INSERT INTO `conditions`
(`condition_entry`, `type`, `value1`, `value2`, `value3`, `value4`, `flags`)
VALUES
(10309001, -2, 129001, 532001, 0, 0, 0),
(10309004, -1, 230000, 10309001, 0, 0, 0),
(309011, 34, 12, 1, 0, 0, 1),
(309310, 34, 2, 1, 0, 0, 0),
(309311, 34, 2, 1, 0, 0, 1),
(309312, 1, 24306, 0, 0, 0, 1),
(309330, 12, 29, 0, 0, 0, 1),
(309331, 12, 30, 0, 0, 0, 1),
(309332, 12, 31, 0, 0, 0, 1),
(309350, 12, 29, 0, 0, 0, 0),
(309352, 12, 30, 0, 0, 0, 0),
(10309351, -1, 309352, 309330, 0, 0, 0),
(309354, 12, 31, 0, 0, 0, 0),
(10309353, -1, 309354, 309330, 309331, 0, 0),
(309356, 12, 32, 0, 0, 0, 0),
(10309355, -1, 309356, 309330, 309331, 309332, 0),
(309357, -1, 351, 352, 0, 0, 2);

-- Conditions another tier-2 migration writes too, under the same entry: whichever comes first.
INSERT IGNORE INTO `conditions`
(`condition_entry`, `type`, `value1`, `value2`, `value3`, `value4`, `flags`)
VALUES
(230000, 62, 0, 0, 0, 0, 1),
(129001, 34, 1, 1, 0, 0, 0),
(532001, 34, 1, 3, 0, 0, 0),
(309010, 34, 12, 1, 0, 0, 0),
(409020, 38, 5, 2, 0, 0, 0);

DELETE FROM `broadcast_text` WHERE `entry` IN (309101, 309102, 309103, 309104, 309201, 309202, 309203, 309204, 309205);
INSERT INTO `broadcast_text`
(`entry`, `male_text`, `female_text`, `chat_type`, `sound_id`, `language_id`, `emote_id1`, `emote_id2`, `emote_id3`, `emote_delay1`, `emote_delay2`, `emote_delay3`)
VALUES
(309101, 'Ssserenity..at lassst!', 'Ssserenity..at lassst!', 1, 0, 0, 0, 0, 0, 0, 0, 0),
(309102, 'Let the coils of hate unfurl!', 'Let the coils of hate unfurl!', 1, 8421, 0, 0, 0, 0, 0, 0, 0),
(309103, 'Gurubashi Bat Rider becomes fully engulfed in flames.', 'Gurubashi Bat Rider becomes fully engulfed in flames.', 2, 0, 0, 0, 0, 0, 0, 0, 0),
(309104, 'Gurubashi Bat Rider gets a crazed look in his eye.', 'Gurubashi Bat Rider gets a crazed look in his eye.', 2, 0, 0, 0, 0, 0, 0, 0, 0),
(309201, 'Lord Hir''eek, grant me wings of vengance!', 'Lord Hir''eek, grant me wings of vengance!', 1, 8417, 0, 0, 0, 0, 0, 0, 0),
(309202, 'Finally ...death. Curse you Hakkar! Curse you!', 'Finally ...death. Curse you Hakkar! Curse you!', 1, 8422, 0, 0, 0, 0, 0, 0, 0),
(309203, 'Jeklik emits a deafening shriek, calling for help.', 'Jeklik emits a deafening shriek, calling for help.', 2, 0, 0, 0, 0, 0, 0, 0, 0),
(309204, 'Jeklik begins to cast a Great Heal!', 'Jeklik begins to cast a Great Heal!', 2, 0, 0, 0, 0, 0, 0, 0, 0),
(309205, 'I command you to rain fire down upon these invaders!', 'I command you to rain fire down upon these invaders!', 1, 0, 0, 0, 0, 0, 0, 0, 0);

-- Existing rows taken away: the restore puts them back.
DELETE FROM `creature_ai_events` WHERE `id` = 1135201;
DELETE FROM `creature_ai_scripts` WHERE `id` = 1135201;
DELETE FROM `creature_ai_events` WHERE `id` = 1135204;
DELETE FROM `creature_ai_scripts` WHERE `id` = 1135204;
DELETE FROM `creature_ai_events` WHERE `id` = 1475001;
DELETE FROM `creature_ai_scripts` WHERE `id` = 1475001;
DELETE FROM `creature_ai_events` WHERE `id` = 1475003;
DELETE FROM `creature_ai_scripts` WHERE `id` = 1475003;
DELETE FROM `creature_ai_events` WHERE `id` = 1475005;
DELETE FROM `creature_ai_scripts` WHERE `id` = 1475005;
DELETE FROM `creature_ai_events` WHERE `id` IN (1135211, 1135212, 1135213, 1135214, 1135215, 1183101, 1183102, 1183103, 1183104, 1183105, 1450701, 1450702, 1450703, 1450704, 1450705, 1450706, 1450711, 1450712, 1450713, 1450714, 1450715, 1450721, 1450722, 1450723, 1450724, 1451701, 1451702, 1451703, 1451704, 1451705, 1451706, 1451711, 1451712, 1451713, 1451714, 1451715, 1451721, 1451722, 1451723, 1451724, 1451725, 1451726, 1475011, 1475012, 1475013, 1475014, 1475015, 1496501, 1496502, 1496503, 1496504, 1496505, 1498601, 1498602, 1498603, 1498604, 1498605, 1500901, 1500902, 1511401, 1511402, 1511403, 1511404, 1511405, 1511406, 1511411, 1511412, 1511413, 3099001, 3099002, 3099003, 3099004);
INSERT INTO `creature_ai_events`
(`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`)
VALUES
(1511401, 15114, 309011, 11, 0, 100, 0, 0, 0, 0, 0, 1511401, 0, 0, 'Gahz''ranka - spawned without his lure: gone for three days'),
(1511402, 15114, 309010, 11, 0, 100, 0, 0, 0, 0, 0, 1511402, 0, 0, 'Gahz''ranka - lured: to the shore'),
(1511403, 15114, 0, 29, 0, 100, 1, 8, 0, 0, 0, 1511403, 0, 0, 'Gahz''ranka - at the shore: up to his place'),
(1511404, 15114, 0, 4, 0, 100, 0, 0, 0, 0, 0, 1511404, 0, 0, 'Gahz''ranka - aggro: in progress (12)'),
(1511405, 15114, 0, 7, 0, 100, 0, 0, 0, 0, 0, 1511405, 0, 0, 'Gahz''ranka - evading: not started (12)'),
(1511406, 15114, 0, 6, 0, 100, 0, 0, 0, 0, 0, 1511406, 0, 0, 'Gahz''ranka - dead: done (12)'),
(1511411, 15114, 0, 0, 0, 100, 9, 8000, 8000, 8000, 20000, 1511411, 0, 0, 'Gahz''ranka - Frost Breath'),
(1511412, 15114, 0, 0, 0, 100, 9, 25000, 25000, 16000, 24000, 1511412, 0, 0, 'Gahz''ranka - Massive Geyser at a random attacker, threat wiped'),
(1511413, 15114, 0, 0, 0, 100, 9, 17000, 17000, 12000, 20000, 1511413, 0, 0, 'Gahz''ranka - Slam'),
(1450701, 14507, 0, 4, 0, 100, 0, 0, 0, 0, 0, 1450701, 0, 0, 'High Priest Venoxis - aggro: in progress (3)'),
(1450702, 14507, 0, 7, 0, 100, 0, 0, 0, 0, 0, 1450702, 0, 0, 'High Priest Venoxis - evading: his cobras and serpents gone'),
(1450703, 14507, 0, 21, 0, 100, 0, 0, 0, 0, 0, 1450703, 0, 0, 'High Priest Venoxis - home: his cobras back, not started (3)'),
(1450704, 14507, 0, 6, 0, 100, 0, 0, 0, 0, 0, 1450704, 0, 0, 'High Priest Venoxis - dead: done (3), his line, Hakkar''s power taken'),
(1450705, 14507, 0, 2, 0, 100, 0, 49, 0, 0, 0, 1450705, 0, 0, 'High Priest Venoxis - under half health: the snake (phase 1), threat wiped'),
(1450706, 14507, 0, 2, 0, 100, 8, 19, 0, 0, 0, 1450706, 0, 0, 'High Priest Venoxis - Frenzy under 20 %'),
(1450711, 14507, 0, 0, 2, 100, 1, 7500, 7500, 14000, 16000, 1450711, 0, 0, 'High Priest Venoxis - Holy Nova'),
(1450712, 14507, 0, 0, 2, 100, 1, 35000, 35000, 16000, 18000, 1450712, 0, 0, 'High Priest Venoxis - Dispel Magic'),
(1450713, 14507, 0, 0, 2, 100, 1, 10000, 10000, 8000, 12000, 1450713, 0, 0, 'High Priest Venoxis - Holy Fire'),
(1450714, 14507, 0, 0, 2, 100, 1, 30500, 30500, 20000, 22000, 1450714, 0, 0, 'High Priest Venoxis - Renew'),
(1450715, 14507, 0, 0, 2, 100, 1, 30000, 30000, 15000, 25000, 1450715, 0, 0, 'High Priest Venoxis - Holy Wrath'),
(1450721, 14507, 0, 0, 1, 100, 9, 2000, 2000, 7000, 10000, 1450721, 0, 0, 'High Priest Venoxis - Poison Cloud'),
(1450722, 14507, 0, 0, 1, 100, 9, 5000, 5000, 10000, 20000, 1450722, 0, 0, 'High Priest Venoxis - Thrash'),
(1450723, 14507, 0, 0, 1, 100, 9, 5500, 5500, 15000, 20000, 1450723, 0, 0, 'High Priest Venoxis - Venom Spit at a random attacker'),
(1450724, 14507, 0, 0, 1, 100, 9, 10000, 10000, 10000, 10000, 1450724, 0, 0, 'High Priest Venoxis - Parasitic Serpent at a random attacker'),
(1135211, 11352, 0, 4, 0, 100, 0, 0, 0, 0, 0, 1135211, 0, 0, 'Gurubashi Berserker - aggro: the zone into the fight'),
(1135212, 11352, 0, 0, 0, 100, 9, 10000, 10000, 10000, 10000, 1135212, 0, 0, 'Gurubashi Berserker - Knock Away, threat wiped'),
(1135213, 11352, 0, 0, 0, 100, 9, 5000, 5000, 14000, 16000, 1135213, 0, 0, 'Gurubashi Berserker - Thunderclap'),
(1135214, 11352, 0, 0, 0, 100, 9, 15000, 15000, 25000, 30000, 1135214, 0, 0, 'Gurubashi Berserker - Intimidating Roar, threat wiped'),
(1135215, 11352, 0, 2, 0, 100, 0, 49, 0, 0, 0, 1135215, 0, 0, 'Gurubashi Berserker - Enrage under half health'),
(1183101, 11831, 0, 0, 0, 100, 9, 5000, 5000, 20000, 40000, 1183101, 0, 0, 'Hakkari Witch Doctor - Malefice at a player out of melee'),
(1183102, 11831, 0, 0, 0, 100, 9, 4000, 4000, 5000, 20000, 1183102, 0, 0, 'Hakkari Witch Doctor - Shadow Shock at a player out of melee'),
(1183103, 11831, 0, 0, 0, 100, 1, 15000, 15000, 10000, 40000, 1183103, 0, 0, 'Hakkari Witch Doctor - four toads at a random attacker'),
(1183104, 11831, 0, 0, 0, 100, 1, 15000, 15000, 1000, 1000, 1183104, 0, 0, 'Hakkari Witch Doctor - the nearest toad freed into a voodoo spirit'),
(1183105, 11831, 0, 6, 0, 100, 0, 0, 0, 0, 0, 1183105, 0, 0, 'Hakkari Witch Doctor - dead: a voodoo spirit at his killer'),
(1500901, 15009, 0, 11, 0, 100, 0, 0, 0, 0, 0, 1500901, 0, 0, 'Voodoo Spirit - unselectable'),
(1500902, 15009, 409020, 0, 0, 100, 1, 500, 500, 500, 500, 1500902, 0, 0, 'Voodoo Spirit - at its victim: the victim takes it'),
(1475011, 14750, 0, 4, 0, 100, 0, 0, 0, 0, 0, 1475011, 0, 0, 'Gurubashi Bat Rider - aggro: Demoralizing Shout'),
(1475012, 14750, 0, 2, 0, 100, 0, 39, 0, 0, 0, 1475012, 0, 0, 'Gurubashi Bat Rider - under 40 %: Unstable Concoction, one of its two emotes'),
(1475013, 14750, 0, 0, 0, 100, 9, 8000, 8000, 25000, 25000, 1475013, 0, 0, 'Gurubashi Bat Rider - Battle Command'),
(1475014, 14750, 0, 0, 0, 100, 9, 6500, 6500, 15000, 15000, 1475014, 0, 0, 'Gurubashi Bat Rider - Infected Bite'),
(1475015, 14750, 0, 0, 0, 100, 9, 6000, 6000, 6000, 6000, 1475015, 0, 0, 'Gurubashi Bat Rider - Thrash'),
(1451701, 14517, 0, 11, 0, 100, 0, 0, 0, 0, 0, 1451701, 0, 0, 'High Priestess Jeklik - at rest: channeling, her size, failed (2)'),
(1451702, 14517, 0, 7, 0, 100, 0, 0, 0, 0, 0, 1451702, 0, 0, 'High Priestess Jeklik - at rest: channeling, her size, failed (2)'),
(1451703, 14517, 0, 21, 0, 100, 1, 0, 0, 0, 0, 1451703, 0, 0, 'High Priestess Jeklik - home: channeling, her own size'),
(1451704, 14517, 0, 4, 0, 100, 0, 0, 0, 0, 0, 1451704, 0, 0, 'High Priestess Jeklik - aggro: her bat form, flying, in progress (2)'),
(1451705, 14517, 0, 6, 0, 100, 0, 0, 0, 0, 0, 1451705, 0, 0, 'High Priestess Jeklik - dead: her line, done (2), Hakkar weakened'),
(1451706, 14517, 0, 2, 0, 100, 0, 49, 0, 0, 0, 1451706, 0, 0, 'High Priestess Jeklik - under half: her troll form, every threat wiped (phase 1)'),
(1451711, 14517, 0, 0, 2, 100, 9, 10000, 10000, 15000, 30000, 1451711, 0, 0, 'High Priestess Jeklik - Charge at a player out of melee'),
(1451712, 14517, 0, 0, 2, 100, 9, 12000, 12000, 20000, 24000, 1451712, 0, 0, 'High Priestess Jeklik - Sonic Burst'),
(1451713, 14517, 0, 0, 2, 100, 9, 8000, 8000, 12000, 15000, 1451713, 0, 0, 'High Priestess Jeklik - Swoop'),
(1451714, 14517, 0, 0, 2, 100, 9, 9000, 9000, 16000, 18000, 1451714, 0, 0, 'High Priestess Jeklik - Pierce Armor'),
(1451715, 14517, 0, 0, 2, 100, 1, 40000, 40000, 65000, 65000, 1451715, 0, 0, 'High Priestess Jeklik - every 65 s: six bats from the cave, each at a random attacker'),
(1451721, 14517, 0, 0, 1, 100, 9, 9000, 9000, 8000, 12000, 1451721, 0, 0, 'High Priestess Jeklik - Shadow Word: Pain at a random attacker'),
(1451723, 14517, 0, 0, 1, 100, 9, 2000, 2000, 25000, 30000, 1451723, 0, 0, 'High Priestess Jeklik - Mind Flay at a random attacker'),
(1451724, 14517, 0, 0, 1, 100, 9, 26000, 26000, 25000, 30000, 1451724, 0, 0, 'High Priestess Jeklik - Curse of Blood at a random attacker'),
(1451725, 14517, 0, 0, 1, 100, 9, 12000, 12000, 30000, 30000, 1451725, 0, 0, 'High Priestess Jeklik - Screech'),
(1451722, 14517, 0, 0, 1, 100, 9, 20000, 20000, 20000, 25000, 1451722, 0, 0, 'High Priestess Jeklik - Great Heal, with its emote'),
(1451726, 14517, 0, 0, 1, 100, 1, 10000, 10000, 10000, 10000, 1451726, 0, 0, 'High Priestess Jeklik - every 10 s: a bomb bat over a random attacker, her yell'),
(1496501, 14965, 0, 11, 0, 100, 0, 0, 0, 0, 0, 1496501, 0, 0, 'Frenzied Bloodseeker Bat - over the fight: unselectable, standing, the zone'),
(1496502, 14965, 309310, 0, 0, 100, 1, 2000, 2000, 5000, 10000, 1496502, 0, 0, 'Frenzied Bloodseeker Bat - Throw Liquid Fire at a random attacker'),
(1496503, 14965, 0, 36, 0, 100, 1, 23970, 0, 0, 0, 1496503, 0, 0, 'Frenzied Bloodseeker Bat - its fire landed: Inferno there'),
(1496504, 14965, 309311, 0, 0, 100, 1, 500, 500, 500, 500, 1496504, 0, 0, 'Frenzied Bloodseeker Bat - Jeklik no longer fighting: gone'),
(1496505, 14965, 309311, 1, 0, 100, 1, 500, 500, 500, 500, 1496505, 0, 0, 'Frenzied Bloodseeker Bat - Jeklik no longer fighting: gone'),
(1498601, 14986, 0, 11, 0, 100, 0, 0, 0, 0, 0, 1498601, 0, 0, 'Shade of Jin''do - invisible'),
(1498602, 14986, 0, 7, 0, 100, 0, 0, 0, 0, 0, 1498602, 0, 0, 'Shade of Jin''do - invisible'),
(1498603, 14986, 309312, 37, 0, 100, 1, 100, 2, 0, 0, 1498603, 0, 0, 'Shade of Jin''do - hit by one not deluded: no damage'),
(1498604, 14986, 0, 24, 0, 100, 1, 17172, 1, 500, 500, 1498604, 0, 0, 'Shade of Jin''do - its victim hexed: its threat wiped'),
(1498605, 14986, 0, 0, 0, 100, 1, 1000, 1000, 2000, 2000, 1498605, 0, 0, 'Shade of Jin''do - Shadow Shock'),
(3099001, 987800, 0, 1, 2, 100, 1, 0, 0, 1000, 1000, 3099001, 0, 0, 'Madness Trigger - its first 4 s: twelve strikes a second (phase 0)'),
(3099002, 987800, 0, 1, 0, 100, 0, 3500, 3500, 0, 0, 3099002, 0, 0, 'Madness Trigger - 3.5 s on: four a second from then (phase 1)'),
(3099003, 987800, 0, 1, 1, 100, 1, 500, 500, 1000, 1000, 3099003, 0, 0, 'Madness Trigger - four strikes a second (phase 1)'),
(3099004, 987800, 0, 1, 0, 100, 0, 24500, 24500, 0, 0, 3099004, 0, 0, 'Madness Trigger - 24.5 s on: gone');

DELETE FROM `creature_ai_scripts` WHERE `id` IN (1135211, 1135212, 1135213, 1135214, 1135215, 1183101, 1183102, 1183103, 1183104, 1183105, 1450701, 1450702, 1450703, 1450704, 1450705, 1450706, 1450711, 1450712, 1450713, 1450714, 1450715, 1450721, 1450722, 1450723, 1450724, 1451701, 1451702, 1451703, 1451704, 1451705, 1451706, 1451711, 1451712, 1451713, 1451714, 1451715, 1451721, 1451722, 1451723, 1451724, 1451725, 1451726, 1475011, 1475012, 1475013, 1475014, 1475015, 1496501, 1496502, 1496503, 1496504, 1496505, 1498601, 1498602, 1498603, 1498604, 1498605, 1500901, 1500902, 1511401, 1511402, 1511403, 1511404, 1511405, 1511406, 1511411, 1511412, 1511413, 3099001, 3099002, 3099003, 3099004);
INSERT INTO `creature_ai_scripts`
(`id`, `delay`, `priority`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`)
VALUES
(1511401, 0, 0, 18, 0, 259200, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Gahz''ranka - gone'),
(1511402, 0, 0, 3, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0, 0, -11709.3476, -1749.965, 8.733, 0, 0, 'Gahz''ranka - to the shore (point 0)'),
(1511402, 0, 1, 34, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, -11688.95, -1777.21, 12.593, 5.81, 0, 'Gahz''ranka - home on the shore'),
(1511403, 0, 0, 3, 0, 0, 0, 2, 0, 0, 0, 0, 1, 0, 0, 0, -11688.95, -1777.21, 12.593, 0, 0, 'Gahz''ranka - his place (point 1)'),
(1511404, 0, 0, 37, 12, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Gahz''ranka - in progress'),
(1511405, 0, 0, 37, 12, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Gahz''ranka - not started'),
(1511406, 0, 0, 37, 12, 3, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Gahz''ranka - done'),
(1511411, 0, 0, 15, 16099, 0, 0, 0, 0, 0, 1, 8, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Gahz''ranka - Frost Breath'),
(1511412, 0, 0, 15, 22421, 0, 0, 0, 0, 0, 4, 8, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Gahz''ranka - Massive Geyser at a random attacker, threat wiped'),
(1511412, 0, 1, 29, 6, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, -100, 0, 0, 0, 0, 'Gahz''ranka - threat wiped'),
(1511413, 0, 0, 15, 24326, 0, 0, 0, 0, 0, 1, 8, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Gahz''ranka - Slam'),
(1450701, 0, 0, 37, 3, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Venoxis - in progress'),
(1450702, 0, 0, 68, 3090001, 2, 11373, 150, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Venoxis - his cobras gone'),
(1450702, 0, 1, 68, 3090001, 2, 14884, 150, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Venoxis - his parasitic serpents gone'),
(1450703, 0, 0, 71, 0, 0, 0, 0, 49195, 0, 9, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Razzashi Cobra 49195 - back'),
(1450703, 0, 1, 71, 0, 0, 0, 0, 49196, 0, 9, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Razzashi Cobra 49196 - back'),
(1450703, 0, 2, 71, 0, 0, 0, 0, 49197, 0, 9, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Razzashi Cobra 49197 - back'),
(1450703, 0, 3, 71, 0, 0, 0, 0, 49198, 0, 9, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Razzashi Cobra 49198 - back'),
(1450703, 0, 4, 37, 3, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Venoxis - not started'),
(1450704, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 309101, 0, 0, 0, 0, 0, 0, 0, 0, 'High Priest Venoxis - his death line'),
(1450704, 0, 1, 15, 23861, 2, 0, 0, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'High Priest Venoxis - Poison Cloud'),
(1450704, 0, 2, 37, 3, 3, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Venoxis - done'),
(1450704, 0, 3, 15, 24693, 2, 0, 0, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'High Priest Venoxis - Hakkar''s power taken'),
(1450705, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 309102, 0, 0, 0, 0, 0, 0, 0, 0, 'High Priest Venoxis - "Let the coils of hate unfurl!"'),
(1450705, 0, 1, 5, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'High Priest Venoxis - stops casting'),
(1450705, 0, 2, 15, 23849, 2, 0, 0, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'High Priest Venoxis - Venoxis Transform'),
(1450705, 0, 3, 29, 6, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, -100, 0, 0, 0, 0, 'High Priest Venoxis - threat wiped'),
(1450705, 0, 4, 44, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'High Priest Venoxis - the snake'),
(1450706, 0, 0, 15, 8269, 0, 0, 0, 0, 0, 0, 12, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'High Priest Venoxis - Frenzy'),
(1450711, 0, 0, 15, 23858, 0, 0, 0, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'High Priest Venoxis - Holy Nova'),
(1450712, 0, 0, 15, 23859, 0, 0, 0, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'High Priest Venoxis - Dispel Magic'),
(1450713, 0, 0, 15, 23860, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'High Priest Venoxis - Holy Fire'),
(1450714, 0, 0, 15, 23895, 0, 0, 0, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'High Priest Venoxis - Renew'),
(1450715, 0, 0, 15, 23979, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'High Priest Venoxis - Holy Wrath'),
(1450721, 0, 0, 15, 23861, 0, 0, 0, 0, 0, 1, 8, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'High Priest Venoxis - Poison Cloud'),
(1450722, 0, 0, 15, 3391, 0, 0, 0, 0, 0, 0, 12, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'High Priest Venoxis - Thrash'),
(1450723, 0, 0, 15, 23862, 0, 0, 0, 0, 0, 4, 8, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'High Priest Venoxis - Venom Spit at a random attacker'),
(1450724, 0, 0, 15, 23865, 0, 0, 0, 0, 0, 4, 8, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'High Priest Venoxis - Parasitic Serpent at a random attacker'),
(1450724, 0, 1, 10, 14884, 25000, 0, 0, 0, 0, 0, 0, 262144, 0, 4, 1, 0, 0, 0, 0, 0, 'High Priest Venoxis - a parasitic serpent'),
(1135211, 0, 0, 49, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Berserker - the zone'),
(1135212, 0, 0, 15, 11130, 0, 0, 0, 0, 0, 1, 8, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Gurubashi Berserker - Knock Away, threat wiped'),
(1135212, 0, 1, 29, 6, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, -100, 0, 0, 0, 0, 'Gurubashi Berserker - threat wiped'),
(1135213, 0, 0, 15, 15588, 0, 0, 0, 0, 0, 1, 8, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Gurubashi Berserker - Thunderclap'),
(1135214, 0, 0, 15, 16508, 0, 0, 0, 0, 0, 1, 8, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Gurubashi Berserker - Intimidating Roar, threat wiped'),
(1135214, 0, 1, 29, 6, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, -100, 0, 0, 0, 0, 'Gurubashi Berserker - threat wiped'),
(1135215, 0, 0, 15, 8269, 0, 0, 0, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Gurubashi Berserker - Enrage'),
(1183101, 0, 0, 15, 24053, 0, 0, 0, 130, 0, 4, 8, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Hakkari Witch Doctor - Malefice at a player out of melee'),
(1183102, 0, 0, 15, 17289, 2, 0, 0, 130, 0, 4, 8, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Hakkari Witch Doctor - Shadow Shock at a player out of melee'),
(1183103, 0, 0, 10, 15010, 25000, 0, 0, 0, 0, 0, 0, 262144, 0, 4, 1, 0, 0, 0, 0, 0, 'Hakkari Witch Doctor - a toad (1 of 4)'),
(1183103, 0, 1, 10, 15010, 25000, 0, 0, 0, 0, 0, 0, 262144, 0, 4, 1, 0, 0, 0, 0, 0, 'Hakkari Witch Doctor - a toad (2 of 4)'),
(1183103, 0, 2, 10, 15010, 25000, 0, 0, 0, 0, 0, 0, 262144, 0, 4, 1, 0, 0, 0, 0, 0, 'Hakkari Witch Doctor - a toad (3 of 4)'),
(1183103, 0, 3, 10, 15010, 25000, 0, 0, 0, 0, 0, 0, 262144, 0, 4, 1, 0, 0, 0, 0, 0, 'Hakkari Witch Doctor - a toad (4 of 4)'),
(1183104, 0, 0, 15, 24065, 2, 0, 0, 15010, 40, 8, 6, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Jungle Toad - freed'),
(1183104, 0, 1, 18, 100, 0, 0, 0, 15010, 40, 8, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Jungle Toad - gone'),
(1183105, 0, 0, 10, 15009, 25000, 0, 0, 0, 0, 0, 0, 262144, 0, 0, 1, 0, 0, 0, 0, 0, 'Hakkari Witch Doctor - a voodoo spirit'),
(1500901, 0, 0, 4, 46, 33554434, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Voodoo Spirit - unselectable'),
(1500902, 0, 0, 15, 24050, 2, 0, 0, 0, 0, 1, 6, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Voodoo Spirit - its victim takes it'),
(1500902, 0, 1, 18, 100, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Voodoo Spirit - gone'),
(1475011, 0, 0, 15, 23511, 0, 0, 0, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Gurubashi Bat Rider - Demoralizing Shout'),
(1475012, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0, 309103, 309104, 0, 0, 0, 0, 0, 0, 0, 'Gurubashi Bat Rider - one of two emotes'),
(1475012, 0, 1, 15, 24024, 0, 0, 0, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Gurubashi Bat Rider - Unstable Concoction'),
(1475013, 0, 0, 15, 5115, 0, 0, 0, 0, 0, 0, 12, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Gurubashi Bat Rider - Battle Command'),
(1475014, 0, 0, 15, 16128, 0, 0, 0, 0, 0, 1, 8, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Gurubashi Bat Rider - Infected Bite'),
(1475015, 0, 0, 15, 3391, 0, 0, 0, 0, 0, 0, 12, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Gurubashi Bat Rider - Thrash'),
(1451701, 0, 0, 15, 13540, 0, 0, 0, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'High Priestess Jeklik - Green Channeling'),
(1451701, 0, 1, 2, 4, 1069547520, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'High Priestess Jeklik - scale 1.5'),
(1451701, 0, 2, 37, 2, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'High Priestess Jeklik - failed'),
(1451702, 0, 0, 15, 13540, 0, 0, 0, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'High Priestess Jeklik - Green Channeling'),
(1451702, 0, 1, 2, 4, 1069547520, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'High Priestess Jeklik - scale 1.5'),
(1451702, 0, 2, 37, 2, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'High Priestess Jeklik - failed'),
(1451702, 0, 3, 6, 309, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, -12289.7, -1382.18, 144.643, 2.31604, 0, 'High Priestess Jeklik - home at once'),
(1451703, 0, 0, 15, 13540, 0, 0, 0, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'High Priestess Jeklik - Green Channeling'),
(1451703, 0, 1, 2, 4, 1065353216, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'High Priestess Jeklik - scale 1.0'),
(1451704, 0, 0, 95, 1, 262144, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'High Priestess Jeklik - no pathfinding'),
(1451704, 0, 1, 0, 1, 0, 0, 0, 0, 0, 0, 0, 309201, 0, 0, 0, 0, 0, 0, 0, 0, 'High Priestess Jeklik - her aggro yell'),
(1451704, 0, 2, 74, 23966, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'High Priestess Jeklik - Bat Form'),
(1451704, 0, 3, 77, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'High Priestess Jeklik - flying'),
(1451704, 0, 4, 2, 4, 1073741824, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'High Priestess Jeklik - scale 2.0'),
(1451704, 0, 5, 37, 2, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'High Priestess Jeklik - in progress'),
(1451705, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 309202, 0, 0, 0, 0, 0, 0, 0, 0, 'High Priestess Jeklik - her death line'),
(1451705, 0, 1, 37, 2, 3, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'High Priestess Jeklik - done'),
(1451705, 0, 2, 15, 24693, 2, 0, 0, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'High Priestess Jeklik - Hakkar Power Down'),
(1451706, 0, 0, 14, 23966, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'High Priestess Jeklik - Bat Form off'),
(1451706, 0, 1, 77, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'High Priestess Jeklik - landed'),
(1451706, 0, 2, 2, 4, 1069547520, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'High Priestess Jeklik - scale 1.5'),
(1451706, 0, 3, 29, 6, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, -100, 0, 0, 0, 0, 'High Priestess Jeklik - every threat wiped'),
(1451706, 0, 4, 44, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'High Priestess Jeklik - phase 1'),
(1451711, 0, 0, 15, 24408, 0, 0, 0, 130, 0, 4, 8, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'High Priestess Jeklik - Charge at a player out of melee'),
(1451712, 0, 0, 15, 23918, 0, 0, 0, 0, 0, 1, 8, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'High Priestess Jeklik - Sonic Burst'),
(1451713, 0, 0, 15, 23919, 0, 0, 0, 0, 0, 1, 8, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'High Priestess Jeklik - Swoop'),
(1451714, 0, 0, 15, 12097, 0, 0, 0, 0, 0, 1, 8, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'High Priestess Jeklik - Pierce Armor'),
(1451715, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0, 309203, 0, 0, 0, 0, 0, 0, 0, 0, 'High Priestess Jeklik - "calls her bats"'),
(1451715, 0, 1, 10, 11368, 15000, 0, 0, 0, 0, 0, 0, 196608, 0, 4, 4, -12291.5, -1379.5, 144.8304, 3.5, 0, 'High Priestess Jeklik - a Bloodseeker Bat (1 of 6)'),
(1451715, 0, 2, 10, 11368, 15000, 0, 0, 0, 0, 0, 0, 196608, 0, 4, 4, -12291.5, -1379.5, 144.8304, 3.5, 0, 'High Priestess Jeklik - a Bloodseeker Bat (2 of 6)'),
(1451715, 0, 3, 10, 11368, 15000, 0, 0, 0, 0, 0, 0, 196608, 0, 4, 4, -12291.5, -1379.5, 144.8304, 3.5, 0, 'High Priestess Jeklik - a Bloodseeker Bat (3 of 6)'),
(1451715, 0, 4, 10, 11368, 15000, 0, 0, 0, 0, 0, 0, 196608, 0, 4, 4, -12291.5, -1379.5, 144.8304, 3.5, 0, 'High Priestess Jeklik - a Bloodseeker Bat (4 of 6)'),
(1451715, 0, 5, 10, 11368, 15000, 0, 0, 0, 0, 0, 0, 196608, 0, 4, 4, -12291.5, -1379.5, 144.8304, 3.5, 0, 'High Priestess Jeklik - a Bloodseeker Bat (5 of 6)'),
(1451715, 0, 6, 10, 11368, 15000, 0, 0, 0, 0, 0, 0, 196608, 0, 4, 4, -12291.5, -1379.5, 144.8304, 3.5, 0, 'High Priestess Jeklik - a Bloodseeker Bat (6 of 6)'),
(1451721, 0, 0, 15, 23952, 0, 0, 0, 0, 0, 4, 8, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'High Priestess Jeklik - Shadow Word: Pain at a random attacker'),
(1451723, 0, 0, 15, 23953, 0, 0, 0, 0, 0, 4, 8, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'High Priestess Jeklik - Mind Flay at a random attacker'),
(1451724, 0, 0, 15, 16098, 0, 0, 0, 0, 0, 4, 8, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'High Priestess Jeklik - Curse of Blood at a random attacker'),
(1451725, 0, 0, 15, 6605, 0, 0, 0, 0, 0, 1, 8, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'High Priestess Jeklik - Screech'),
(1451722, 0, 0, 15, 23954, 0, 0, 0, 0, 0, 0, 12, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'High Priestess Jeklik - Great Heal, with its emote'),
(1451722, 0, 1, 0, 2, 0, 0, 0, 0, 0, 0, 0, 309204, 0, 0, 0, 0, 0, 0, 0, 0, 'High Priestess Jeklik - "begins to cast a Great Heal!"'),
(1451726, 0, 0, 10, 14965, 1800000, 0, 0, 0, 0, 4, 8, 65536, 0, -1, 4, 0, 0, 15, 0, 0, 'High Priestess Jeklik - a Frenzied Bloodseeker Bat 15 yd over the attacker'),
(1451726, 0, 1, 0, 1, 0, 0, 0, 0, 0, 0, 0, 309205, 0, 0, 0, 0, 0, 0, 0, 0, 'High Priestess Jeklik - her bomb bat yell'),
(1496501, 0, 0, 4, 46, 33554432, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Frenzied Bloodseeker Bat - not selectable'),
(1496501, 0, 1, 43, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Frenzied Bloodseeker Bat - no chase'),
(1496501, 0, 2, 42, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Frenzied Bloodseeker Bat - no melee'),
(1496501, 0, 3, 49, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Frenzied Bloodseeker Bat - the zone into its sight'),
(1496502, 0, 0, 15, 23970, 0, 0, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Frenzied Bloodseeker Bat - Throw Liquid Fire at a random attacker'),
(1496503, 0, 0, 76, 177764, 15, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Frenzied Bloodseeker Bat - Inferno at the hit'),
(1496504, 0, 0, 18, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Frenzied Bloodseeker Bat - gone'),
(1496505, 0, 0, 18, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Frenzied Bloodseeker Bat - gone'),
(1498601, 0, 0, 74, 24307, 8, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Shade of Jin''do - Invisible'),
(1498602, 0, 0, 74, 24307, 8, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Shade of Jin''do - Invisible'),
(1498603, 0, 0, 74, 24307, 8, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Shade of Jin''do - Invisible (kept)'),
(1498604, 0, 0, 29, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, -100, 0, 0, 0, 0, 'Shade of Jin''do - the hexed victim''s threat wiped'),
(1498605, 0, 0, 15, 24458, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Shade of Jin''do - Shadow Shock'),
(3099001, 0, 0, 13, 0, 0, 0, 0, 180252, 100, 27, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Madness Trigger - a Troll Hero Lightning struck'),
(3099001, 0, 1, 13, 0, 0, 0, 0, 180252, 100, 27, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Madness Trigger - a Troll Hero Lightning struck'),
(3099001, 0, 2, 13, 0, 0, 0, 0, 180252, 100, 27, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Madness Trigger - a Troll Hero Lightning struck'),
(3099001, 0, 3, 13, 0, 0, 0, 0, 180252, 100, 27, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Madness Trigger - a Troll Hero Lightning struck'),
(3099001, 0, 4, 13, 0, 0, 0, 0, 180252, 100, 27, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Madness Trigger - a Troll Hero Lightning struck'),
(3099001, 0, 5, 13, 0, 0, 0, 0, 180252, 100, 27, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Madness Trigger - a Troll Hero Lightning struck'),
(3099001, 0, 6, 13, 0, 0, 0, 0, 180252, 100, 27, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Madness Trigger - a Troll Hero Lightning struck'),
(3099001, 0, 7, 13, 0, 0, 0, 0, 180252, 100, 27, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Madness Trigger - a Troll Hero Lightning struck'),
(3099001, 0, 8, 13, 0, 0, 0, 0, 180252, 100, 27, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Madness Trigger - a Troll Hero Lightning struck'),
(3099001, 0, 9, 13, 0, 0, 0, 0, 180252, 100, 27, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Madness Trigger - a Troll Hero Lightning struck'),
(3099001, 0, 10, 13, 0, 0, 0, 0, 180252, 100, 27, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Madness Trigger - a Troll Hero Lightning struck'),
(3099001, 0, 11, 13, 0, 0, 0, 0, 180252, 100, 27, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Madness Trigger - a Troll Hero Lightning struck'),
(3099002, 0, 0, 44, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Madness Trigger - phase 1'),
(3099003, 0, 0, 13, 0, 0, 0, 0, 180252, 100, 27, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Madness Trigger - a Troll Hero Lightning struck'),
(3099003, 0, 1, 13, 0, 0, 0, 0, 180252, 100, 27, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Madness Trigger - a Troll Hero Lightning struck'),
(3099003, 0, 2, 13, 0, 0, 0, 0, 180252, 100, 27, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Madness Trigger - a Troll Hero Lightning struck'),
(3099003, 0, 3, 13, 0, 0, 0, 0, 180252, 100, 27, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Madness Trigger - a Troll Hero Lightning struck'),
(3099004, 0, 0, 18, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Madness Trigger - gone');

DELETE FROM `generic_scripts` WHERE `id` IN (3090001);
INSERT INTO `generic_scripts`
(`id`, `delay`, `priority`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`)
VALUES
(3090001, 0, 0, 18, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Venoxis''s serpent - gone');

DELETE FROM `gossip_scripts` WHERE `id` IN (309500);
INSERT INTO `gossip_scripts`
(`id`, `delay`, `priority`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`)
VALUES
(309500, 0, 0, 15, 24267, 2, 0, 0, 0, 0, 0, 6, 0, 0, 0, 0, 0, 0, 0, 0, 309357, 'Tablet of Madness - an alchemist of 300 learns Gurubashi Mojo Madness');

DELETE FROM `gossip_menu` WHERE `entry` = 309501 AND `text_id` = 7643;
INSERT INTO `gossip_menu`
(`entry`, `text_id`, `script_id`, `condition_id`)
VALUES
(309501, 7643, 309500, 0);

DELETE FROM `gossip_menu` WHERE `entry` = 309501 AND `text_id` = 7669;
INSERT INTO `gossip_menu`
(`entry`, `text_id`, `script_id`, `condition_id`)
VALUES
(309501, 7669, 309500, 309350);

DELETE FROM `gossip_menu` WHERE `entry` = 309502 AND `text_id` = 7670;
INSERT INTO `gossip_menu`
(`entry`, `text_id`, `script_id`, `condition_id`)
VALUES
(309502, 7670, 309500, 0);

DELETE FROM `gossip_menu` WHERE `entry` = 309502 AND `text_id` = 7675;
INSERT INTO `gossip_menu`
(`entry`, `text_id`, `script_id`, `condition_id`)
VALUES
(309502, 7675, 309500, 10309351);

DELETE FROM `gossip_menu` WHERE `entry` = 309503 AND `text_id` = 7672;
INSERT INTO `gossip_menu`
(`entry`, `text_id`, `script_id`, `condition_id`)
VALUES
(309503, 7672, 309500, 0);

DELETE FROM `gossip_menu` WHERE `entry` = 309503 AND `text_id` = 7673;
INSERT INTO `gossip_menu`
(`entry`, `text_id`, `script_id`, `condition_id`)
VALUES
(309503, 7673, 309500, 10309353);

DELETE FROM `gossip_menu` WHERE `entry` = 309504 AND `text_id` = 7674;
INSERT INTO `gossip_menu`
(`entry`, `text_id`, `script_id`, `condition_id`)
VALUES
(309504, 7674, 309500, 0);

DELETE FROM `gossip_menu` WHERE `entry` = 309504 AND `text_id` = 7682;
INSERT INTO `gossip_menu`
(`entry`, `text_id`, `script_id`, `condition_id`)
VALUES
(309504, 7682, 309500, 10309355);

-- Steps added to scripts the migration does not own: each found by id, command, comments.
DELETE FROM `event_scripts` WHERE `id` = 9066 AND `command` = 32 AND `comments` = 'Gong of Bethekk - Arlokk up or done: no more';
INSERT INTO `event_scripts`
(`id`, `delay`, `priority`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`)
VALUES
(9066, 0, 0, 32, 10309004, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Gong of Bethekk - Arlokk up or done: no more');

DELETE FROM `event_scripts` WHERE `id` = 9066 AND `command` = 37 AND `comments` = 'Gong of Bethekk - Arlokk called (1 = 1)';
INSERT INTO `event_scripts`
(`id`, `delay`, `priority`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`)
VALUES
(9066, 0, 1, 37, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 230000, 'Gong of Bethekk - Arlokk called (1 = 1)');

UPDATE `gameobject_template` SET `data3` = 309501 WHERE `entry` = 180358;
UPDATE `gameobject_template` SET `data3` = 309501 WHERE `entry` = 987654;
UPDATE `gameobject_template` SET `data3` = 309502 WHERE `entry` = 180364;
UPDATE `gameobject_template` SET `data3` = 309502 WHERE `entry` = 987655;
UPDATE `gameobject_template` SET `data3` = 309503 WHERE `entry` = 180365;
UPDATE `gameobject_template` SET `data3` = 309503 WHERE `entry` = 987656;
UPDATE `gameobject_template` SET `data3` = 309504 WHERE `entry` = 180393;
UPDATE `gameobject_template` SET `data3` = 309504 WHERE `entry` = 987657;
