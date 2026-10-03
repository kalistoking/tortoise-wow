-- Puts back what gilneas_city_as_rows.sql replaced, as d6_world had it when the migration
-- was written (scripts/tier2/a10_gilneas_city.py). The rows the migration added are removed.

UPDATE `creature_template` SET `ai_name` = 'EventAI', `script_name` = 'boss_celia', `flags_extra` = 0 WHERE `entry` = 61263;
UPDATE `creature_template` SET `ai_name` = 'EventAI', `script_name` = 'boss_lord_mortimer', `flags_extra` = 0 WHERE `entry` = 61264;
UPDATE `creature_template` SET `ai_name` = '', `script_name` = 'greymane_knight', `flags_extra` = 0 WHERE `entry` = 61365;
UPDATE `creature_template` SET `ai_name` = '', `script_name` = 'greymane_noble', `flags_extra` = 0 WHERE `entry` = 61390;
UPDATE `creature_template` SET `ai_name` = '', `script_name` = 'genn_greymane', `flags_extra` = 0 WHERE `entry` = 61418;
UPDATE `creature_template` SET `ai_name` = 'EventAI', `script_name` = '', `flags_extra` = 0 WHERE `entry` = 61419;
UPDATE `creature_template` SET `ai_name` = '', `script_name` = '', `flags_extra` = 0 WHERE `entry` = 61421;
UPDATE `creature_template` SET `ai_name` = 'EventAI', `script_name` = '', `flags_extra` = 0 WHERE `entry` = 61422;
UPDATE `creature_template` SET `ai_name` = '', `script_name` = '', `flags_extra` = 0 WHERE `entry` = 61423;
DELETE FROM `broadcast_text` WHERE `entry` IN (815001, 815002, 815003, 815004, 815005, 815006, 815007, 815008, 815009, 815010, 815011, 815012);
DELETE FROM `creature_ai_events` WHERE `id` IN (6126301, 6126302, 6126303, 6126304, 6126305, 6126306, 6126307, 6126308, 6126309, 6126310, 6126401, 6126402, 6126403, 6126404, 6126405, 6126406, 6126407, 6126408, 6126409, 6136501, 6136502, 6139001, 6139002, 6141801, 6141802, 6141803, 6141804, 6141805, 6141806, 6141901, 6141902, 6142101, 6142102, 6142201, 6142202, 6142301, 6142302);
DELETE FROM `creature_ai_scripts` WHERE `id` IN (6126301, 6126302, 6126303, 6126304, 6126305, 6126306, 6126307, 6126308, 6126309, 6126310, 6126401, 6126402, 6126403, 6126404, 6126405, 6126406, 6126407, 6126408, 6126409, 6136501, 6136502, 6139001, 6139002, 6141801, 6141802, 6141803, 6141804, 6141805, 6141806, 6141901, 6141902, 6142101, 6142102, 6142201, 6142202, 6142301, 6142302);
DELETE FROM `generic_scripts` WHERE `id` IN (815001);
DELETE FROM `map_player_script` WHERE `map_id` = 815 AND `event` = 0 AND `script_id` = 815001;
INSERT INTO `creature_ai_events`
(`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`)
VALUES
(899712, 61390, 0, 2, 0, 25, 0, 90, 1, 0, 0, 899706, 0, 0, 'Gilneas NPC (Greymane) - Say at 90% HP');

INSERT INTO `creature_ai_events`
(`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`)
VALUES
(899708, 61365, 0, 2, 0, 25, 0, 90, 1, 0, 0, 899706, 0, 0, 'Gilneas NPC (Greymane) - Say at 90% HP');

INSERT INTO `creature_ai_events`
(`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`)
VALUES
(899705, 61418, 0, 2, 0, 100, 0, 50, 1, 0, 0, 899705, 0, 0, 'Genn Greymane - Say at 50% HP');

-- The shared conditions go only once nothing names them: the other migration that writes them is then not applied either.
DELETE FROM `conditions` WHERE `condition_entry` = 43001 AND NOT EXISTS (SELECT 1 FROM `creature_ai_events` WHERE `condition_id` = 43001) AND NOT EXISTS (SELECT 1 FROM `creature_ai_scripts` WHERE `condition_id` = 43001) AND NOT EXISTS (SELECT 1 FROM `generic_scripts` WHERE `condition_id` = 43001) AND NOT EXISTS (SELECT 1 FROM `gameobject_scripts` WHERE `condition_id` = 43001) AND NOT EXISTS (SELECT 1 FROM `gossip_scripts` WHERE `condition_id` = 43001) AND NOT EXISTS (SELECT 1 FROM `event_scripts` WHERE `condition_id` = 43001) AND NOT EXISTS (SELECT 1 FROM `creature_movement_scripts` WHERE `condition_id` = 43001) AND NOT EXISTS (SELECT 1 FROM `quest_start_scripts` WHERE `condition_id` = 43001) AND NOT EXISTS (SELECT 1 FROM `quest_end_scripts` WHERE `condition_id` = 43001) AND NOT EXISTS (SELECT 1 FROM `spell_scripts` WHERE `condition_id` = 43001) AND NOT EXISTS (SELECT 1 FROM `gossip_menu` WHERE `condition_id` = 43001) AND NOT EXISTS (SELECT 1 FROM `gossip_menu_option` WHERE `condition_id` = 43001) AND NOT EXISTS (SELECT 1 FROM (SELECT * FROM `conditions`) c WHERE c.`type` < 0 AND 43001 IN (c.`value1`, c.`value2`, c.`value3`, c.`value4`));
