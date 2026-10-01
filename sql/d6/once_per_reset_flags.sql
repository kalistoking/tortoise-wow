-- Once-per-reset EventAI rules (aggro, death, evade, reached home, leave combat) that the tier-2
-- generators wrote with EFLAG_REPEATABLE. The core strips the flag at boot and logs
-- "Event can never be repeatable"; the rules fire after every reset either way. This clears the
-- flag in a world the *_as_rows.sql files were applied to before the fix; it touches nothing else.
UPDATE `creature_ai_events` SET `event_flags` = `event_flags` & ~1
WHERE `id` IN (1149615, 1432405, 1616812, 1593113, 1595312, 1595313, 1542803, 4510904, 4511003, 4511203, 1451703)
  AND `event_type` IN (4, 6, 7, 21, 30);
