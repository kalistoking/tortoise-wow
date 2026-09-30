-- AC3 whole (trt E22, the director's sign-off of 2026-09-30): gameobject_spawn_state's two more
-- columns -- the core of trt/module-structure from a8067af0, which reads them (apply before it
-- starts: without them it loads no spawn state). Apply after ac3_gameobject_spawn_state_prototype.sql.
--   despawn: the object is not spawned while the row's condition holds (a script's
--            LOAD_GAMEOBJECT still loads it);
--   script_id: a generic script started at spawn, the object its source and target.
-- Tried in the Deadmines with mod-deadmines off, on the slot the prototype writes (Rhahk'Zor, 2 = 3,
-- condition taken by its values -- 3704 in t1_world):
--   the Door Lever beside the Factory Door (guid 26188) is not there once Rhahk'Zor is dead;
--   the Factory Door, spawning open, starts script 3053301: a Rat beside it for 60 s.
-- Undone by ac3_gameobject_spawn_state_whole_restore.sql. R8: a person applies it.
ALTER TABLE `gameobject_spawn_state`
  ADD COLUMN IF NOT EXISTS `despawn` tinyint unsigned NOT NULL DEFAULT 0 COMMENT '1: not spawned while the condition holds' AFTER `flags_clear`,
  ADD COLUMN IF NOT EXISTS `script_id` int unsigned NOT NULL DEFAULT 0 COMMENT 'generic_scripts.id started at spawn, the object source and target' AFTER `despawn`;

SET @rhahkzor_dead := (SELECT `condition_entry` FROM `conditions` WHERE `type` = 34 AND `value1` = 2 AND `value2` = 3
  AND `value3` = 0 AND `value4` = 0 AND `flags` = 0 LIMIT 1);

DELETE FROM `generic_scripts` WHERE `id` = 3053301;
INSERT INTO `generic_scripts`
(`id`, `delay`, `priority`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`)
VALUES
(3053301, 0, 0, 10, 4075, 60000, 0, 0, 0, 0, 0, 0, 0, 0, -1, 3, 0, 0, 0, 0, 0, 'Factory Door - AC3 whole: a Rat beside it for 60 s, at spawn');

UPDATE `gameobject_spawn_state` SET `script_id` = 3053301 WHERE `guid` = 30533 AND `ord` = 0;
DELETE FROM `gameobject_spawn_state` WHERE `guid` = 26188;
INSERT INTO `gameobject_spawn_state` (`guid`, `ord`, `condition_id`, `state`, `flags_set`, `flags_clear`, `despawn`, `script_id`, `comment`) VALUES
(26188, 0, @rhahkzor_dead, -1, 0, 0, 1, 0, 'Door Lever: not there once Rhahk''Zor is dead (slot 2 = 3)');
