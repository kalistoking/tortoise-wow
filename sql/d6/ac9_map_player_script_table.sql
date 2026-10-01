-- AC9's table alone (trt E22): map_player_script, which the core reads at start. No rows: a world
-- with no map player scripts starts with it. The rows come with ac9_map_player_script_prototype.sql
-- (TC66) and the migrations that use it (A36, A20, A10). R8: a person applies it.
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
