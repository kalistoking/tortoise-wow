-- Puts back what naxxramas_as_rows.sql replaced, as t1_world had it when the migration
-- was written (scripts/tier2/a30_naxxramas.py). The rows the migration added are removed.

UPDATE `creature_template` SET `ai_name` = '', `script_name` = 'mob_diseased_maggot', `flags_extra` = 0, `call_for_help_range` = 0.5, `detection_range` = 20, `leash_range` = 0 WHERE `entry` = 16056;
UPDATE `creature_template` SET `ai_name` = '', `script_name` = 'mob_rotting_maggot', `flags_extra` = 0, `call_for_help_range` = 0.5, `detection_range` = 20, `leash_range` = 0 WHERE `entry` = 16057;
UPDATE `creature_template` SET `ai_name` = '', `script_name` = 'mob_shadow_fissure', `flags_extra` = 2, `call_for_help_range` = 5, `detection_range` = 18, `leash_range` = 0 WHERE `entry` = 16129;
UPDATE `creature_template` SET `ai_name` = '', `script_name` = 'dark_touched_warriorAI', `flags_extra` = 2097152, `call_for_help_range` = 5, `detection_range` = 20, `leash_range` = 0 WHERE `entry` = 16156;
UPDATE `creature_template` SET `ai_name` = '', `script_name` = 'spirit_of_naxxramas_ai', `flags_extra` = 2101248, `call_for_help_range` = 5, `detection_range` = 20, `leash_range` = 0 WHERE `entry` = 16164;
UPDATE `creature_template` SET `ai_name` = '', `script_name` = 'naxxramas_gargoyle_ai', `flags_extra` = 2101248, `call_for_help_range` = 5, `detection_range` = 20, `leash_range` = 0 WHERE `entry` = 16168;
UPDATE `creature_template` SET `ai_name` = '', `script_name` = 'naxxramas_plague_slime_ai', `flags_extra` = 2097664, `call_for_help_range` = 5, `detection_range` = 20, `leash_range` = 0 WHERE `entry` = 16243;
UPDATE `creature_template` SET `ai_name` = '', `script_name` = 'toxic_tunnel_ai', `flags_extra` = 2, `call_for_help_range` = 5, `detection_range` = 18, `leash_range` = 0 WHERE `entry` = 16400;
UPDATE `creature_template` SET `ai_name` = '', `script_name` = 'naxxramas_gargoyle_ai', `flags_extra` = 2097152, `call_for_help_range` = 5, `detection_range` = 20, `leash_range` = 0 WHERE `entry` = 16446;
UPDATE `creature_template` SET `ai_name` = '', `script_name` = 'spirit_of_naxxramas_ai', `flags_extra` = 2101248, `call_for_help_range` = 5, `detection_range` = 20, `leash_range` = 0 WHERE `entry` = 16449;
UPDATE `creature_template` SET `ai_name` = '', `script_name` = 'mob_cryptguards', `flags_extra` = 2097152, `call_for_help_range` = 5, `detection_range` = 20, `leash_range` = 0 WHERE `entry` = 16573;
UPDATE `creature_template` SET `ai_name` = '', `script_name` = 'naxxramas_plague_slime_ai', `flags_extra` = 512, `call_for_help_range` = 5, `detection_range` = 20, `leash_range` = 0 WHERE `entry` = 16783;
UPDATE `creature_template` SET `ai_name` = '', `script_name` = 'naxxramas_plague_slime_ai', `flags_extra` = 512, `call_for_help_range` = 5, `detection_range` = 20, `leash_range` = 0 WHERE `entry` = 16784;
UPDATE `creature_template` SET `ai_name` = '', `script_name` = 'naxxramas_plague_slime_ai', `flags_extra` = 512, `call_for_help_range` = 5, `detection_range` = 20, `leash_range` = 0 WHERE `entry` = 16785;
UPDATE `creature_template` SET `ai_name` = 0, `script_name` = 'mob_plague_cloud', `flags_extra` = 0, `call_for_help_range` = 5, `detection_range` = 18, `leash_range` = 0 WHERE `entry` = 533002;
UPDATE `creature_template` SET `ai_name` = 0, `script_name` = 'mob_plague_cloud', `flags_extra` = 0, `call_for_help_range` = 5, `detection_range` = 18, `leash_range` = 0 WHERE `entry` = 533003;
UPDATE `creature_template` SET `ai_name` = 0, `script_name` = 'mob_faerlina_rp', `flags_extra` = 0, `call_for_help_range` = 5, `detection_range` = 18, `leash_range` = 0 WHERE `entry` = 533004;
DELETE FROM `conditions` WHERE `condition_entry` IN (533010, 533011, 533012, 533013);
DELETE FROM `creature_ai_events` WHERE `id` IN (1605611, 1605612, 1605613, 1605711, 1605712, 1612901, 1615611, 1616411, 1616412, 1616413, 1616414, 1616415, 1616811, 1616812, 1616813, 1616814, 1616815, 1624311, 1624312, 1624313, 1624314, 1636011, 1636012, 1640011, 1640012, 1640013, 1640014, 1644613, 1644614, 1644615, 1644911, 1644912, 1644913, 1644914, 1644915, 1657301, 1657302, 1657303, 1657304, 1657305, 1678311, 1678312, 1678313, 1678314, 1678411, 1678412, 1678413, 1678414, 1678511, 1678512, 1678513, 1678514, 5339001, 5339002, 5339003, 5339004, 5339005);
DELETE FROM `creature_ai_scripts` WHERE `id` IN (1605611, 1605612, 1605613, 1605711, 1605712, 1612901, 1615611, 1616411, 1616412, 1616413, 1616414, 1616415, 1616811, 1616812, 1616813, 1616814, 1616815, 1624311, 1624312, 1624313, 1624314, 1636011, 1636012, 1640011, 1640012, 1640013, 1640014, 1644613, 1644614, 1644615, 1644911, 1644912, 1644913, 1644914, 1644915, 1657301, 1657302, 1657303, 1657304, 1657305, 1678311, 1678312, 1678313, 1678314, 1678411, 1678412, 1678413, 1678414, 1678511, 1678512, 1678513, 1678514, 5339001, 5339002, 5339003, 5339004, 5339005);
DELETE FROM `generic_scripts` WHERE `id` IN (5330001, 5330002, 5330003, 5330004, 5330005, 5330006, 5330007, 5330008, 5330009, 5330010, 5330011, 5330012, 5330013, 5330014, 5330015);
DELETE FROM `gameobject_scripts` WHERE `id` IN (533008);
INSERT INTO `creature_ai_events`
(`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`)
VALUES
(1616401, 16164, 0, 0, 0, 100, 13, 0, 0, 4000, 4000, 1616401, 0, 0, 'Shadow of Naxxramas - Shadow Bolt Volley');

INSERT INTO `creature_ai_scripts`
(`id`, `delay`, `priority`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`)
VALUES
(1616401, 0, 0, 15, 28407, 0, 0, 0, 0, 0, 1, 8, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Shade of Naxxramas - Cast Spell Shadow Bolt Volley');

INSERT INTO `creature_ai_events`
(`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`)
VALUES
(1616801, 16168, 0, 0, 0, 100, 13, 0, 0, 10000, 10000, 1616801, 0, 0, 'Stoneskin Gargoyle - Casts Acid Volley');

INSERT INTO `creature_ai_scripts`
(`id`, `delay`, `priority`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`)
VALUES
(1616801, 0, 0, 15, 29325, 0, 0, 0, 0, 0, 0, 12, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Stoneskin Gargoyle - Cast Spell Acid Volley');

INSERT INTO `creature_ai_events`
(`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`)
VALUES
(1616802, 16168, 0, 2, 0, 100, 1, 50, 0, 60000, 60000, 1616802, 0, 0, 'Stoneskin Gargoyle - Casts Stoneskin');

INSERT INTO `creature_ai_scripts`
(`id`, `delay`, `priority`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`)
VALUES
(1616802, 0, 0, 15, 28995, 0, 0, 0, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Stoneskin Gargoyle - Cast Spell Stoneskin');

INSERT INTO `creature_ai_events`
(`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`)
VALUES
(1644601, 16446, 0, 0, 0, 100, 13, 0, 0, 10000, 10000, 1644601, 0, 0, 'Plague Gargoyle - Casts Acid Volley');

INSERT INTO `creature_ai_scripts`
(`id`, `delay`, `priority`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`)
VALUES
(1644601, 0, 0, 15, 29325, 0, 0, 0, 0, 0, 0, 12, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Plagued Gargoyle - Cast Spell Acid Volley');

INSERT INTO `creature_ai_events`
(`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`)
VALUES
(1644602, 16446, 0, 2, 0, 100, 1, 50, 0, 30000, 30000, 1644602, 0, 0, 'Plague Gargoyle - Casts Stoneskin');

INSERT INTO `creature_ai_scripts`
(`id`, `delay`, `priority`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`)
VALUES
(1644602, 0, 0, 15, 28995, 0, 0, 0, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Plagued Gargoyle - Cast Spell Stoneskin');

INSERT INTO `creature_ai_events`
(`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`)
VALUES
(1615601, 16156, 0, 0, 0, 100, 1, 5000, 5000, 5000, 5000, 1615601, 0, 0, 'Dark Touched Warrior periodically wipe aggro');

INSERT INTO `creature_ai_scripts`
(`id`, `delay`, `priority`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`)
VALUES
(1615601, 0, 0, 29, 6, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, -100, 0, 0, 0, 0, 'Dark Touched Warrior - Reduce All Threat by -100.000000%');

-- The shared conditions go only once nothing names them: the other migration that writes them is then not applied either.
DELETE FROM `conditions` WHERE `condition_entry` = 230000 AND NOT EXISTS (SELECT 1 FROM `creature_ai_events` WHERE `condition_id` = 230000) AND NOT EXISTS (SELECT 1 FROM `creature_ai_scripts` WHERE `condition_id` = 230000) AND NOT EXISTS (SELECT 1 FROM `generic_scripts` WHERE `condition_id` = 230000) AND NOT EXISTS (SELECT 1 FROM `gameobject_scripts` WHERE `condition_id` = 230000) AND NOT EXISTS (SELECT 1 FROM `gossip_scripts` WHERE `condition_id` = 230000) AND NOT EXISTS (SELECT 1 FROM `event_scripts` WHERE `condition_id` = 230000) AND NOT EXISTS (SELECT 1 FROM `creature_movement_scripts` WHERE `condition_id` = 230000) AND NOT EXISTS (SELECT 1 FROM `quest_start_scripts` WHERE `condition_id` = 230000) AND NOT EXISTS (SELECT 1 FROM `quest_end_scripts` WHERE `condition_id` = 230000) AND NOT EXISTS (SELECT 1 FROM `spell_scripts` WHERE `condition_id` = 230000) AND NOT EXISTS (SELECT 1 FROM `gossip_menu` WHERE `condition_id` = 230000) AND NOT EXISTS (SELECT 1 FROM `gossip_menu_option` WHERE `condition_id` = 230000) AND NOT EXISTS (SELECT 1 FROM `gameobject_spawn_state` WHERE `condition_id` = 230000) AND NOT EXISTS (SELECT 1 FROM `areatrigger_generic_script` WHERE `condition_id` = 230000) AND NOT EXISTS (SELECT 1 FROM (SELECT * FROM `conditions`) c WHERE c.`type` < 0 AND 230000 IN (c.`value1`, c.`value2`, c.`value3`, c.`value4`));
DELETE FROM `conditions` WHERE `condition_entry` = 209009 AND NOT EXISTS (SELECT 1 FROM `creature_ai_events` WHERE `condition_id` = 209009) AND NOT EXISTS (SELECT 1 FROM `creature_ai_scripts` WHERE `condition_id` = 209009) AND NOT EXISTS (SELECT 1 FROM `generic_scripts` WHERE `condition_id` = 209009) AND NOT EXISTS (SELECT 1 FROM `gameobject_scripts` WHERE `condition_id` = 209009) AND NOT EXISTS (SELECT 1 FROM `gossip_scripts` WHERE `condition_id` = 209009) AND NOT EXISTS (SELECT 1 FROM `event_scripts` WHERE `condition_id` = 209009) AND NOT EXISTS (SELECT 1 FROM `creature_movement_scripts` WHERE `condition_id` = 209009) AND NOT EXISTS (SELECT 1 FROM `quest_start_scripts` WHERE `condition_id` = 209009) AND NOT EXISTS (SELECT 1 FROM `quest_end_scripts` WHERE `condition_id` = 209009) AND NOT EXISTS (SELECT 1 FROM `spell_scripts` WHERE `condition_id` = 209009) AND NOT EXISTS (SELECT 1 FROM `gossip_menu` WHERE `condition_id` = 209009) AND NOT EXISTS (SELECT 1 FROM `gossip_menu_option` WHERE `condition_id` = 209009) AND NOT EXISTS (SELECT 1 FROM `gameobject_spawn_state` WHERE `condition_id` = 209009) AND NOT EXISTS (SELECT 1 FROM `areatrigger_generic_script` WHERE `condition_id` = 209009) AND NOT EXISTS (SELECT 1 FROM (SELECT * FROM `conditions`) c WHERE c.`type` < 0 AND 209009 IN (c.`value1`, c.`value2`, c.`value3`, c.`value4`));
DELETE FROM `conditions` WHERE `condition_entry` = 33003 AND NOT EXISTS (SELECT 1 FROM `creature_ai_events` WHERE `condition_id` = 33003) AND NOT EXISTS (SELECT 1 FROM `creature_ai_scripts` WHERE `condition_id` = 33003) AND NOT EXISTS (SELECT 1 FROM `generic_scripts` WHERE `condition_id` = 33003) AND NOT EXISTS (SELECT 1 FROM `gameobject_scripts` WHERE `condition_id` = 33003) AND NOT EXISTS (SELECT 1 FROM `gossip_scripts` WHERE `condition_id` = 33003) AND NOT EXISTS (SELECT 1 FROM `event_scripts` WHERE `condition_id` = 33003) AND NOT EXISTS (SELECT 1 FROM `creature_movement_scripts` WHERE `condition_id` = 33003) AND NOT EXISTS (SELECT 1 FROM `quest_start_scripts` WHERE `condition_id` = 33003) AND NOT EXISTS (SELECT 1 FROM `quest_end_scripts` WHERE `condition_id` = 33003) AND NOT EXISTS (SELECT 1 FROM `spell_scripts` WHERE `condition_id` = 33003) AND NOT EXISTS (SELECT 1 FROM `gossip_menu` WHERE `condition_id` = 33003) AND NOT EXISTS (SELECT 1 FROM `gossip_menu_option` WHERE `condition_id` = 33003) AND NOT EXISTS (SELECT 1 FROM `gameobject_spawn_state` WHERE `condition_id` = 33003) AND NOT EXISTS (SELECT 1 FROM `areatrigger_generic_script` WHERE `condition_id` = 33003) AND NOT EXISTS (SELECT 1 FROM (SELECT * FROM `conditions`) c WHERE c.`type` < 0 AND 33003 IN (c.`value1`, c.`value2`, c.`value3`, c.`value4`));
