-- Undoes ac4_polar_summon_prototype.sql: the residues back at contact distance (x = y = z = 0).
UPDATE `creature_ai_scripts` SET `dataint` = 2, `x` = 0, `y` = 0, `z` = 0
WHERE `id` IN (6286501, 6286502, 6286503) AND `command` = 10;
