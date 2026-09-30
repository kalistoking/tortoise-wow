-- Puts back what shadowfang_keep_as_rows.sql replaced, as t1_world had it when the migration
-- was written (scripts/tier2/a32_shadowfang_keep.py). The rows the migration added are removed.

DELETE FROM `conditions` WHERE `condition_entry` IN (33001, 33002, 33003, 33004, 33005);
DELETE FROM `creature_ai_events` WHERE `id` IN (444408, 1000001);
DELETE FROM `creature_ai_scripts` WHERE `id` IN (444408, 1000001);
DELETE FROM `creature_ai_scripts` WHERE `id` = 392705 AND `command` = 11 AND `comments` = 'Wolf Master Nandos - open Arugal''s Door (A32)';
DELETE FROM `creature_ai_scripts` WHERE `id` = 462704 AND `command` = 37 AND `comments` = 'Arugal''s Voidwalker - one more dead, slot 7 (A32)';
DELETE FROM `creature_ai_scripts` WHERE `id` = 462704 AND `command` = 11 AND `comments` = 'Arugal''s Voidwalker - the fourth opens the Sorcerer''s Door (A32)';
DELETE FROM `gameobject_spawn_state` WHERE `guid` = 20835 AND `ord` = 0;
DELETE FROM `gameobject_spawn_state` WHERE `guid` = 33785 AND `ord` = 0;
DELETE FROM `gameobject_spawn_state` WHERE `guid` = 33241 AND `ord` = 0;
