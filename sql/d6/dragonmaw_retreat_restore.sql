-- Puts back what dragonmaw_retreat_as_rows.sql replaced, as d6_world had it when the migration
-- was written (scripts/tier2/a04_dragonmaw_retreat.py). The rows the migration added are removed.

UPDATE `creature_template` SET `ai_name` = 'EventAI', `script_name` = 'boss_zuluhed_the_whacked', `flags_extra` = 0 WHERE `entry` = 62037;
UPDATE `creature_template` SET `ai_name` = 'EventAI', `script_name` = 'boss_bogpaw_truthsay', `flags_extra` = 0 WHERE `entry` = 62056;
UPDATE `creature_template` SET `ai_name` = 'EventAI', `script_name` = 'boss_gowlfang', `flags_extra` = 0 WHERE `entry` = 62057;
UPDATE `creature_template` SET `ai_name` = 'EventAI', `script_name` = 'boss_halgan_redbrand', `flags_extra` = 0 WHERE `entry` = 62069;
UPDATE `creature_template` SET `ai_name` = 'EventAI', `script_name` = 'boss_searistrasz', `flags_extra` = 0 WHERE `entry` = 62072;
UPDATE `creature_template` SET `ai_name` = 'EventAI', `script_name` = '', `flags_extra` = 0 WHERE `entry` = 62453;
DELETE FROM `conditions` WHERE `condition_entry` IN (816001, 816002, 816003, 816004);
DELETE FROM `broadcast_text` WHERE `entry` IN (6203701, 6203702, 6203703, 6203704, 6203801, 6203802, 6203803, 6205701, 6205702, 6205703, 6206701, 6206702, 6206703, 6206801, 6206802, 6206803, 6206901, 6206902, 6206903, 6207001, 6207002, 6207003, 6207101, 6207102, 6207103, 6207201, 6207202, 6207203, 6245301);
DELETE FROM `creature_ai_events` WHERE `id` IN (6203701, 6203702, 6203703, 6203704, 6205601, 6205602, 6205603, 6205701, 6205702, 6205703, 6206901, 6206902, 6206903, 6206904, 6206905, 6207201, 6207202, 6207203, 6207204, 6207205, 6207206, 6207207, 6207208, 6245301);
DELETE FROM `creature_ai_scripts` WHERE `id` IN (6203701, 6203702, 6203703, 6203704, 6205601, 6205602, 6205603, 6205701, 6205702, 6205703, 6206901, 6206902, 6206903, 6206904, 6206905, 6207201, 6207202, 6207203, 6207204, 6207205, 6207206, 6207207, 6207208, 6245301);
DELETE FROM `generic_scripts` WHERE `id` IN (6203704);
UPDATE `creature_ai_scripts` SET `dataint` = -1999883, `datalong` = 0 WHERE `id` = 6206701 AND `command` = 0;
UPDATE `creature_ai_scripts` SET `dataint` = -1999884, `datalong` = 0 WHERE `id` = 6206702 AND `command` = 0;
UPDATE `creature_ai_scripts` SET `dataint` = -1999885, `datalong` = 0 WHERE `id` = 6206703 AND `command` = 0;
UPDATE `creature_ai_scripts` SET `dataint` = -1999886, `datalong` = 0 WHERE `id` = 6207101 AND `command` = 0;
UPDATE `creature_ai_scripts` SET `dataint` = -1999887, `datalong` = 0 WHERE `id` = 6207102 AND `command` = 0;
UPDATE `creature_ai_scripts` SET `dataint` = -1999888, `datalong` = 0 WHERE `id` = 6207103 AND `command` = 0;
UPDATE `creature_ai_scripts` SET `dataint` = -1999889, `datalong` = 0 WHERE `id` = 6203801 AND `command` = 0;
UPDATE `creature_ai_scripts` SET `dataint` = -1999890, `datalong` = 0 WHERE `id` = 6203802 AND `command` = 0;
UPDATE `creature_ai_scripts` SET `dataint` = -1999891, `datalong` = 0 WHERE `id` = 6203803 AND `command` = 0;
UPDATE `creature_ai_scripts` SET `dataint` = -1999892, `datalong` = 0 WHERE `id` = 6207001 AND `command` = 0;
UPDATE `creature_ai_scripts` SET `dataint` = -1999893, `datalong` = 0 WHERE `id` = 6207002 AND `command` = 0;
UPDATE `creature_ai_scripts` SET `dataint` = -1999894, `datalong` = 0 WHERE `id` = 6207003 AND `command` = 0;
UPDATE `creature_ai_scripts` SET `dataint` = -1999895, `datalong` = 0 WHERE `id` = 6206801 AND `command` = 0;
UPDATE `creature_ai_scripts` SET `dataint` = -1999896, `datalong` = 0 WHERE `id` = 6206802 AND `command` = 0;
UPDATE `creature_ai_scripts` SET `dataint` = -1999897, `datalong` = 0 WHERE `id` = 6206803 AND `command` = 0;
