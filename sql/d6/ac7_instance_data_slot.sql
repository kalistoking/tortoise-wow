-- AC7 whole (trt E22, the director's sign-off of 2026-09-30): instance_data_slot, the generic
-- instance store's slots named and described -- the core of trt/module-structure (a926038b on).
--   flags 0x1: a slot left at 1 (IN_PROGRESS) goes back to 0 as the instance loads;
--   flags 0x2: a slot at 1 (IN_PROGRESS) is an encounter in progress -- a raid is not entered.
--   name: for trt, whose bench says "instance data 0 (Hailar the Frigid dead) = 1".
-- The slots the prototypes write: Frostmane Hollow's (AC7), the Deadmines' with mod-deadmines off
-- (AC3, AC8). Undone by ac7_instance_data_slot_restore.sql. R8: a person applies it.
CREATE TABLE IF NOT EXISTS `instance_data_slot` (
  `map` smallint unsigned NOT NULL COMMENT 'map_template.entry, a dungeon or raid',
  `slot` tinyint unsigned NOT NULL COMMENT 'the generic store''s slot, 0-63',
  `flags` int unsigned NOT NULL DEFAULT 0 COMMENT '0x1 IN_PROGRESS back to 0 on load, 0x2 an encounter',
  `name` varchar(100) NOT NULL DEFAULT '' COMMENT 'for the tools',
  PRIMARY KEY (`map`, `slot`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='trt E22, AC7: the generic instance store''s slots';

DELETE FROM `instance_data_slot` WHERE (`map`, `slot`) IN ((822, 0), (36, 2), (36, 3));
INSERT INTO `instance_data_slot` (`map`, `slot`, `flags`, `name`) VALUES
(822, 0, 0, 'Hailar the Frigid dead'),
(36, 2, 0, 'Rhahk''Zor (3 done)'),
(36, 3, 0, 'entrance Fortitude given');
