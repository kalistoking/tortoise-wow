-- AC7 prototype (trt E22, the director's yes of 2026-09-30): the generic instance store tried in
-- Frostmane Hollow (map 822), which has no instance script -- the core of trt/module-structure
-- with the store (Install-Core-Build.ps1). Apply after frostmane_hollow_as_rows.sql.
--   Hailar's death rule (6313003) writes slot 0 = 1 (SET_INST_DATA);
--   the ritualists (36519) read it (CONDITION_INSTANCE_DATA 822002: slot 0 equal to 1): every 5 s
--   out of combat, they cry -- only once Hailar is dead in this instance.
-- `.debug instancedata 0` reads the slot; the store is saved in characters' `instance`.`data`.
-- Undone by ac7_instance_store_prototype_restore.sql. R8: a person applies it.
DELETE FROM `conditions` WHERE `condition_entry` = 822002;
INSERT INTO `conditions` (`condition_entry`, `type`, `value1`, `value2`, `value3`, `value4`, `flags`) VALUES
(822002, 34, 0, 1, 0, 0, 0);
DELETE FROM `creature_ai_scripts` WHERE `id` = 6313003 AND `command` = 37;
INSERT INTO `creature_ai_scripts`
(`id`, `delay`, `priority`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`)
VALUES
(6313003, 0, 1, 37, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Hailar the Frigid - AC7 prototype: slot 0 = 1 (dead)');
DELETE FROM `creature_ai_events` WHERE `id` = 3651904;
INSERT INTO `creature_ai_events`
(`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`)
VALUES
(3651904, 36519, 822002, 1, 0, 100, 1, 5000, 5000, 5000, 5000, 3651904, 0, 0, 'Frostmane Ritualist - AC7 prototype: cry once Hailar is dead (slot 0 = 1)');
DELETE FROM `creature_ai_scripts` WHERE `id` = 3651904;
INSERT INTO `creature_ai_scripts`
(`id`, `delay`, `priority`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`)
VALUES
(3651904, 0, 0, 1, 18, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Frostmane Ritualist - cry');
