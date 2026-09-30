-- Puts back what razorfen_kraul_as_rows.sql replaced, as t1_world had it when the migration
-- was written (scripts/tier2/a08_razorfen_kraul.py). The rows the migration added are removed.

UPDATE `creature_template` SET `ai_name` = 'EventAI', `script_name` = 'razorfen_defender', `flags_extra` = 0 WHERE `entry` = 4442;
DELETE FROM `conditions` WHERE `condition_entry` IN (47001);
DELETE FROM `creature_ai_events` WHERE `id` IN (444201, 444203, 444205, 444206);
DELETE FROM `creature_ai_scripts` WHERE `id` IN (444201, 444203, 444205, 444206);
DELETE FROM `creature_ai_scripts` WHERE `id` = 462501 AND `command` = 37 AND `comments` = 'Death''s Head Ward Keeper - one more dead, slot 2 (A8)';
DELETE FROM `creature_ai_scripts` WHERE `id` = 462501 AND `command` = 11 AND `comments` = 'Death''s Head Ward Keeper - the second opens Agathelos''s ward (A8)';
DELETE FROM `creature_ai_scripts` WHERE `id` = 462501 AND `command` = 25 AND `comments` = 'Agathelos the Raging - running, the ward open (A8)';
DELETE FROM `creature_ai_scripts` WHERE `id` = 462501 AND `command` = 20 AND `comments` = 'Agathelos the Raging - off along his path, the ward open (A8)';
UPDATE `creature_ai_events` SET `event_type` = 9, `event_flags` = 13, `event_param1` = 0, `event_param2` = 5, `event_param3` = 12000, `event_param4` = 17000 WHERE `id` = 444202;
DELETE FROM `gameobject_spawn_state` WHERE `guid` = 35698 AND `ord` = 0;
