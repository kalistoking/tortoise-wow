-- Scarlet Citadel (map 45), High General Abbendis, the trash and the chaplain: its C++ as rows -- EPIC10 tier 2.
-- Written by the trt repo's scripts/tier2/a21_scarlet_citadel.py from d6_world; scarlet_citadel_restore.sql puts
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
-- Third pass: Sacred Fist Daelus and his Fallen Spirits leave the C++. His root is his combat movement off (rows
-- have no root). His drain takes 10 % of every player's health within 200 yd each second his victim stands
-- beyond 3 yd -- game masters too (the C++: every living player on the map but game masters); what it takes
-- he gains by DEAL_DAMAGE's drain flag (datalong3, a core addition: trt A21). His shout comes as his Dark
-- Channeling starts, so once per stretch, as the C++'s flag did. His Sunder Armor asks 3 yd in 3D (the C++:
-- 2D). The red spirit's spot is one of six at 16.5/16.5/17 % (the C++: even); its scale 2 and run never took
-- in the C++ (set before its aura) and do not here. A spirit is consumed within 4 yd of his middle (the C++:
-- 1 yd edge to edge, about 3.6), re-sent to him every 0.5 s (the C++: every update). His curse skips a raid of
-- one on his threat list (the C++: that one cursed). His fight is a map event of two hours at most, which
-- carries the red one's spot. The C++'s achievement chest was game object 0: none, here as there.
-- Fourth pass: High Inquisitor Mariella and her adds leave the C++. Her root is her combat movement off; she
-- stays stunned through her fight, as the C++ left her. Her sacrifices are her EventAI phases 1, 3 and 5,
-- under 75, 50 and 25 % (her normal phases 0, 2, 4 and 6 keep her volley, void zones and felhounds, their
-- timers paused through a sacrifice, as the C++'s were); the players she marks are the targets of a map event
-- (two hours at most), any one of them dead failing it, its failure script ending the sacrifice. She marks
-- the living players within 32 yd 2D, edge to edge -- game masters too (the C++: 3D, to her middle, no game
-- masters); a sacrifice outlasting two hours ends as a death would. Her void zones go under three random
-- players not her tank within 32 yd, one player twice at times (the C++: three different ones); a void zone
-- hits within 2 yd, edge to edge (about 2.4 to its middle; the C++: 2.85), game masters too, as the C++. The
-- kill zone kills within 5 yd edge to edge (about 5.5; the C++: 5.7) -- game masters too, whom `.god on`
-- keeps alive (the C++ spared them). A Felhound goes to a random player with mana on her threat list (the
-- C++: the map's first), 1000000 threat on that player by ADD_THREAT's new amount, its mana taken by
-- DEAL_DAMAGE's new mana (datalong4) -- both core additions: trt A21; its beam shows on a victim without mana
-- too (the C++: only one with mana). Her enrage yell comes once (the C++ yelled it every update). Her
-- achievement chest, game object 5000013, was set at 0, 0, 0 (a TODO in the C++): none here; a void zone's
-- first hit still makes her laugh. The C++'s 32 yd check on her aggro sent her home and pulled her back in at
-- once: no rule for it.
-- Map 45 keeps instance_scarlet_citadel and Ardaeus (the core).
-- The Chaplain starts the talk for a player within 35 yd of him (the C++: within 10 yd of the doorway, 34 yd
-- off), and picks the conversation every time (the C++: once per server start). The Inquisitor counters his
-- own victim's casts; the Valiant charges a player with mana and cleaves his victim, the Footman disarms his
-- victim (the C++ aimed Cleave and Disarm at themselves, which could not take); the Interrogator's Eviscerate
-- keeps its own 12.5 s timer (the C++ counted five Sinister Strikes). Abbendis's week-long respawn is her
-- spawn's own now (the C++ set it as she died).

UPDATE `creature_template` SET `ai_name` = 'EventAI', `gossip_menu_id` = 2000000 WHERE `entry` = 2000000;
UPDATE `creature_template` SET `ai_name` = 'EventAI', `gossip_menu_id` = 2000002 WHERE `entry` = 2000002;
UPDATE `creature_template` SET `ai_name` = 'EventAI' WHERE `entry` = 2000003;
UPDATE `creature_template` SET `ai_name` = 'EventAI' WHERE `entry` = 2000004;
UPDATE `creature_template` SET `ai_name` = 'EventAI' WHERE `entry` = 2000005;
UPDATE `creature_template` SET `ai_name` = 'EventAI', `speed_walk` = 0.48 WHERE `entry` = 2000013;
UPDATE `creature_template` SET `ai_name` = 'EventAI' WHERE `entry` = 2000014;
UPDATE `creature_template` SET `ai_name` = 'EventAI' WHERE `entry` = 2000015;
UPDATE `creature_template` SET `ai_name` = 'EventAI' WHERE `entry` = 2000016;
UPDATE `creature_template` SET `ai_name` = 'EventAI' WHERE `entry` = 2000017;
UPDATE `creature_template` SET `ai_name` = 'EventAI' WHERE `entry` = 2000018;
UPDATE `creature_template` SET `ai_name` = 'EventAI' WHERE `entry` = 2000033;
UPDATE `creature_template` SET `ai_name` = 'EventAI' WHERE `entry` = 2000034;
UPDATE `creature_template` SET `ai_name` = 'EventAI' WHERE `entry` = 2000035;
UPDATE `creature_template` SET `ai_name` = 'EventAI' WHERE `entry` = 2000036;
UPDATE `creature_template` SET `ai_name` = 'EventAI' WHERE `entry` = 2000037;

DELETE FROM `conditions` WHERE `condition_entry` IN (450000, 450013, 450014, 450015, 450020, 450021, 450022, 450023, 450024, 450025, 450026, 450027, 450028, 450029, 450031, 450032, 450033, 450034, 450035, 450036, 450040, 450041, 450042, 10450011);
INSERT INTO `conditions`
(`condition_entry`, `type`, `value1`, `value2`, `value3`, `value4`, `flags`)
VALUES
(450000, 56, 0, 35, 0, 0, 2),
(450013, 54, 129, -10, 16, 12, 0),
(10450011, -1, 116, 450013, 0, 0, 0),
(450014, 1, 25685, 0, 0, 0, 3),
(450015, -1, 450014, 230003, 0, 0, 0),
(450026, 38, 2, 2, 0, 0, 0),
(450027, 1, 21157, -1, 0, 0, 3),
(450031, 35, 2000000, 1, 1, 0, 0),
(450032, 35, 2000000, 1, 2, 0, 0),
(450033, 35, 2000000, 1, 3, 0, 0),
(450034, 35, 2000000, 1, 4, 0, 0),
(450035, 35, 2000000, 1, 5, 0, 0),
(450036, 35, 2000000, 1, 6, 0, 0),
(450029, 1, 22577, -1, 0, 0, 0),
(450028, 38, 40, 2, 0, 0, 0),
(450020, 1, 26235, -1, 0, 0, 0),
(450021, 54, 67, 13, 17, 4, 0),
(450022, 54, 67, 13, 17, 4, 1),
(450023, 1, 26235, -1, 0, 0, 1),
(450024, -1, 450021, 450020, 0, 0, 0),
(450025, -1, 450021, 450023, 0, 0, 0),
(450040, 35, 2000002, 1, 0, 0, 0),
(450041, 35, 2000002, 1, 1, 0, 0),
(450042, 38, 32, 2, 0, 0, 0);

-- Conditions another tier-2 migration writes too, under the same entry: whichever comes first.
INSERT IGNORE INTO `conditions`
(`condition_entry`, `type`, `value1`, `value2`, `value3`, `value4`, `flags`)
VALUES
(450010, 1, 15473, 0, 0, 0, 3),
(230003, 41, 99, 2, 0, 0, 0),
(409020, 38, 5, 2, 0, 0, 0);

DELETE FROM `broadcast_text` WHERE `entry` IN (450101, 450102, 450103, 450104, 450105, 450106, 450107, 450108, 450109, 450110, 450111, 450112, 450113, 450114, 450115, 450116, 450117, 450118, 450119, 450120, 450121, 450122, 450123, 450124, 450125, 450126, 450127, 450128, 450129, 450130, 450131, 450132, 450133, 450134, 450135, 450136, 450137, 450138, 450139, 450140, 450141, 450142, 450143, 450144, 450145, 450146, 450147);
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
(450120, 'If only I- I could <cough> .. glance upon an evening’s star <cough> one last time.', 'If only I- I could <cough> .. glance upon an evening’s star <cough> one last time.', 0, 0, 0, 0, 0, 0, 0, 0, 0),
(450121, 'You''re about to face the thickest wall the Scarlet Crusade has ever built!', 'You''re about to face the thickest wall the Scarlet Crusade has ever built!', 0, 0, 0, 0, 0, 0, 0, 0, 0),
(450122, 'With this fist, I become the impenetrable wall of the Crusade!', 'With this fist, I become the impenetrable wall of the Crusade!', 0, 0, 0, 0, 0, 0, 0, 0, 0),
(450123, 'Seems like luck favors the damned, but yours has run out!', 'Seems like luck favors the damned, but yours has run out!', 0, 0, 0, 0, 0, 0, 0, 0, 0),
(450124, 'Justice for the Scarlet Crusade, justice for Azeroth!', 'Justice for the Scarlet Crusade, justice for Azeroth!', 0, 0, 0, 0, 0, 0, 0, 0, 0),
(450125, 'Light… <gasp> d- damn you … all.', 'Light… <gasp> d- damn you … all.', 0, 0, 0, 0, 0, 0, 0, 0, 0),
(450126, 'Has he sent nothing but mindless husks? Disappointing.', 'Has he sent nothing but mindless husks? Disappointing.', 0, 0, 0, 0, 0, 0, 0, 0, 0),
(450127, 'I am not so easily crumbled!', 'I am not so easily crumbled!', 0, 0, 0, 0, 0, 0, 0, 0, 0),
(450128, 'The Light curses you, with every second your own flesh and blood burn your very being.', 'The Light curses you, with every second your own flesh and blood burn your very being.', 0, 0, 0, 0, 0, 0, 0, 0, 0),
(450129, 'By my wrath your soul will succumb to the Light''s justice!', 'By my wrath your soul will succumb to the Light''s justice!', 0, 0, 0, 0, 0, 0, 0, 0, 0),
(450130, 'Your own mind will be your greatest enemy. The Light shall burn you!', 'Your own mind will be your greatest enemy. The Light shall burn you!', 0, 0, 0, 0, 0, 0, 0, 0, 0),
(450131, 'MY FIST FOR THE SCARLET CRUSADE!', 'MY FIST FOR THE SCARLET CRUSADE!', 1, 0, 0, 0, 0, 0, 0, 0, 0),
(450132, 'I will have you confess!', 'I will have you confess!', 0, 0, 0, 0, 0, 0, 0, 0, 0),
(450133, 'Only through sacrifice can one achieve victory.', 'Only through sacrifice can one achieve victory.', 0, 0, 0, 0, 0, 0, 0, 0, 0),
(450134, 'Persistent, are we?', 'Persistent, are we?', 0, 0, 0, 0, 0, 0, 0, 0, 0),
(450135, 'What an utter waste of my time.', 'What an utter waste of my time.', 0, 0, 0, 0, 0, 0, 0, 0, 0),
(450136, 'No! This is not... how it should have ended.', 'No! This is not... how it should have ended.', 0, 0, 0, 0, 0, 0, 0, 0, 0),
(450137, 'It seems I have nothing to worry about, you will not touch my treasure.', 'It seems I have nothing to worry about, you will not touch my treasure.', 0, 0, 0, 0, 0, 0, 0, 0, 0),
(450138, 'Unworthy.', 'Unworthy.', 0, 0, 0, 0, 0, 0, 0, 0, 0),
(450139, 'As expected.', 'As expected.', 0, 0, 0, 0, 0, 0, 0, 0, 0),
(450140, 'Pathetic.', 'Pathetic.', 0, 0, 0, 0, 0, 0, 0, 0, 0),
(450141, 'How easily you crumble.', 'How easily you crumble.', 0, 0, 0, 0, 0, 0, 0, 0, 0),
(450142, 'In Lady Whitemane''s name!', 'In Lady Whitemane''s name!', 1, 0, 0, 0, 0, 0, 0, 0, 0),
(450143, 'Die for the glory of the crusade!', 'Die for the glory of the crusade!', 1, 0, 0, 0, 0, 0, 0, 0, 0),
(450144, 'You worms! I will not fall to the likes of you!', 'You worms! I will not fall to the likes of you!', 1, 0, 0, 0, 0, 0, 0, 0, 0),
(450145, 'That''s enough! Now DIE!', 'That''s enough! Now DIE!', 1, 0, 0, 0, 0, 0, 0, 0, 0),
(450146, 'Feed my pets! Feed on the blasphemers!', 'Feed my pets! Feed on the blasphemers!', 1, 0, 0, 0, 0, 0, 0, 0, 0),
(450147, 'Only the darkness awaits the heretics.', 'Only the darkness awaits the heretics.', 1, 0, 0, 0, 0, 0, 0, 0, 0);

DELETE FROM `creature_ai_events` WHERE `id` IN (4510001, 4510002, 4510003, 4510101, 4510102, 4510103, 4510104, 4510201, 4510202, 4510203, 4510204, 4510301, 4510302, 4510401, 4510402, 4510501, 4510502, 4510601, 4510602, 4510603, 4510604, 4510605, 4510606, 4510607, 4510608, 4510701, 4510801, 4510802, 4510811, 4510812, 4510813, 4510814, 4510901, 4510902, 4510903, 4510904, 4510905, 4510911, 4510912, 4510913, 4510914, 4510915, 4510916, 4511001, 4511002, 4511003, 4511004, 4511011, 4511012, 4511013, 4511014, 4511015, 4511021, 4511022, 4511023, 4511024, 4511025, 4511031, 4511101, 4511102, 4511103, 4511104, 4511105, 4511201, 4511202, 4511203, 4511204, 4511205, 4511211, 4511212, 4511213, 4511214, 4511215, 4511216, 4511217, 4511218, 4511221, 4511222, 4511223, 4511224, 4511301, 4511302, 4511303, 4511401, 4511402, 4511403, 4511501, 4511502);
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
(4510904, 2000004, 0, 21, 0, 100, 0, 0, 0, 0, 0, 4510904, 0, 0, 'Brother Eric Vesper - home: his guards gone, Energize off'),
(4510905, 2000004, 0, 6, 0, 100, 0, 0, 0, 0, 0, 4510905, 0, 0, 'Brother Eric Vesper - dead: his guards gone, his last words'),
(4511001, 2000000, 0, 11, 0, 100, 0, 0, 0, 0, 0, 4511001, 0, 0, 'Sacred Fist Daelus - spawned: kneeling, waiting for a player'),
(4511002, 2000000, 0, 4, 0, 100, 0, 0, 0, 0, 0, 4511002, 0, 0, 'Sacred Fist Daelus - aggro: rooted, Carapace of C''Thun, the zone, in progress, his fight'),
(4511003, 2000000, 0, 7, 0, 100, 0, 0, 0, 0, 0, 4511003, 0, 0, 'Sacred Fist Daelus - evading: his adds gone, his line, failed, kneeling again'),
(4511004, 2000000, 0, 6, 0, 100, 0, 0, 0, 0, 0, 4511004, 0, 0, 'Sacred Fist Daelus - dead: his adds gone, his last words, done'),
(4511011, 2000000, 450026, 0, 2, 100, 1, 10000, 10000, 10000, 10000, 4511011, 0, 0, 'Sacred Fist Daelus - phase 0: Sunder Armor every 10 s, his victim within 3 yd'),
(4511012, 2000000, 0, 9, 2, 100, 1, 3, 200, 1000, 1000, 4511012, 0, 0, 'Sacred Fist Daelus - phase 0, his victim beyond 3 yd: Dark Channeling, the raid drained every second'),
(4511013, 2000000, 0, 9, 2, 100, 1, 0, 3, 1000, 1000, 4511013, 0, 0, 'Sacred Fist Daelus - phase 0, his victim within 3 yd: Dark Channeling off'),
(4511014, 2000000, 0, 0, 2, 100, 1, 5000, 5000, 30000, 30000, 4511014, 0, 0, 'Sacred Fist Daelus - phase 0: six Fallen Spirits, 5 s in, then every 30 s'),
(4511015, 2000000, 0, 0, 2, 100, 1, 90000, 90000, 120000, 180000, 4511015, 0, 0, 'Sacred Fist Daelus - phase 0: the next wave''s red spirit chosen, 90 s in, then every 120-180 s'),
(4511021, 2000000, 0, 31, 0, 100, 1, 1, 0, 0, 0, 4511021, 0, 0, 'Sacred Fist Daelus - a plain spirit consumed: 5 % healed'),
(4511022, 2000000, 0, 31, 0, 100, 0, 1, 0, 0, 0, 4511022, 0, 0, 'Sacred Fist Daelus - the first plain spirit of a fight: he laughs, his line'),
(4511023, 2000000, 0, 31, 0, 100, 1, 2, 0, 0, 0, 4511023, 0, 0, 'Sacred Fist Daelus - the red spirit consumed: 5 % healed'),
(4511024, 2000000, 0, 31, 2, 100, 1, 2, 0, 0, 0, 4511024, 0, 0, 'Sacred Fist Daelus - phase 0, the red spirit consumed: vulnerable (phase 1)'),
(4511025, 2000000, 0, 0, 1, 100, 1, 30000, 30000, 30000, 30000, 4511025, 0, 0, 'Sacred Fist Daelus - phase 1, 30 s on: the wall again (phase 0)'),
(4511031, 2000000, 0, 0, 0, 100, 9, 10000, 10000, 60000, 60000, 4511031, 0, 0, 'Sacred Fist Daelus - a curse on a player within 40 yd, not his tank: 10 s in, then every 60 s'),
(4511101, 2000013, 0, 11, 0, 100, 0, 0, 0, 0, 0, 4511101, 0, 0, 'Fallen Spirit - spawned: no melee, no chase, to Daelus'),
(4511102, 2000013, 0, 4, 0, 100, 0, 0, 0, 0, 0, 4511102, 0, 0, 'Fallen Spirit - aggro: no melee, no chase'),
(4511103, 2000013, 0, 1, 0, 100, 1, 500, 500, 500, 500, 4511103, 0, 0, 'Fallen Spirit - every 0.5 s out of a fight: on to Daelus, consumed at him'),
(4511104, 2000013, 0, 0, 0, 100, 1, 500, 500, 500, 500, 4511104, 0, 0, 'Fallen Spirit - every 0.5 s in a fight: on to Daelus, consumed at him'),
(4511105, 2000013, 0, 6, 0, 100, 0, 0, 0, 0, 0, 4511105, 0, 0, 'Fallen Spirit - dead: Sonic Burst, gone'),
(4511201, 2000002, 0, 11, 0, 100, 0, 0, 0, 0, 0, 4511201, 0, 0, 'High Inquisitor Mariella - spawned: waiting for a player'),
(4511202, 2000002, 0, 4, 0, 100, 0, 0, 0, 0, 0, 4511202, 0, 0, 'High Inquisitor Mariella - aggro: rooted, the zone, in progress, her fight'),
(4511203, 2000002, 0, 7, 0, 100, 0, 0, 0, 0, 0, 4511203, 0, 0, 'High Inquisitor Mariella - evading: her adds gone, she laughs, failed, waiting again'),
(4511204, 2000002, 0, 6, 0, 100, 0, 0, 0, 0, 0, 4511204, 0, 0, 'High Inquisitor Mariella - dead: her adds gone, her last words, done'),
(4511205, 2000002, 0, 5, 0, 100, 1, 0, 0, 0, 0, 4511205, 0, 0, 'High Inquisitor Mariella - a kill: she asks, one of her four lines'),
(4511211, 2000002, 450040, 0, 42, 100, 1, 3500, 3500, 3500, 3500, 4511211, 0, 0, 'High Inquisitor Mariella - a normal phase: Shadow Bolt Volley every 3.5 s'),
(4511212, 2000002, 450041, 0, 42, 100, 1, 1000, 1000, 1000, 1000, 4511212, 0, 0, 'High Inquisitor Mariella - a normal phase, enraged: Shadow Bolt Volley every second'),
(4511213, 2000002, 0, 0, 42, 100, 9, 2500, 2500, 10000, 10000, 4511213, 0, 0, 'High Inquisitor Mariella - a normal phase: three void zones, 2.5 s in, then every 10 s, once two are on her threat list'),
(4511214, 2000002, 0, 0, 42, 100, 1, 1000, 1000, 15000, 15000, 4511214, 0, 0, 'High Inquisitor Mariella - a normal phase: a Felhound at a player with mana, 1 s in, then every 15 s, 50 at most'),
(4511215, 2000002, 0, 17, 0, 100, 0, 2000016, 0, 0, 0, 4511215, 0, 0, 'High Inquisitor Mariella - her first void zone of a fight: her yell'),
(4511216, 2000002, 0, 17, 0, 100, 0, 2000017, 0, 0, 0, 4511216, 0, 0, 'High Inquisitor Mariella - her first Felhound of a fight: she exclaims, her yell'),
(4511217, 2000002, 0, 31, 0, 100, 0, 1, 0, 0, 0, 4511217, 0, 0, 'High Inquisitor Mariella - a void zone hit a player, the first of a fight: she laughs, her line'),
(4511218, 2000002, 0, 0, 0, 100, 0, 480000, 480000, 0, 0, 4511218, 0, 0, 'High Inquisitor Mariella - 8 min in: enraged, her volley every second'),
(4511221, 2000002, 0, 2, 126, 100, 0, 74, 0, 0, 0, 4511221, 0, 0, 'High Inquisitor Mariella - phase 0, under 75 %: her sacrifice'),
(4511222, 2000002, 0, 2, 123, 100, 0, 49, 0, 0, 0, 4511222, 0, 0, 'High Inquisitor Mariella - phase 2, under 50 %: her sacrifice'),
(4511223, 2000002, 0, 2, 111, 100, 0, 24, 0, 0, 0, 4511223, 0, 0, 'High Inquisitor Mariella - phase 4, under 25 %: her sacrifice'),
(4511224, 2000002, 0, 0, 85, 100, 1, 1000, 1000, 1000, 1000, 4511224, 0, 0, 'High Inquisitor Mariella - a sacrifice: 1 % healed every second'),
(4511301, 2000016, 0, 11, 0, 100, 0, 0, 0, 0, 0, 4511301, 0, 0, 'Void Zone - spawned: unselectable, unattackable, still'),
(4511302, 2000016, 0, 1, 0, 100, 1, 2000, 2000, 2000, 2000, 4511302, 0, 0, 'Void Zone - every 2 s: the players within 2 yd'),
(4511303, 2000016, 0, 0, 0, 100, 1, 2000, 2000, 2000, 2000, 4511303, 0, 0, 'Void Zone - every 2 s: the players within 2 yd'),
(4511401, 2000018, 0, 11, 0, 100, 0, 0, 0, 0, 0, 4511401, 0, 0, 'Kill Zone - spawned: unselectable, unattackable, still'),
(4511402, 2000018, 0, 1, 0, 100, 1, 500, 500, 500, 500, 4511402, 0, 0, 'Kill Zone - every 0.5 s: the players within 5 yd'),
(4511403, 2000018, 0, 0, 0, 100, 1, 500, 500, 500, 500, 4511403, 0, 0, 'Kill Zone - every 0.5 s: the players within 5 yd'),
(4511501, 2000017, 0, 4, 0, 100, 0, 0, 0, 0, 0, 4511501, 0, 0, 'Felhound - aggro: no melee, as the C++ had none'),
(4511502, 2000017, 409020, 0, 0, 100, 1, 1500, 1500, 1500, 1500, 4511502, 0, 0, 'Felhound - every 1.5 s, its victim within 5 yd: 1250 of its mana drained');

DELETE FROM `creature_ai_scripts` WHERE `id` IN (4510001, 4510002, 4510003, 4510101, 4510102, 4510103, 4510104, 4510201, 4510202, 4510203, 4510204, 4510301, 4510302, 4510401, 4510402, 4510501, 4510502, 4510601, 4510602, 4510603, 4510604, 4510605, 4510606, 4510607, 4510608, 4510701, 4510801, 4510802, 4510811, 4510812, 4510813, 4510814, 4510901, 4510902, 4510903, 4510904, 4510905, 4510911, 4510912, 4510913, 4510914, 4510915, 4510916, 4511001, 4511002, 4511003, 4511004, 4511011, 4511012, 4511013, 4511014, 4511015, 4511021, 4511022, 4511023, 4511024, 4511025, 4511031, 4511101, 4511102, 4511103, 4511104, 4511105, 4511201, 4511202, 4511203, 4511204, 4511205, 4511211, 4511212, 4511213, 4511214, 4511215, 4511216, 4511217, 4511218, 4511221, 4511222, 4511223, 4511224, 4511301, 4511302, 4511303, 4511401, 4511402, 4511403, 4511501, 4511502);
INSERT INTO `creature_ai_scripts`
(`id`, `delay`, `priority`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`)
VALUES
(4510001, 0, 0, 37, 3, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'High General Abbendis - in progress'),
(4510001, 0, 1, 49, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'High General Abbendis - the zone into the fight'),
(4510002, 0, 0, 37, 3, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'High General Abbendis - failed'),
(4510003, 0, 0, 37, 3, 3, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'High General Abbendis - done'),
(4510101, 0, 0, 15, 20537, 0, 0, 0, 0, 0, 1, 8, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Citadel Inquisitor - Counterspell'),
(4510102, 0, 0, 15, 23858, 0, 0, 0, 12, 10, 15, 12, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Citadel Inquisitor - Holy Nova'),
(4510103, 0, 0, 15, 1020, 0, 0, 0, 0, 0, 0, 12, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Citadel Inquisitor - Divine Shield'),
(4510104, 0, 0, 15, 24208, 0, 0, 0, 40, 60, 15, 8, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Citadel Inquisitor - Greater Heal'),
(4510201, 0, 0, 15, 20537, 0, 0, 0, 0, 0, 1, 8, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Citadel Inquisitor - Counterspell'),
(4510202, 0, 0, 15, 23858, 0, 0, 0, 12, 10, 15, 12, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Citadel Inquisitor - Holy Nova'),
(4510203, 0, 0, 15, 1020, 0, 0, 0, 0, 0, 0, 12, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Citadel Inquisitor - Divine Shield'),
(4510204, 0, 0, 15, 24208, 0, 0, 0, 40, 60, 15, 8, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Citadel Inquisitor - Greater Heal'),
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
(4510903, 0, 0, 49, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Brother Eric Vesper - the zone into the fight'),
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
(4510905, 0, 3, 0, 0, 0, 0, 0, 0, 0, 0, 0, 450120, 0, 0, 0, 0, 0, 0, 0, 0, 'Brother Eric Vesper - his last words'),
(4511001, 0, 0, 4, 46, 262146, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Sacred Fist Daelus - unattackable and stunned'),
(4511001, 0, 1, 4, 147, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Sacred Fist Daelus - his gossip on'),
(4511001, 0, 2, 28, 8, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Sacred Fist Daelus - kneels'),
(4511001, 0, 3, 22, 189, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Sacred Fist Daelus - neutral (189)'),
(4511001, 0, 4, 43, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Sacred Fist Daelus - rooted: no combat movement'),
(4511002, 0, 0, 43, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Sacred Fist Daelus - rooted: no combat movement'),
(4511002, 0, 1, 15, 26156, 2, 0, 0, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Sacred Fist Daelus - Carapace of C''Thun'),
(4511002, 0, 2, 49, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Sacred Fist Daelus - the zone into the fight'),
(4511002, 0, 3, 37, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Sacred Fist Daelus - in progress (0 = 1)'),
(4511002, 0, 4, 61, 2000000, 7200, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Sacred Fist Daelus - his fight, a map event (two hours at most)'),
(4511003, 0, 0, 68, 450024, 2, 2000013, 150, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Sacred Fist Daelus - his Fallen Spirits gone'),
(4511003, 0, 1, 68, 450024, 2, 16363, 80, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Sacred Fist Daelus - the Poison Clouds gone'),
(4511003, 0, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 450124, 0, 0, 0, 0, 0, 0, 0, 0, 'Sacred Fist Daelus - "Justice for the Scarlet Crusade, justice for Azeroth!"'),
(4511003, 0, 3, 37, 0, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Sacred Fist Daelus - failed (0 = 2)'),
(4511003, 0, 4, 62, 2000000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Sacred Fist Daelus - his fight over'),
(4511003, 0, 5, 44, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Sacred Fist Daelus - phase 0'),
(4511003, 0, 6, 42, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Sacred Fist Daelus - melee on'),
(4511003, 0, 7, 4, 46, 262146, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Sacred Fist Daelus - unattackable and stunned'),
(4511003, 0, 8, 4, 147, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Sacred Fist Daelus - his gossip on'),
(4511003, 0, 9, 28, 8, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Sacred Fist Daelus - kneels'),
(4511003, 0, 10, 22, 189, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Sacred Fist Daelus - neutral (189)'),
(4511003, 0, 11, 43, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Sacred Fist Daelus - rooted: no combat movement'),
(4511004, 0, 0, 68, 450024, 2, 2000013, 150, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Sacred Fist Daelus - his Fallen Spirits gone'),
(4511004, 0, 1, 68, 450024, 2, 16363, 80, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Sacred Fist Daelus - the Poison Clouds gone'),
(4511004, 0, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 450125, 0, 0, 0, 0, 0, 0, 0, 0, 'Sacred Fist Daelus - his last words'),
(4511004, 0, 3, 37, 0, 3, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Sacred Fist Daelus - done (0 = 3)'),
(4511004, 0, 4, 62, 2000000, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Sacred Fist Daelus - his fight over'),
(4511011, 0, 0, 15, 25051, 2, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Sacred Fist Daelus - Sunder Armor'),
(4511012, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 450127, 0, 0, 0, 0, 0, 0, 0, 450027, 'Sacred Fist Daelus - "I am not so easily crumbled!", as he starts channelling'),
(4511012, 0, 1, 15, 21157, 34, 0, 0, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Sacred Fist Daelus - Dark Channeling'),
(4511012, 0, 2, 68, 450025, 3, 0, 200, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Sacred Fist Daelus - the players within 200 yd drained'),
(4511013, 0, 0, 14, 21157, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Sacred Fist Daelus - Dark Channeling off'),
(4511014, 0, 0, 10, 2000013, 0, 0, 0, 0, 0, 0, 0, 0, 450026, -1, 8, 36.207348, -17.218674, 16.87, 1.570526, 0, 'Sacred Fist Daelus - a Fallen Spirit at spot 1'),
(4511014, 0, 1, 10, 2000013, 0, 0, 0, 0, 0, 0, 0, 0, 450027, -1, 8, 36.207348, 43.897984, 16.87, 4.69641, 0, 'Sacred Fist Daelus - a Fallen Spirit at spot 2'),
(4511014, 0, 2, 10, 2000013, 0, 0, 0, 0, 0, 0, 0, 0, 450028, -1, 8, 67.414421, -17.218674, 16.87, 1.570526, 0, 'Sacred Fist Daelus - a Fallen Spirit at spot 3'),
(4511014, 0, 3, 10, 2000013, 0, 0, 0, 0, 0, 0, 0, 0, 450029, -1, 8, 67.414421, 43.897984, 16.87, 4.69641, 0, 'Sacred Fist Daelus - a Fallen Spirit at spot 4'),
(4511014, 0, 4, 10, 2000013, 0, 0, 0, 0, 0, 0, 0, 0, 450030, -1, 8, 98.575172, -17.218674, 16.87, 1.570526, 0, 'Sacred Fist Daelus - a Fallen Spirit at spot 5'),
(4511014, 0, 5, 10, 2000013, 0, 0, 0, 0, 0, 0, 0, 0, 450031, -1, 8, 98.575172, 43.897984, 16.87, 4.69641, 0, 'Sacred Fist Daelus - a Fallen Spirit at spot 6'),
(4511015, 0, 0, 39, 450038, 450039, 0, 0, 0, 0, 0, 0, 50, 50, 0, 0, 0, 0, 0, 0, 0, 'Sacred Fist Daelus - one of six spots'),
(4511021, 0, 0, 94, 5, 3, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Sacred Fist Daelus - 5 % healed'),
(4511022, 0, 0, 1, 11, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Sacred Fist Daelus - laughs'),
(4511022, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 450126, 0, 0, 0, 0, 0, 0, 0, 0, 'Sacred Fist Daelus - "Has he sent nothing but mindless husks? Disappointing."'),
(4511023, 0, 0, 94, 5, 3, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Sacred Fist Daelus - 5 % healed'),
(4511024, 0, 0, 14, 21157, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Sacred Fist Daelus - Dark Channeling off'),
(4511024, 0, 1, 74, 26235, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Sacred Fist Daelus - Cthun Vulnerable'),
(4511024, 0, 2, 14, 26156, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Sacred Fist Daelus - Carapace of C''Thun off'),
(4511024, 0, 3, 4, 46, 262144, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Sacred Fist Daelus - stunned'),
(4511024, 0, 4, 42, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Sacred Fist Daelus - melee off'),
(4511024, 0, 5, 0, 0, 0, 0, 0, 0, 0, 0, 0, 450123, 0, 0, 0, 0, 0, 0, 0, 0, 'Sacred Fist Daelus - "Seems like luck favors the damned, but yours has run out!"'),
(4511024, 0, 6, 44, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Sacred Fist Daelus - phase 1'),
(4511025, 0, 0, 14, 26235, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Sacred Fist Daelus - Cthun Vulnerable off'),
(4511025, 0, 1, 15, 26156, 2, 0, 0, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Sacred Fist Daelus - Carapace of C''Thun'),
(4511025, 0, 2, 4, 46, 262144, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Sacred Fist Daelus - not stunned'),
(4511025, 0, 3, 42, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Sacred Fist Daelus - melee on'),
(4511025, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 450122, 0, 0, 0, 0, 0, 0, 0, 0, 'Sacred Fist Daelus - "With this fist, I become the impenetrable wall of the Crusade!"'),
(4511025, 0, 5, 44, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Sacred Fist Daelus - phase 0'),
(4511031, 0, 0, 39, 450040, 0, 0, 0, 2, 0, 5, 24, 100, 0, 0, 0, 0, 0, 0, 0, 450028, 'Sacred Fist Daelus - the curse'),
(4511101, 0, 0, 42, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Fallen Spirit - no melee'),
(4511101, 0, 1, 43, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Fallen Spirit - no chase'),
(4511101, 0, 2, 3, 0, 0, 3, 0, 0, 0, 0, 4, 0, 0, 0, 0, 67.3897, 13.3098, 16.8691, 0, 0, 'Fallen Spirit - walks to Daelus'),
(4511102, 0, 0, 42, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Fallen Spirit - no melee'),
(4511102, 0, 1, 43, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Fallen Spirit - no chase'),
(4511103, 0, 0, 94, 1, 1, 0, 0, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, 450020, 'Fallen Spirit - the red one kept at 1 %'),
(4511103, 0, 1, 3, 0, 0, 3, 0, 0, 0, 0, 4, 0, 0, 0, 0, 67.3897, 13.3098, 16.8691, 0, 450022, 'Fallen Spirit - walks to Daelus'),
(4511103, 0, 2, 85, 1, 0, 0, 0, 1300000, 0, 9, 2, 0, 0, 0, 0, 0, 0, 0, 0, 450025, 'Fallen Spirit - at Daelus, plain: he is told (1)'),
(4511103, 0, 3, 85, 2, 0, 0, 0, 1300000, 0, 9, 2, 0, 0, 0, 0, 0, 0, 0, 0, 450024, 'Fallen Spirit - at Daelus, red: he is told (2)'),
(4511103, 0, 4, 48, 100, 1, 0, 0, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, 450021, 'Fallen Spirit - at Daelus: consumed'),
(4511104, 0, 0, 94, 1, 1, 0, 0, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, 450020, 'Fallen Spirit - the red one kept at 1 %'),
(4511104, 0, 1, 3, 0, 0, 3, 0, 0, 0, 0, 4, 0, 0, 0, 0, 67.3897, 13.3098, 16.8691, 0, 450022, 'Fallen Spirit - walks to Daelus'),
(4511104, 0, 2, 85, 1, 0, 0, 0, 1300000, 0, 9, 2, 0, 0, 0, 0, 0, 0, 0, 0, 450025, 'Fallen Spirit - at Daelus, plain: he is told (1)'),
(4511104, 0, 3, 85, 2, 0, 0, 0, 1300000, 0, 9, 2, 0, 0, 0, 0, 0, 0, 0, 0, 450024, 'Fallen Spirit - at Daelus, red: he is told (2)'),
(4511104, 0, 4, 48, 100, 1, 0, 0, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, 450021, 'Fallen Spirit - at Daelus: consumed'),
(4511105, 0, 0, 15, 23918, 2, 0, 0, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Fallen Spirit - Sonic Burst'),
(4511105, 0, 1, 18, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Fallen Spirit - gone'),
(4511201, 0, 0, 4, 46, 262146, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'High Inquisitor Mariella - unattackable and stunned'),
(4511201, 0, 1, 4, 147, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'High Inquisitor Mariella - her gossip on'),
(4511201, 0, 2, 22, 189, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'High Inquisitor Mariella - neutral (189)'),
(4511201, 0, 3, 43, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'High Inquisitor Mariella - rooted: no combat movement'),
(4511202, 0, 0, 43, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'High Inquisitor Mariella - rooted: no combat movement'),
(4511202, 0, 1, 49, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'High Inquisitor Mariella - the zone into the fight'),
(4511202, 0, 2, 37, 2, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'High Inquisitor Mariella - in progress (2 = 1)'),
(4511202, 0, 3, 61, 2000002, 7200, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'High Inquisitor Mariella - her fight, a map event (two hours at most)'),
(4511203, 0, 0, 68, 450041, 2, 2000016, 150, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'High Inquisitor Mariella - her Void Zones gone'),
(4511203, 0, 1, 68, 450041, 2, 2000018, 150, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'High Inquisitor Mariella - her Kill Zone gone'),
(4511203, 0, 2, 68, 450041, 2, 2000017, 150, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'High Inquisitor Mariella - her Felhounds gone'),
(4511203, 0, 3, 68, 450042, 0, 5000012, 100, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'High Inquisitor Mariella - her summoning circles gone'),
(4511203, 0, 4, 14, 22518, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'High Inquisitor Mariella - Glowy (Red) off'),
(4511203, 0, 5, 62, 2000102, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'High Inquisitor Mariella - a sacrifice over, not ended by a death'),
(4511203, 0, 6, 1, 11, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'High Inquisitor Mariella - laughs'),
(4511203, 0, 7, 0, 0, 0, 0, 0, 0, 0, 0, 0, 450135, 0, 0, 0, 0, 0, 0, 0, 0, 'High Inquisitor Mariella - "What an utter waste of my time."'),
(4511203, 0, 8, 37, 2, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'High Inquisitor Mariella - failed (2 = 2)'),
(4511203, 0, 9, 62, 2000002, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'High Inquisitor Mariella - her fight over'),
(4511203, 0, 10, 44, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'High Inquisitor Mariella - phase 0'),
(4511203, 0, 11, 4, 46, 262146, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'High Inquisitor Mariella - unattackable and stunned'),
(4511203, 0, 12, 4, 147, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'High Inquisitor Mariella - her gossip on'),
(4511203, 0, 13, 22, 189, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'High Inquisitor Mariella - neutral (189)'),
(4511203, 0, 14, 43, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'High Inquisitor Mariella - rooted: no combat movement'),
(4511204, 0, 0, 68, 450041, 2, 2000016, 150, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'High Inquisitor Mariella - her Void Zones gone'),
(4511204, 0, 1, 68, 450041, 2, 2000018, 150, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'High Inquisitor Mariella - her Kill Zone gone'),
(4511204, 0, 2, 68, 450041, 2, 2000017, 150, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'High Inquisitor Mariella - her Felhounds gone'),
(4511204, 0, 3, 68, 450042, 0, 5000012, 100, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'High Inquisitor Mariella - her summoning circles gone'),
(4511204, 0, 4, 14, 22518, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'High Inquisitor Mariella - Glowy (Red) off'),
(4511204, 0, 5, 62, 2000102, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'High Inquisitor Mariella - a sacrifice over, not ended by a death'),
(4511204, 0, 6, 0, 0, 0, 0, 0, 0, 0, 0, 0, 450136, 0, 0, 0, 0, 0, 0, 0, 0, 'High Inquisitor Mariella - her last words'),
(4511204, 0, 7, 37, 2, 3, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'High Inquisitor Mariella - done (2 = 3)'),
(4511204, 0, 8, 62, 2000002, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'High Inquisitor Mariella - her fight over'),
(4511205, 0, 0, 1, 6, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'High Inquisitor Mariella - asks'),
(4511205, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 450138, 450139, 450140, 450141, 0, 0, 0, 0, 0, 'High Inquisitor Mariella - one of her four lines on a kill'),
(4511211, 0, 0, 15, 21341, 0, 0, 0, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'High Inquisitor Mariella - Shadow Bolt Volley'),
(4511212, 0, 0, 15, 21341, 0, 0, 0, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'High Inquisitor Mariella - Shadow Bolt Volley'),
(4511213, 0, 0, 10, 2000016, 0, 0, 0, 514, 0, 5, 24, 65536, 0, -1, 8, 0, 0, 0.25, 0, 450042, 'High Inquisitor Mariella - void zone 1 under a player within 32 yd, not her tank'),
(4511213, 0, 1, 10, 2000016, 0, 0, 0, 514, 0, 5, 16, 65536, 0, -1, 8, 0, 0, 0.25, 0, 450042, 'High Inquisitor Mariella - void zone 2 under a player within 32 yd, not her tank'),
(4511213, 0, 2, 10, 2000016, 0, 0, 0, 514, 0, 5, 16, 65536, 0, -1, 8, 0, 0, 0.25, 0, 450042, 'High Inquisitor Mariella - void zone 3 under a player within 32 yd, not her tank'),
(4511214, 0, 0, 39, 450044, 450045, 450046, 450047, 518, 0, 4, 16, 25, 25, 25, 25, 0, 0, 0, 0, 0, 'High Inquisitor Mariella - one of four spots'),
(4511215, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 450147, 0, 0, 0, 0, 0, 0, 0, 0, 'High Inquisitor Mariella - "Only the darkness awaits the heretics."'),
(4511216, 0, 0, 1, 5, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'High Inquisitor Mariella - exclaims'),
(4511216, 0, 1, 0, 1, 0, 0, 0, 0, 0, 0, 0, 450146, 0, 0, 0, 0, 0, 0, 0, 0, 'High Inquisitor Mariella - "Feed my pets! Feed on the blasphemers!"'),
(4511217, 0, 0, 1, 11, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'High Inquisitor Mariella - laughs'),
(4511217, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 450137, 0, 0, 0, 0, 0, 0, 0, 0, 'High Inquisitor Mariella - "It seems I have nothing to worry about, you will not touch my treasure."'),
(4511218, 0, 0, 1, 15, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'High Inquisitor Mariella - roars'),
(4511218, 0, 1, 0, 1, 0, 0, 0, 0, 0, 0, 0, 450145, 0, 0, 0, 0, 0, 0, 0, 0, 'High Inquisitor Mariella - "That''s enough! Now DIE!"'),
(4511218, 0, 2, 65, 2000002, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'High Inquisitor Mariella - her fight: enraged'),
(4511221, 0, 0, 1, 5, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'High Inquisitor Mariella - exclaims'),
(4511221, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 450133, 0, 0, 0, 0, 0, 0, 0, 0, 'High Inquisitor Mariella - "Only through sacrifice can one achieve victory."'),
(4511221, 0, 2, 74, 22518, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'High Inquisitor Mariella - Glowy (Red)'),
(4511221, 0, 3, 61, 2000102, 7200, 0, 0, 0, 0, 0, 4, 0, 0, 0, 450048, 0, 0, 0, 0, 0, 'High Inquisitor Mariella - a sacrifice, a map event (two hours at most), ended by a marked player''s death'),
(4511221, 0, 4, 68, 450049, 3, 0, 32, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'High Inquisitor Mariella - the players within 32 yd marked'),
(4511221, 0, 5, 44, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'High Inquisitor Mariella - her sacrifice phase'),
(4511222, 0, 0, 1, 5, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'High Inquisitor Mariella - exclaims'),
(4511222, 0, 1, 0, 1, 0, 0, 0, 0, 0, 0, 0, 450143, 0, 0, 0, 0, 0, 0, 0, 0, 'High Inquisitor Mariella - "Die for the glory of the crusade!"'),
(4511222, 0, 2, 74, 22518, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'High Inquisitor Mariella - Glowy (Red)'),
(4511222, 0, 3, 61, 2000102, 7200, 0, 0, 0, 0, 0, 4, 0, 0, 0, 450048, 0, 0, 0, 0, 0, 'High Inquisitor Mariella - a sacrifice, a map event (two hours at most), ended by a marked player''s death'),
(4511222, 0, 4, 68, 450049, 3, 0, 32, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'High Inquisitor Mariella - the players within 32 yd marked'),
(4511222, 0, 5, 44, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'High Inquisitor Mariella - her sacrifice phase'),
(4511223, 0, 0, 1, 16, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'High Inquisitor Mariella - kneels'),
(4511223, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 450134, 0, 0, 0, 0, 0, 0, 0, 0, 'High Inquisitor Mariella - "Persistent, are we?"'),
(4511223, 0, 2, 74, 22518, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'High Inquisitor Mariella - Glowy (Red)'),
(4511223, 0, 3, 61, 2000102, 7200, 0, 0, 0, 0, 0, 4, 0, 0, 0, 450048, 0, 0, 0, 0, 0, 'High Inquisitor Mariella - a sacrifice, a map event (two hours at most), ended by a marked player''s death'),
(4511223, 0, 4, 68, 450049, 3, 0, 32, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'High Inquisitor Mariella - the players within 32 yd marked'),
(4511223, 0, 5, 44, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'High Inquisitor Mariella - her sacrifice phase'),
(4511224, 0, 0, 94, 1, 3, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'High Inquisitor Mariella - 1 % healed'),
(4511301, 0, 0, 4, 46, 33554434, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Void Zone - unselectable and unattackable'),
(4511301, 0, 1, 43, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Void Zone - no combat movement'),
(4511302, 0, 0, 68, 450050, 3, 0, 2, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Void Zone - the players within 2 yd'),
(4511303, 0, 0, 68, 450050, 3, 0, 2, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Void Zone - the players within 2 yd'),
(4511401, 0, 0, 4, 46, 33554434, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Kill Zone - unselectable and unattackable'),
(4511401, 0, 1, 43, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Kill Zone - no combat movement'),
(4511402, 0, 0, 68, 450051, 3, 0, 5, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Kill Zone - the players within 5 yd'),
(4511403, 0, 0, 68, 450051, 3, 0, 5, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Kill Zone - the players within 5 yd'),
(4511501, 0, 0, 42, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Felhound - no melee'),
(4511502, 0, 0, 15, 25676, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Felhound - Drain Mana (the beam)'),
(4511502, 0, 1, 48, 1250, 0, 0, 1, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Felhound - 1250 of its victim''s mana taken');

DELETE FROM `generic_scripts` WHERE `id` IN (450001, 450002, 450003, 450004, 450005, 450006, 450007, 450008, 450009, 450010, 450011, 450012, 450013, 450014, 450015, 450016, 450017, 450018, 450019, 450020, 450021, 450022, 450023, 450024, 450025, 450026, 450027, 450028, 450029, 450030, 450031, 450032, 450033, 450034, 450035, 450036, 450037, 450038, 450039, 450040, 450041, 450042, 450043, 450044, 450045, 450046, 450047, 450048, 450049, 450050, 450051);
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
(450021, 0, 0, 85, 1, 0, 0, 0, 1300006, 0, 9, 2, 0, 0, 0, 0, 0, 0, 0, 0, 10450011, 'a player at the hall''s middle - Brother Eric Vesper told'),
(450022, 0, 0, 48, 100, 1, 0, 0, 1300006, 0, 9, 2, 0, 0, 0, 0, 0, 0, 0, 0, 116, 'Brother Eric Vesper - a player in the room killed'),
(450023, 0, 0, 18, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Brother Eric Vesper''s guard - gone'),
(450024, 0, 0, 18, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Sacred Fist Daelus - a spirit or a cloud gone'),
(450025, 0, 0, 48, 10, 1, 1, 0, 1300000, 0, 9, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Sacred Fist Daelus - 10 % of a player''s health drained into his'),
(450026, 0, 0, 74, 26235, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 450031, 'Fallen Spirit - spot 1, the chosen one: red (Cthun Vulnerable)'),
(450026, 0, 1, 65, 2000000, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 450031, 'Fallen Spirit - spot 1, the chosen one: the choice spent'),
(450027, 0, 0, 74, 26235, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 450032, 'Fallen Spirit - spot 2, the chosen one: red (Cthun Vulnerable)'),
(450027, 0, 1, 65, 2000000, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 450032, 'Fallen Spirit - spot 2, the chosen one: the choice spent'),
(450028, 0, 0, 74, 26235, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 450033, 'Fallen Spirit - spot 3, the chosen one: red (Cthun Vulnerable)'),
(450028, 0, 1, 65, 2000000, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 450033, 'Fallen Spirit - spot 3, the chosen one: the choice spent'),
(450029, 0, 0, 74, 26235, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 450034, 'Fallen Spirit - spot 4, the chosen one: red (Cthun Vulnerable)'),
(450029, 0, 1, 65, 2000000, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 450034, 'Fallen Spirit - spot 4, the chosen one: the choice spent'),
(450030, 0, 0, 74, 26235, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 450035, 'Fallen Spirit - spot 5, the chosen one: red (Cthun Vulnerable)'),
(450030, 0, 1, 65, 2000000, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 450035, 'Fallen Spirit - spot 5, the chosen one: the choice spent'),
(450031, 0, 0, 74, 26235, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 450036, 'Fallen Spirit - spot 6, the chosen one: red (Cthun Vulnerable)'),
(450031, 0, 1, 65, 2000000, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 450036, 'Fallen Spirit - spot 6, the chosen one: the choice spent'),
(450032, 0, 0, 65, 2000000, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Sacred Fist Daelus - the next wave''s spot 1 red'),
(450033, 0, 0, 65, 2000000, 1, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Sacred Fist Daelus - the next wave''s spot 2 red'),
(450034, 0, 0, 65, 2000000, 1, 3, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Sacred Fist Daelus - the next wave''s spot 3 red'),
(450035, 0, 0, 65, 2000000, 1, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Sacred Fist Daelus - the next wave''s spot 4 red'),
(450036, 0, 0, 65, 2000000, 1, 5, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Sacred Fist Daelus - the next wave''s spot 5 red'),
(450037, 0, 0, 65, 2000000, 1, 6, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Sacred Fist Daelus - the next wave''s spot 6 red'),
(450038, 0, 0, 39, 450032, 450033, 450034, 0, 0, 0, 0, 0, 33, 33, 34, 0, 0, 0, 0, 0, 0, 'Sacred Fist Daelus - one of three spots'),
(450039, 0, 0, 39, 450035, 450036, 450037, 0, 0, 0, 0, 0, 33, 33, 34, 0, 0, 0, 0, 0, 0, 'Sacred Fist Daelus - one of three spots'),
(450040, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 450128, 450129, 450130, 0, 0, 0, 0, 0, 0, 'Sacred Fist Daelus - one of his three curses'),
(450040, 0, 1, 15, 22577, 2, 0, 0, 0, 0, 0, 5, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'the cursed player - Glowy (Green) on himself'),
(450040, 6, 2, 15, 28240, 2, 0, 0, 0, 0, 0, 5, 0, 0, 0, 0, 0, 0, 0, 0, 450029, 'the cursed player - Poison Cloud at his feet, Glowy still on him'),
(450040, 6, 3, 14, 22577, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'the cursed player - Glowy (Green) off'),
(450041, 0, 0, 18, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'High Inquisitor Mariella - a void zone, her kill zone or a felhound gone'),
(450042, 0, 0, 81, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'High Inquisitor Mariella - a summoning circle gone'),
(450043, 0, 0, 15, 7741, 2, 0, 0, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Felhound - Summoned Demon'),
(450043, 0, 1, 42, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Felhound - no melee, as the C++ had none'),
(450043, 0, 2, 75, 1000000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Felhound - held to its player: 1000000 threat'),
(450044, 0, 0, 10, 2000017, 0, 50, 150, 0, 0, 0, 0, 4, 450043, 0, 8, 178.621826, 57.703217, 33.25, 5.535669, 0, 'High Inquisitor Mariella - a Felhound at spot 1, sent at the player'),
(450045, 0, 0, 10, 2000017, 0, 50, 150, 0, 0, 0, 0, 4, 450043, 0, 8, 178.621826, 38.533649, 33.55, 0.755342, 0, 'High Inquisitor Mariella - a Felhound at spot 2, sent at the player'),
(450046, 0, 0, 10, 2000017, 0, 50, 150, 0, 0, 0, 0, 4, 450043, 0, 8, 197.66568, 38.533649, 32.88, 2.328107, 0, 'High Inquisitor Mariella - a Felhound at spot 3, sent at the player'),
(450047, 0, 0, 10, 2000017, 0, 50, 150, 0, 0, 0, 0, 4, 450043, 0, 8, 197.66568, 57.703217, 33.45, 2.35979, 0, 'High Inquisitor Mariella - a Felhound at spot 4, sent at the player'),
(450048, 0, 0, 14, 22518, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'High Inquisitor Mariella - a marked player dead: Glowy (Red) off'),
(450048, 0, 1, 1, 5, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'High Inquisitor Mariella - exclaims'),
(450048, 0, 2, 0, 1, 0, 0, 0, 0, 0, 0, 0, 450144, 0, 0, 0, 0, 0, 0, 0, 0, 'High Inquisitor Mariella - "You worms! I will not fall to the likes of you!"'),
(450048, 0, 3, 44, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'High Inquisitor Mariella - the next normal phase'),
(450049, 0, 0, 63, 2000102, 0, 0, 0, 0, 0, 0, 0, 0, 0, 121, 0, 0, 0, 0, 0, 1000, 'a living player within 32 yd - marked for her sacrifice'),
(450050, 0, 0, 85, 1, 0, 0, 0, 1300002, 0, 9, 18, 0, 0, 0, 0, 0, 0, 0, 0, 116, 'a player in a void zone - High Inquisitor Mariella told (1)'),
(450050, 0, 1, 48, 3000, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Void Zone - 3000 to a player in it'),
(450051, 0, 0, 48, 100, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Kill Zone - a player in it killed');

DELETE FROM `gossip_scripts` WHERE `id` IN (2000000, 2000002);
INSERT INTO `gossip_scripts`
(`id`, `delay`, `priority`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`)
VALUES
(2000000, 0, 0, 4, 147, 1, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Sacred Fist Daelus - his gossip off'),
(2000000, 2, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 450121, 0, 0, 0, 0, 0, 0, 0, 0, 'Sacred Fist Daelus - "You''re about to face the thickest wall..."'),
(2000000, 7, 2, 28, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Sacred Fist Daelus - stands'),
(2000000, 7, 3, 4, 46, 262144, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Sacred Fist Daelus - not stunned'),
(2000000, 7, 4, 0, 1, 0, 0, 0, 0, 0, 0, 0, 450131, 0, 0, 0, 0, 0, 0, 0, 0, 'Sacred Fist Daelus - "MY FIST FOR THE SCARLET CRUSADE!"'),
(2000000, 9, 5, 4, 46, 2, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Sacred Fist Daelus - attackable'),
(2000000, 9, 6, 22, 67, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Sacred Fist Daelus - hostile (67)'),
(2000000, 9, 7, 49, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Sacred Fist Daelus - the zone into the fight'),
(2000002, 0, 0, 4, 147, 1, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'High Inquisitor Mariella - her gossip off'),
(2000002, 1, 1, 1, 5, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'High Inquisitor Mariella - exclaims'),
(2000002, 1, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 450132, 0, 0, 0, 0, 0, 0, 0, 0, 'High Inquisitor Mariella - "I will have you confess!"'),
(2000002, 2, 3, 76, 5000012, 1800000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 178.621826, 57.703217, 33.25, 5.535669, 0, 'High Inquisitor Mariella - a summoning circle at spot 1'),
(2000002, 2, 4, 76, 5000012, 1800000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 178.621826, 38.533649, 33.55, 0.755342, 0, 'High Inquisitor Mariella - a summoning circle at spot 2'),
(2000002, 2, 5, 76, 5000012, 1800000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 197.66568, 38.533649, 32.88, 2.328107, 0, 'High Inquisitor Mariella - a summoning circle at spot 3'),
(2000002, 2, 6, 76, 5000012, 1800000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 197.66568, 57.703217, 33.45, 2.35979, 0, 'High Inquisitor Mariella - a summoning circle at spot 4'),
(2000002, 6, 7, 1, 15, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'High Inquisitor Mariella - roars'),
(2000002, 6, 8, 0, 1, 0, 0, 0, 0, 0, 0, 0, 450142, 0, 0, 0, 0, 0, 0, 0, 0, 'High Inquisitor Mariella - "In Lady Whitemane''s name!"'),
(2000002, 8, 9, 10, 2000018, 0, 0, 0, 0, 0, 0, 0, 262144, 0, -1, 8, 0, 0, 0.25, 0, 0, 'High Inquisitor Mariella - her Kill Zone at her feet'),
(2000002, 10, 10, 4, 46, 2, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'High Inquisitor Mariella - attackable (still stunned, as the C++ left her)'),
(2000002, 10, 11, 22, 67, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'High Inquisitor Mariella - hostile (67)'),
(2000002, 10, 12, 49, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'High Inquisitor Mariella - the zone into the fight');

DELETE FROM `gossip_menu` WHERE `entry` = 2000000 AND `text_id` = 1000002;
INSERT INTO `gossip_menu`
(`entry`, `text_id`, `script_id`, `condition_id`)
VALUES
(2000000, 1000002, 0, 0);

DELETE FROM `gossip_menu_option` WHERE `menu_id` = 2000000 AND `id` = 0;
INSERT INTO `gossip_menu_option`
(`menu_id`, `id`, `option_icon`, `option_text`, `option_broadcast_text`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `box_broadcast_text`, `condition_id`)
VALUES
(2000000, 0, 0, 'This will be your resting place, old-timer.', 0, 1, 1, -1, 0, 2000000, 0, 0, NULL, 0, 0);

DELETE FROM `gossip_menu` WHERE `entry` = 2000002 AND `text_id` = 1000000;
INSERT INTO `gossip_menu`
(`entry`, `text_id`, `script_id`, `condition_id`)
VALUES
(2000002, 1000000, 0, 0);

DELETE FROM `gossip_menu_option` WHERE `menu_id` = 2000002 AND `id` = 0;
INSERT INTO `gossip_menu_option`
(`menu_id`, `id`, `option_icon`, `option_text`, `option_broadcast_text`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `box_broadcast_text`, `condition_id`)
VALUES
(2000002, 0, 0, 'We will see who ends who.', 0, 1, 1, -1, 0, 2000002, 0, 0, NULL, 0, 0);

UPDATE `creature` SET `spawntimesecsmin` = 604800, `spawntimesecsmax` = 604800 WHERE `guid` = 1300003;
UPDATE `creature` SET `spawntimesecsmin` = 604800, `spawntimesecsmax` = 604800 WHERE `guid` = 1300021;
UPDATE `creature` SET `spawntimesecsmin` = 7200, `spawntimesecsmax` = 7200 WHERE `guid` = 1300006;
UPDATE `creature` SET `spawntimesecsmin` = 604800, `spawntimesecsmax` = 604800 WHERE `guid` = 1300000;
UPDATE `creature` SET `spawntimesecsmin` = 604800, `spawntimesecsmax` = 604800 WHERE `guid` = 1300002;
