-- Scarlet Citadel (map 45), High General Abbendis, the trash and the chaplain: its C++ as rows -- EPIC10 tier 2.
-- Written by the trt repo's scripts/tier2/a21_scarlet_citadel.py from t1_world; scarlet_citadel_restore.sql puts
-- back what this replaces. R8: a person applies it, into the world database.
--
-- The C++ keeps its script names: mod-scarlet-citadel is the switch (AM1, handoff/manager-091).
-- Loaded, the C++ runs as before -- a script found by name comes first. Unloaded
-- (`module unload mod-scarlet-citadel`, which gives every creature standing a new AI at once),
-- the names find no script and the creatures run these rows (their ai_name).
--
-- Second pass: Darkcaller Rayn and Brother Eric Vesper. Rayn's True Fulfillment goes at a player in sight but
-- his tank (the C++: any player on his threat list, once it had two). Eric's guards are called when a living
-- player is within 12 yd of the hall's middle, asked of every player within 80 yd of him each second -- a game
-- master too; the first tells him, once until he resets (the C++ called a wave per player in range at once).
-- Each guard walks to its post at 5 yd a second by a timed move. His Lightning Wave goes at his victim once
-- hurt (the C++: the first on his threat list that was), his Drain Mana at a player with mana in sight (the
-- C++: the first caster). His mana full kills every player within 150 yd (the C++: on the map). His spawn
-- respawns in two hours; the C++'s week once Ardaeus is dead never came, Ardaeus being unkillable there.
-- Map 45 keeps instance_scarlet_citadel, Daelus, Mariella and Ardaeus (the core).
-- The Chaplain starts the talk for a player within 35 yd of him (the C++: within 10 yd of the doorway, 34 yd
-- off), and picks the conversation every time (the C++: once per server start). The Inquisitor counters his
-- own victim's casts; the Valiant charges a player with mana and cleaves his victim, the Footman disarms his
-- victim (the C++ aimed Cleave and Disarm at themselves, which could not take); the Interrogator's Eviscerate
-- keeps its own 12.5 s timer (the C++ counted five Sinister Strikes). Abbendis's week-long respawn is her
-- spawn's own now (the C++ set it as she died).

UPDATE `creature_template` SET `ai_name` = 'EventAI' WHERE `entry` = 2000003;
UPDATE `creature_template` SET `ai_name` = 'EventAI' WHERE `entry` = 2000004;
UPDATE `creature_template` SET `ai_name` = 'EventAI' WHERE `entry` = 2000005;
UPDATE `creature_template` SET `ai_name` = 'EventAI' WHERE `entry` = 2000014;
UPDATE `creature_template` SET `ai_name` = 'EventAI' WHERE `entry` = 2000015;
UPDATE `creature_template` SET `ai_name` = 'EventAI' WHERE `entry` = 2000033;
UPDATE `creature_template` SET `ai_name` = 'EventAI' WHERE `entry` = 2000034;
UPDATE `creature_template` SET `ai_name` = 'EventAI' WHERE `entry` = 2000035;
UPDATE `creature_template` SET `ai_name` = 'EventAI' WHERE `entry` = 2000036;
UPDATE `creature_template` SET `ai_name` = 'EventAI' WHERE `entry` = 2000037;

DELETE FROM `conditions` WHERE `condition_entry` IN (450000, 450010, 450011, 450013, 450014, 450015);
INSERT INTO `conditions`
(`condition_entry`, `type`, `value1`, `value2`, `value3`, `value4`, `flags`)
VALUES
(450000, 56, 0, 35, 0, 0, 2),
(450010, 1, 15473, 0, 0, 0, 3),
(450013, 54, 129, -10, 16, 12, 0),
(450011, -1, 116, 450013, 0, 0, 0),
(450014, 1, 25685, 0, 0, 0, 3),
(450015, -1, 450014, 230003, 0, 0, 0);

-- Conditions another tier-2 migration writes too, under the same entry: whichever comes first.
INSERT IGNORE INTO `conditions`
(`condition_entry`, `type`, `value1`, `value2`, `value3`, `value4`, `flags`)
VALUES
(230003, 41, 99, 2, 0, 0, 0);

DELETE FROM `broadcast_text` WHERE `entry` IN (450101, 450102, 450103, 450104, 450105, 450106, 450107, 450108, 450109, 450110, 450111, 450112, 450113, 450114, 450115, 450116, 450117, 450118, 450119, 450120);
INSERT INTO `broadcast_text`
(`entry`, `male_text`, `female_text`, `chat_type`, `sound_id`, `language_id`, `emote_id1`, `emote_id2`, `emote_id3`, `emote_delay1`, `emote_delay2`, `emote_delay3`)
VALUES
(450101, 'Lady Abbendis has been meditating for the past few days to communicate with the Light.', 'Lady Abbendis has been meditating for the past few days to communicate with the Light.', 0, 0, 0, 0, 0, 0, 0, 0, 0),
(450102, 'Do you believe the Light will finally answer?', 'Do you believe the Light will finally answer?', 0, 0, 0, 0, 0, 0, 0, 0, 0),
(450103, 'Is that doubt I hear sister? Mumble around the wrong people and you will be hanged.', 'Is that doubt I hear sister? Mumble around the wrong people and you will be hanged.', 0, 0, 0, 0, 0, 0, 0, 0, 0),
(450104, 'Of course not. I simply miss the might of the Ashbringer.', 'Of course not. I simply miss the might of the Ashbringer.', 0, 0, 0, 0, 0, 0, 0, 0, 0),
(450105, 'The Ashbringer is lost to the corruption of the Scourge, as believers we will have to make due.', 'The Ashbringer is lost to the corruption of the Scourge, as believers we will have to make due.', 0, 0, 0, 0, 0, 0, 0, 0, 0),
(450106, 'You speak truthfully. I wonder what would happen if it''d ever cross our paths.', 'You speak truthfully. I wonder what would happen if it''d ever cross our paths.', 0, 0, 0, 0, 0, 0, 0, 0, 0),
(450107, 'The Light''s Justice will be met.', 'The Light''s Justice will be met.', 0, 0, 0, 0, 0, 0, 0, 0, 0),
(450108, 'The new recruits will help us in our campaign to Northrend.', 'The new recruits will help us in our campaign to Northrend.', 0, 0, 0, 0, 0, 0, 0, 0, 0),
(450109, 'Are we certain that attacking their very heart is the best decision?', 'Are we certain that attacking their very heart is the best decision?', 0, 0, 0, 0, 0, 0, 0, 0, 0),
(450110, 'The Dread Citadel has fallen, without the Cult of the Damned the Scourge is nothing but fodder.', 'The Dread Citadel has fallen, without the Cult of the Damned the Scourge is nothing but fodder.', 0, 0, 0, 0, 0, 0, 0, 0, 0),
(450111, 'If only Lady Whitemane was here to witness this moment.', 'If only Lady Whitemane was here to witness this moment.', 0, 0, 0, 0, 0, 0, 0, 0, 0),
(450112, 'She was blinded by her own personal agenda.', 'She was blinded by her own personal agenda.', 0, 0, 0, 0, 0, 0, 0, 0, 0),
(450113, 'I wish you wouldn''t speak like that.', 'I wish you wouldn''t speak like that.', 0, 0, 0, 0, 0, 0, 0, 0, 0),
(450114, 'It is nothing but the truth.', 'It is nothing but the truth.', 0, 0, 0, 0, 0, 0, 0, 0, 0),
(450115, 'The enemy has gone past the Sacred Fist, avenge our fallen brother!', 'The enemy has gone past the Sacred Fist, avenge our fallen brother!', 1, 0, 0, 0, 0, 0, 0, 0, 0),
(450116, 'All your efforts are in vain.', 'All your efforts are in vain.', 0, 0, 0, 0, 0, 0, 0, 0, 0),
(450117, 'It’s too late to turn back now!', 'It’s too late to turn back now!', 0, 0, 0, 0, 0, 0, 0, 0, 0),
(450118, 'Vile Scourge.', 'Vile Scourge.', 0, 0, 0, 0, 0, 0, 0, 0, 0),
(450119, 'Even the afterlife abandons mongrels like you!', 'Even the afterlife abandons mongrels like you!', 0, 0, 0, 0, 0, 0, 0, 0, 0),
(450120, 'If only I- I could <cough> .. glance upon an evening’s star <cough> one last time.', 'If only I- I could <cough> .. glance upon an evening’s star <cough> one last time.', 0, 0, 0, 0, 0, 0, 0, 0, 0);

DELETE FROM `creature_ai_events` WHERE `id` IN (4510001, 4510002, 4510003, 4510101, 4510102, 4510103, 4510104, 4510201, 4510202, 4510203, 4510204, 4510301, 4510302, 4510401, 4510402, 4510501, 4510502, 4510601, 4510602, 4510603, 4510604, 4510605, 4510606, 4510607, 4510608, 4510701, 4510801, 4510802, 4510811, 4510812, 4510813, 4510814, 4510901, 4510902, 4510903, 4510904, 4510905, 4510911, 4510912, 4510913, 4510914, 4510915, 4510916);
INSERT INTO `creature_ai_events`
(`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`)
VALUES
(4510001, 2000003, 0, 4, 0, 100, 0, 0, 0, 0, 0, 4510001, 0, 0, 'High General Abbendis - aggro: in progress (3), the zone into the fight'),
(4510002, 2000003, 0, 21, 0, 100, 0, 0, 0, 0, 0, 4510002, 0, 0, 'High General Abbendis - home: failed (3)'),
(4510003, 2000003, 0, 6, 0, 100, 0, 0, 0, 0, 0, 4510003, 0, 0, 'High General Abbendis - dead: done (3)'),
(4510101, 2000014, 0, 13, 0, 100, 9, 5000, 8000, 0, 0, 4510101, 0, 0, 'Citadel Inquisitor - Counterspell, his victim casting'),
(4510102, 2000014, 0, 0, 0, 100, 9, 1000, 1000, 1000, 1000, 4510102, 0, 0, 'Citadel Inquisitor - Holy Nova while a friend within 12 yd is under 90 %'),
(4510103, 2000014, 0, 2, 0, 100, 8, 9, 0, 0, 0, 4510103, 0, 0, 'Citadel Inquisitor - Divine Shield under 10 %'),
(4510104, 2000014, 0, 0, 0, 100, 9, 5000, 5000, 5000, 5000, 4510104, 0, 0, 'Citadel Inquisitor - Greater Heal on a friend under 40 %'),
(4510201, 2000033, 0, 13, 0, 100, 9, 5000, 8000, 0, 0, 4510201, 0, 0, 'Citadel Inquisitor - Counterspell, his victim casting'),
(4510202, 2000033, 0, 0, 0, 100, 9, 1000, 1000, 1000, 1000, 4510202, 0, 0, 'Citadel Inquisitor - Holy Nova while a friend within 12 yd is under 90 %'),
(4510203, 2000033, 0, 2, 0, 100, 8, 9, 0, 0, 0, 4510203, 0, 0, 'Citadel Inquisitor - Divine Shield under 10 %'),
(4510204, 2000033, 0, 0, 0, 100, 9, 5000, 5000, 5000, 5000, 4510204, 0, 0, 'Citadel Inquisitor - Greater Heal on a friend under 40 %'),
(4510301, 2000015, 0, 0, 0, 100, 9, 10000, 10000, 10000, 10000, 4510301, 0, 0, 'Citadel Valiant - Charge at a player with mana'),
(4510302, 2000015, 0, 0, 0, 100, 9, 5000, 5000, 5000, 5000, 4510302, 0, 0, 'Citadel Valiant - Cleave'),
(4510401, 2000034, 0, 0, 0, 100, 9, 10000, 10000, 10000, 10000, 4510401, 0, 0, 'Citadel Valiant - Charge at a player with mana'),
(4510402, 2000034, 0, 0, 0, 100, 9, 5000, 5000, 5000, 5000, 4510402, 0, 0, 'Citadel Valiant - Cleave'),
(4510501, 2000035, 0, 0, 0, 100, 9, 1000, 1000, 7000, 7000, 4510501, 0, 0, 'Citadel Footman - Disarm, Hamstring, his victim''s threat dropped'),
(4510502, 2000035, 0, 0, 0, 100, 9, 15000, 15000, 120000, 120000, 4510502, 0, 0, 'Citadel Footman - Frenzy'),
(4510601, 2000036, 0, 11, 0, 100, 0, 0, 0, 0, 0, 4510601, 0, 0, 'Citadel Interrogator - spawned: stealth'),
(4510602, 2000036, 0, 7, 0, 100, 0, 0, 0, 0, 0, 4510602, 0, 0, 'Citadel Interrogator - evading: stealth again'),
(4510603, 2000036, 0, 2, 0, 100, 8, 24, 0, 0, 0, 4510603, 0, 0, 'Citadel Interrogator - Frenzy under 25 %'),
(4510604, 2000036, 0, 2, 0, 100, 8, 49, 0, 0, 0, 4510604, 0, 0, 'Citadel Interrogator - Evasion under half health'),
(4510605, 2000036, 0, 0, 0, 100, 9, 2000, 3000, 2000, 3000, 4510605, 0, 0, 'Citadel Interrogator - Sinister Strike'),
(4510606, 2000036, 0, 0, 0, 100, 9, 12500, 12500, 12500, 12500, 4510606, 0, 0, 'Citadel Interrogator - Eviscerate, about every fifth strike'),
(4510607, 2000036, 0, 0, 0, 100, 9, 8000, 8000, 8000, 10000, 4510607, 0, 0, 'Citadel Interrogator - Gouge, his victim''s threat dropped'),
(4510608, 2000036, 0, 0, 0, 100, 9, 12000, 12000, 12000, 15000, 4510608, 0, 0, 'Citadel Interrogator - Blind, his victim''s threat dropped'),
(4510701, 2000005, 450000, 1, 0, 100, 0, 1000, 1000, 0, 0, 4510701, 0, 0, 'Scarlet Chaplain - a player near: the talk with the Sister, once'),
(4510801, 2000037, 0, 27, 0, 100, 1, 15473, 1, 500, 500, 4510801, 0, 0, 'Darkcaller Rayn - Shadowform kept, in a fight or out'),
(4510802, 2000037, 450010, 1, 0, 100, 1, 500, 500, 500, 500, 4510802, 0, 0, 'Darkcaller Rayn - Shadowform kept out of a fight'),
(4510811, 2000037, 0, 0, 0, 100, 9, 15000, 15000, 15000, 25000, 4510811, 0, 0, 'Darkcaller Rayn - True Fulfillment at a player in sight, not his tank'),
(4510812, 2000037, 0, 0, 0, 100, 9, 5000, 5000, 6000, 8000, 4510812, 0, 0, 'Darkcaller Rayn - Shadow Bolt Volley'),
(4510813, 2000037, 0, 0, 0, 100, 9, 8000, 8000, 18000, 22000, 4510813, 0, 0, 'Darkcaller Rayn - Mind Flay at his victim'),
(4510814, 2000037, 0, 0, 0, 100, 9, 6000, 6000, 5500, 5500, 4510814, 0, 0, 'Darkcaller Rayn - Impending Doom at a player with mana'),
(4510901, 2000004, 0, 1, 0, 100, 1, 1000, 1000, 1000, 1000, 4510901, 0, 0, 'Brother Eric Vesper - every second: each player near asked whether he stands there'),
(4510902, 2000004, 0, 31, 0, 100, 0, 1, 0, 0, 0, 4510902, 0, 0, 'Brother Eric Vesper - told: his guards called, once until he resets'),
(4510903, 2000004, 0, 4, 0, 100, 0, 0, 0, 0, 0, 4510903, 0, 0, 'Brother Eric Vesper - aggro: the zone, his mana emptied'),
(4510911, 2000004, 450014, 0, 0, 100, 9, 5000, 5000, 15000, 15000, 4510911, 0, 0, 'Brother Eric Vesper - Lightning Cloud at the nearest player within 15 yd'),
(4510912, 2000004, 450015, 0, 0, 100, 9, 1000, 1000, 4000, 5000, 4510912, 0, 0, 'Brother Eric Vesper - Lightning Wave at his victim, hurt'),
(4510913, 2000004, 450014, 0, 0, 100, 9, 5000, 5000, 5000, 5000, 4510913, 0, 0, 'Brother Eric Vesper - Drain Mana at a player with mana in sight'),
(4510914, 2000004, 0, 0, 0, 100, 9, 300000, 300000, 1000, 1000, 4510914, 0, 0, 'Brother Eric Vesper - from 5 min on: Energize whenever it is gone'),
(4510915, 2000004, 450014, 0, 0, 100, 1, 30000, 30000, 30000, 30000, 4510915, 0, 0, 'Brother Eric Vesper - one of his four taunts every 30 s'),
(4510916, 2000004, 0, 3, 0, 100, 1, 100, 100, 1000, 1000, 4510916, 0, 0, 'Brother Eric Vesper - his mana full: every player in the room killed, home'),
(4510904, 2000004, 0, 21, 0, 100, 1, 0, 0, 0, 0, 4510904, 0, 0, 'Brother Eric Vesper - home: his guards gone, Energize off'),
(4510905, 2000004, 0, 6, 0, 100, 0, 0, 0, 0, 0, 4510905, 0, 0, 'Brother Eric Vesper - dead: his guards gone, his last words');

DELETE FROM `creature_ai_scripts` WHERE `id` IN (4510001, 4510002, 4510003, 4510101, 4510102, 4510103, 4510104, 4510201, 4510202, 4510203, 4510204, 4510301, 4510302, 4510401, 4510402, 4510501, 4510502, 4510601, 4510602, 4510603, 4510604, 4510605, 4510606, 4510607, 4510608, 4510701, 4510801, 4510802, 4510811, 4510812, 4510813, 4510814, 4510901, 4510902, 4510903, 4510904, 4510905, 4510911, 4510912, 4510913, 4510914, 4510915, 4510916);
INSERT INTO `creature_ai_scripts`
(`id`, `delay`, `priority`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`)
VALUES
(4510001, 0, 0, 37, 3, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'High General Abbendis - in progress'),
(4510001, 0, 1, 49, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'High General Abbendis - the zone into the fight'),
(4510002, 0, 0, 37, 3, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'High General Abbendis - failed'),
(4510003, 0, 0, 37, 3, 3, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'High General Abbendis - done'),
(4510101, 0, 0, 15, 20537, 0, 0, 0, 0, 0, 1, 8, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Citadel Inquisitor - Counterspell'),
(4510102, 0, 0, 15, 23858, 0, 0, 0, 12, 90, 15, 12, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Citadel Inquisitor - Holy Nova'),
(4510103, 0, 0, 15, 1020, 0, 0, 0, 0, 0, 0, 12, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Citadel Inquisitor - Divine Shield'),
(4510104, 0, 0, 15, 24208, 0, 0, 0, 40, 40, 15, 8, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Citadel Inquisitor - Greater Heal'),
(4510201, 0, 0, 15, 20537, 0, 0, 0, 0, 0, 1, 8, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Citadel Inquisitor - Counterspell'),
(4510202, 0, 0, 15, 23858, 0, 0, 0, 12, 90, 15, 12, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Citadel Inquisitor - Holy Nova'),
(4510203, 0, 0, 15, 1020, 0, 0, 0, 0, 0, 0, 12, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Citadel Inquisitor - Divine Shield'),
(4510204, 0, 0, 15, 24208, 0, 0, 0, 40, 40, 15, 8, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Citadel Inquisitor - Greater Heal'),
(4510301, 0, 0, 15, 26561, 0, 0, 0, 6, 0, 4, 8, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Citadel Valiant - Charge'),
(4510302, 0, 0, 15, 26350, 0, 0, 0, 0, 0, 1, 8, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Citadel Valiant - Cleave'),
(4510401, 0, 0, 15, 26561, 0, 0, 0, 6, 0, 4, 8, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Citadel Valiant - Charge'),
(4510402, 0, 0, 15, 26350, 0, 0, 0, 0, 0, 1, 8, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Citadel Valiant - Cleave'),
(4510501, 0, 0, 15, 6713, 0, 0, 0, 0, 0, 1, 8, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Citadel Footman - Disarm'),
(4510501, 0, 1, 15, 26141, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Citadel Footman - Hamstring'),
(4510501, 0, 2, 29, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, -100, 0, 0, 0, 0, 'Citadel Footman - his victim''s threat dropped'),
(4510502, 0, 0, 15, 8269, 0, 0, 0, 0, 0, 0, 12, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Citadel Footman - Frenzy'),
(4510601, 0, 0, 74, 1787, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Citadel Interrogator - stealth'),
(4510602, 0, 0, 74, 1787, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Citadel Interrogator - stealth'),
(4510603, 0, 0, 15, 8269, 0, 0, 0, 0, 0, 0, 12, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Citadel Interrogator - Frenzy'),
(4510604, 0, 0, 15, 5277, 0, 0, 0, 0, 0, 0, 12, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Citadel Interrogator - Evasion'),
(4510605, 0, 0, 15, 11294, 0, 0, 0, 0, 0, 1, 8, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Citadel Interrogator - Sinister Strike'),
(4510606, 0, 0, 15, 11300, 0, 0, 0, 0, 0, 1, 8, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Citadel Interrogator - Eviscerate'),
(4510607, 0, 0, 15, 11286, 0, 0, 0, 0, 0, 1, 8, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Citadel Interrogator - Gouge'),
(4510607, 0, 1, 29, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, -100, 0, 0, 0, 0, 'Citadel Interrogator - his victim''s threat dropped'),
(4510608, 0, 0, 15, 2094, 0, 0, 0, 0, 0, 1, 8, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Citadel Interrogator - Blind'),
(4510608, 0, 1, 29, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, -100, 0, 0, 0, 0, 'Citadel Interrogator - his victim''s threat dropped'),
(4510701, 0, 0, 39, 450001, 450002, 0, 0, 0, 0, 0, 0, 50, 50, 0, 0, 0, 0, 0, 0, 0, 'Scarlet Chaplain - one of the two talks'),
(4510801, 0, 0, 74, 15473, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Darkcaller Rayn - Shadowform kept'),
(4510802, 0, 0, 74, 15473, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Darkcaller Rayn - Shadowform kept'),
(4510811, 0, 0, 15, 785, 0, 0, 0, 3, 0, 5, 8, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Darkcaller Rayn - True Fulfillment at a player in sight, not his tank'),
(4510812, 0, 0, 15, 21341, 0, 0, 0, 0, 0, 0, 12, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Darkcaller Rayn - Shadow Bolt Volley'),
(4510813, 0, 0, 15, 26143, 0, 0, 0, 0, 0, 1, 8, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Darkcaller Rayn - Mind Flay at his victim'),
(4510814, 0, 0, 15, 19702, 0, 0, 0, 6, 0, 4, 8, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Darkcaller Rayn - Impending Doom at a player with mana'),
(4510901, 0, 0, 68, 450021, 3, 0, 80, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Brother Eric Vesper - the players within 80 yd'),
(4510902, 0, 0, 10, 2000033, 0, 0, 0, 0, 0, 0, 0, 0, 450003, -1, 8, 147.0, -60.0, 17.0, 0, 0, 'Brother Eric Vesper - a Citadel Inquisitor for post 1'),
(4510902, 0, 1, 10, 2000034, 0, 0, 0, 0, 0, 0, 0, 0, 450004, -1, 8, 147.0, -60.0, 17.0, 0, 0, 'Brother Eric Vesper - a Citadel Valiant for post 2'),
(4510902, 0, 2, 10, 2000035, 0, 0, 0, 0, 0, 0, 0, 0, 450005, -1, 8, 147.0, -60.0, 17.0, 0, 0, 'Brother Eric Vesper - a Citadel Footman for post 3'),
(4510902, 0, 3, 10, 2000033, 0, 0, 0, 0, 0, 0, 0, 0, 450006, -1, 8, 147.0, -60.0, 17.0, 0, 0, 'Brother Eric Vesper - a Citadel Inquisitor for post 4'),
(4510902, 0, 4, 10, 2000034, 0, 0, 0, 0, 0, 0, 0, 0, 450007, -1, 8, 147.0, -60.0, 17.0, 0, 0, 'Brother Eric Vesper - a Citadel Valiant for post 5'),
(4510902, 0, 5, 10, 2000035, 0, 0, 0, 0, 0, 0, 0, 0, 450008, -1, 8, 147.0, -60.0, 17.0, 0, 0, 'Brother Eric Vesper - a Citadel Footman for post 6'),
(4510902, 0, 6, 10, 2000033, 0, 0, 0, 0, 0, 0, 0, 0, 450009, -1, 8, 147.0, -60.0, 17.0, 0, 0, 'Brother Eric Vesper - a Citadel Inquisitor for post 7'),
(4510902, 0, 7, 10, 2000034, 0, 0, 0, 0, 0, 0, 0, 0, 450010, -1, 8, 147.0, -60.0, 17.0, 0, 0, 'Brother Eric Vesper - a Citadel Valiant for post 8'),
(4510902, 0, 8, 10, 2000035, 0, 0, 0, 0, 0, 0, 0, 0, 450011, -1, 8, 147.0, -60.0, 17.0, 0, 0, 'Brother Eric Vesper - a Citadel Footman for post 9'),
(4510902, 0, 9, 10, 2000033, 0, 0, 0, 0, 0, 0, 0, 0, 450012, -1, 8, 147.0, -60.0, 17.0, 0, 0, 'Brother Eric Vesper - a Citadel Inquisitor for post 10'),
(4510902, 0, 10, 10, 2000034, 0, 0, 0, 0, 0, 0, 0, 0, 450013, -1, 8, 147.0, -60.0, 17.0, 0, 0, 'Brother Eric Vesper - a Citadel Valiant for post 11'),
(4510902, 0, 11, 10, 2000035, 0, 0, 0, 0, 0, 0, 0, 0, 450014, -1, 8, 147.0, -60.0, 17.0, 0, 0, 'Brother Eric Vesper - a Citadel Footman for post 12'),
(4510902, 0, 12, 10, 2000033, 0, 0, 0, 0, 0, 0, 0, 0, 450015, -1, 8, 147.0, -60.0, 17.0, 0, 0, 'Brother Eric Vesper - a Citadel Inquisitor for post 13'),
(4510902, 0, 13, 10, 2000034, 0, 0, 0, 0, 0, 0, 0, 0, 450016, -1, 8, 147.0, -60.0, 17.0, 0, 0, 'Brother Eric Vesper - a Citadel Valiant for post 14'),
(4510902, 0, 14, 10, 2000035, 0, 0, 0, 0, 0, 0, 0, 0, 450017, -1, 8, 147.0, -60.0, 17.0, 0, 0, 'Brother Eric Vesper - a Citadel Footman for post 15'),
(4510902, 0, 15, 10, 2000033, 0, 0, 0, 0, 0, 0, 0, 0, 450018, -1, 8, 147.0, -60.0, 17.0, 0, 0, 'Brother Eric Vesper - a Citadel Inquisitor for post 16'),
(4510902, 0, 16, 10, 2000034, 0, 0, 0, 0, 0, 0, 0, 0, 450019, -1, 8, 147.0, -60.0, 17.0, 0, 0, 'Brother Eric Vesper - a Citadel Valiant for post 17'),
(4510902, 0, 17, 10, 2000035, 0, 0, 0, 0, 0, 0, 0, 0, 450020, -1, 8, 147.0, -60.0, 17.0, 0, 0, 'Brother Eric Vesper - a Citadel Footman for post 18'),
(4510902, 0, 18, 22, 67, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Brother Eric Vesper - hostile'),
(4510902, 0, 19, 0, 1, 0, 0, 0, 0, 0, 0, 0, 450115, 0, 0, 0, 0, 0, 0, 0, 0, 'Brother Eric Vesper - "The enemy has gone past the Sacred Fist, avenge our fallen brother!"'),
(4510902, 0, 20, 1, 5, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Brother Eric Vesper - exclamation'),
(4510903, 0, 0, 49, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Brother Eric Vesper - the zone into the fight'),
(4510903, 0, 1, 2, 23, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Brother Eric Vesper - mana emptied'),
(4510911, 0, 0, 15, 25033, 0, 0, 0, 15, 0, 24, 8, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Brother Eric Vesper - Lightning Cloud at the nearest player within 15 yd'),
(4510912, 0, 0, 15, 24819, 0, 0, 0, 0, 0, 1, 8, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Brother Eric Vesper - Lightning Wave at his victim, hurt'),
(4510913, 0, 0, 15, 25676, 0, 0, 0, 5, 0, 4, 8, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Brother Eric Vesper - Drain Mana at a player with mana in sight'),
(4510914, 0, 0, 15, 25685, 32, 0, 0, 0, 0, 0, 12, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Brother Eric Vesper - Energize'),
(4510915, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 450116, 450117, 450118, 450119, 0, 0, 0, 0, 0, 'Brother Eric Vesper - a taunt'),
(4510916, 0, 0, 68, 450022, 3, 0, 150, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Brother Eric Vesper - the players within 150 yd'),
(4510916, 0, 1, 33, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Brother Eric Vesper - home'),
(4510904, 0, 0, 68, 450023, 2, 2000033, 150, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Brother Eric Vesper - his guards gone (2000033)'),
(4510904, 0, 1, 68, 450023, 2, 2000034, 150, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Brother Eric Vesper - his guards gone (2000034)'),
(4510904, 0, 2, 68, 450023, 2, 2000035, 150, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Brother Eric Vesper - his guards gone (2000035)'),
(4510904, 0, 3, 14, 25685, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Brother Eric Vesper - Energize off'),
(4510905, 0, 0, 68, 450023, 2, 2000033, 150, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Brother Eric Vesper - his guards gone (2000033)'),
(4510905, 0, 1, 68, 450023, 2, 2000034, 150, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Brother Eric Vesper - his guards gone (2000034)'),
(4510905, 0, 2, 68, 450023, 2, 2000035, 150, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Brother Eric Vesper - his guards gone (2000035)'),
(4510905, 0, 3, 0, 0, 0, 0, 0, 0, 0, 0, 0, 450120, 0, 0, 0, 0, 0, 0, 0, 0, 'Brother Eric Vesper - his last words');

DELETE FROM `generic_scripts` WHERE `id` IN (450001, 450002, 450003, 450004, 450005, 450006, 450007, 450008, 450009, 450010, 450011, 450012, 450013, 450014, 450015, 450016, 450017, 450018, 450019, 450020, 450021, 450022, 450023);
INSERT INTO `generic_scripts`
(`id`, `delay`, `priority`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`)
VALUES
(450001, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 450101, 0, 0, 0, 0, 0, 0, 0, 0, 'Scarlet Chaplain - "Lady Abbendis has been meditating for th..."'),
(450001, 10, 1, 0, 0, 0, 0, 0, 1300023, 0, 9, 2, 450102, 0, 0, 0, 0, 0, 0, 0, 0, 'Scarlet Sister - "Do you believe the Light will finally an..."'),
(450001, 18, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 450103, 0, 0, 0, 0, 0, 0, 0, 0, 'Scarlet Chaplain - "Is that doubt I hear sister? Mumble arou..."'),
(450001, 26, 3, 0, 0, 0, 0, 0, 1300023, 0, 9, 2, 450104, 0, 0, 0, 0, 0, 0, 0, 0, 'Scarlet Sister - "Of course not. I simply miss the might o..."'),
(450001, 34, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 450105, 0, 0, 0, 0, 0, 0, 0, 0, 'Scarlet Chaplain - "The Ashbringer is lost to the corruption..."'),
(450001, 42, 5, 0, 0, 0, 0, 0, 1300023, 0, 9, 2, 450106, 0, 0, 0, 0, 0, 0, 0, 0, 'Scarlet Sister - "You speak truthfully. I wonder what woul..."'),
(450001, 50, 6, 0, 0, 0, 0, 0, 0, 0, 0, 0, 450107, 0, 0, 0, 0, 0, 0, 0, 0, 'Scarlet Chaplain - "The Light''s Justice will be met...."'),
(450002, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 450108, 0, 0, 0, 0, 0, 0, 0, 0, 'Scarlet Chaplain - "The new recruits will help us in our cam..."'),
(450002, 10, 1, 0, 0, 0, 0, 0, 1300023, 0, 9, 2, 450109, 0, 0, 0, 0, 0, 0, 0, 0, 'Scarlet Sister - "Are we certain that attacking their very..."'),
(450002, 18, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 450110, 0, 0, 0, 0, 0, 0, 0, 0, 'Scarlet Chaplain - "The Dread Citadel has fallen, without th..."'),
(450002, 26, 3, 0, 0, 0, 0, 0, 1300023, 0, 9, 2, 450111, 0, 0, 0, 0, 0, 0, 0, 0, 'Scarlet Sister - "If only Lady Whitemane was here to witne..."'),
(450002, 34, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 450112, 0, 0, 0, 0, 0, 0, 0, 0, 'Scarlet Chaplain - "She was blinded by her own personal agen..."'),
(450002, 42, 5, 0, 0, 0, 0, 0, 1300023, 0, 9, 2, 450113, 0, 0, 0, 0, 0, 0, 0, 0, 'Scarlet Sister - "I wish you wouldn''t speak like that...."'),
(450002, 50, 6, 0, 0, 0, 0, 0, 0, 0, 0, 0, 450114, 0, 0, 0, 0, 0, 0, 0, 0, 'Scarlet Chaplain - "It is nothing but the truth...."'),
(450003, 0, 0, 3, 0, 4279, 0, 2, 0, 0, 0, 0, 0, 0, 0, 0, 128.883, -48.6615, 15.99, 1.55, 0, 'Brother Eric Vesper''s guard - to its post 1'),
(450003, 0, 1, 34, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 128.883, -48.6615, 15.99, 1.55, 0, 'Brother Eric Vesper''s guard - home at its post 1'),
(450003, 0, 2, 2, 148, 375, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Brother Eric Vesper''s guard - ready, two-handed'),
(450004, 0, 0, 3, 0, 3627, 0, 2, 0, 0, 0, 0, 0, 0, 0, 0, 132.825, -48.7298, 15.99, 1.55, 0, 'Brother Eric Vesper''s guard - to its post 2'),
(450004, 0, 1, 34, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 132.825, -48.7298, 15.99, 1.55, 0, 'Brother Eric Vesper''s guard - home at its post 2'),
(450004, 0, 2, 2, 148, 375, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Brother Eric Vesper''s guard - ready, two-handed'),
(450005, 0, 0, 3, 0, 4949, 0, 2, 0, 0, 0, 0, 0, 0, 0, 0, 125.016, -48.6871, 15.99, 1.55, 0, 'Brother Eric Vesper''s guard - to its post 3'),
(450005, 0, 1, 34, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 125.016, -48.6871, 15.99, 1.55, 0, 'Brother Eric Vesper''s guard - home at its post 3'),
(450005, 0, 2, 2, 148, 375, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Brother Eric Vesper''s guard - ready, two-handed'),
(450006, 0, 0, 3, 0, 6368, 0, 2, 0, 0, 0, 0, 0, 0, 0, 0, 125.081, -36.9308, 15.99, 1.55, 0, 'Brother Eric Vesper''s guard - to its post 4'),
(450006, 0, 1, 34, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 125.081, -36.9308, 15.99, 1.55, 0, 'Brother Eric Vesper''s guard - home at its post 4'),
(450006, 0, 2, 2, 148, 375, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Brother Eric Vesper''s guard - ready, two-handed'),
(450007, 0, 0, 3, 0, 5871, 0, 2, 0, 0, 0, 0, 0, 0, 0, 0, 128.847, -36.9513, 15.99, 1.55, 0, 'Brother Eric Vesper''s guard - to its post 5'),
(450007, 0, 1, 34, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 128.847, -36.9513, 15.99, 1.55, 0, 'Brother Eric Vesper''s guard - home at its post 5'),
(450007, 0, 2, 2, 148, 375, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Brother Eric Vesper''s guard - ready, two-handed'),
(450008, 0, 0, 3, 0, 5442, 0, 2, 0, 0, 0, 0, 0, 0, 0, 0, 132.736, -36.8489, 15.99, 1.55, 0, 'Brother Eric Vesper''s guard - to its post 6'),
(450008, 0, 1, 34, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 132.736, -36.8489, 15.99, 1.55, 0, 'Brother Eric Vesper''s guard - home at its post 6'),
(450008, 0, 2, 2, 148, 375, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Brother Eric Vesper''s guard - ready, two-handed'),
(450009, 0, 0, 3, 0, 7501, 0, 2, 0, 0, 0, 0, 0, 0, 0, 0, 132.777, -25.3095, 15.99, 1.55, 0, 'Brother Eric Vesper''s guard - to its post 7'),
(450009, 0, 1, 34, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 132.777, -25.3095, 15.99, 1.55, 0, 'Brother Eric Vesper''s guard - home at its post 7'),
(450009, 0, 2, 2, 148, 375, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Brother Eric Vesper''s guard - ready, two-handed'),
(450010, 0, 0, 3, 0, 7827, 0, 2, 0, 0, 0, 0, 0, 0, 0, 0, 128.892, -25.3187, 15.99, 1.55, 0, 'Brother Eric Vesper''s guard - to its post 8'),
(450010, 0, 1, 34, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 128.892, -25.3187, 15.99, 1.55, 0, 'Brother Eric Vesper''s guard - home at its post 8'),
(450010, 0, 2, 2, 148, 375, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Brother Eric Vesper''s guard - ready, two-handed'),
(450011, 0, 0, 3, 0, 8208, 0, 2, 0, 0, 0, 0, 0, 0, 0, 0, 125.063, -25.3278, 15.99, 1.55, 0, 'Brother Eric Vesper''s guard - to its post 9'),
(450011, 0, 1, 34, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 125.063, -25.3278, 15.99, 1.55, 0, 'Brother Eric Vesper''s guard - home at its post 9'),
(450011, 0, 2, 2, 148, 375, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Brother Eric Vesper''s guard - ready, two-handed'),
(450012, 0, 0, 3, 0, 10255, 0, 2, 0, 0, 0, 0, 0, 0, 0, 0, 125.035, -13.6799, 15.99, 1.55, 0, 'Brother Eric Vesper''s guard - to its post 10'),
(450012, 0, 1, 34, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 125.035, -13.6799, 15.99, 1.55, 0, 'Brother Eric Vesper''s guard - home at its post 10'),
(450012, 0, 2, 2, 148, 375, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Brother Eric Vesper''s guard - ready, two-handed'),
(450013, 0, 0, 3, 0, 9951, 0, 2, 0, 0, 0, 0, 0, 0, 0, 0, 128.917, -13.6573, 15.99, 1.55, 0, 'Brother Eric Vesper''s guard - to its post 11'),
(450013, 0, 1, 34, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 128.917, -13.6573, 15.99, 1.55, 0, 'Brother Eric Vesper''s guard - home at its post 11'),
(450013, 0, 2, 2, 148, 375, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Brother Eric Vesper''s guard - ready, two-handed'),
(450014, 0, 0, 3, 0, 9682, 0, 2, 0, 0, 0, 0, 0, 0, 0, 0, 132.745, -13.7459, 15.99, 1.55, 0, 'Brother Eric Vesper''s guard - to its post 12'),
(450014, 0, 1, 34, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 132.745, -13.7459, 15.99, 1.55, 0, 'Brother Eric Vesper''s guard - home at its post 12'),
(450014, 0, 2, 2, 148, 375, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Brother Eric Vesper''s guard - ready, two-handed'),
(450015, 0, 0, 3, 0, 11935, 0, 2, 0, 0, 0, 0, 0, 0, 0, 0, 132.766, -2.05773, 15.99, 1.55, 0, 'Brother Eric Vesper''s guard - to its post 13'),
(450015, 0, 1, 34, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 132.766, -2.05773, 15.99, 1.55, 0, 'Brother Eric Vesper''s guard - home at its post 13'),
(450015, 0, 2, 2, 148, 375, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Brother Eric Vesper''s guard - ready, two-handed'),
(450016, 0, 0, 3, 0, 12144, 0, 2, 0, 0, 0, 0, 0, 0, 0, 0, 128.937, -2.03679, 15.99, 1.55, 0, 'Brother Eric Vesper''s guard - to its post 14'),
(450016, 0, 1, 34, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 128.937, -2.03679, 15.99, 1.55, 0, 'Brother Eric Vesper''s guard - home at its post 14'),
(450016, 0, 2, 2, 148, 375, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Brother Eric Vesper''s guard - ready, two-handed'),
(450017, 0, 0, 3, 0, 12405, 0, 2, 0, 0, 0, 0, 0, 0, 0, 0, 125.003, -2.01526, 15.99, 1.55, 0, 'Brother Eric Vesper''s guard - to its post 15'),
(450017, 0, 1, 34, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 125.003, -2.01526, 15.99, 1.55, 0, 'Brother Eric Vesper''s guard - home at its post 15'),
(450017, 0, 2, 2, 148, 375, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Brother Eric Vesper''s guard - ready, two-handed'),
(450018, 0, 0, 3, 0, 14582, 0, 2, 0, 0, 0, 0, 0, 0, 0, 0, 125.066, 9.52406, 15.99, 1.55, 0, 'Brother Eric Vesper''s guard - to its post 16'),
(450018, 0, 1, 34, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 125.066, 9.52406, 15.99, 1.55, 0, 'Brother Eric Vesper''s guard - home at its post 16'),
(450018, 0, 2, 2, 148, 375, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Brother Eric Vesper''s guard - ready, two-handed'),
(450019, 0, 0, 3, 0, 14360, 0, 2, 0, 0, 0, 0, 0, 0, 0, 0, 128.944, 9.48699, 15.99, 1.55, 0, 'Brother Eric Vesper''s guard - to its post 17'),
(450019, 0, 1, 34, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 128.944, 9.48699, 15.99, 1.55, 0, 'Brother Eric Vesper''s guard - home at its post 17'),
(450019, 0, 2, 2, 148, 375, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Brother Eric Vesper''s guard - ready, two-handed'),
(450020, 0, 0, 3, 0, 14183, 0, 2, 0, 0, 0, 0, 0, 0, 0, 0, 132.826, 9.47718, 15.99, 1.55, 0, 'Brother Eric Vesper''s guard - to its post 18'),
(450020, 0, 1, 34, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 132.826, 9.47718, 15.99, 1.55, 0, 'Brother Eric Vesper''s guard - home at its post 18'),
(450020, 0, 2, 2, 148, 375, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Brother Eric Vesper''s guard - ready, two-handed'),
(450021, 0, 0, 85, 1, 0, 0, 0, 1300006, 0, 9, 2, 0, 0, 0, 0, 0, 0, 0, 0, 450011, 'a player at the hall''s middle - Brother Eric Vesper told'),
(450022, 0, 0, 48, 100, 1, 0, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0, 0, 116, 'Brother Eric Vesper - a player in the room killed'),
(450023, 0, 0, 18, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Brother Eric Vesper''s guard - gone');

UPDATE `creature` SET `spawntimesecsmin` = 604800, `spawntimesecsmax` = 604800 WHERE `guid` = 1300003;
UPDATE `creature` SET `spawntimesecsmin` = 604800, `spawntimesecsmax` = 604800 WHERE `guid` = 1300021;
UPDATE `creature` SET `spawntimesecsmin` = 7200, `spawntimesecsmax` = 7200 WHERE `guid` = 1300006;
