-- Puts back what crescent_grove_as_rows.sql replaced, as t1_world had it when the migration
-- was written (scripts/tier1_rows.py). The rows the migration added are removed.

UPDATE `creature_template` SET `ai_name` = '', `script_name` = '', `flags_extra` = 0 WHERE `entry` = 92100;
UPDATE `creature_template` SET `ai_name` = '', `script_name` = '', `flags_extra` = 0 WHERE `entry` = 92101;
UPDATE `creature_template` SET `ai_name` = '', `script_name` = '', `flags_extra` = 0 WHERE `entry` = 92102;
UPDATE `creature_template` SET `ai_name` = '', `script_name` = '', `flags_extra` = 0 WHERE `entry` = 92103;
UPDATE `creature_template` SET `ai_name` = '', `script_name` = '', `flags_extra` = 0 WHERE `entry` = 92104;
UPDATE `creature_template` SET `ai_name` = '', `script_name` = '', `flags_extra` = 0 WHERE `entry` = 92105;
UPDATE `creature_template` SET `ai_name` = '', `script_name` = '', `flags_extra` = 0 WHERE `entry` = 92106;
UPDATE `creature_template` SET `ai_name` = '', `script_name` = '', `flags_extra` = 0 WHERE `entry` = 92108;
UPDATE `creature_template` SET `ai_name` = '', `script_name` = '', `flags_extra` = 0 WHERE `entry` = 92111;
UPDATE `creature_template` SET `ai_name` = '', `script_name` = '', `flags_extra` = 0 WHERE `entry` = 92112;
UPDATE `creature_template` SET `ai_name` = '', `script_name` = '', `flags_extra` = 0 WHERE `entry` = 92113;
UPDATE `creature_template` SET `ai_name` = '', `script_name` = '', `flags_extra` = 0 WHERE `entry` = 92114;
UPDATE `creature_template` SET `ai_name` = '', `script_name` = '', `flags_extra` = 0 WHERE `entry` = 92115;
UPDATE `creature_template` SET `ai_name` = '', `script_name` = '', `flags_extra` = 0 WHERE `entry` = 92116;
UPDATE `creature_template` SET `ai_name` = '', `script_name` = '', `flags_extra` = 0 WHERE `entry` = 92117;
UPDATE `creature_template` SET `ai_name` = '', `script_name` = '', `flags_extra` = 0 WHERE `entry` = 92118;
UPDATE `creature_template` SET `ai_name` = '', `script_name` = '', `flags_extra` = 0 WHERE `entry` = 92119;
UPDATE `creature_template` SET `ai_name` = '', `script_name` = '', `flags_extra` = 0 WHERE `entry` = 92120;
UPDATE `creature_template` SET `ai_name` = '', `script_name` = '', `flags_extra` = 0 WHERE `entry` = 92121;
UPDATE `creature_template` SET `ai_name` = '', `script_name` = '', `flags_extra` = 0 WHERE `entry` = 92122;
UPDATE `creature_template` SET `ai_name` = '', `script_name` = '', `flags_extra` = 0 WHERE `entry` = 92123;
UPDATE `creature_template` SET `ai_name` = '', `script_name` = '', `flags_extra` = 0 WHERE `entry` = 92124;
UPDATE `creature_template` SET `ai_name` = '', `script_name` = '', `flags_extra` = 0 WHERE `entry` = 92125;
UPDATE `creature_template` SET `ai_name` = '', `script_name` = '', `flags_extra` = 0 WHERE `entry` = 92126;
UPDATE `creature_template` SET `ai_name` = '', `script_name` = '', `flags_extra` = 0 WHERE `entry` = 92127;
UPDATE `creature_template` SET `ai_name` = '', `script_name` = '', `flags_extra` = 0 WHERE `entry` = 92128;
UPDATE `creature_template` SET `ai_name` = '', `script_name` = '', `flags_extra` = 0 WHERE `entry` = 92129;
UPDATE `creature_template` SET `ai_name` = '', `script_name` = '', `flags_extra` = 524298 WHERE `entry` = 92130;
UPDATE `creature_template` SET `ai_name` = '', `script_name` = '', `flags_extra` = 524298 WHERE `entry` = 92131;
UPDATE `creature_template` SET `ai_name` = '', `script_name` = '', `flags_extra` = 0 WHERE `entry` = 92133;
UPDATE `map_template` SET `script_name` = 'instance_crescent_grove' WHERE `entry` = 802;
DELETE FROM `conditions` WHERE `condition_entry` IN (802001);
DELETE FROM `broadcast_text` WHERE `entry` IN (9210701, 9210702, 9210901, 9210902, 9211001, 9211002, 9211101, 9211102);
DELETE FROM `creature_ai_events` WHERE `id` IN (9210001, 9210101, 9210201, 9210301, 9210401, 9210501, 9210601, 9210701, 9210702, 9210801, 9210901, 9210902, 9211001, 9211002, 9211101, 9211102, 9211201, 9211301, 9211401, 9211501, 9211601, 9211701, 9211801, 9211901, 9212001, 9212101, 9212201, 9212301, 9212401, 9212501, 9212601, 9212701, 9212801, 9212901, 9213001, 9213101, 9213201, 9213301);
DELETE FROM `creature_ai_scripts` WHERE `id` IN (9210001, 9210101, 9210201, 9210301, 9210401, 9210501, 9210601, 9210701, 9210702, 9210801, 9210901, 9210902, 9211001, 9211002, 9211101, 9211102, 9211201, 9211301, 9211401, 9211501, 9211601, 9211701, 9211801, 9211901, 9212001, 9212101, 9212201, 9212301, 9212401, 9212501, 9212601, 9212701, 9212801, 9212901, 9213001, 9213101, 9213201, 9213301);
