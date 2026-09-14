-- 19 creature_template rows carry a loot_id with no matching creature_loot_template
-- entry, causing a boot warning each. Unlike most of #510's list, these are confirmed
-- safe to silence via `loot_id = 0` - not "loot design pending", but "this creature was
-- never meant to drop general loot", verified two different ways:
--
-- 18 of them carry a formal service npc_flags bit (Vendor/Trainer/Innkeeper/Flightmaster/
-- Repair/Banker/etc.) - the same convention already used by 735 of 742 (99%) other
-- vendor/trainer creatures in this database (8 of the 18 additionally have real rows in
-- npc_vendor/npc_trainer, confirmed against the live data, not just the flag bit):
--
--     Rud'an Malas, Rodon Blackstout, Ovan Gradal, Omna'kar, P'li, Ma'shaka, Fra'phani,
--     F'eesh, Bogtu, Cook Rem'sai, Master Craftsman T'kalpa, Merellanea, Achak Pinemoon,
--     Innkeeper Warmbreeze, Z'ahk, Sol Greycloud, Dhom, Ley-Technician Firael
--
-- The 19th, Highlord Mograine (Naxxramas' Four Horsemen encounter), is confirmed by direct
-- comparison against his own encounter: all 3 other horsemen (Sir Zeliek, Thane Korth'azz,
-- Lady Blaumeux) and all 4 of their spirit forms already have loot_id = 0 in this database -
-- the encounter's real reward is a chest (gameobject 181366, "Four Horsemen Chest",
-- unlocked by src/scripts/dungeons/naxxramas/instance_naxxramas.cpp on encounter completion),
-- not creature loot. Mograine's stray loot_id = 92300 is the only one of 8 encounter
-- members that does not follow this pattern.
--
-- Explicitly NOT included here: entry 61594 "Dark Spirit of Loresh" has real npc_trainer
-- rows too, but is `faction = 16` (Monster) and hostile - a combat target that happens to
-- also teach something as a quest mechanic, not a service NPC. Also not included: Father
-- Lycan and Sanv Tas'dal, the two other named bosses from #510 - unlike Mograine, Father
-- Lycan's own quest-series sibling (Keeper Gnarlmoon, entry 61939, same quest trio and
-- tier) already has a real 8-row loot table, showing this tier of boss is meant to drop
-- its own loot - these two remain flagged as genuine content gaps in #510.
UPDATE `creature_template` SET `loot_id` = 0 WHERE `entry` = 62029 AND `loot_id` = 62029; -- Rud'an Malas
UPDATE `creature_template` SET `loot_id` = 0 WHERE `entry` = 62033 AND `loot_id` = 62033; -- Rodon Blackstout
UPDATE `creature_template` SET `loot_id` = 0 WHERE `entry` = 62058 AND `loot_id` = 62058; -- Ovan Gradal
UPDATE `creature_template` SET `loot_id` = 0 WHERE `entry` = 62853 AND `loot_id` = 62853; -- Omna'kar
UPDATE `creature_template` SET `loot_id` = 0 WHERE `entry` = 62854 AND `loot_id` = 62854; -- P'li
UPDATE `creature_template` SET `loot_id` = 0 WHERE `entry` = 62857 AND `loot_id` = 62857; -- Ma'shaka
UPDATE `creature_template` SET `loot_id` = 0 WHERE `entry` = 62858 AND `loot_id` = 62858; -- Fra'phani
UPDATE `creature_template` SET `loot_id` = 0 WHERE `entry` = 62859 AND `loot_id` = 62859; -- F'eesh
UPDATE `creature_template` SET `loot_id` = 0 WHERE `entry` = 62860 AND `loot_id` = 62860; -- Bogtu
UPDATE `creature_template` SET `loot_id` = 0 WHERE `entry` = 62861 AND `loot_id` = 62861; -- Cook Rem'sai
UPDATE `creature_template` SET `loot_id` = 0 WHERE `entry` = 62864 AND `loot_id` = 62864; -- Master Craftsman T'kalpa
UPDATE `creature_template` SET `loot_id` = 0 WHERE `entry` = 62908 AND `loot_id` = 62908; -- Merellanea
UPDATE `creature_template` SET `loot_id` = 0 WHERE `entry` = 62911 AND `loot_id` = 62911; -- Achak Pinemoon
UPDATE `creature_template` SET `loot_id` = 0 WHERE `entry` = 62975 AND `loot_id` = 62975; -- Innkeeper Warmbreeze
UPDATE `creature_template` SET `loot_id` = 0 WHERE `entry` = 63048 AND `loot_id` = 63048; -- Z'ahk
UPDATE `creature_template` SET `loot_id` = 0 WHERE `entry` = 63051 AND `loot_id` = 63051; -- Sol Greycloud
UPDATE `creature_template` SET `loot_id` = 0 WHERE `entry` = 63069 AND `loot_id` = 63069; -- Dhom
UPDATE `creature_template` SET `loot_id` = 0 WHERE `entry` = 63123 AND `loot_id` = 63123; -- Ley-Technician Firael
UPDATE `creature_template` SET `loot_id` = 0 WHERE `entry` = 16062 AND `loot_id` = 92300; -- Highlord Mograine

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
