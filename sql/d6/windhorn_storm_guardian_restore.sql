-- Puts back what windhorn_storm_guardian_as_rows.sql replaced, as t1_world had it when the migration
-- was written (scripts/tier1_rows.py). The rows the migration added are removed.

UPDATE `creature_template` SET `ai_name` = '', `script_name` = 'npc_windhorn_storm_guardian', `flags_extra` = 0 WHERE `entry` = 62865;
DELETE FROM `creature_ai_events` WHERE `id` IN (6286501, 6286502, 6286503);
DELETE FROM `creature_ai_scripts` WHERE `id` IN (6286501, 6286502, 6286503);
