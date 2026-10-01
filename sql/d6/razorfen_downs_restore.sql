-- Puts back what razorfen_downs_as_rows.sql replaced, as t1_world had it when the migration
-- was written (scripts/tier2/a35_razorfen_downs.py). The rows the migration added are removed.

UPDATE `creature_template` SET `ai_name` = '', `script_name` = 'npc_tomb_creature', `flags_extra` = 0, `gossip_menu_id` = 0 WHERE `entry` = 7349;
UPDATE `creature_template` SET `ai_name` = '', `script_name` = 'npc_tomb_creature', `flags_extra` = 0, `gossip_menu_id` = 0 WHERE `entry` = 7351;
UPDATE `creature_template` SET `ai_name` = '', `script_name` = 'npc_henry_stern', `flags_extra` = 2, `gossip_menu_id` = 0 WHERE `entry` = 8696;
UPDATE `creature_template` SET `ai_name` = '', `script_name` = 'boss_lady_faltheress', `flags_extra` = 0, `gossip_menu_id` = 0 WHERE `entry` = 14686;
DELETE FROM `conditions` WHERE `condition_entry` IN (129001, 129009, 129010, 129014, 129015, 129030, 129031, 129032, 129033, 129034, 129035);
DELETE FROM `creature_ai_events` WHERE `id` IN (734901, 735101, 1468601);
DELETE FROM `creature_ai_scripts` WHERE `id` IN (734901, 735101, 1468601);
DELETE FROM `generic_scripts` WHERE `id` IN (734950, 734951);
DELETE FROM `gameobject_scripts` WHERE `id` IN (32045);
DELETE FROM `gossip_scripts` WHERE `id` IN (869601, 869602);
DELETE FROM `instance_data_slot` WHERE `map` = 129 AND `slot` = 1;
DELETE FROM `gossip_menu` WHERE `entry` = 869601 AND `text_id` = 2114;
DELETE FROM `gossip_menu_option` WHERE `menu_id` = 869600 AND `id` = 0;
DELETE FROM `gossip_menu` WHERE `entry` = 869602 AND `text_id` = 2115;
DELETE FROM `gossip_menu_option` WHERE `menu_id` = 869600 AND `id` = 1;
