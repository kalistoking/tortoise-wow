-- Four creature_template rows point at loot templates that have never existed,
-- so every startup logs (LootMgr.cpp):
--
--     Table 'skinning_loot_template' entry 61393 (creature skinning id) not exist but used as loot id in DB.
--     Table 'pickpocketing_loot_template' entry 1183 (creature pickpocket lootid) not exist but used as loot id in DB.   [x3]
--
-- Neither id is missing data that was lost: no row for skinning 61393 or for
-- pickpocketing 1183 exists in sql/base or in any file under sql/database_updates.
-- Both are also the odd ones out by a wide margin - 1174 of the 1175 rows with a
-- non-zero skinning_loot_id resolve, and 1917 of the 1920 with a non-zero
-- pickpocket_loot_id do.
--
-- Greymane Watcher (61393) self-references an id that was never populated. All
-- nineteen other Greymane creatures have skinning_loot_id = 0, and the humanoids
-- around its level that really are skinnable are worgen and yeti reusing shared
-- tables (5260, 5425, 5426) rather than self-referencing. Creature::SetDeathState
-- only sets UNIT_FLAG_SKINNABLE when the template actually exists, so the
-- creature is not skinnable today and zeroing the column changes nothing.
--
-- Dean LeGuin, High Widow Arania and Gunther (61763-61765) point at 1183, which
-- is the creature entry of Mo'grosh Mystic - a level 19 ogre whose own
-- pickpocket_loot_id is 0. The 107 rows keyed 1183 in 20260511053220_world.sql
-- belong to creature_loot_template (its kill loot; the chances match what the
-- community databases list for that creature), not to this table. Their
-- neighbours in the same entry range point at existing shared tables instead
-- (8525, 8530, 8547), and the community databases show no pickpocket loot for
-- any of the three, so zeroing the column changes nothing either.
--
-- The old value is in the WHERE clause so re-running this cannot overwrite a
-- later correction.

UPDATE `creature_template` SET `skinning_loot_id` = 0 WHERE `entry` = 61393 AND `skinning_loot_id` = 61393; -- Greymane Watcher

UPDATE `creature_template` SET `pickpocket_loot_id` = 0 WHERE `entry` = 61763 AND `pickpocket_loot_id` = 1183; -- Dean LeGuin
UPDATE `creature_template` SET `pickpocket_loot_id` = 0 WHERE `entry` = 61764 AND `pickpocket_loot_id` = 1183; -- High Widow Arania
UPDATE `creature_template` SET `pickpocket_loot_id` = 0 WHERE `entry` = 61765 AND `pickpocket_loot_id` = 1183; -- Gunther

-- Livia Strongarm, Luke Agamand, Blackthorn Footpad and Greta Longpike had
-- exactly one creature_loot_template row each - the dangling reference removed
-- in creature_loot_template.sql. With it gone their loot_id points at an entry
-- that holds no rows, which just moves the warning to a different table:
--
--     Table 'creature_loot_template' entry 61376 (creature entry) not exist but used as loot id in DB.
--
-- They have no loot to lose: the community databases report no drops for any of
-- the four, and all four have gold_min = gold_max = 0. loot_id = 0 is the
-- established convention for a creature with no loot table and is what the rest
-- of this database uses.
UPDATE `creature_template` SET `loot_id` = 0 WHERE `entry` = 61376 AND `loot_id` = 61376; -- Livia Strongarm
UPDATE `creature_template` SET `loot_id` = 0 WHERE `entry` = 61377 AND `loot_id` = 61377; -- Luke Agamand
UPDATE `creature_template` SET `loot_id` = 0 WHERE `entry` = 61378 AND `loot_id` = 61378; -- Blackthorn Footpad
UPDATE `creature_template` SET `loot_id` = 0 WHERE `entry` = 61379 AND `loot_id` = 61379; -- Greta Longpike
