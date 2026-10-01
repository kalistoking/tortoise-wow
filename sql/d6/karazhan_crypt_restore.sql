-- Puts back what karazhan_crypt_as_rows.sql replaced, as t1_world had it when the migration
-- was written (scripts/tier2/a31_karazhan_crypt.py). The rows the migration added are removed.

UPDATE `creature_template` SET `ai_name` = '', `script_name` = '', `flags_extra` = 0 WHERE `entry` = 91920;
UPDATE `creature_template` SET `ai_name` = '', `script_name` = 'tomb_bat', `flags_extra` = 0 WHERE `entry` = 91921;
UPDATE `creature_template` SET `ai_name` = 'EventAI', `script_name` = 'skeletal_remains', `flags_extra` = 0 WHERE `entry` = 91924;
UPDATE `creature_template` SET `ai_name` = '', `script_name` = '', `flags_extra` = 0 WHERE `entry` = 91928;
UPDATE `creature_template` SET `ai_name` = 'NullAI', `script_name` = 'trigger_summon_alarus', `flags_extra` = 32898 WHERE `entry` = 91931;
UPDATE `creature_template` SET `ai_name` = '', `script_name` = '', `flags_extra` = 0 WHERE `entry` = 92935;
UPDATE `map_template` SET `script_name` = 'instance_karazhan_crypt' WHERE `entry` = 800;
DELETE FROM `conditions` WHERE `condition_entry` IN (800002, 800010, 800011, 800012, 800013, 800014, 800015, 800016, 800020, 800021, 800022, 800023, 800024, 800030, 800031);
DELETE FROM `broadcast_text` WHERE `entry` IN (800101, 800102, 800103, 800104);
DELETE FROM `creature_ai_events` WHERE `id` IN (9192001, 9192101, 9192102, 9192103, 9192401, 9192402, 9192403, 9192801, 9193101, 9293501, 9293502);
DELETE FROM `creature_ai_scripts` WHERE `id` IN (9192001, 9192101, 9192102, 9192103, 9192401, 9192402, 9192403, 9192801, 9193101, 9293501, 9293502);
DELETE FROM `generic_scripts` WHERE `id` IN (8000001);
DELETE FROM `gameobject_scripts` WHERE `id` IN (4013143, 4013144, 4013145, 4013147, 4013148, 4013149);
-- The shared conditions go only once nothing names them: the other migration that writes them is then not applied either.
DELETE FROM `conditions` WHERE `condition_entry` = 230000 AND NOT EXISTS (SELECT 1 FROM `creature_ai_events` WHERE `condition_id` = 230000) AND NOT EXISTS (SELECT 1 FROM `creature_ai_scripts` WHERE `condition_id` = 230000) AND NOT EXISTS (SELECT 1 FROM `generic_scripts` WHERE `condition_id` = 230000) AND NOT EXISTS (SELECT 1 FROM `gameobject_scripts` WHERE `condition_id` = 230000) AND NOT EXISTS (SELECT 1 FROM `gossip_scripts` WHERE `condition_id` = 230000) AND NOT EXISTS (SELECT 1 FROM `event_scripts` WHERE `condition_id` = 230000) AND NOT EXISTS (SELECT 1 FROM `creature_movement_scripts` WHERE `condition_id` = 230000) AND NOT EXISTS (SELECT 1 FROM `quest_start_scripts` WHERE `condition_id` = 230000) AND NOT EXISTS (SELECT 1 FROM `quest_end_scripts` WHERE `condition_id` = 230000) AND NOT EXISTS (SELECT 1 FROM `spell_scripts` WHERE `condition_id` = 230000) AND NOT EXISTS (SELECT 1 FROM `gossip_menu` WHERE `condition_id` = 230000) AND NOT EXISTS (SELECT 1 FROM `gossip_menu_option` WHERE `condition_id` = 230000) AND NOT EXISTS (SELECT 1 FROM `gameobject_spawn_state` WHERE `condition_id` = 230000) AND NOT EXISTS (SELECT 1 FROM `areatrigger_generic_script` WHERE `condition_id` = 230000) AND NOT EXISTS (SELECT 1 FROM (SELECT * FROM `conditions`) c WHERE c.`type` < 0 AND 230000 IN (c.`value1`, c.`value2`, c.`value3`, c.`value4`));
