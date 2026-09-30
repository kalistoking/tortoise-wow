-- Undoes deal_damage_rows.sql: Baxxil's DEAL_DAMAGE step without TARGET_SELF, as it was.
UPDATE `gossip_scripts` SET `data_flags` = `data_flags` & ~4 WHERE `id` = 6003702 AND `command` = 48;
