-- AC9 prototype (trt E22): a map's rows for a player entering it or leaving it, tried on the
-- Deadmines (map 36). The rows run beside the instance's C++ (OnPlayerEnter, OnPlayerLeave), so
-- mod-deadmines may stay on.
-- The core of trt/module-structure with map_player_script (Install-Core-Build.ps1).
--   Entering, alive (flag 1): generic script 3690001 -- Mark of the Wild on the player at once,
--   Arcane Intellect 5 s later (both triggered).
--   Leaving: generic script 3690002 -- Mark of the Wild taken off, its one step at once (a leave
--   script runs only those: by a later step's time the player is on another map). Arcane Intellect
--   stays.
-- Undone by ac9_map_player_script_prototype_restore.sql. R8: a person applies it.
CREATE TABLE IF NOT EXISTS `map_player_script` (
  `map_id` int unsigned NOT NULL COMMENT 'map_template.entry',
  `event` tinyint unsigned NOT NULL DEFAULT 0 COMMENT '0 a player enters the map, 1 one leaves it (its steps at once only)',
  `script_id` int unsigned NOT NULL COMMENT 'generic_scripts.id; the player is its source and target',
  `condition_id` int unsigned NOT NULL DEFAULT 0 COMMENT 'conditions.condition_entry, of the player and the map; 0 always',
  `flags` int unsigned NOT NULL DEFAULT 0 COMMENT '0x1 alive only, 0x2 not for a game master',
  `comment` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`map_id`, `event`, `script_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='trt E22, AC9: a map starting rows for a player entering or leaving it';

DELETE FROM `generic_scripts` WHERE `id` IN (3690001, 3690002);
INSERT INTO `generic_scripts`
(`id`, `delay`, `priority`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`)
VALUES
(3690001, 0, 0, 15, 1126, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Deadmines entered - AC9 prototype: Mark of the Wild on the player'),
(3690001, 5, 0, 15, 1460, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Deadmines entered - AC9 prototype: Arcane Intellect on the player, 5 s later'),
(3690002, 0, 0, 14, 1126, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Deadmines left - AC9 prototype: Mark of the Wild taken off');

DELETE FROM `map_player_script` WHERE `map_id` = 36;
INSERT INTO `map_player_script` (`map_id`, `event`, `script_id`, `condition_id`, `flags`, `comment`) VALUES
(36, 0, 3690001, 0, 1, 'Deadmines entered: Mark of the Wild, Arcane Intellect 5 s later'),
(36, 1, 3690002, 0, 0, 'Deadmines left: Mark of the Wild taken off');
