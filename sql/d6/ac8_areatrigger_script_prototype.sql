-- AC8 prototype (trt E22, the director's yes of 2026-09-30): an area trigger starting rows, tried on
-- the Deadmines' trigger 3746 just past the entrance (no C++, no quest, no teleport on it), with
-- mod-deadmines switched off, so "once" is data in the generic instance store (AC7).
-- The core of trt/module-structure with areatrigger_generic_script (Install-Core-Build.ps1).
--   Stepping in, alive (flag 1), while slot 3 is 0 (condition 3600104): generic script 3746 --
--   step 0 claims slot 3 = 1, step 1 casts Power Word: Fortitude on the player (triggered).
--   Once per instance: a second walk through, or a second player, gets nothing.
-- Known for the full AC8: the condition is read as the player steps in, the claim runs at the
-- next map update, so two players in the same tick would both pass.
-- Undone by ac8_areatrigger_script_prototype_restore.sql. R8: a person applies it.
CREATE TABLE IF NOT EXISTS `areatrigger_generic_script` (
  `trigger_id` int unsigned NOT NULL COMMENT 'areatrigger_template.id',
  `script_id` int unsigned NOT NULL COMMENT 'generic_scripts.id; the player is its source and target',
  `condition_id` int unsigned NOT NULL DEFAULT 0 COMMENT 'conditions.condition_entry, of the player; 0 always',
  `flags` int unsigned NOT NULL DEFAULT 0 COMMENT '0x1 alive only, 0x2 not for a game master',
  `comment` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`trigger_id`, `script_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='trt E22, AC8: an area trigger starting rows';

DELETE FROM `conditions` WHERE `condition_entry` = 3600104;
-- conditions has a unique key on the values: where a row with the same ones is there already,
-- that row is taken (INSERT IGNORE skips ours) and its entry used below.
INSERT IGNORE INTO `conditions` (`condition_entry`, `type`, `value1`, `value2`, `value3`, `value4`, `flags`) VALUES
(3600104, 34, 3, 0, 0, 0, 0);
SET @not_claimed := (SELECT `condition_entry` FROM `conditions` WHERE `type` = 34 AND `value1` = 3 AND `value2` = 0 AND `value3` = 0 AND `value4` = 0 AND `flags` = 0 LIMIT 1);

DELETE FROM `generic_scripts` WHERE `id` = 3746;
INSERT INTO `generic_scripts`
(`id`, `delay`, `priority`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`)
VALUES
(3746, 0, 0, 37, 3, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Deadmines entrance - AC8 prototype: slot 3 = 1 (claimed)'),
(3746, 0, 1, 15, 1243, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Deadmines entrance - AC8 prototype: Power Word: Fortitude on the player');

DELETE FROM `areatrigger_generic_script` WHERE `trigger_id` = 3746;
INSERT INTO `areatrigger_generic_script` (`trigger_id`, `script_id`, `condition_id`, `flags`, `comment`) VALUES
(3746, 3746, @not_claimed, 1, 'Deadmines entrance: Power Word: Fortitude, once per instance');
