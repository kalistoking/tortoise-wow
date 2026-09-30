-- Puts back what frostmane_hollow_as_rows.sql replaced, as t1_world had it when the migration
-- was written (scripts/tier1_rows.py). The rows the migration added are removed.

UPDATE `creature_template` SET `ai_name` = '', `script_name` = 'npc_frostmane_ritualist', `flags_extra` = 0 WHERE `entry` = 36519;
UPDATE `creature_template` SET `ai_name` = '', `script_name` = 'boss_hailar_the_frigid', `flags_extra` = 0 WHERE `entry` = 63130;
DELETE FROM `conditions` WHERE `condition_entry` IN (822001);
DELETE FROM `broadcast_text` WHERE `entry` IN (6312901, 6313001, 6313002, 6313003, 6313102, 6313201);
DELETE FROM `creature_ai_events` WHERE `id` IN (3651901, 3651902, 3651903, 6313001, 6313002, 6313003);
DELETE FROM `creature_ai_scripts` WHERE `id` IN (3651901, 3651902, 3651903, 6313001, 6313002, 6313003);
UPDATE `creature_ai_scripts` SET `dataint` = -1999991, `datalong` = 0 WHERE `id` = 6312901 AND `command` = 0;
UPDATE `creature_ai_scripts` SET `dataint` = -1999990, `datalong` = 0 WHERE `id` = 6313102 AND `command` = 0;
UPDATE `creature_ai_scripts` SET `dataint` = -1999989, `datalong` = 0 WHERE `id` = 6313201 AND `command` = 0;
