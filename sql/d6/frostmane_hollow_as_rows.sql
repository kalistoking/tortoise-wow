-- Frostmane Hollow (map 822), boss_hailar_the_frigid + npc_frostmane_ritualist: its C++ as rows -- EPIC10 tier 1, handoff/manager-084.
-- Written by the trt repo's scripts/tier1_rows.py from t1_world; frostmane_hollow_restore.sql puts
-- back what this replaces. R8: a person applies it, into the world database.
--
-- Hailar's three lines, the script_texts made broadcast texts. The ritualists -- the five spawns
-- the C++ named are the entry's only five -- never aggro on sight (flags_extra NO_AGGRO), neither
-- chase nor swing, and channel the ritual at Hailar every 5 s, again at once when it fails
-- (EFLAG_CHECK_RESULT: the C++ retried in 1 s). Held to map 822 by a condition.
-- Differences: attacked, a ritualist enters combat (the C++ ignored its attacker) -- it still
-- neither moves nor swings, and keeps channelling.
-- Also: 3 TALK steps of Frostmane creatures that named script_texts ids, repointed.
-- Load: run into the world database, then .reload creature_template 63130 and 36519 (or a
-- restart), .reload creature_ai_events, .reload creature_ai_scripts, .reload broadcast_text,
-- .reload conditions.

UPDATE `creature_template` SET `ai_name` = 'EventAI', `script_name` = '', `flags_extra` = `flags_extra` | 2 WHERE `entry` = 36519;
UPDATE `creature_template` SET `ai_name` = 'EventAI', `script_name` = '' WHERE `entry` = 63130;

DELETE FROM `conditions` WHERE `condition_entry` IN (822001);
INSERT INTO `conditions`
(`condition_entry`, `type`, `value1`, `value2`, `value3`, `value4`, `flags`)
VALUES
(822001, 33, 822, 0, 0, 0, 0);

DELETE FROM `broadcast_text` WHERE `entry` IN (6312901, 6313001, 6313002, 6313003, 6313102, 6313201);
INSERT INTO `broadcast_text`
(`entry`, `male_text`, `female_text`, `chat_type`, `sound_id`, `language_id`, `emote_id1`, `emote_id2`, `emote_id3`, `emote_delay1`, `emote_delay2`, `emote_delay3`)
VALUES
(6313001, 'Embrace the cold...', 'Embrace the cold...', 1, 60706, 0, 0, 0, 0, 0, 0, 0),
(6313002, 'Let the chill overcome...', 'Let the chill overcome...', 1, 60707, 0, 0, 0, 0, 0, 0, 0),
(6313003, 'Destruction...', 'Destruction...', 1, 60708, 0, 0, 0, 0, 0, 0, 0),
(6312901, 'I have seen da future, and you aint in it!', 'I have seen da future, and you aint in it!', 1, 60711, 0, 0, 0, 0, 0, 0, 0),
(6313102, 'The Frostmane be da strongest, be da fiercest! Dis be our home, you think you can mess wit us?', 'The Frostmane be da strongest, be da fiercest! Dis be our home, you think you can mess wit us?', 1, 60710, 0, 0, 0, 0, 0, 0, 0),
(6313201, 'Tan''sha, kill them all!', 'Tan''sha, kill them all!', 1, 60709, 0, 0, 0, 0, 0, 0, 0);

DELETE FROM `creature_ai_events` WHERE `id` IN (3651901, 3651902, 3651903, 6313001, 6313002, 6313003);
INSERT INTO `creature_ai_events`
(`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`)
VALUES
(6313001, 63130, 0, 4, 0, 100, 0, 0, 0, 0, 0, 6313001, 0, 0, 'Hailar the Frigid - aggro line'),
(6313002, 63130, 0, 2, 0, 100, 0, 50, 0, 0, 0, 6313002, 0, 0, 'Hailar the Frigid - half health line'),
(6313003, 63130, 0, 6, 0, 100, 0, 0, 0, 0, 0, 6313003, 0, 0, 'Hailar the Frigid - death line'),
(3651901, 36519, 822001, 11, 0, 100, 0, 0, 0, 0, 0, 3651901, 0, 0, 'Frostmane Ritualist - no melee, no chase'),
(3651902, 36519, 822001, 1, 0, 100, 13, 500, 500, 5000, 5000, 3651902, 0, 0, 'Frostmane Ritualist - channel the ritual at Hailar (out of combat)'),
(3651903, 36519, 822001, 0, 0, 100, 13, 500, 500, 5000, 5000, 3651903, 0, 0, 'Frostmane Ritualist - channel the ritual at Hailar (in combat)');

DELETE FROM `creature_ai_scripts` WHERE `id` IN (3651901, 3651902, 3651903, 6313001, 6313002, 6313003);
INSERT INTO `creature_ai_scripts`
(`id`, `delay`, `priority`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`)
VALUES
(6313001, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 6313001, 0, 0, 0, 0, 0, 0, 0, 0, 'Hailar the Frigid - aggro line'),
(6313002, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 6313002, 0, 0, 0, 0, 0, 0, 0, 0, 'Hailar the Frigid - half health line'),
(6313003, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 6313003, 0, 0, 0, 0, 0, 0, 0, 0, 'Hailar the Frigid - death line'),
(3651901, 0, 0, 43, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Frostmane Ritualist - no chase'),
(3651901, 0, 1, 42, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Frostmane Ritualist - no melee'),
(3651902, 0, 0, 15, 41592, 4, 0, 0, 63130, 100, 8, 24, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Frostmane Ritualist - Frostmane Ritual on Hailar'),
(3651903, 0, 0, 15, 41592, 4, 0, 0, 63130, 100, 8, 24, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Frostmane Ritualist - Frostmane Ritual on Hailar');

-- The steps that named a script_texts id: now their broadcast text.
UPDATE `creature_ai_scripts` SET `dataint` = 6312901, `datalong` = 1 WHERE `id` = 6312901 AND `command` = 0;
UPDATE `creature_ai_scripts` SET `dataint` = 6313102, `datalong` = 1 WHERE `id` = 6313102 AND `command` = 0;
UPDATE `creature_ai_scripts` SET `dataint` = 6313201, `datalong` = 1 WHERE `id` = 6313201 AND `command` = 0;
