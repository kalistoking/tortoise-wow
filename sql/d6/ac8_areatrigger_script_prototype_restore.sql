-- Undoes ac8_areatrigger_script_prototype.sql. The table stays, empty: the prototype's core reads it
-- at start and would log a missing one as an error.
DELETE FROM `areatrigger_generic_script` WHERE `trigger_id` = 3746;
DELETE FROM `generic_scripts` WHERE `id` = 3746;
DELETE FROM `conditions` WHERE `condition_entry` = 3600104;
