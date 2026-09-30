-- AC3 prototype (trt E22, the director's yes of 2026-09-30): a gameobject's state as it spawns,
-- decided by rows from the map's saved data -- tried on the Deadmines' Factory Door (guid 30533),
-- with mod-deadmines switched off, so the Deadmines run on the generic instance store (AC7).
-- The core of trt/module-structure with gameobject_spawn_state (Install-Core-Build.ps1).
--   Rhahk'Zor's death rule (64402) already opens the door; it now also writes slot 2 = 3 (DONE).
--   The door's spawn row: open (state 0) when slot 2 is 3 (condition 3600103) -- so the door is
--   still open after the server restarts, and closed again in a new instance.
-- Only the state and the flags are in the prototype; despawn and a script at spawn come with the
-- full AC3. Undone by ac3_gameobject_spawn_state_prototype_restore.sql. R8: a person applies it.
CREATE TABLE IF NOT EXISTS `gameobject_spawn_state` (
  `guid` int unsigned NOT NULL COMMENT 'gameobject.guid',
  `ord` tinyint unsigned NOT NULL DEFAULT 0 COMMENT 'rows apply in this order; later rows win',
  `condition_id` int unsigned NOT NULL DEFAULT 0 COMMENT 'conditions.condition_entry, map-scoped only; 0 always',
  `state` tinyint NOT NULL DEFAULT -1 COMMENT '-1 keeps the spawn''s own; 0 active (open), 1 ready (closed), 2 alternative',
  `flags_set` int unsigned NOT NULL DEFAULT 0 COMMENT 'GAMEOBJECT_FLAGS to set',
  `flags_clear` int unsigned NOT NULL DEFAULT 0 COMMENT 'GAMEOBJECT_FLAGS to clear',
  `comment` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`guid`, `ord`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='trt E22, AC3: a gameobject''s state as it spawns';

DELETE FROM `conditions` WHERE `condition_entry` = 3600103;
INSERT INTO `conditions` (`condition_entry`, `type`, `value1`, `value2`, `value3`, `value4`, `flags`) VALUES
(3600103, 34, 2, 3, 0, 0, 0);

DELETE FROM `creature_ai_scripts` WHERE `id` = 64402 AND `command` = 37;
INSERT INTO `creature_ai_scripts`
(`id`, `delay`, `priority`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`)
VALUES
(64402, 0, 1, 37, 2, 3, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Rhahk''Zor - AC3 prototype: slot 2 = 3 (dead)');

DELETE FROM `gameobject_spawn_state` WHERE `guid` = 30533;
INSERT INTO `gameobject_spawn_state` (`guid`, `ord`, `condition_id`, `state`, `flags_set`, `flags_clear`, `comment`) VALUES
(30533, 0, 3600103, 0, 0, 0, 'Factory Door: open once Rhahk''Zor is dead (slot 2 = 3)');
