-- Puts back what onyxias_lair_as_rows.sql replaced, as d6_world had it when the migration
-- was written (scripts/tier2/a33_onyxias_lair.py). The rows the migration added are removed.

UPDATE `creature_template` SET `ai_name` = '', `script_name` = 'npc_onyxian_whelp', `flags_extra` = 2097152 WHERE `entry` = 11262;
DELETE FROM `creature_ai_events` WHERE `id` IN (1126201);
DELETE FROM `creature_ai_scripts` WHERE `id` IN (1126201);
DELETE FROM `instance_data_slot` WHERE `map` = 249 AND `slot` = 0;
