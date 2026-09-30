-- Dragonmaw Retreat (map 816), instance_dragonmaw_retreat and five bosses: its C++ as rows -- EPIC10 tier 2.
-- Written by the trt repo's scripts/tier2/a04_dragonmaw_retreat.py from t1_world; dragonmaw_retreat_restore.sql puts
-- back what this replaces. R8: a person applies it, into the world database.
--
-- The C++ keeps its script names: mod-dragonmaw-retreat is the switch (AM1, handoff/manager-091).
-- Loaded, the C++ runs as before -- a script found by name comes first. Unloaded
-- (`module unload mod-dragonmaw-retreat`, which gives every creature standing a new AI at once),
-- the names find no script and the creatures run these rows (their ai_name).
--
-- Map 816 keeps instance_dragonmaw_retreat: with mod-dragonmaw-retreat unloaded it names no loaded
-- script, and the map gets the generic store (AC7) -- slot 2 counts the enchanters, saved.

UPDATE `creature_template` SET `ai_name` = 'EventAI' WHERE `entry` = 62037;
UPDATE `creature_template` SET `ai_name` = 'EventAI' WHERE `entry` = 62056;
UPDATE `creature_template` SET `ai_name` = 'EventAI' WHERE `entry` = 62057;
UPDATE `creature_template` SET `ai_name` = 'EventAI' WHERE `entry` = 62069;
UPDATE `creature_template` SET `ai_name` = 'EventAI' WHERE `entry` = 62072;
UPDATE `creature_template` SET `ai_name` = 'EventAI' WHERE `entry` = 62453;

DELETE FROM `conditions` WHERE `condition_entry` IN (816001, 816002, 816003, 816004);
INSERT INTO `conditions`
(`condition_entry`, `type`, `value1`, `value2`, `value3`, `value4`, `flags`)
VALUES
(816001, 34, 2, 5, 2, 0, 0),
(816002, 34, 2, 6, 1, 0, 0),
(816003, 1, 52249, 0, 0, 0, 2),
(816004, -1, 816002, 816003, 0, 0, 0);

DELETE FROM `broadcast_text` WHERE `entry` IN (6203701, 6203702, 6203703, 6203704, 6203801, 6203802, 6203803, 6205701, 6205702, 6205703, 6206701, 6206702, 6206703, 6206801, 6206802, 6206803, 6206901, 6206902, 6206903, 6207001, 6207002, 6207003, 6207101, 6207102, 6207103, 6207201, 6207202, 6207203, 6245301);
INSERT INTO `broadcast_text`
(`entry`, `male_text`, `female_text`, `chat_type`, `sound_id`, `language_id`, `emote_id1`, `emote_id2`, `emote_id3`, `emote_delay1`, `emote_delay2`, `emote_delay3`)
VALUES
(6245301, 'The enchanted flame has left! Who dares mess with my power?!', 'The enchanted flame has left! Who dares mess with my power?!', 1, 60526, 0, 0, 0, 0, 0, 0, 0),
(6207201, 'This sanctum is mine... Begone from this place.', 'This sanctum is mine... Begone from this place.', 1, 60498, 0, 0, 0, 0, 0, 0, 0),
(6207203, 'I am... Free, once again.', 'I am... Free, once again.', 1, 60500, 0, 0, 0, 0, 0, 0, 0),
(6207202, 'Bathe in fire, and fury.', 'Bathe in fire, and fury.', 1, 60499, 0, 0, 0, 0, 0, 0, 0),
(6205701, 'Who messes with Mosshide? We gnolls are strongest!', 'Who messes with Mosshide? We gnolls are strongest!', 1, 60527, 0, 0, 0, 0, 0, 0, 0),
(6205703, 'Mosshide is mine! No-no one else...', 'Mosshide is mine! No-no one else...', 1, 60529, 0, 0, 0, 0, 0, 0, 0),
(6205702, 'No one defeats Gowlfang, I am leader!', 'No one defeats Gowlfang, I am leader!', 1, 60528, 0, 0, 0, 0, 0, 0, 0),
(6206901, 'These halls are a sacred place, you can go no further.', 'These halls are a sacred place, you can go no further.', 1, 60495, 0, 0, 0, 0, 0, 0, 0),
(6206903, 'To the great... Beyond.', 'To the great... Beyond.', 1, 60497, 0, 0, 0, 0, 0, 0, 0),
(6206902, 'I shall not falter.', 'I shall not falter.', 1, 60496, 0, 0, 0, 0, 0, 0, 0),
(6203701, 'The Dragonmaw Clan shall live forever!', 'The Dragonmaw Clan shall live forever!', 1, 60504, 0, 0, 0, 0, 0, 0, 0),
(6203703, 'The Dragonmaw will never be destroyed... Another will take my place, whelps!', 'The Dragonmaw will never be destroyed... Another will take my place, whelps!', 1, 60507, 0, 0, 0, 0, 0, 0, 0),
(6203702, 'You are under MY command!', 'You are under MY command!', 1, 60506, 0, 0, 0, 0, 0, 0, 0),
(6203704, 'Your power is mine!', 'Your power is mine!', 1, 60505, 0, 0, 0, 0, 0, 0, 0),
(6206701, 'You won''t interrupt my plans...', 'You won''t interrupt my plans...', 1, 60520, 0, 0, 0, 0, 0, 0, 0),
(6206702, 'The brood will live on, my work will not end here!', 'The brood will live on, my work will not end here!', 1, 60521, 0, 0, 0, 0, 0, 0, 0),
(6206703, 'Pointless...', 'Pointless...', 1, 60522, 0, 0, 0, 0, 0, 0, 0),
(6207101, 'I have been tasked to keep our sacred flame, do not test me!', 'I have been tasked to keep our sacred flame, do not test me!', 1, 60492, 0, 0, 0, 0, 0, 0, 0),
(6207102, 'You have no place here!', 'You have no place here!', 1, 60493, 0, 0, 0, 0, 0, 0, 0),
(6207103, 'My duty... Is failed...', 'My duty... Is failed...', 1, 60494, 0, 0, 0, 0, 0, 0, 0),
(6203801, 'The destiny of our clan is set in stone, you can not change fate.', 'The destiny of our clan is set in stone, you can not change fate.', 0, 60592, 0, 0, 0, 0, 0, 0, 0),
(6203802, 'Behold, the power of the elements!', 'Behold, the power of the elements!', 0, 60593, 0, 0, 0, 0, 0, 0, 0),
(6203803, 'My legacy...', 'My legacy...', 0, 60594, 0, 0, 0, 0, 0, 0, 0),
(6207001, 'More Slaves? How fortunate for you to deliver yourself to me!', 'More Slaves? How fortunate for you to deliver yourself to me!', 1, 60523, 0, 0, 0, 0, 0, 0, 0),
(6207002, 'Get into order, maggots!', 'Get into order, maggots!', 1, 60524, 0, 0, 0, 0, 0, 0, 0),
(6207003, 'Overlord Blackheart begins to laugh maniacally.', 'Overlord Blackheart begins to laugh maniacally.', 2, 60525, 0, 0, 0, 0, 0, 0, 0),
(6206801, 'Unidentified intruder detected.', 'Unidentified intruder detected.', 1, 60501, 0, 0, 0, 0, 0, 0, 0),
(6206802, 'Execute destruction measure 13.', 'Execute destruction measure 13.', 1, 60502, 0, 0, 0, 0, 0, 0, 0),
(6206803, 'Protocal failure...', 'Protocal failure...', 1, 60503, 0, 0, 0, 0, 0, 0, 0);

DELETE FROM `creature_ai_events` WHERE `id` IN (6203701, 6203702, 6203703, 6203704, 6205601, 6205602, 6205603, 6205701, 6205702, 6205703, 6206901, 6206902, 6206903, 6206904, 6206905, 6207201, 6207202, 6207203, 6207204, 6207205, 6207206, 6207207, 6207208, 6245301);
INSERT INTO `creature_ai_events`
(`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`)
VALUES
(6245301, 62453, 0, 6, 0, 100, 0, 0, 0, 0, 0, 6245301, 0, 0, 'Dragonmaw Enchanter - counted; the sixth frees Searistrasz'),
(6207201, 62072, 0, 4, 0, 100, 0, 0, 0, 0, 0, 6207201, 0, 0, 'Searistrasz - aggro line'),
(6207203, 62072, 0, 6, 0, 100, 0, 0, 0, 0, 0, 6207203, 0, 0, 'Searistrasz - death line'),
(6207202, 62072, 0, 2, 0, 100, 0, 50, 0, 0, 0, 6207202, 0, 0, 'Searistrasz - half health line'),
(6207204, 62072, 0, 11, 0, 100, 0, 0, 0, 0, 0, 6207204, 0, 0, 'Searistrasz - Enchanting Flames by the count, at spawn'),
(6207205, 62072, 0, 7, 0, 100, 0, 0, 0, 0, 0, 6207205, 0, 0, 'Searistrasz - Enchanting Flames by the count, at evade'),
(6207206, 62072, 0, 0, 0, 100, 9, 500, 1500, 15000, 18000, 6207206, 0, 0, 'Searistrasz - Wing Flap on a random attacker in melee'),
(6207207, 62072, 0, 0, 0, 100, 9, 2000, 4000, 28000, 36000, 6207207, 0, 0, 'Searistrasz - Flame Breath on its victim'),
(6207208, 62072, 0, 0, 0, 100, 9, 5000, 7000, 18000, 23000, 6207208, 0, 0, 'Searistrasz - Fireball on a random attacker'),
(6205701, 62057, 0, 4, 0, 100, 0, 0, 0, 0, 0, 6205701, 0, 0, 'Gowlfang - aggro line'),
(6205703, 62057, 0, 6, 0, 100, 0, 0, 0, 0, 0, 6205703, 0, 0, 'Gowlfang - death line'),
(6205702, 62057, 0, 2, 0, 100, 8, 50, 0, 0, 0, 6205702, 0, 0, 'Gowlfang - Intimidating Roar at half health'),
(6205601, 62056, 0, 0, 0, 100, 9, 2000, 4000, 18000, 24000, 6205601, 0, 0, 'Bogpaw Truthsay - Lightning Cloud on a random attacker'),
(6205602, 62056, 0, 0, 0, 100, 9, 5000, 7000, 12000, 15000, 6205602, 0, 0, 'Bogpaw Truthsay - Entangling Roots on a random attacker'),
(6205603, 62056, 0, 0, 0, 100, 9, 6000, 8000, 8000, 11000, 6205603, 0, 0, 'Bogpaw Truthsay - Healing Wave on the friend missing most health, under half'),
(6206901, 62069, 0, 4, 0, 100, 0, 0, 0, 0, 0, 6206901, 0, 0, 'Halgan Redbrand - aggro line'),
(6206903, 62069, 0, 6, 0, 100, 0, 0, 0, 0, 0, 6206903, 0, 0, 'Halgan Redbrand - death line'),
(6206902, 62069, 0, 2, 0, 100, 8, 50, 0, 0, 0, 6206902, 0, 0, 'Halgan Redbrand - Psychic Scream at half health'),
(6206904, 62069, 0, 0, 0, 100, 9, 2000, 4000, 14000, 18000, 6206904, 0, 0, 'Halgan Redbrand - Curse of Agony on a random attacker'),
(6206905, 62069, 0, 0, 0, 100, 9, 5000, 7000, 10000, 14000, 6206905, 0, 0, 'Halgan Redbrand - Mind Flay on a random attacker'),
(6203701, 62037, 0, 4, 0, 100, 0, 0, 0, 0, 0, 6203701, 0, 0, 'Zuluhed the Whacked - aggro line'),
(6203703, 62037, 0, 6, 0, 100, 0, 0, 0, 0, 0, 6203703, 0, 0, 'Zuluhed the Whacked - death line'),
(6203702, 62037, 0, 0, 0, 100, 9, 6000, 8000, 14000, 18000, 6203702, 0, 0, 'Zuluhed the Whacked - Soul Domination on a random player'),
(6203704, 62037, 0, 2, 0, 100, 8, 50, 0, 0, 0, 6203704, 0, 0, 'Zuluhed the Whacked - Withering Soul at half health');

DELETE FROM `creature_ai_scripts` WHERE `id` IN (6203701, 6203702, 6203703, 6203704, 6205601, 6205602, 6205603, 6205701, 6205702, 6205703, 6206901, 6206902, 6206903, 6206904, 6206905, 6207201, 6207202, 6207203, 6207204, 6207205, 6207206, 6207207, 6207208, 6245301);
INSERT INTO `creature_ai_scripts`
(`id`, `delay`, `priority`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`)
VALUES
(6245301, 0, 0, 37, 2, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Dragonmaw Enchanter - one more dead (slot 2)'),
(6245301, 0, 1, 0, 1, 0, 0, 0, 2584790, 0, 9, 2, 6245301, 0, 0, 0, 0, 0, 0, 0, 816004, 'Searistrasz - the flame has left (the sixth, while it was on him)'),
(6245301, 0, 2, 14, 52249, 0, 0, 0, 2584790, 0, 9, 2, 0, 0, 0, 0, 0, 0, 0, 0, 816002, 'Searistrasz - Enchanting Flames off (the sixth)'),
(6207201, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 6207201, 0, 0, 0, 0, 0, 0, 0, 0, 'Searistrasz - aggro line'),
(6207203, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 6207203, 0, 0, 0, 0, 0, 0, 0, 0, 'Searistrasz - death line'),
(6207202, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 6207202, 0, 0, 0, 0, 0, 0, 0, 0, 'Searistrasz - half health line'),
(6207204, 0, 0, 15, 52249, 34, 0, 0, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, 816001, 'Searistrasz - Enchanting Flames on while fewer than six are dead'),
(6207204, 0, 1, 14, 52249, 0, 0, 0, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, 816002, 'Searistrasz - Enchanting Flames off once six are'),
(6207205, 0, 0, 15, 52249, 34, 0, 0, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, 816001, 'Searistrasz - Enchanting Flames on while fewer than six are dead'),
(6207205, 0, 1, 14, 52249, 0, 0, 0, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, 816002, 'Searistrasz - Enchanting Flames off once six are'),
(6207206, 0, 0, 15, 12882, 0, 0, 0, 320, 0, 4, 8, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Searistrasz - Wing Flap on a random attacker in melee'),
(6207207, 0, 0, 15, 16396, 0, 0, 0, 0, 0, 1, 8, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Searistrasz - Flame Breath on its victim'),
(6207208, 0, 0, 15, 8401, 0, 0, 0, 257, 0, 4, 8, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Searistrasz - Fireball on a random attacker'),
(6205701, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 6205701, 0, 0, 0, 0, 0, 0, 0, 0, 'Gowlfang - aggro line'),
(6205703, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 6205703, 0, 0, 0, 0, 0, 0, 0, 0, 'Gowlfang - death line'),
(6205702, 0, 0, 15, 8715, 0, 0, 0, 0, 0, 0, 12, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Gowlfang - Intimidating Roar'),
(6205702, 0, 1, 0, 1, 0, 0, 0, 0, 0, 0, 0, 6205702, 0, 0, 0, 0, 0, 0, 0, 0, 'Gowlfang - half health line'),
(6205702, 0, 2, 29, 6, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, -100, 0, 0, 0, 0, 'Gowlfang - threat wiped (DoResetThreat)'),
(6205601, 0, 0, 15, 19513, 0, 0, 0, 257, 0, 4, 8, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Bogpaw Truthsay - Lightning Cloud on a random attacker'),
(6205602, 0, 0, 15, 22415, 0, 0, 0, 257, 0, 4, 8, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Bogpaw Truthsay - Entangling Roots on a random attacker'),
(6205603, 0, 0, 15, 10395, 0, 0, 0, 80, 50, 15, 8, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Bogpaw Truthsay - Healing Wave on the friend missing most health, under half'),
(6206901, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 6206901, 0, 0, 0, 0, 0, 0, 0, 0, 'Halgan Redbrand - aggro line'),
(6206903, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 6206903, 0, 0, 0, 0, 0, 0, 0, 0, 'Halgan Redbrand - death line'),
(6206902, 0, 0, 15, 22884, 0, 0, 0, 0, 0, 1, 8, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Halgan Redbrand - Psychic Scream on its victim'),
(6206902, 0, 1, 0, 1, 0, 0, 0, 0, 0, 0, 0, 6206902, 0, 0, 0, 0, 0, 0, 0, 0, 'Halgan Redbrand - half health line'),
(6206904, 0, 0, 15, 11711, 0, 0, 0, 257, 0, 4, 8, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Halgan Redbrand - Curse of Agony on a random attacker'),
(6206905, 0, 0, 15, 17311, 0, 0, 0, 257, 0, 4, 8, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Halgan Redbrand - Mind Flay on a random attacker'),
(6203701, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 6203701, 0, 0, 0, 0, 0, 0, 0, 0, 'Zuluhed the Whacked - aggro line'),
(6203703, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 6203703, 0, 0, 0, 0, 0, 0, 0, 0, 'Zuluhed the Whacked - death line'),
(6203702, 0, 0, 15, 52042, 0, 0, 0, 259, 0, 4, 8, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Zuluhed the Whacked - Soul Domination on a random player'),
(6203702, 0, 1, 0, 1, 0, 0, 0, 0, 0, 0, 0, 6203702, 0, 0, 0, 0, 0, 0, 0, 0, 'Zuluhed the Whacked - Soul Domination line'),
(6203704, 0, 0, 15, 52044, 0, 0, 0, 0, 0, 0, 12, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Zuluhed the Whacked - Withering Soul'),
(6203704, 0, 1, 0, 1, 0, 0, 0, 0, 0, 0, 0, 6203704, 0, 0, 0, 0, 0, 0, 0, 0, 'Zuluhed the Whacked - Withering Soul line'),
(6203704, 0, 2, 39, 6203704, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0, 0, 0, 0, 0, 0, 0, 'Zuluhed the Whacked - the souls, 6 s on');

DELETE FROM `generic_scripts` WHERE `id` IN (6203704);
INSERT INTO `generic_scripts`
(`id`, `delay`, `priority`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`)
VALUES
(6203704, 6, 0, 15, 52045, 0, 0, 0, 0, 0, 0, 12, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Zuluhed the Whacked - Debilitated Soul, 6 s after Withering Soul'),
(6203704, 6, 1, 15, 52046, 2, 0, 0, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Zuluhed the Whacked - Empowered Soul');

-- The steps that named a script_texts id: now their broadcast text.
UPDATE `creature_ai_scripts` SET `dataint` = 6206701, `datalong` = 1 WHERE `id` = 6206701 AND `command` = 0;
UPDATE `creature_ai_scripts` SET `dataint` = 6206702, `datalong` = 1 WHERE `id` = 6206702 AND `command` = 0;
UPDATE `creature_ai_scripts` SET `dataint` = 6206703, `datalong` = 1 WHERE `id` = 6206703 AND `command` = 0;
UPDATE `creature_ai_scripts` SET `dataint` = 6207101, `datalong` = 1 WHERE `id` = 6207101 AND `command` = 0;
UPDATE `creature_ai_scripts` SET `dataint` = 6207102, `datalong` = 1 WHERE `id` = 6207102 AND `command` = 0;
UPDATE `creature_ai_scripts` SET `dataint` = 6207103, `datalong` = 1 WHERE `id` = 6207103 AND `command` = 0;
UPDATE `creature_ai_scripts` SET `dataint` = 6203801, `datalong` = 0 WHERE `id` = 6203801 AND `command` = 0;
UPDATE `creature_ai_scripts` SET `dataint` = 6203802, `datalong` = 0 WHERE `id` = 6203802 AND `command` = 0;
UPDATE `creature_ai_scripts` SET `dataint` = 6203803, `datalong` = 0 WHERE `id` = 6203803 AND `command` = 0;
UPDATE `creature_ai_scripts` SET `dataint` = 6207001, `datalong` = 1 WHERE `id` = 6207001 AND `command` = 0;
UPDATE `creature_ai_scripts` SET `dataint` = 6207002, `datalong` = 1 WHERE `id` = 6207002 AND `command` = 0;
UPDATE `creature_ai_scripts` SET `dataint` = 6207003, `datalong` = 2 WHERE `id` = 6207003 AND `command` = 0;
UPDATE `creature_ai_scripts` SET `dataint` = 6206801, `datalong` = 1 WHERE `id` = 6206801 AND `command` = 0;
UPDATE `creature_ai_scripts` SET `dataint` = 6206802, `datalong` = 1 WHERE `id` = 6206802 AND `command` = 0;
UPDATE `creature_ai_scripts` SET `dataint` = 6206803, `datalong` = 1 WHERE `id` = 6206803 AND `command` = 0;
