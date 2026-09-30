-- Puts back what windhorn_canyon_as_rows.sql replaced, as d6_world had it when the migration
-- was written (scripts/tier1_rows.py). The rows the migration added are removed.

UPDATE `creature_template` SET `ai_name` = '', `script_name` = 'boss_bonespeaker_narlgom', `flags_extra` = 0 WHERE `entry` = 62780;
UPDATE `creature_template` SET `ai_name` = '', `script_name` = 'boss_chieftain_shalk_blackwind', `flags_extra` = 0 WHERE `entry` = 62782;
UPDATE `creature_template` SET `ai_name` = '', `script_name` = 'npc_champion_rotag', `flags_extra` = 134217728 WHERE `entry` = 62785;
UPDATE `spell_template` SET `auraInterruptFlags` = 0 WHERE `entry` = 41121;
DELETE FROM `broadcast_text` WHERE `entry` IN (6141001, 6277105, 6277902, 6277903, 6277904, 6278001, 6278002, 6278006, 6278101, 6278102, 6278103, 6278201, 6278202, 6278203, 6278302, 6278303, 6278304, 6278402, 6278403, 6278404);
DELETE FROM `creature_ai_events` WHERE `id` IN (6278001, 6278002, 6278003, 6278004, 6278005, 6278006, 6278201, 6278202, 6278203, 6278501, 6278502, 6278503, 6278504);
DELETE FROM `creature_ai_scripts` WHERE `id` IN (6278001, 6278002, 6278003, 6278004, 6278005, 6278006, 6278201, 6278202, 6278203, 6278501, 6278502, 6278503, 6278504);
DELETE FROM `generic_scripts` WHERE `id` IN (6277105);
UPDATE `creature_ai_scripts` SET `dataint` = -1999940, `datalong` = 0 WHERE `id` = 6141001 AND `command` = 0;
UPDATE `creature_ai_scripts` SET `dataint` = -1999929, `datalong` = 0 WHERE `id` = 6277902 AND `command` = 0;
UPDATE `creature_ai_scripts` SET `dataint` = -1999930, `datalong` = 0 WHERE `id` = 6277903 AND `command` = 0;
UPDATE `creature_ai_scripts` SET `dataint` = -1999931, `datalong` = 0 WHERE `id` = 6277904 AND `command` = 0;
UPDATE `creature_ai_scripts` SET `dataint` = -1999942, `datalong` = 0 WHERE `id` = 6278101 AND `command` = 0;
UPDATE `creature_ai_scripts` SET `dataint` = -1999943, `datalong` = 0 WHERE `id` = 6278102 AND `command` = 0;
UPDATE `creature_ai_scripts` SET `dataint` = -1999944, `datalong` = 0 WHERE `id` = 6278103 AND `command` = 0;
UPDATE `creature_ai_scripts` SET `dataint` = -1999932, `datalong` = 0 WHERE `id` = 6278302 AND `command` = 0;
UPDATE `creature_ai_scripts` SET `dataint` = -1999933, `datalong` = 0 WHERE `id` = 6278303 AND `command` = 0;
UPDATE `creature_ai_scripts` SET `dataint` = -1999934, `datalong` = 0 WHERE `id` = 6278304 AND `command` = 0;
UPDATE `creature_ai_scripts` SET `dataint` = -1999935, `datalong` = 0 WHERE `id` = 6278402 AND `command` = 0;
UPDATE `creature_ai_scripts` SET `dataint` = -1999936, `datalong` = 0 WHERE `id` = 6278403 AND `command` = 0;
UPDATE `creature_ai_scripts` SET `dataint` = -1999937, `datalong` = 0 WHERE `id` = 6278404 AND `command` = 0;
