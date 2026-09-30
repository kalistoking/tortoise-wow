-- Undoes ac2_spell_hit_target_prototype.sql: the Kobold Worker's two prototype rules gone.
DELETE FROM `creature_ai_events` WHERE `id` IN (25702, 25703);
DELETE FROM `creature_ai_scripts` WHERE `id` IN (25702, 25703);
