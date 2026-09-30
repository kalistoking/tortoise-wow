-- AC2 prototype (trt E22, the director's yes of 2026-09-30): EVENT_T_SPELL_HIT_TARGET (36) tried on
-- the Kobold Worker of Northshire (257) -- the core of trt/module-structure with the event
-- (Install-Core-Build.ps1). Two rules beside its own aggro say:
--   25702 in combat, every 5 s: Strike (11976) on its victim;
--   25703 its own Strike hitting a player (event 36: spell 11976, unit hit 1 = a player): it cheers.
-- A Strike that misses, or is dodged or parried, is no hit and gets no cheer.
-- Undone by ac2_spell_hit_target_prototype_restore.sql. R8: a person applies it.
DELETE FROM `creature_ai_events` WHERE `id` IN (25702, 25703);
INSERT INTO `creature_ai_events`
(`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`)
VALUES
(25702, 257, 0, 0, 0, 100, 1, 2000, 2000, 5000, 5000, 25702, 0, 0, 'Kobold Worker - AC2 prototype: Strike every 5 s'),
(25703, 257, 0, 36, 0, 100, 1, 11976, 1, 0, 0, 25703, 0, 0, 'Kobold Worker - AC2 prototype: its Strike hit a player');
DELETE FROM `creature_ai_scripts` WHERE `id` IN (25702, 25703);
INSERT INTO `creature_ai_scripts`
(`id`, `delay`, `priority`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`)
VALUES
(25702, 0, 0, 15, 11976, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Kobold Worker - Strike on its victim'),
(25703, 0, 0, 1, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Kobold Worker - cheer');
