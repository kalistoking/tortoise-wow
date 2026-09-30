-- AC4 step 1 prototype (trt E22, the director's yes of 2026-09-30): a summon placed x yards from
-- its summoner at angle o from its facing -- position type 1 in bits 16-23 of TEMP_SUMMON's dataint.
-- The core of trt/module-structure with the position type (Install-Core-Build.ps1). Apply after
-- windhorn_storm_guardian_as_rows.sql, with mod-windhorn-canyon unloaded (the rows' side).
--   The Storm Guardian's three residues (6286501-03): at contact distance today; now 1.5 yd at
--   0, 120 and 240 degrees -- the triangle npc_windhorn_storm_guardian made.
--   dataint 2 (ACTIVE) becomes 65538 = 2 | 1 << 16; x the distance, y = z = 0.
-- Only with that core: an older one reads x = 1.5 as a world coordinate and summons far away.
-- Undone by ac4_polar_summon_prototype_restore.sql. R8: a person applies it.
UPDATE `creature_ai_scripts` SET `dataint` = 65538, `x` = 1.5, `y` = 0, `z` = 0
WHERE `id` IN (6286501, 6286502, 6286503) AND `command` = 10;
