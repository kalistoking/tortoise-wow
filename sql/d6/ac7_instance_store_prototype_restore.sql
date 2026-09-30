-- Undoes ac7_instance_store_prototype.sql.
DELETE FROM `conditions` WHERE `condition_entry` = 822002;
DELETE FROM `creature_ai_scripts` WHERE `id` = 6313003 AND `command` = 37;
DELETE FROM `creature_ai_events` WHERE `id` = 3651904;
DELETE FROM `creature_ai_scripts` WHERE `id` = 3651904;
