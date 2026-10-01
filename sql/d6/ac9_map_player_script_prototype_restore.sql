-- Undoes ac9_map_player_script_prototype.sql. The table stays, empty: the prototype's core reads it
-- at start and would log a missing one as an error.
DELETE FROM `map_player_script` WHERE `map_id` = 36 AND `script_id` IN (3690001, 3690002);
DELETE FROM `generic_scripts` WHERE `id` IN (3690001, 3690002);
