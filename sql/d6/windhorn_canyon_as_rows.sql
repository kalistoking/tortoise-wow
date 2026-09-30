-- Windhorn Canyon (map 820), Narlgom, Rotag and Shalk: its C++ as rows -- EPIC10 tier 1, handoff/manager-084.
-- Written by the trt repo's scripts/tier1_rows.py from d6_world; windhorn_canyon_restore.sql puts
-- back what this replaces. R8: a person applies it, into the world database.
--
-- Narlgom: channels at Rotag while idle, stops as he aggroes (Rotag down, out of combat); Summon
-- Rotag at half health, Bone Armor and Rain of Fire on the C++'s timers -- each retried until it
-- takes, as the C++ kept its timer on a failure (EFLAG_CHECK_RESULT, the step ABORT_ON_FAILURE).
-- Rotag: lies dead, never aggroes on sight (flags_extra NO_AGGRO), drops out of combat within a
-- second. Shalk: his lines; at half health the Blackwind Bloodguard (active, 5 min or dead), who
-- calls out (generic script) and attacks one of Shalk's attackers.
-- The Flame of Shalk: the C++ polled the map's players while Shalk fought and took the aura off
-- one whose head was under water. As a row, the spell's own aura interrupt flag NOT_ABOVEWATER:
-- the aura goes as the player goes into deep water. Differences: deep enough to swim, not head
-- under; and a player already swimming when it lands keeps it until he leaves and re-enters.
-- NOT rows, and so not here: the Storm Guardian (62865) summoning three residues at offsets from
-- where it died -- its C++ stays (npc_windhorn_storm_guardian) until AC4.
-- Also: 13 TALK steps of Windhorn creatures that named script_texts ids, repointed.
-- Load: run into the world database, then .reload creature_template 62780, 62785 and 62782 (or
-- a restart), .reload creature_ai_events, .reload creature_ai_scripts, .reload generic_scripts,
-- .reload broadcast_text; spell_template takes a restart.

UPDATE `creature_template` SET `ai_name` = 'EventAI', `script_name` = '' WHERE `entry` = 62780;
UPDATE `creature_template` SET `ai_name` = 'EventAI', `script_name` = '' WHERE `entry` = 62782;
UPDATE `creature_template` SET `ai_name` = 'EventAI', `script_name` = '', `flags_extra` = `flags_extra` | 2 WHERE `entry` = 62785;
UPDATE `spell_template` SET `auraInterruptFlags` = `auraInterruptFlags` | 128 WHERE `entry` = 41121;

DELETE FROM `broadcast_text` WHERE `entry` IN (6141001, 6277105, 6277902, 6277903, 6277904, 6278001, 6278002, 6278006, 6278101, 6278102, 6278103, 6278201, 6278202, 6278203, 6278302, 6278303, 6278304, 6278402, 6278403, 6278404);
INSERT INTO `broadcast_text`
(`entry`, `male_text`, `female_text`, `chat_type`, `sound_id`, `language_id`, `emote_id1`, `emote_id2`, `emote_id3`, `emote_delay1`, `emote_delay2`, `emote_delay3`)
VALUES
(6278001, 'My powers will lead us to victory!', 'My powers will lead us to victory!', 1, 60679, 0, 0, 0, 0, 0, 0, 0),
(6278002, 'The Windhorn were just a nuisance!', 'The Windhorn were just a nuisance!', 1, 60680, 0, 0, 0, 0, 0, 0, 0),
(6278006, 'I do not fear death... I embrace it...', 'I do not fear death... I embrace it...', 1, 60681, 0, 0, 0, 0, 0, 0, 0),
(6278201, 'You challenge the chieftain of the Blackwind? So be it.', 'You challenge the chieftain of the Blackwind? So be it.', 1, 60673, 0, 0, 0, 0, 0, 0, 0),
(6278202, 'The Grimtotem will endure!', 'The Grimtotem will endure!', 1, 60674, 0, 0, 0, 0, 0, 0, 0),
(6278203, 'My death means little... the Grimtotem shall not be defeated...', 'My death means little... the Grimtotem shall not be defeated...', 1, 60675, 0, 0, 0, 0, 0, 0, 0),
(6277105, 'Chieftain I come to your aid!', 'Chieftain I come to your aid!', 1, 0, 0, 0, 0, 0, 0, 0, 0),
(6141001, 'I have returned...', 'I have returned...', 1, 0, 0, 0, 0, 0, 0, 0, 0),
(6277902, 'This canyon will make for excellent hunting!', 'This canyon will make for excellent hunting!', 1, 60663, 0, 0, 0, 0, 0, 0, 0),
(6277903, 'You shall be crushed!', 'You shall be crushed!', 1, 60664, 0, 0, 0, 0, 0, 0, 0),
(6277904, 'I travel to the great beyond...', 'I travel to the great beyond...', 1, 60665, 0, 0, 0, 0, 0, 0, 0),
(6278101, 'Our destiny has been foretold!', 'Our destiny has been foretold!', 1, 60669, 0, 0, 0, 0, 0, 0, 0),
(6278102, 'I have seen the future, and it is your death!', 'I have seen the future, and it is your death!', 1, 60670, 0, 0, 0, 0, 0, 0, 0),
(6278103, 'My sight, has left me!', 'My sight, has left me!', 1, 60671, 0, 0, 0, 0, 0, 0, 0),
(6278302, 'Behold the howling wind!', 'Behold the howling wind!', 1, 60676, 0, 0, 0, 0, 0, 0, 0),
(6278303, 'We seek unity...', 'We seek unity...', 1, 60677, 0, 0, 0, 0, 0, 0, 0),
(6278304, 'Disperse...', 'Disperse...', 1, 60678, 0, 0, 0, 0, 0, 0, 0),
(6278402, 'Be destroyed by my hands!', 'Be destroyed by my hands!', 1, 60666, 0, 0, 0, 0, 0, 0, 0),
(6278403, 'Enough!', 'Enough!', 1, 60667, 0, 0, 0, 0, 0, 0, 0),
(6278404, 'This cannot... be...', 'This cannot... be...', 1, 60668, 0, 0, 0, 0, 0, 0, 0);

DELETE FROM `creature_ai_events` WHERE `id` IN (6278001, 6278002, 6278003, 6278004, 6278005, 6278006, 6278201, 6278202, 6278203, 6278501, 6278502, 6278503, 6278504);
INSERT INTO `creature_ai_events`
(`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`)
VALUES
(6278001, 62780, 0, 4, 0, 100, 0, 0, 0, 0, 0, 6278001, 0, 0, 'Bonespeaker Narlgom - aggro: stop the channel, Rotag lies down'),
(6278002, 62780, 0, 2, 0, 100, 8, 50, 0, 0, 0, 6278002, 0, 0, 'Bonespeaker Narlgom - half health: Summon Rotag'),
(6278003, 62780, 0, 0, 0, 100, 9, 0, 1000, 14000, 31000, 6278003, 0, 0, 'Bonespeaker Narlgom - Bone Armor'),
(6278004, 62780, 0, 0, 0, 100, 9, 1000, 2000, 17000, 22000, 6278004, 0, 0, 'Bonespeaker Narlgom - Rain of Fire'),
(6278005, 62780, 0, 1, 0, 100, 13, 1000, 1000, 5000, 5000, 6278005, 0, 0, 'Bonespeaker Narlgom - idle: channel at Rotag'),
(6278006, 62780, 0, 6, 0, 100, 0, 0, 0, 0, 0, 6278006, 0, 0, 'Bonespeaker Narlgom - death line'),
(6278501, 62785, 0, 11, 0, 100, 0, 0, 0, 0, 0, 6278501, 0, 0, 'Champion Rotag - spawned: lies dead, no melee, no chase'),
(6278502, 62785, 0, 4, 0, 100, 0, 0, 0, 0, 0, 6278502, 0, 0, 'Champion Rotag - aggro: lies dead'),
(6278503, 62785, 0, 0, 0, 100, 1, 0, 0, 1000, 1000, 6278503, 0, 0, 'Champion Rotag - in combat: out of it'),
(6278504, 62785, 0, 7, 0, 100, 0, 0, 0, 0, 0, 6278504, 0, 0, 'Champion Rotag - evade: lies dead'),
(6278201, 62782, 0, 4, 0, 100, 0, 0, 0, 0, 0, 6278201, 0, 0, 'Chieftain Shalk Blackwind - aggro line'),
(6278202, 62782, 0, 2, 0, 100, 0, 50, 0, 0, 0, 6278202, 0, 0, 'Chieftain Shalk Blackwind - half health: the Blackwind Bloodguard'),
(6278203, 62782, 0, 6, 0, 100, 0, 0, 0, 0, 0, 6278203, 0, 0, 'Chieftain Shalk Blackwind - death line');

DELETE FROM `creature_ai_scripts` WHERE `id` IN (6278001, 6278002, 6278003, 6278004, 6278005, 6278006, 6278201, 6278202, 6278203, 6278501, 6278502, 6278503, 6278504);
INSERT INTO `creature_ai_scripts`
(`id`, `delay`, `priority`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`)
VALUES
(6278001, 0, 0, 5, 0, 51187, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Bonespeaker Narlgom - stop Targeted Arcane Channeling'),
(6278001, 0, 1, 14, 51187, 0, 0, 0, 62785, 100, 8, 18, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Bonespeaker Narlgom - Rotag: the channel gone'),
(6278001, 0, 2, 73, 0, 0, 0, 0, 62785, 100, 8, 18, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Bonespeaker Narlgom - Rotag: out of combat'),
(6278001, 0, 3, 28, 7, 0, 0, 0, 62785, 100, 8, 18, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Bonespeaker Narlgom - Rotag: lies dead'),
(6278001, 0, 4, 0, 1, 0, 0, 0, 0, 0, 0, 0, 6278001, 0, 0, 0, 0, 0, 0, 0, 0, 'Bonespeaker Narlgom - aggro line'),
(6278002, 0, 0, 15, 42004, 1, 0, 0, 0, 0, 0, 12, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Bonespeaker Narlgom - Summon Rotag'),
(6278002, 0, 1, 0, 1, 0, 0, 0, 0, 0, 0, 0, 6278002, 0, 0, 0, 0, 0, 0, 0, 0, 'Bonespeaker Narlgom - Summon Rotag line'),
(6278003, 0, 0, 15, 11445, 32, 0, 0, 0, 0, 0, 12, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Bonespeaker Narlgom - Bone Armor'),
(6278004, 0, 0, 15, 57747, 0, 0, 0, 0, 0, 0, 8, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Bonespeaker Narlgom - Rain of Fire on the victim'),
(6278005, 0, 0, 15, 51187, 4, 0, 0, 62785, 100, 8, 24, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Bonespeaker Narlgom - Targeted Arcane Channeling on Rotag'),
(6278005, 0, 1, 28, 7, 0, 0, 0, 62785, 100, 8, 18, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Bonespeaker Narlgom - Rotag: lies dead'),
(6278006, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 6278006, 0, 0, 0, 0, 0, 0, 0, 0, 'Bonespeaker Narlgom - death line'),
(6278501, 0, 0, 43, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Champion Rotag - no chase'),
(6278501, 0, 1, 42, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Champion Rotag - no melee'),
(6278501, 0, 2, 28, 7, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Champion Rotag - lies dead'),
(6278502, 0, 0, 28, 7, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Champion Rotag - lies dead'),
(6278503, 0, 0, 73, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Champion Rotag - out of combat'),
(6278503, 0, 1, 28, 7, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Champion Rotag - lies dead'),
(6278504, 0, 0, 28, 7, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Champion Rotag - lies dead'),
(6278201, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 6278201, 0, 0, 0, 0, 0, 0, 0, 0, 'Chieftain Shalk Blackwind - aggro line'),
(6278202, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 6278202, 0, 0, 0, 0, 0, 0, 0, 0, 'Chieftain Shalk Blackwind - half health line'),
(6278202, 0, 1, 10, 62771, 300000, 0, 0, 0, 0, 0, 0, 2, 6277105, 4, 1, -7546.96875, -3762.458008, 282.898224, 5.498519, 0, 'Chieftain Shalk Blackwind - summon the Blackwind Bloodguard'),
(6278203, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 6278203, 0, 0, 0, 0, 0, 0, 0, 0, 'Chieftain Shalk Blackwind - death line');

DELETE FROM `generic_scripts` WHERE `id` IN (6277105);
INSERT INTO `generic_scripts`
(`id`, `delay`, `priority`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`)
VALUES
(6277105, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 6277105, 0, 0, 0, 0, 0, 0, 0, 0, 'Blackwind Bloodguard (Shalk''s) - calls to the chieftain');

-- The steps that named a script_texts id: now their broadcast text.
UPDATE `creature_ai_scripts` SET `dataint` = 6141001, `datalong` = 1 WHERE `id` = 6141001 AND `command` = 0;
UPDATE `creature_ai_scripts` SET `dataint` = 6277902, `datalong` = 1 WHERE `id` = 6277902 AND `command` = 0;
UPDATE `creature_ai_scripts` SET `dataint` = 6277903, `datalong` = 1 WHERE `id` = 6277903 AND `command` = 0;
UPDATE `creature_ai_scripts` SET `dataint` = 6277904, `datalong` = 1 WHERE `id` = 6277904 AND `command` = 0;
UPDATE `creature_ai_scripts` SET `dataint` = 6278101, `datalong` = 1 WHERE `id` = 6278101 AND `command` = 0;
UPDATE `creature_ai_scripts` SET `dataint` = 6278102, `datalong` = 1 WHERE `id` = 6278102 AND `command` = 0;
UPDATE `creature_ai_scripts` SET `dataint` = 6278103, `datalong` = 1 WHERE `id` = 6278103 AND `command` = 0;
UPDATE `creature_ai_scripts` SET `dataint` = 6278302, `datalong` = 1 WHERE `id` = 6278302 AND `command` = 0;
UPDATE `creature_ai_scripts` SET `dataint` = 6278303, `datalong` = 1 WHERE `id` = 6278303 AND `command` = 0;
UPDATE `creature_ai_scripts` SET `dataint` = 6278304, `datalong` = 1 WHERE `id` = 6278304 AND `command` = 0;
UPDATE `creature_ai_scripts` SET `dataint` = 6278402, `datalong` = 1 WHERE `id` = 6278402 AND `command` = 0;
UPDATE `creature_ai_scripts` SET `dataint` = 6278403, `datalong` = 1 WHERE `id` = 6278403 AND `command` = 0;
UPDATE `creature_ai_scripts` SET `dataint` = 6278404, `datalong` = 1 WHERE `id` = 6278404 AND `command` = 0;
