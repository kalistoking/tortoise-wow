-- Puts back what scarlet_citadel_as_rows.sql replaced, as t1_world had it when the migration
-- was written (scripts/tier2/a21_scarlet_citadel.py). The rows the migration added are removed.

UPDATE `creature_template` SET `ai_name` = '', `script_name` = 'boss_abbendis', `flags_extra` = 2130433 WHERE `entry` = 2000003;
UPDATE `creature_template` SET `ai_name` = '', `script_name` = 'npc_chaplain_and_sister', `flags_extra` = 0 WHERE `entry` = 2000005;
UPDATE `creature_template` SET `ai_name` = '', `script_name` = 'npc_citadel_inquisitor', `flags_extra` = 0 WHERE `entry` = 2000014;
UPDATE `creature_template` SET `ai_name` = '', `script_name` = 'npc_citadel_valiant', `flags_extra` = 0 WHERE `entry` = 2000015;
UPDATE `creature_template` SET `ai_name` = '', `script_name` = 'npc_citadel_inquisitor', `flags_extra` = 0 WHERE `entry` = 2000033;
UPDATE `creature_template` SET `ai_name` = '', `script_name` = 'npc_citadel_valiant', `flags_extra` = 0 WHERE `entry` = 2000034;
UPDATE `creature_template` SET `ai_name` = '', `script_name` = 'npc_citadel_footman', `flags_extra` = 0 WHERE `entry` = 2000035;
UPDATE `creature_template` SET `ai_name` = '', `script_name` = 'npc_citadel_interrogator', `flags_extra` = 0 WHERE `entry` = 2000036;
DELETE FROM `conditions` WHERE `condition_entry` IN (450000);
DELETE FROM `broadcast_text` WHERE `entry` IN (450101, 450102, 450103, 450104, 450105, 450106, 450107, 450108, 450109, 450110, 450111, 450112, 450113, 450114);
DELETE FROM `creature_ai_events` WHERE `id` IN (4510001, 4510002, 4510003, 4510101, 4510102, 4510103, 4510104, 4510201, 4510202, 4510203, 4510204, 4510301, 4510302, 4510401, 4510402, 4510501, 4510502, 4510601, 4510602, 4510603, 4510604, 4510605, 4510606, 4510607, 4510608, 4510701);
DELETE FROM `creature_ai_scripts` WHERE `id` IN (4510001, 4510002, 4510003, 4510101, 4510102, 4510103, 4510104, 4510201, 4510202, 4510203, 4510204, 4510301, 4510302, 4510401, 4510402, 4510501, 4510502, 4510601, 4510602, 4510603, 4510604, 4510605, 4510606, 4510607, 4510608, 4510701);
DELETE FROM `generic_scripts` WHERE `id` IN (450001, 450002);
UPDATE `creature` SET `spawntimesecsmin` = 25, `spawntimesecsmax` = 25 WHERE `guid` = 1300003;
