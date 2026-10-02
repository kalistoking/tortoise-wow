-- Puts back what scarlet_monastery_as_rows.sql replaced, as d6_world had it when the migration
-- was written (scripts/tier2/a15_scarlet_monastery.py). The rows the migration added are removed.

UPDATE `creature_template` SET `ai_name` = '', `script_name` = 'boss_houndmaster_loksey', `flags_extra` = 0 WHERE `entry` = 3974;
UPDATE `creature_template` SET `ai_name` = '', `script_name` = 'boss_herod', `flags_extra` = 0 WHERE `entry` = 3975;
UPDATE `creature_template` SET `ai_name` = '', `script_name` = 'boss_interrogator_vishas', `flags_extra` = 0 WHERE `entry` = 3983;
UPDATE `creature_template` SET `ai_name` = '', `script_name` = 'boss_high_inquisitor_fairbanks', `flags_extra` = 2 WHERE `entry` = 4542;
UPDATE `creature_template` SET `ai_name` = '', `script_name` = 'boss_bloodmage_thalnos', `flags_extra` = 0 WHERE `entry` = 4543;
UPDATE `creature_template` SET `ai_name` = '', `script_name` = 'boss_arcanist_doan', `flags_extra` = 0 WHERE `entry` = 6487;
UPDATE `creature_template` SET `ai_name` = '', `script_name` = 'boss_scorn', `flags_extra` = 0 WHERE `entry` = 14693;
DELETE FROM `conditions` WHERE `condition_entry` IN (189001, 189004, 189005);
DELETE FROM `broadcast_text` WHERE `entry` IN (397401, 397501, 397503, 397504, 397505, 397508, 397513, 398301, 398302, 398303, 398304, 398306, 454301, 454302, 454303, 648701, 648702);
DELETE FROM `creature_ai_events` WHERE `id` IN (397401, 397402, 397501, 397502, 397503, 397504, 397506, 397507, 397508, 397509, 397511, 398301, 398302, 398303, 398304, 398305, 398306, 429590, 454201, 454202, 454203, 454204, 454205, 454206, 454207, 454301, 454302, 454303, 454304, 454305, 454306, 454307, 648701, 648702, 648703, 648704, 648705, 1469301, 1469302, 1469303, 1469304);
DELETE FROM `creature_ai_scripts` WHERE `id` IN (397401, 397402, 397501, 397502, 397503, 397504, 397506, 397507, 397508, 397509, 397511, 398301, 398302, 398303, 398304, 398305, 398306, 429590, 454201, 454202, 454203, 454204, 454205, 454206, 454207, 454301, 454302, 454303, 454304, 454305, 454306, 454307, 648701, 648702, 648703, 648704, 648705, 1469301, 1469302, 1469303, 1469304);
DELETE FROM `generic_scripts` WHERE `id` IN (397510, 397511, 397512, 397513, 397514, 397515, 397516, 397517, 397518);
UPDATE `creature` SET `movement_type` = 0 WHERE `guid` = 39850;
DELETE FROM `creature_movement` WHERE `id` = 39850 AND `point` = 1;
DELETE FROM `creature_movement` WHERE `id` = 39850 AND `point` = 2;
DELETE FROM `creature_movement` WHERE `id` = 39850 AND `point` = 3;
DELETE FROM `creature_movement` WHERE `id` = 39850 AND `point` = 4;
DELETE FROM `creature_movement` WHERE `id` = 39850 AND `point` = 5;
DELETE FROM `creature_movement` WHERE `id` = 39850 AND `point` = 6;
DELETE FROM `creature_movement` WHERE `id` = 39850 AND `point` = 7;
DELETE FROM `creature_movement` WHERE `id` = 39850 AND `point` = 8;
DELETE FROM `creature_movement` WHERE `id` = 39850 AND `point` = 9;
DELETE FROM `creature_movement` WHERE `id` = 39850 AND `point` = 10;
-- The shared conditions go only once nothing names them: the other migration that writes them is then not applied either.
DELETE FROM `conditions` WHERE `condition_entry` = 189002 AND NOT EXISTS (SELECT 1 FROM `creature_ai_events` WHERE `condition_id` = 189002) AND NOT EXISTS (SELECT 1 FROM `creature_ai_scripts` WHERE `condition_id` = 189002) AND NOT EXISTS (SELECT 1 FROM `generic_scripts` WHERE `condition_id` = 189002) AND NOT EXISTS (SELECT 1 FROM `gameobject_scripts` WHERE `condition_id` = 189002) AND NOT EXISTS (SELECT 1 FROM `gossip_scripts` WHERE `condition_id` = 189002) AND NOT EXISTS (SELECT 1 FROM `event_scripts` WHERE `condition_id` = 189002) AND NOT EXISTS (SELECT 1 FROM `creature_movement_scripts` WHERE `condition_id` = 189002) AND NOT EXISTS (SELECT 1 FROM `quest_start_scripts` WHERE `condition_id` = 189002) AND NOT EXISTS (SELECT 1 FROM `quest_end_scripts` WHERE `condition_id` = 189002) AND NOT EXISTS (SELECT 1 FROM `spell_scripts` WHERE `condition_id` = 189002) AND NOT EXISTS (SELECT 1 FROM `gossip_menu` WHERE `condition_id` = 189002) AND NOT EXISTS (SELECT 1 FROM `gossip_menu_option` WHERE `condition_id` = 189002) AND NOT EXISTS (SELECT 1 FROM (SELECT * FROM `conditions`) c WHERE c.`type` < 0 AND 189002 IN (c.`value1`, c.`value2`, c.`value3`, c.`value4`));
