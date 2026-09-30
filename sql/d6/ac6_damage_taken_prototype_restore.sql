-- Undoes ac6_damage_taken_prototype.sql.
DELETE FROM `conditions` WHERE `condition_entry` = 800301;
DELETE FROM `creature_ai_events` WHERE `id` IN (8003, 3803);
DELETE FROM `creature_ai_scripts` WHERE `id` = 3803;
