-- Five rows added by 20260626153218_world.sql and 20260628192033_world.sql
-- (Zel'jeb the Ancient, Arkod the White) carry a chat_type the core does not
-- recognise (ChatType in Creature.h is 0..6):
--
--     BroadcastText (Id: 6249501) in table `broadcast_text` has ChatType 12 but this chat type does not exist.
--     BroadcastText (Id: 6249502) in table `broadcast_text` has ChatType 12 but this chat type does not exist.
--     BroadcastText (Id: 6249503) in table `broadcast_text` has ChatType 12 but this chat type does not exist.
--     BroadcastText (Id: 6271501) in table `broadcast_text` has ChatType 11 but this chat type does not exist.
--     BroadcastText (Id: 6271502) in table `broadcast_text` has ChatType 11 but this chat type does not exist.
--
-- ObjectMgr::LoadBroadcastTexts clamps the value to CHAT_TYPE_SAY (0) at
-- load, so this is boot-log noise, not a behavior change either way:
--
--   * Zel'jeb's three lines are spoken through creature_ai_scripts rows
--     whose datalong is 1. SCRIPT_COMMAND_TALK passes that to DoScriptText
--     as a chat type override, so broadcast_text.chat_type is never read
--     for these rows regardless of what it holds.
--   * Arkod's two rows have datalong = 0, so no override applies and the
--     clamped CHAT_TYPE_SAY is what plays today - which already matches
--     their own comments ("Arkod the White - Say aggro/death line").
--
-- The values are corrected anyway so the warning stops and the column
-- holds what the accompanying creature_ai_scripts comments say was meant:
-- Zel'jeb's lines are "Yell on aggro"/"Yell on death" (CHAT_TYPE_YELL = 1),
-- Arkod's are "Say on aggro"/"Say on death" (CHAT_TYPE_SAY = 0, matching
-- the clamp already in effect).
--
-- The old value is in the WHERE clause so re-running this cannot overwrite
-- a later correction.
UPDATE `broadcast_text` SET `chat_type` = 1
WHERE `entry` IN (6249501, 6249502, 6249503) AND `chat_type` = 12;

UPDATE `broadcast_text` SET `chat_type` = 0
WHERE `entry` IN (6271501, 6271502) AND `chat_type` = 11;
