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
