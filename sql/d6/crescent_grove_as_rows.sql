-- Crescent Grove (map 802), instance_crescent_grove: its C++ as rows -- EPIC10 tier 1, handoff/manager-084.
-- Written by the trt repo's scripts/tier1_rows.py from t1_world; crescent_grove_restore.sql puts
-- back what this replaces. R8: a person applies it, into the world database.
--
-- The C++ keeps its script names: mod-crescent-grove is the switch (AM1, handoff/manager-091).
-- Loaded, the C++ runs as before -- a script found by name comes first. Unloaded
-- (`module unload mod-crescent-grove`, which gives every creature standing a new AI at once),
-- the names find no script and the creatures run these rows (their ai_name).
--
-- Every creature of the dungeon pulls the zone into its fight as it enters combat, as the
-- instance script's OnCreatureEnterCombat did: an aggro rule on each entry, held to map 802 by
-- condition 802001 (92100 and 92101 also live on map 1). The entries without an AI name take
-- EventAI, which chooses its fights as their AggressorAI did. The four bosses yell on aggro and
-- death: the literal texts made broadcast texts with the sounds the C++ played. Their 50 % lines
-- (rules 2200008-2200010) stay as they are.
-- Left out, not reached by these rows:
--   883 Deer (a world creature: EventAI would reach every zone it lives in)
-- Load: run into the world database, then .reload creature_template for each entry above (or a
-- restart), .reload creature_ai_events, .reload creature_ai_scripts, .reload broadcast_text,
-- .reload conditions.

UPDATE `creature_template` SET `ai_name` = 'EventAI' WHERE `entry` = 92100;
UPDATE `creature_template` SET `ai_name` = 'EventAI' WHERE `entry` = 92101;
UPDATE `creature_template` SET `ai_name` = 'EventAI' WHERE `entry` = 92102;
UPDATE `creature_template` SET `ai_name` = 'EventAI' WHERE `entry` = 92103;
UPDATE `creature_template` SET `ai_name` = 'EventAI' WHERE `entry` = 92104;
UPDATE `creature_template` SET `ai_name` = 'EventAI' WHERE `entry` = 92105;
UPDATE `creature_template` SET `ai_name` = 'EventAI' WHERE `entry` = 92106;
UPDATE `creature_template` SET `ai_name` = 'EventAI' WHERE `entry` = 92108;
UPDATE `creature_template` SET `ai_name` = 'EventAI' WHERE `entry` = 92111;
UPDATE `creature_template` SET `ai_name` = 'EventAI' WHERE `entry` = 92112;
UPDATE `creature_template` SET `ai_name` = 'EventAI' WHERE `entry` = 92113;
UPDATE `creature_template` SET `ai_name` = 'EventAI' WHERE `entry` = 92114;
UPDATE `creature_template` SET `ai_name` = 'EventAI' WHERE `entry` = 92115;
UPDATE `creature_template` SET `ai_name` = 'EventAI' WHERE `entry` = 92116;
UPDATE `creature_template` SET `ai_name` = 'EventAI' WHERE `entry` = 92117;
UPDATE `creature_template` SET `ai_name` = 'EventAI' WHERE `entry` = 92118;
UPDATE `creature_template` SET `ai_name` = 'EventAI' WHERE `entry` = 92119;
UPDATE `creature_template` SET `ai_name` = 'EventAI' WHERE `entry` = 92120;
UPDATE `creature_template` SET `ai_name` = 'EventAI' WHERE `entry` = 92121;
UPDATE `creature_template` SET `ai_name` = 'EventAI' WHERE `entry` = 92122;
UPDATE `creature_template` SET `ai_name` = 'EventAI' WHERE `entry` = 92123;
UPDATE `creature_template` SET `ai_name` = 'EventAI' WHERE `entry` = 92124;
UPDATE `creature_template` SET `ai_name` = 'EventAI' WHERE `entry` = 92125;
UPDATE `creature_template` SET `ai_name` = 'EventAI' WHERE `entry` = 92126;
UPDATE `creature_template` SET `ai_name` = 'EventAI' WHERE `entry` = 92127;
UPDATE `creature_template` SET `ai_name` = 'EventAI' WHERE `entry` = 92128;
UPDATE `creature_template` SET `ai_name` = 'EventAI' WHERE `entry` = 92129;
UPDATE `creature_template` SET `ai_name` = 'EventAI' WHERE `entry` = 92130;
UPDATE `creature_template` SET `ai_name` = 'EventAI' WHERE `entry` = 92131;
UPDATE `creature_template` SET `ai_name` = 'EventAI' WHERE `entry` = 92133;

DELETE FROM `conditions` WHERE `condition_entry` IN (802001);
INSERT INTO `conditions`
(`condition_entry`, `type`, `value1`, `value2`, `value3`, `value4`, `flags`)
VALUES
(802001, 33, 802, 0, 0, 0, 0);

DELETE FROM `broadcast_text` WHERE `entry` IN (9210701, 9210702, 9210901, 9210902, 9211001, 9211002, 9211101, 9211102);
INSERT INTO `broadcast_text`
(`entry`, `male_text`, `female_text`, `chat_type`, `sound_id`, `language_id`, `emote_id1`, `emote_id2`, `emote_id3`, `emote_delay1`, `emote_delay2`, `emote_delay3`)
VALUES
(9210701, 'I am the leader of the tribes, me! The Groveweald shall destroy everyone that gets in the way!', 'I am the leader of the tribes, me! The Groveweald shall destroy everyone that gets in the way!', 1, 30268, 0, 0, 0, 0, 0, 0, 0),
(9210702, 'I.. I can see clearly now.. The madness... It''s... Over...', 'I.. I can see clearly now.. The madness... It''s... Over...', 1, 30270, 0, 0, 0, 0, 0, 0, 0),
(9210901, 'What? Who..Who are you? They wouldn''t send you! Ancients, to my side!', 'What? Who..Who are you? They wouldn''t send you! Ancients, to my side!', 1, 30256, 0, 0, 0, 0, 0, 0, 0),
(9210902, 'We must.. Stop.. The shadow...', 'We must.. Stop.. The shadow...', 1, 30258, 0, 0, 0, 0, 0, 0, 0),
(9211001, 'Do you think you can withstand the might of the Burning Legion?', 'Do you think you can withstand the might of the Burning Legion?', 1, 30271, 0, 0, 0, 0, 0, 0, 0),
(9211002, 'My death.. Means little in the grand scheme, mortals... Drink down your victory... It will mean nothing... In the end...', 'My death.. Means little in the grand scheme, mortals... Drink down your victory... It will mean nothing... In the end...', 1, 30273, 0, 0, 0, 0, 0, 0, 0),
(9211101, 'We will serve at the Master''s will!', 'We will serve at the Master''s will!', 1, 30252, 0, 0, 0, 0, 0, 0, 0),
(9211102, 'You think.. This.... Is the end?', 'You think.. This.... Is the end?', 1, 30253, 0, 0, 0, 0, 0, 0, 0);

DELETE FROM `creature_ai_events` WHERE `id` IN (9210001, 9210101, 9210201, 9210301, 9210401, 9210501, 9210601, 9210701, 9210702, 9210801, 9210901, 9210902, 9211001, 9211002, 9211101, 9211102, 9211201, 9211301, 9211401, 9211501, 9211601, 9211701, 9211801, 9211901, 9212001, 9212101, 9212201, 9212301, 9212401, 9212501, 9212601, 9212701, 9212801, 9212901, 9213001, 9213101, 9213201, 9213301);
INSERT INTO `creature_ai_events`
(`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`)
VALUES
(9210001, 92100, 802001, 4, 0, 100, 0, 0, 0, 0, 0, 9210001, 0, 0, 'Crescent Grove - Groveweald Warrior - pull the zone on aggro'),
(9210101, 92101, 802001, 4, 0, 100, 0, 0, 0, 0, 0, 9210101, 0, 0, 'Crescent Grove - Groveweald Shaman - pull the zone on aggro'),
(9210201, 92102, 802001, 4, 0, 100, 0, 0, 0, 0, 0, 9210201, 0, 0, 'Crescent Grove - Groveweald Pathfinder - pull the zone on aggro'),
(9210301, 92103, 802001, 4, 0, 100, 0, 0, 0, 0, 0, 9210301, 0, 0, 'Crescent Grove - Groveweald Warder - pull the zone on aggro'),
(9210401, 92104, 802001, 4, 0, 100, 0, 0, 0, 0, 0, 9210401, 0, 0, 'Crescent Grove - Groveweald Ursa - pull the zone on aggro'),
(9210501, 92105, 802001, 4, 0, 100, 0, 0, 0, 0, 0, 9210501, 0, 0, 'Crescent Grove - Elder ''One Eye'' - pull the zone on aggro'),
(9210601, 92106, 802001, 4, 0, 100, 0, 0, 0, 0, 0, 9210601, 0, 0, 'Crescent Grove - Elder Blackmaw - pull the zone on aggro'),
(9210701, 92107, 802001, 4, 0, 100, 0, 0, 0, 0, 0, 9210701, 0, 0, 'Crescent Grove - Grovetender Engryss - pull the zone on aggro - yell'),
(9210702, 92107, 0, 6, 0, 100, 0, 0, 0, 0, 0, 9210702, 0, 0, 'Crescent Grove - Grovetender Engryss - death yell'),
(9210801, 92108, 802001, 4, 0, 100, 0, 0, 0, 0, 0, 9210801, 0, 0, 'Crescent Grove - High Priestess A''lathea - pull the zone on aggro'),
(9210901, 92109, 802001, 4, 0, 100, 0, 0, 0, 0, 0, 9210901, 0, 0, 'Crescent Grove - Keeper Ranathos - pull the zone on aggro - yell'),
(9210902, 92109, 0, 6, 0, 100, 0, 0, 0, 0, 0, 9210902, 0, 0, 'Crescent Grove - Keeper Ranathos - death yell'),
(9211001, 92110, 802001, 4, 0, 100, 0, 0, 0, 0, 0, 9211001, 0, 0, 'Crescent Grove - Master Raxxieth - pull the zone on aggro - yell'),
(9211002, 92110, 0, 6, 0, 100, 0, 0, 0, 0, 0, 9211002, 0, 0, 'Crescent Grove - Master Raxxieth - death yell'),
(9211101, 92111, 802001, 4, 0, 100, 0, 0, 0, 0, 0, 9211101, 0, 0, 'Crescent Grove - Fenektis the Deceiver - pull the zone on aggro - yell'),
(9211102, 92111, 0, 6, 0, 100, 0, 0, 0, 0, 0, 9211102, 0, 0, 'Crescent Grove - Fenektis the Deceiver - death yell'),
(9211201, 92112, 802001, 4, 0, 100, 0, 0, 0, 0, 0, 9211201, 0, 0, 'Crescent Grove - Raging Infernal - pull the zone on aggro'),
(9211301, 92113, 802001, 4, 0, 100, 0, 0, 0, 0, 0, 9211301, 0, 0, 'Crescent Grove - Grove Sprite Corruptor - pull the zone on aggro'),
(9211401, 92114, 802001, 4, 0, 100, 0, 0, 0, 0, 0, 9211401, 0, 0, 'Crescent Grove - Wandering Faerie Dragon - pull the zone on aggro'),
(9211501, 92115, 802001, 4, 0, 100, 0, 0, 0, 0, 0, 9211501, 0, 0, 'Crescent Grove - Enraged Sharpclaw - pull the zone on aggro'),
(9211601, 92116, 802001, 4, 0, 100, 0, 0, 0, 0, 0, 9211601, 0, 0, 'Crescent Grove - Glade Creeper - pull the zone on aggro'),
(9211701, 92117, 802001, 4, 0, 100, 0, 0, 0, 0, 0, 9211701, 0, 0, 'Crescent Grove - Deranged Ancient - pull the zone on aggro'),
(9211801, 92118, 802001, 4, 0, 100, 0, 0, 0, 0, 0, 9211801, 0, 0, 'Crescent Grove - Disturbed Spirit - pull the zone on aggro'),
(9211901, 92119, 802001, 4, 0, 100, 0, 0, 0, 0, 0, 9211901, 0, 0, 'Crescent Grove - Wallowing Spirit - pull the zone on aggro'),
(9212001, 92120, 802001, 4, 0, 100, 0, 0, 0, 0, 0, 9212001, 0, 0, 'Crescent Grove - Roaming Felguard - pull the zone on aggro'),
(9212101, 92121, 802001, 4, 0, 100, 0, 0, 0, 0, 0, 9212101, 0, 0, 'Crescent Grove - Mana Hunter - pull the zone on aggro'),
(9212201, 92122, 802001, 4, 0, 100, 0, 0, 0, 0, 0, 9212201, 0, 0, 'Crescent Grove - Wicked Manipulator - pull the zone on aggro'),
(9212301, 92123, 802001, 4, 0, 100, 0, 0, 0, 0, 0, 9212301, 0, 0, 'Crescent Grove - Blacktalon Trickster - pull the zone on aggro'),
(9212401, 92124, 802001, 4, 0, 100, 0, 0, 0, 0, 0, 9212401, 0, 0, 'Crescent Grove - Blacktalon Felsworn - pull the zone on aggro'),
(9212501, 92125, 802001, 4, 0, 100, 0, 0, 0, 0, 0, 9212501, 0, 0, 'Crescent Grove - Blacktalon Flamecaller - pull the zone on aggro'),
(9212601, 92126, 802001, 4, 0, 100, 0, 0, 0, 0, 0, 9212601, 0, 0, 'Crescent Grove - Blacktalon Corruptor - pull the zone on aggro'),
(9212701, 92127, 802001, 4, 0, 100, 0, 0, 0, 0, 0, 9212701, 0, 0, 'Crescent Grove - Twisted Ancient - pull the zone on aggro'),
(9212801, 92128, 802001, 4, 0, 100, 0, 0, 0, 0, 0, 9212801, 0, 0, 'Crescent Grove - Warden Liferoot - pull the zone on aggro'),
(9212901, 92129, 802001, 4, 0, 100, 0, 0, 0, 0, 0, 9212901, 0, 0, 'Crescent Grove - Warden Treeshade - pull the zone on aggro'),
(9213001, 92130, 802001, 4, 0, 100, 0, 0, 0, 0, 0, 9213001, 0, 0, 'Crescent Grove - Speaker Gnarr - pull the zone on aggro'),
(9213101, 92131, 802001, 4, 0, 100, 0, 0, 0, 0, 0, 9213101, 0, 0, 'Crescent Grove - Speaker Ragnaf - pull the zone on aggro'),
(9213201, 92132, 802001, 4, 0, 100, 0, 0, 0, 0, 0, 9213201, 0, 0, 'Crescent Grove - Swordsman Daelus - pull the zone on aggro'),
(9213301, 92133, 802001, 4, 0, 100, 0, 0, 0, 0, 0, 9213301, 0, 0, 'Crescent Grove - Inuvias Brightlance - pull the zone on aggro');

DELETE FROM `creature_ai_scripts` WHERE `id` IN (9210001, 9210101, 9210201, 9210301, 9210401, 9210501, 9210601, 9210701, 9210702, 9210801, 9210901, 9210902, 9211001, 9211002, 9211101, 9211102, 9211201, 9211301, 9211401, 9211501, 9211601, 9211701, 9211801, 9211901, 9212001, 9212101, 9212201, 9212301, 9212401, 9212501, 9212601, 9212701, 9212801, 9212901, 9213001, 9213101, 9213201, 9213301);
INSERT INTO `creature_ai_scripts`
(`id`, `delay`, `priority`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`)
VALUES
(9210001, 0, 0, 49, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Crescent Grove - Groveweald Warrior - pull the zone'),
(9210101, 0, 0, 49, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Crescent Grove - Groveweald Shaman - pull the zone'),
(9210201, 0, 0, 49, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Crescent Grove - Groveweald Pathfinder - pull the zone'),
(9210301, 0, 0, 49, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Crescent Grove - Groveweald Warder - pull the zone'),
(9210401, 0, 0, 49, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Crescent Grove - Groveweald Ursa - pull the zone'),
(9210501, 0, 0, 49, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Crescent Grove - Elder ''One Eye'' - pull the zone'),
(9210601, 0, 0, 49, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Crescent Grove - Elder Blackmaw - pull the zone'),
(9210701, 0, 0, 49, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Crescent Grove - Grovetender Engryss - pull the zone'),
(9210701, 0, 1, 0, 1, 0, 0, 0, 0, 0, 0, 0, 9210701, 0, 0, 0, 0, 0, 0, 0, 0, 'Crescent Grove - Grovetender Engryss - aggro yell'),
(9210702, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 9210702, 0, 0, 0, 0, 0, 0, 0, 0, 'Crescent Grove - Grovetender Engryss - death yell'),
(9210801, 0, 0, 49, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Crescent Grove - High Priestess A''lathea - pull the zone'),
(9210901, 0, 0, 49, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Crescent Grove - Keeper Ranathos - pull the zone'),
(9210901, 0, 1, 0, 1, 0, 0, 0, 0, 0, 0, 0, 9210901, 0, 0, 0, 0, 0, 0, 0, 0, 'Crescent Grove - Keeper Ranathos - aggro yell'),
(9210902, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 9210902, 0, 0, 0, 0, 0, 0, 0, 0, 'Crescent Grove - Keeper Ranathos - death yell'),
(9211001, 0, 0, 49, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Crescent Grove - Master Raxxieth - pull the zone'),
(9211001, 0, 1, 0, 1, 0, 0, 0, 0, 0, 0, 0, 9211001, 0, 0, 0, 0, 0, 0, 0, 0, 'Crescent Grove - Master Raxxieth - aggro yell'),
(9211002, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 9211002, 0, 0, 0, 0, 0, 0, 0, 0, 'Crescent Grove - Master Raxxieth - death yell'),
(9211101, 0, 0, 49, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Crescent Grove - Fenektis the Deceiver - pull the zone'),
(9211101, 0, 1, 0, 1, 0, 0, 0, 0, 0, 0, 0, 9211101, 0, 0, 0, 0, 0, 0, 0, 0, 'Crescent Grove - Fenektis the Deceiver - aggro yell'),
(9211102, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 9211102, 0, 0, 0, 0, 0, 0, 0, 0, 'Crescent Grove - Fenektis the Deceiver - death yell'),
(9211201, 0, 0, 49, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Crescent Grove - Raging Infernal - pull the zone'),
(9211301, 0, 0, 49, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Crescent Grove - Grove Sprite Corruptor - pull the zone'),
(9211401, 0, 0, 49, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Crescent Grove - Wandering Faerie Dragon - pull the zone'),
(9211501, 0, 0, 49, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Crescent Grove - Enraged Sharpclaw - pull the zone'),
(9211601, 0, 0, 49, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Crescent Grove - Glade Creeper - pull the zone'),
(9211701, 0, 0, 49, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Crescent Grove - Deranged Ancient - pull the zone'),
(9211801, 0, 0, 49, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Crescent Grove - Disturbed Spirit - pull the zone'),
(9211901, 0, 0, 49, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Crescent Grove - Wallowing Spirit - pull the zone'),
(9212001, 0, 0, 49, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Crescent Grove - Roaming Felguard - pull the zone'),
(9212101, 0, 0, 49, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Crescent Grove - Mana Hunter - pull the zone'),
(9212201, 0, 0, 49, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Crescent Grove - Wicked Manipulator - pull the zone'),
(9212301, 0, 0, 49, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Crescent Grove - Blacktalon Trickster - pull the zone'),
(9212401, 0, 0, 49, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Crescent Grove - Blacktalon Felsworn - pull the zone'),
(9212501, 0, 0, 49, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Crescent Grove - Blacktalon Flamecaller - pull the zone'),
(9212601, 0, 0, 49, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Crescent Grove - Blacktalon Corruptor - pull the zone'),
(9212701, 0, 0, 49, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Crescent Grove - Twisted Ancient - pull the zone'),
(9212801, 0, 0, 49, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Crescent Grove - Warden Liferoot - pull the zone'),
(9212901, 0, 0, 49, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Crescent Grove - Warden Treeshade - pull the zone'),
(9213001, 0, 0, 49, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Crescent Grove - Speaker Gnarr - pull the zone'),
(9213101, 0, 0, 49, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Crescent Grove - Speaker Ragnaf - pull the zone'),
(9213201, 0, 0, 49, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Crescent Grove - Swordsman Daelus - pull the zone'),
(9213301, 0, 0, 49, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Crescent Grove - Inuvias Brightlance - pull the zone');

