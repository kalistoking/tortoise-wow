-- AC1 whole (trt E22, the director's sign-off of 2026-09-30): a root said by the aura idiom and
-- SCRIPT_COMMAND_UNIT_STATE (95) for what no aura says -- the core of trt/module-structure from
-- c955df09. Tried on the Kobold Tunneler of Echo Ridge (475), rule 47502 on aggro:
--   ADD_AURA 17507 (Passive Root): it stays where it is;
--   UNIT_STATE add (datalong 1) 0x20000000 (datalong2, can't rotate): it does not turn to face its
--   attacker. The mask is in datalong2: datalong is a mediumint, too narrow for the bits.
-- Evade takes both off before the walk home (the aura by RemoveAurasAtReset, the bit by
-- MoveTargetedHome); death does too. Undone by ac1_unit_state_whole_restore.sql. R8: a person
-- applies it.
DELETE FROM `creature_ai_events` WHERE `id` = 47502;
INSERT INTO `creature_ai_events`
(`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`)
VALUES
(47502, 475, 0, 4, 0, 100, 0, 0, 0, 0, 0, 47502, 0, 0, 'Kobold Tunneler - AC1 whole: rooted and not turning, on aggro');
DELETE FROM `creature_ai_scripts` WHERE `id` = 47502;
INSERT INTO `creature_ai_scripts`
(`id`, `delay`, `priority`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`)
VALUES
(47502, 0, 0, 74, 17507, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Kobold Tunneler - Passive Root on itself'),
(47502, 0, 1, 95, 1, 536870912, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Kobold Tunneler - can''t rotate');
