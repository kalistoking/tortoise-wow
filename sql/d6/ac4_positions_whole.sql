-- AC4 whole (trt E22, on the director's standing yes of 2026-10-01): TEMP_SUMMON_CREATURE's position
-- type (dataint bits 16-23) now reads one numbering with MOVE_TO, SUMMON_OBJECT and TELEPORT_TO
-- (eScriptPosition, core `90211cdb`): the prototype's polar summon from the source, type 1, is type
-- 5 -- 1 is an offset from the target now. Every summon row the prototype's numbering wrote moves;
-- in t1_world, the Storm Guardian's three residues (ac4_polar_summon_prototype.sql).
-- Undone by ac4_positions_whole_restore.sql. R8: a person applies it.
UPDATE `creature_ai_scripts` SET `dataint` = (`dataint` & ~0xFF0000) | (5 << 16) WHERE `command` = 10 AND ((`dataint` >> 16) & 0xFF) = 1;
UPDATE `generic_scripts` SET `dataint` = (`dataint` & ~0xFF0000) | (5 << 16) WHERE `command` = 10 AND ((`dataint` >> 16) & 0xFF) = 1;
UPDATE `gameobject_scripts` SET `dataint` = (`dataint` & ~0xFF0000) | (5 << 16) WHERE `command` = 10 AND ((`dataint` >> 16) & 0xFF) = 1;
UPDATE `event_scripts` SET `dataint` = (`dataint` & ~0xFF0000) | (5 << 16) WHERE `command` = 10 AND ((`dataint` >> 16) & 0xFF) = 1;
UPDATE `gossip_scripts` SET `dataint` = (`dataint` & ~0xFF0000) | (5 << 16) WHERE `command` = 10 AND ((`dataint` >> 16) & 0xFF) = 1;
UPDATE `creature_movement_scripts` SET `dataint` = (`dataint` & ~0xFF0000) | (5 << 16) WHERE `command` = 10 AND ((`dataint` >> 16) & 0xFF) = 1;
UPDATE `quest_start_scripts` SET `dataint` = (`dataint` & ~0xFF0000) | (5 << 16) WHERE `command` = 10 AND ((`dataint` >> 16) & 0xFF) = 1;
UPDATE `quest_end_scripts` SET `dataint` = (`dataint` & ~0xFF0000) | (5 << 16) WHERE `command` = 10 AND ((`dataint` >> 16) & 0xFF) = 1;
UPDATE `spell_scripts` SET `dataint` = (`dataint` & ~0xFF0000) | (5 << 16) WHERE `command` = 10 AND ((`dataint` >> 16) & 0xFF) = 1;
UPDATE `creature_spells_scripts` SET `dataint` = (`dataint` & ~0xFF0000) | (5 << 16) WHERE `command` = 10 AND ((`dataint` >> 16) & 0xFF) = 1;
