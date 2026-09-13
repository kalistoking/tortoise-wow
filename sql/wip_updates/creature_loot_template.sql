-- Six creature_loot_template rows reference reference_loot_template entries that
-- do not exist, so every startup logs (LootMgr.cpp, LoadLootTemplates_Reference):
--
--     Table 'reference_loot_template' entry 30171 (reference id) not exist but used as loot id in DB.
--     Table 'reference_loot_template' entry 30559 (reference id) not exist but used as loot id in DB.
--     Table 'reference_loot_template' entry 150112 (reference id) not exist but used as loot id in DB.
--
-- Cause: 20260511053220_world.sql drops and repopulates the six loot tables and
-- renumbers reference_loot_template into the 9xxxxx range. Consumers were moved
-- onto the new ids, but these six rows were left on the pre-renumbering ones:
--
--   30171  -> 900832, all 76 items identical, already used by other creatures
--   30559  -> 900998, all 8 items identical, already used by seven Greymane NPCs
--   150112 -> no successor, the pool is gone (best match elsewhere is 2 of 25 items)
--
-- These rows are dead either way - a reference that cannot be resolved contributes
-- no loot - so removing them changes no drop behaviour. They are deleted rather
-- than repointed at the successor ids because repointing would *add* loot these
-- creatures do not currently have: the successor pools resolve normally for their
-- real consumers (900832 for Ragnaros, Nefarian, Onyxia, Lord Kazzak and the four
-- Dream dragons; 900998 for the seven Greymane NPCs), and none of the five
-- creatures below appears among them in the community databases built from this
-- content. Snowball keeps its remaining row (item 51249 at 60%), which matches
-- what those databases report it dropping today.
--
-- Whether Snowball - a level 63 world boss whose table was authored with two
-- guaranteed reference rolls plus one item - is meant to have kept a reward pool
-- is a content question, not a data-hygiene one, and is deliberately left alone.
--
-- mincountOrRef is in the WHERE clause so re-running this cannot delete a row
-- that has since been repointed at a valid reference.

DELETE FROM `creature_loot_template` WHERE `entry` = 50112 AND `item` = 30171  AND `mincountOrRef` = -30171;  -- Snowball
DELETE FROM `creature_loot_template` WHERE `entry` = 50112 AND `item` = 150112 AND `mincountOrRef` = -150112; -- Snowball
DELETE FROM `creature_loot_template` WHERE `entry` = 61376 AND `item` = 30559  AND `mincountOrRef` = -30559;  -- Livia Strongarm
DELETE FROM `creature_loot_template` WHERE `entry` = 61377 AND `item` = 30559  AND `mincountOrRef` = -30559;  -- Luke Agamand
DELETE FROM `creature_loot_template` WHERE `entry` = 61378 AND `item` = 30559  AND `mincountOrRef` = -30559;  -- Blackthorn Footpad
DELETE FROM `creature_loot_template` WHERE `entry` = 61379 AND `item` = 30559  AND `mincountOrRef` = -30559;  -- Greta Longpike
