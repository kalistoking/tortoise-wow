-- Puts back what temple_of_ahnqiraj_as_rows.sql replaced, as t1_world had it when the migration
-- was written (scripts/tier2/a29_temple_of_ahnqiraj.py). The rows the migration added are removed.

UPDATE `creature_template` SET `ai_name` = '', `script_name` = 'mob_qiraji_mindslayer', `flags_extra` = 2097152 WHERE `entry` = 15246;
UPDATE `creature_template` SET `ai_name` = '', `script_name` = 'boss_huhuran', `flags_extra` = 2130433 WHERE `entry` = 15509;
UPDATE `creature_template` SET `ai_name` = '', `script_name` = 'mob_viscidus_glob', `flags_extra` = 2097152 WHERE `entry` = 15667;
UPDATE `creature_template` SET `ai_name` = '', `script_name` = 'mob_viscidus_trigger', `flags_extra` = 0 WHERE `entry` = 15922;
UPDATE `creature_template` SET `ai_name` = '', `script_name` = 'npc_ouro_spawner', `flags_extra` = 2097152 WHERE `entry` = 15957;
UPDATE `creature_template` SET `ai_name` = '', `script_name` = 'creature_vekniss_hatchling', `flags_extra` = 2097152 WHERE `entry` = 15962;
DELETE FROM `conditions` WHERE `condition_entry` IN (531001, 531002);
DELETE FROM `broadcast_text` WHERE `entry` IN (531101);
DELETE FROM `creature_ai_events` WHERE `id` IN (1524611, 1524612, 1524613, 1524614, 1550901, 1550902, 1550903, 1550904, 1550911, 1550912, 1550913, 1550914, 1550915, 1566701, 1571211, 1571212, 1571213, 1571811, 1571812, 1592201, 1595701, 1595702, 1595703, 1596201, 1596202, 1596203);
DELETE FROM `creature_ai_scripts` WHERE `id` IN (1524611, 1524612, 1524613, 1524614, 1550901, 1550902, 1550903, 1550904, 1550911, 1550912, 1550913, 1550914, 1550915, 1566701, 1571211, 1571212, 1571213, 1571811, 1571812, 1592201, 1595701, 1595702, 1595703, 1596201, 1596202, 1596203);
DELETE FROM `generic_scripts` WHERE `id` IN (5310001, 5310002, 5310003, 5310004);
INSERT INTO `creature_ai_events`
(`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`)
VALUES
(1524601, 15246, 0, 0, 0, 100, 13, 500, 500, 10000, 10000, 1524601, 0, 0, 'Qiraji Mindslayer - Periodic cast Cause Insanity');

INSERT INTO `creature_ai_scripts`
(`id`, `delay`, `priority`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`)
VALUES
(1524601, 0, 0, 15, 26079, 0, 0, 0, 0, 0, 1, 8, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Qiraji Mindslayer - Cast Spell Cause Insanity');

INSERT INTO `creature_ai_events`
(`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`)
VALUES
(1524602, 15246, 0, 0, 0, 100, 13, 3000, 3000, 10000, 10000, 1524602, 0, 0, 'Qiraji Mindslayer - Periodic cast Mana Burn');

INSERT INTO `creature_ai_scripts`
(`id`, `delay`, `priority`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`)
VALUES
(1524602, 0, 0, 15, 26049, 0, 0, 0, 0, 0, 0, 12, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Qiraji Mindslayer - Cast Spell Mana Burn');

INSERT INTO `creature_ai_events`
(`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`)
VALUES
(1524603, 15246, 0, 0, 0, 100, 13, 5000, 5000, 10000, 10000, 1524603, 0, 0, 'Qiraji Mindslayer - Periodic cast Mind Blast');

INSERT INTO `creature_ai_scripts`
(`id`, `delay`, `priority`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`)
VALUES
(1524603, 0, 0, 15, 26048, 0, 0, 0, 0, 0, 1, 8, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Qiraji Mindslayer - Cast Spell Mind Blast');

INSERT INTO `creature_ai_events`
(`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`)
VALUES
(1524604, 15246, 0, 0, 0, 100, 13, 7000, 7000, 10000, 10000, 1524604, 0, 0, 'Qiraji Mindslayer - Periodic cast Mind Flay');

INSERT INTO `creature_ai_scripts`
(`id`, `delay`, `priority`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`)
VALUES
(1524604, 0, 0, 15, 26044, 0, 0, 0, 0, 0, 1, 8, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Qiraji Mindslayer - Cast Spell Mind Flay');

INSERT INTO `creature_ai_events`
(`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`)
VALUES
(1571201, 15712, 0, 1, 0, 100, 1, 1000, 1000, 1000, 1000, 1571201, 0, 0, 'Dirt Mound - Cast Quake');

INSERT INTO `creature_ai_scripts`
(`id`, `delay`, `priority`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`)
VALUES
(1571201, 0, 0, 15, 26093, 0, 0, 0, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Dirt Mound - Cast Spell Quake');

INSERT INTO `creature_ai_events`
(`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`)
VALUES
(1571202, 15712, 0, 1, 0, 100, 0, 30000, 30000, 0, 0, 1571202, 0, 0, 'Dirt Mound - Cast Summon Ouro Scarabs and Forced Despawn');

INSERT INTO `creature_ai_scripts`
(`id`, `delay`, `priority`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`)
VALUES
(1571202, 0, 0, 15, 26060, 0, 0, 0, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Dirt Mound - Cast Spell Summon Ouro Scarabs'),
(1571202, 0, 0, 18, 1000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Dirt Mound - Despawn Self');

INSERT INTO `creature_ai_events`
(`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`)
VALUES
(1571801, 15718, 0, 11, 0, 100, 0, 0, 0, 0, 0, 1571801, 0, 0, 'Ouro Scarab - Set In combat with Zone on Spawn');

INSERT INTO `creature_ai_scripts`
(`id`, `delay`, `priority`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`)
VALUES
(1571801, 0, 0, 49, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Ouro Scarab - Combat Pulse');

INSERT INTO `creature_ai_events`
(`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`)
VALUES
(1571802, 15718, 0, 9, 0, 100, 13, 60, 120, 5000, 10000, 1571802, 0, 0, 'Ouro Scarab - Cast Summon Player at 60 Yards');

INSERT INTO `creature_ai_scripts`
(`id`, `delay`, `priority`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`)
VALUES
(1571802, 0, 0, 15, 20477, 1, 0, 0, 0, 0, 0, 8, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Ouro Scarab - Cast Spell Summon Player');

INSERT INTO `creature_ai_events`
(`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`)
VALUES
(1571803, 15718, 0, 0, 0, 100, 0, 45000, 45000, 0, 0, 1571803, 0, 0, 'Ouro Scarab - Forced Despawn on timer');

INSERT INTO `creature_ai_scripts`
(`id`, `delay`, `priority`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`)
VALUES
(1571803, 0, 0, 18, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Ouro Scarab - Despawn Self');

