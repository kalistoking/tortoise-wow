-- mod-deadmines: the world rows that name this module's scripts.
--
-- The scripts are registered by the module under these names; these rows are what make the
-- server look for them. A database that already carries the names is unchanged by this file.
--
-- Idempotent: each row is set by its entry, and set again on a re-run.

-- Mr. Smite.
UPDATE `creature_template` SET `script_name` = 'boss_mr_smite' WHERE `entry` = 646;

-- The Deadmines' instance script.
UPDATE `map_template` SET `script_name` = 'instance_deadmines' WHERE `entry` = 36;

-- The objects: the Defias cannon, its gunpowder, and the lever by the Iron Clad Door.
UPDATE `gameobject_template` SET `script_name` = 'go_defias_cannon' WHERE `entry` = 16398;
UPDATE `gameobject_template` SET `script_name` = 'go_defias_gunpowder' WHERE `entry` = 17155;
UPDATE `gameobject_template` SET `script_name` = 'go_door_lever_dm' WHERE `entry` = 101833;
