-- AC5 prototype (trt E22, the director's yes of 2026-09-30): SCRIPT_COMMAND_SET_HEALTH (94) tried on
-- the Kobold Vermin of Northshire (6) -- the core of trt/module-structure with the command
-- (Install-Core-Build.ps1). Two rules beside its own aggro say:
--   602 on spawn: its maximum health to 500 (SET_HEALTH_MAX) -- a level-1 kobold with 500 hp;
--   603 at or below 50 %, every 5 s: back to full (SET_HEALTH_PERCENT 100), with a flex emote.
-- Undone by ac5_set_health_prototype_restore.sql. R8: a person applies it.
DELETE FROM `creature_ai_events` WHERE `id` IN (602, 603);
INSERT INTO `creature_ai_events`
(`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`)
VALUES
(602, 6, 0, 11, 0, 100, 0, 0, 0, 0, 0, 602, 0, 0, 'Kobold Vermin - AC5 prototype: max health 500 on spawn'),
(603, 6, 0, 2, 0, 100, 1, 50, 0, 5000, 5000, 603, 0, 0, 'Kobold Vermin - AC5 prototype: full health at 50%');
DELETE FROM `creature_ai_scripts` WHERE `id` IN (602, 603);
INSERT INTO `creature_ai_scripts`
(`id`, `delay`, `priority`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`)
VALUES
(602, 0, 0, 94, 500, 6, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Kobold Vermin - SET_HEALTH max 500'),
(603, 0, 0, 94, 100, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Kobold Vermin - SET_HEALTH 100%'),
(603, 0, 1, 1, 23, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Kobold Vermin - flex');
