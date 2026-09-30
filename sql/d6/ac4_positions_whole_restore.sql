-- Puts the polar summons back to the prototype's numbering (type 1), for a core before `90211cdb`.
UPDATE `creature_ai_scripts` SET `dataint` = (`dataint` & ~0xFF0000) | (1 << 16) WHERE `command` = 10 AND ((`dataint` >> 16) & 0xFF) = 5;
UPDATE `generic_scripts` SET `dataint` = (`dataint` & ~0xFF0000) | (1 << 16) WHERE `command` = 10 AND ((`dataint` >> 16) & 0xFF) = 5;
UPDATE `gameobject_scripts` SET `dataint` = (`dataint` & ~0xFF0000) | (1 << 16) WHERE `command` = 10 AND ((`dataint` >> 16) & 0xFF) = 5;
UPDATE `event_scripts` SET `dataint` = (`dataint` & ~0xFF0000) | (1 << 16) WHERE `command` = 10 AND ((`dataint` >> 16) & 0xFF) = 5;
UPDATE `gossip_scripts` SET `dataint` = (`dataint` & ~0xFF0000) | (1 << 16) WHERE `command` = 10 AND ((`dataint` >> 16) & 0xFF) = 5;
UPDATE `creature_movement_scripts` SET `dataint` = (`dataint` & ~0xFF0000) | (1 << 16) WHERE `command` = 10 AND ((`dataint` >> 16) & 0xFF) = 5;
UPDATE `quest_start_scripts` SET `dataint` = (`dataint` & ~0xFF0000) | (1 << 16) WHERE `command` = 10 AND ((`dataint` >> 16) & 0xFF) = 5;
UPDATE `quest_end_scripts` SET `dataint` = (`dataint` & ~0xFF0000) | (1 << 16) WHERE `command` = 10 AND ((`dataint` >> 16) & 0xFF) = 5;
UPDATE `spell_scripts` SET `dataint` = (`dataint` & ~0xFF0000) | (1 << 16) WHERE `command` = 10 AND ((`dataint` >> 16) & 0xFF) = 5;
UPDATE `creature_spells_scripts` SET `dataint` = (`dataint` & ~0xFF0000) | (1 << 16) WHERE `command` = 10 AND ((`dataint` >> 16) & 0xFF) = 5;
