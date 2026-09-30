-- Undoes ac7_instance_data_slot.sql's rows. The table stays, empty: the core reads it at start
-- and would log a missing one as an error.
DELETE FROM `instance_data_slot` WHERE (`map`, `slot`) IN ((822, 0), (36, 2), (36, 3));
