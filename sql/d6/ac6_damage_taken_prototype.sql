-- AC6 prototype (trt E22, the director's yes of 2026-09-30): EVENT_T_DAMAGE_TAKEN (37) tried in
-- Northshire -- the core of trt/module-structure with the event (Install-Core-Build.ps1).
--   Kobold Laborer (80), rule 8003: every hit absorbed (p1 100, p2 2 absorb), unless the attacker
--   has Power Word: Fortitude (condition 800301: the aura 1243, reversed -- read of the attacker,
--   the rule's invoker). The Blood Raven's shape (absorb unless the attacker has Blue Moon).
--   Defias Thug (38), rule 3803: the killing blow stops at 1 health (p1 0, p2 1 clamp), once
--   (not repeatable), with a roar; the next killing blow kills.
-- Undone by ac6_damage_taken_prototype_restore.sql. R8: a person applies it.
DELETE FROM `conditions` WHERE `condition_entry` = 800301;
-- conditions has a unique key on the values: where a row with the same ones is there already,
-- that row is taken (INSERT IGNORE skips ours) and its entry used below.
INSERT IGNORE INTO `conditions` (`condition_entry`, `type`, `value1`, `value2`, `value3`, `value4`, `flags`) VALUES
(800301, 1, 1243, 0, 0, 0, 1);
SET @no_fortitude := (SELECT `condition_entry` FROM `conditions` WHERE `type` = 1 AND `value1` = 1243 AND `value2` = 0 AND `value3` = 0 AND `value4` = 0 AND `flags` = 1 LIMIT 1);
DELETE FROM `creature_ai_events` WHERE `id` IN (8003, 3803);
INSERT INTO `creature_ai_events`
(`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`)
VALUES
(8003, 80, @no_fortitude, 37, 0, 100, 1, 100, 2, 0, 0, 0, 0, 0, 'Kobold Laborer - AC6 prototype: absorb every hit unless the attacker has Power Word: Fortitude'),
(3803, 38, 0, 37, 0, 100, 0, 0, 1, 0, 0, 3803, 0, 0, 'Defias Thug - AC6 prototype: the killing blow stops at 1 health, once');
DELETE FROM `creature_ai_scripts` WHERE `id` = 3803;
INSERT INTO `creature_ai_scripts`
(`id`, `delay`, `priority`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`)
VALUES
(3803, 0, 0, 1, 15, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Defias Thug - roar');
