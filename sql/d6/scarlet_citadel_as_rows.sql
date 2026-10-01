-- Scarlet Citadel (map 45), High General Abbendis, the trash and the chaplain: its C++ as rows -- EPIC10 tier 2.
-- Written by the trt repo's scripts/tier2/a21_scarlet_citadel.py from t1_world; scarlet_citadel_restore.sql puts
-- back what this replaces. R8: a person applies it, into the world database.
--
-- The C++ keeps its script names: mod-scarlet-citadel is the switch (AM1, handoff/manager-091).
-- Loaded, the C++ runs as before -- a script found by name comes first. Unloaded
-- (`module unload mod-scarlet-citadel`, which gives every creature standing a new AI at once),
-- the names find no script and the creatures run these rows (their ai_name).
--
-- Map 45 keeps instance_scarlet_citadel, Daelus, Mariella, Ardaeus, Eric Vesper and Darkcaller Rayn (the core).
-- The Chaplain starts the talk for a player within 35 yd of him (the C++: within 10 yd of the doorway, 34 yd
-- off), and picks the conversation every time (the C++: once per server start). The Inquisitor counters his
-- own victim's casts; the Valiant charges a player with mana and cleaves his victim, the Footman disarms his
-- victim (the C++ aimed Cleave and Disarm at themselves, which could not take); the Interrogator's Eviscerate
-- keeps its own 12.5 s timer (the C++ counted five Sinister Strikes). Abbendis's week-long respawn is her
-- spawn's own now (the C++ set it as she died).

UPDATE `creature_template` SET `ai_name` = 'EventAI' WHERE `entry` = 2000003;
UPDATE `creature_template` SET `ai_name` = 'EventAI' WHERE `entry` = 2000005;
UPDATE `creature_template` SET `ai_name` = 'EventAI' WHERE `entry` = 2000014;
UPDATE `creature_template` SET `ai_name` = 'EventAI' WHERE `entry` = 2000015;
UPDATE `creature_template` SET `ai_name` = 'EventAI' WHERE `entry` = 2000033;
UPDATE `creature_template` SET `ai_name` = 'EventAI' WHERE `entry` = 2000034;
UPDATE `creature_template` SET `ai_name` = 'EventAI' WHERE `entry` = 2000035;
UPDATE `creature_template` SET `ai_name` = 'EventAI' WHERE `entry` = 2000036;

DELETE FROM `conditions` WHERE `condition_entry` IN (450000);
INSERT INTO `conditions`
(`condition_entry`, `type`, `value1`, `value2`, `value3`, `value4`, `flags`)
VALUES
(450000, 56, 0, 35, 0, 0, 2);

DELETE FROM `broadcast_text` WHERE `entry` IN (450101, 450102, 450103, 450104, 450105, 450106, 450107, 450108, 450109, 450110, 450111, 450112, 450113, 450114);
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
(450114, 'It is nothing but the truth.', 'It is nothing but the truth.', 0, 0, 0, 0, 0, 0, 0, 0, 0);

DELETE FROM `creature_ai_events` WHERE `id` IN (4510001, 4510002, 4510003, 4510101, 4510102, 4510103, 4510104, 4510201, 4510202, 4510203, 4510204, 4510301, 4510302, 4510401, 4510402, 4510501, 4510502, 4510601, 4510602, 4510603, 4510604, 4510605, 4510606, 4510607, 4510608, 4510701);
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
(4510701, 2000005, 450000, 1, 0, 100, 0, 1000, 1000, 0, 0, 4510701, 0, 0, 'Scarlet Chaplain - a player near: the talk with the Sister, once');

DELETE FROM `creature_ai_scripts` WHERE `id` IN (4510001, 4510002, 4510003, 4510101, 4510102, 4510103, 4510104, 4510201, 4510202, 4510203, 4510204, 4510301, 4510302, 4510401, 4510402, 4510501, 4510502, 4510601, 4510602, 4510603, 4510604, 4510605, 4510606, 4510607, 4510608, 4510701);
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
(4510701, 0, 0, 39, 450001, 450002, 0, 0, 0, 0, 0, 0, 50, 50, 0, 0, 0, 0, 0, 0, 0, 'Scarlet Chaplain - one of the two talks');

DELETE FROM `generic_scripts` WHERE `id` IN (450001, 450002);
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
(450002, 50, 6, 0, 0, 0, 0, 0, 0, 0, 0, 0, 450114, 0, 0, 0, 0, 0, 0, 0, 0, 'Scarlet Chaplain - "It is nothing but the truth...."');

UPDATE `creature` SET `spawntimesecsmin` = 604800, `spawntimesecsmax` = 604800 WHERE `guid` = 1300003;
