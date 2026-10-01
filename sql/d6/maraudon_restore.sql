-- Puts back what maraudon_as_rows.sql replaced, as t1_world had it when the migration
-- was written (scripts/tier2/a07_maraudon.py). The rows the migration added are removed.

UPDATE `creature_template` SET `ai_name` = '', `script_name` = 'boss_princess_theradras', `flags_extra` = 2097152 WHERE `entry` = 12201;
UPDATE `creature_template` SET `ai_name` = '', `script_name` = 'boss_landslide', `flags_extra` = 0 WHERE `entry` = 12203;
UPDATE `creature_template` SET `ai_name` = '', `script_name` = 'celebras_the_cursed', `flags_extra` = 0 WHERE `entry` = 12225;
UPDATE `creature_template` SET `ai_name` = '', `script_name` = 'boss_noxxion', `flags_extra` = 96 WHERE `entry` = 13282;
DELETE FROM `conditions` WHERE `condition_entry` IN (349002, 349003);
DELETE FROM `creature_ai_events` WHERE `id` IN (1220101, 1220102, 1220103, 1220104, 1220105, 1220301, 1220302, 1220303, 1222501, 1222502, 1222503, 1222504, 1222505, 1328201, 1328202, 1328203, 1328204, 1353304);
DELETE FROM `creature_ai_scripts` WHERE `id` IN (1220101, 1220102, 1220103, 1220104, 1220105, 1220301, 1220302, 1220303, 1222501, 1222502, 1222503, 1222504, 1222505, 1328201, 1328202, 1328203, 1328204, 1353304);
DELETE FROM `generic_scripts` WHERE `id` IN (1328203, 1353303);
DELETE FROM `creature_ai_scripts` WHERE `id` = 1353302 AND `command` = 39 AND `comments` = 'Spewed Larva - back in 4 s while the spewer works (A7)';
DELETE FROM `gameobject_spawn_state` WHERE `guid` = 32892 AND `ord` = 0;
-- The shared conditions go only once nothing names them: the other migration that writes them is then not applied either.
DELETE FROM `conditions` WHERE `condition_entry` = 532000 AND NOT EXISTS (SELECT 1 FROM `creature_ai_events` WHERE `condition_id` = 532000) AND NOT EXISTS (SELECT 1 FROM `creature_ai_scripts` WHERE `condition_id` = 532000) AND NOT EXISTS (SELECT 1 FROM `generic_scripts` WHERE `condition_id` = 532000) AND NOT EXISTS (SELECT 1 FROM `gameobject_scripts` WHERE `condition_id` = 532000) AND NOT EXISTS (SELECT 1 FROM `gossip_scripts` WHERE `condition_id` = 532000) AND NOT EXISTS (SELECT 1 FROM `event_scripts` WHERE `condition_id` = 532000) AND NOT EXISTS (SELECT 1 FROM `creature_movement_scripts` WHERE `condition_id` = 532000) AND NOT EXISTS (SELECT 1 FROM `quest_start_scripts` WHERE `condition_id` = 532000) AND NOT EXISTS (SELECT 1 FROM `quest_end_scripts` WHERE `condition_id` = 532000) AND NOT EXISTS (SELECT 1 FROM `spell_scripts` WHERE `condition_id` = 532000) AND NOT EXISTS (SELECT 1 FROM `gossip_menu` WHERE `condition_id` = 532000) AND NOT EXISTS (SELECT 1 FROM `gossip_menu_option` WHERE `condition_id` = 532000) AND NOT EXISTS (SELECT 1 FROM `gameobject_spawn_state` WHERE `condition_id` = 532000) AND NOT EXISTS (SELECT 1 FROM `areatrigger_generic_script` WHERE `condition_id` = 532000) AND NOT EXISTS (SELECT 1 FROM (SELECT * FROM `conditions`) c WHERE c.`type` < 0 AND 532000 IN (c.`value1`, c.`value2`, c.`value3`, c.`value4`));
