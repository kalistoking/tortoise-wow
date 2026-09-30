-- Puts back what maraudon_as_rows.sql replaced, as t1_world had it when the migration
-- was written (scripts/tier2/a07_maraudon.py). The rows the migration added are removed.

UPDATE `creature_template` SET `ai_name` = '', `script_name` = 'boss_princess_theradras', `flags_extra` = 2097152 WHERE `entry` = 12201;
UPDATE `creature_template` SET `ai_name` = '', `script_name` = 'boss_landslide', `flags_extra` = 0 WHERE `entry` = 12203;
UPDATE `creature_template` SET `ai_name` = '', `script_name` = 'celebras_the_cursed', `flags_extra` = 0 WHERE `entry` = 12225;
UPDATE `creature_template` SET `ai_name` = '', `script_name` = 'boss_noxxion', `flags_extra` = 96 WHERE `entry` = 13282;
DELETE FROM `conditions` WHERE `condition_entry` IN (349001, 349002, 349003);
DELETE FROM `creature_ai_events` WHERE `id` IN (1220101, 1220102, 1220103, 1220104, 1220105, 1220301, 1220302, 1220303, 1222501, 1222502, 1222503, 1222504, 1222505, 1328201, 1328202, 1328203, 1328204, 1353304);
DELETE FROM `creature_ai_scripts` WHERE `id` IN (1220101, 1220102, 1220103, 1220104, 1220105, 1220301, 1220302, 1220303, 1222501, 1222502, 1222503, 1222504, 1222505, 1328201, 1328202, 1328203, 1328204, 1353304);
DELETE FROM `generic_scripts` WHERE `id` IN (1328203, 1353303);
DELETE FROM `creature_ai_scripts` WHERE `id` = 1353302 AND `command` = 39 AND `comments` = 'Spewed Larva - back in 4 s while the spewer works (A7)';
DELETE FROM `gameobject_spawn_state` WHERE `guid` = 32892 AND `ord` = 0;
