-- Puts back what gnomeregan_as_rows.sql replaced, as t1_world had it when the migration
-- was written (scripts/tier2/a13_gnomeregan.py). The rows the migration added are removed.

DELETE FROM `conditions` WHERE `condition_entry` IN (901301, 901302, 901305, 901306, 901311, 901312, 901315, 901316, 901319, 901320, 901323, 901324, 901330, 901331);
DELETE FROM `gossip_scripts` WHERE `id` IN (1423451, 1424751, 1424761, 1426961, 1426962);
UPDATE `gameobject_template` SET `data3` = 0 WHERE `entry` = 142345;
UPDATE `gameobject_template` SET `data3` = 0 WHERE `entry` = 142475;
UPDATE `gameobject_template` SET `data3` = 0 WHERE `entry` = 142476;
UPDATE `gameobject_template` SET `data3` = 0 WHERE `entry` = 142696;
DELETE FROM `gossip_menu` WHERE `entry` = 1423450 AND `text_id` = 1643;
DELETE FROM `gossip_menu_option` WHERE `menu_id` = 1423450 AND `id` = 0;
DELETE FROM `gossip_menu` WHERE `entry` = 1424750 AND `text_id` = 1647;
DELETE FROM `gossip_menu_option` WHERE `menu_id` = 1424750 AND `id` = 0;
DELETE FROM `gossip_menu` WHERE `entry` = 1424760 AND `text_id` = 1649;
DELETE FROM `gossip_menu_option` WHERE `menu_id` = 1424760 AND `id` = 0;
DELETE FROM `gossip_menu` WHERE `entry` = 1426960 AND `text_id` = 1651;
DELETE FROM `gossip_menu_option` WHERE `menu_id` = 1426960 AND `id` = 0;
DELETE FROM `gossip_menu_option` WHERE `menu_id` = 1426960 AND `id` = 1;
DELETE FROM `gossip_menu_option` WHERE `menu_id` = 1426960 AND `id` = 2;
