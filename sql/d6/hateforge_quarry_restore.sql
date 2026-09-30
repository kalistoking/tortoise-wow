-- Puts back what hateforge_quarry_as_rows.sql replaced, as t1_world had it when the migration
-- was written (scripts/tier2/a06_hateforge_quarry.py). The rows the migration added are removed.

UPDATE `creature_template` SET `ai_name` = '', `script_name` = 'mob_hateforge_cleric', `flags_extra` = 0 WHERE `entry` = 60718;
UPDATE `creature_template` SET `ai_name` = '', `script_name` = 'mob_hateforge_taskmaster', `flags_extra` = 0 WHERE `entry` = 60723;
UPDATE `creature_template` SET `ai_name` = '', `script_name` = 'mob_twilight_fireblade', `flags_extra` = 0 WHERE `entry` = 60725;
UPDATE `creature_template` SET `ai_name` = '', `script_name` = 'boss_hatereaver_annhilator', `flags_extra` = 0 WHERE `entry` = 60734;
UPDATE `creature_template` SET `ai_name` = '', `script_name` = 'boss_bargul_blackhammer', `flags_extra` = 0 WHERE `entry` = 60735;
UPDATE `creature_template` SET `ai_name` = '', `script_name` = 'boss_engineer_figgles', `flags_extra` = 0 WHERE `entry` = 60736;
UPDATE `creature_template` SET `ai_name` = '', `script_name` = 'boss_hargesh_doomcaller', `flags_extra` = 0 WHERE `entry` = 60737;
DELETE FROM `broadcast_text` WHERE `entry` IN (6073401, 6073403, 6073501, 6073503, 6073506, 6073507, 6073508, 6073601, 6073603, 6073701, 6073703, 6073706);
DELETE FROM `creature_ai_events` WHERE `id` IN (6071801, 6071802, 6072301, 6072302, 6072501, 6073401, 6073402, 6073403, 6073404, 6073405, 6073501, 6073502, 6073503, 6073504, 6073505, 6073506, 6073601, 6073602, 6073603, 6073701, 6073702, 6073703, 6073704, 6073705, 6073706, 6073707, 6073708, 6073709);
DELETE FROM `creature_ai_scripts` WHERE `id` IN (6071801, 6071802, 6072301, 6072302, 6072501, 6073401, 6073402, 6073403, 6073404, 6073405, 6073501, 6073502, 6073503, 6073504, 6073505, 6073506, 6073601, 6073602, 6073603, 6073701, 6073702, 6073703, 6073704, 6073705, 6073706, 6073707, 6073708, 6073709);
