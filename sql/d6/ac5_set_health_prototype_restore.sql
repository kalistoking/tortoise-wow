-- Undoes ac5_set_health_prototype.sql: the Kobold Vermin's two prototype rules gone.
DELETE FROM `creature_ai_events` WHERE `id` IN (602, 603);
DELETE FROM `creature_ai_scripts` WHERE `id` IN (602, 603);
