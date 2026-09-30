-- Hateforge Quarry (map 808), four bosses and three trash: its C++ as rows -- EPIC10 tier 2.
-- Written by the trt repo's scripts/tier2/a06_hateforge_quarry.py from t1_world; hateforge_quarry_restore.sql puts
-- back what this replaces. R8: a person applies it, into the world database.
--
-- The C++ keeps its script names: mod-hateforge-quarry is the switch (AM1, handoff/manager-091).
-- Loaded, the C++ runs as before -- a script found by name comes first. Unloaded
-- (`module unload mod-hateforge-quarry`, which gives every creature standing a new AI at once),
-- the names find no script and the creatures run these rows (their ai_name).
--
-- Stays in the core: the auras' dispel counterpart (hateforge_quarry_spells.cpp). The Faceless
-- Terror keeps its script name and no rules: unloaded, it fights on the core's own AI.

UPDATE `creature_template` SET `ai_name` = 'EventAI' WHERE `entry` = 60718;
UPDATE `creature_template` SET `ai_name` = 'EventAI' WHERE `entry` = 60723;
UPDATE `creature_template` SET `ai_name` = 'EventAI' WHERE `entry` = 60725;
UPDATE `creature_template` SET `ai_name` = 'EventAI' WHERE `entry` = 60734;
UPDATE `creature_template` SET `ai_name` = 'EventAI' WHERE `entry` = 60735;
UPDATE `creature_template` SET `ai_name` = 'EventAI' WHERE `entry` = 60736;
UPDATE `creature_template` SET `ai_name` = 'EventAI' WHERE `entry` = 60737;

DELETE FROM `broadcast_text` WHERE `entry` IN (6073401, 6073403, 6073501, 6073503, 6073506, 6073507, 6073508, 6073601, 6073603, 6073701, 6073703, 6073706);
INSERT INTO `broadcast_text`
(`entry`, `male_text`, `female_text`, `chat_type`, `sound_id`, `language_id`, `emote_id1`, `emote_id2`, `emote_id3`, `emote_delay1`, `emote_delay2`, `emote_delay3`)
VALUES
(6073601, 'You foolish outsiders! You''re not supposed to be here interrupting my great work. Broody, get them, destroy them!', 'You foolish outsiders! You''re not supposed to be here interrupting my great work. Broody, get them, destroy them!', 0, 60353, 0, 0, 0, 0, 0, 0, 0),
(6073603, 'I.. Was going to build an army... I would''ve never been stopped!', 'I.. Was going to build an army... I would''ve never been stopped!', 0, 60354, 0, 0, 0, 0, 0, 0, 0),
(6073401, 'Unidentified intruders, defensive measures, engaged.', 'Unidentified intruders, defensive measures, engaged.', 0, 60355, 0, 0, 0, 0, 0, 0, 0),
(6073403, 'Activate emergency power... Emergency power activation failed... Commence... Shut... Do..wn...', 'Activate emergency power... Emergency power activation failed... Commence... Shut... Do..wn...', 0, 60356, 0, 0, 0, 0, 0, 0, 0),
(6073501, 'You think you contend with the High Foreman? Feel the fury of the Dark Iron!', 'You think you contend with the High Foreman? Feel the fury of the Dark Iron!', 0, 60348, 0, 0, 0, 0, 0, 0, 0),
(6073503, 'Curse you.. Damn you... The work, must go on.', 'Curse you.. Damn you... The work, must go on.', 0, 60352, 0, 0, 0, 0, 0, 0, 0),
(6073506, 'We must maintain our production! WORK HARDER!', 'We must maintain our production! WORK HARDER!', 6, 60349, 0, 0, 0, 0, 0, 0, 0),
(6073507, 'Shadowforge shall reward us all for our work here in the Quarry!', 'Shadowforge shall reward us all for our work here in the Quarry!', 6, 60350, 0, 0, 0, 0, 0, 0, 0),
(6073508, 'I don''t see enough of you busy out there, We don''t have all month!', 'I don''t see enough of you busy out there, We don''t have all month!', 6, 60351, 0, 0, 0, 0, 0, 0, 0),
(6073701, 'So, you have been the ones that raised the alarms, you shall meet your demise within this cave...', 'So, you have been the ones that raised the alarms, you shall meet your demise within this cave...', 0, 60360, 0, 0, 0, 0, 0, 0, 0),
(6073703, 'Stronger than I have anticipated... I have served my masters, till the end.', 'Stronger than I have anticipated... I have served my masters, till the end.', 0, 60361, 0, 0, 0, 0, 0, 0, 0),
(6073706, 'The Void hungers for more souls, let it consume you...', 'The Void hungers for more souls, let it consume you...', 0, 60362, 0, 0, 0, 0, 0, 0, 0);

DELETE FROM `creature_ai_events` WHERE `id` IN (6071801, 6071802, 6072301, 6072302, 6072501, 6073401, 6073402, 6073403, 6073404, 6073405, 6073501, 6073502, 6073503, 6073504, 6073505, 6073506, 6073601, 6073602, 6073603, 6073701, 6073702, 6073703, 6073704, 6073705, 6073706, 6073707, 6073708, 6073709);
INSERT INTO `creature_ai_events`
(`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`)
VALUES
(6073601, 60736, 0, 4, 0, 100, 0, 0, 0, 0, 0, 6073601, 0, 0, 'Engineer Figgles - aggro line'),
(6073603, 60736, 0, 6, 0, 100, 0, 0, 0, 0, 0, 6073603, 0, 0, 'Engineer Figgles - death line'),
(6073602, 60736, 0, 0, 0, 100, 0, 10000, 10000, 0, 0, 6073602, 0, 0, 'Engineer Figgles - Corrosive Poison on its victim, once'),
(6073401, 60734, 0, 4, 0, 100, 0, 0, 0, 0, 0, 6073401, 0, 0, 'Hatereaver Annihilator - aggro line'),
(6073403, 60734, 0, 6, 0, 100, 0, 0, 0, 0, 0, 6073403, 0, 0, 'Hatereaver Annihilator - death line'),
(6073402, 60734, 0, 0, 0, 100, 9, 30000, 30000, 30000, 30000, 6073402, 0, 0, 'Hatereaver Annihilator - Knockback on its victim'),
(6073404, 60734, 0, 0, 0, 100, 9, 40000, 40000, 40000, 40000, 6073404, 0, 0, 'Hatereaver Annihilator - Cleave on its victim'),
(6073405, 60734, 0, 0, 0, 100, 9, 45000, 45000, 45000, 45000, 6073405, 0, 0, 'Hatereaver Annihilator - War Stomp'),
(6073501, 60735, 0, 4, 0, 100, 0, 0, 0, 0, 0, 6073501, 0, 0, 'High Foreman Bargul Blackhammer - aggro line'),
(6073503, 60735, 0, 6, 0, 100, 0, 0, 0, 0, 0, 6073503, 0, 0, 'High Foreman Bargul Blackhammer - death line'),
(6073502, 60735, 0, 0, 0, 100, 9, 25000, 25000, 25000, 25000, 6073502, 0, 0, 'Bargul Blackhammer - Stunning Strike on its victim'),
(6073504, 60735, 0, 0, 0, 100, 9, 35000, 35000, 35000, 35000, 6073504, 0, 0, 'Bargul Blackhammer - Mortal Strike on its victim'),
(6073505, 60735, 0, 0, 0, 100, 9, 40000, 40000, 40000, 40000, 6073505, 0, 0, 'Bargul Blackhammer - Demoralizing Shout'),
(6073506, 60735, 0, 1, 0, 100, 1, 60000, 60000, 300000, 300000, 6073506, 0, 0, 'Bargul Blackhammer - a work shout, a minute in, then every 5 min'),
(6073701, 60737, 0, 4, 0, 100, 0, 0, 0, 0, 0, 6073701, 0, 0, 'Har''gesh Doomcaller - aggro line'),
(6073703, 60737, 0, 6, 0, 100, 0, 0, 0, 0, 0, 6073703, 0, 0, 'Har''gesh Doomcaller - death line'),
(6073702, 60737, 0, 0, 6, 100, 9, 30000, 30000, 30000, 30000, 6073702, 0, 0, 'Har''gesh Doomcaller - Immolate on its victim'),
(6073704, 60737, 0, 0, 6, 100, 9, 60000, 60000, 90000, 90000, 6073704, 0, 0, 'Har''gesh Doomcaller - Shadow Bolt Volley'),
(6073705, 60737, 0, 0, 6, 100, 9, 10000, 10000, 10000, 10000, 6073705, 0, 0, 'Har''gesh Doomcaller - Shadow Bolt on its victim'),
(6073706, 60737, 0, 2, 0, 100, 0, 59, 0, 0, 0, 6073706, 0, 0, 'Har''gesh Doomcaller - the void, under 60 %'),
(6073707, 60737, 0, 25, -3, 100, 1, 60738, 0, 0, 0, 6073707, 0, 0, 'Har''gesh Doomcaller - the first terror dead'),
(6073708, 60737, 0, 25, -5, 100, 1, 60738, 0, 0, 0, 6073708, 0, 0, 'Har''gesh Doomcaller - the second terror dead: the void ends'),
(6073709, 60737, 0, 7, 0, 100, 0, 0, 0, 0, 0, 6073709, 0, 0, 'Har''gesh Doomcaller - evade: the void undone'),
(6071801, 60718, 0, 0, 0, 100, 8, 0, 0, 0, 0, 6071801, 0, 0, 'Hateforge Cleric - Immolate on its victim, once'),
(6071802, 60718, 0, 0, 0, 100, 9, 4000, 4000, 8000, 10000, 6071802, 0, 0, 'Hateforge Cleric - Greater Heal on the friend missing most health'),
(6072301, 60723, 0, 0, 0, 100, 8, 5000, 5000, 0, 0, 6072301, 0, 0, 'Hateforge Taskmaster - its spell on a friend within 5 yd, once'),
(6072302, 60723, 0, 0, 0, 100, 9, 1000, 1000, 35000, 35000, 6072302, 0, 0, 'Hateforge Taskmaster - its spell on its victim'),
(6072501, 60725, 0, 0, 0, 100, 8, 1000, 1000, 0, 0, 6072501, 0, 0, 'Twilight Fireblade - its spell on a friend within 10 yd, once');

DELETE FROM `creature_ai_scripts` WHERE `id` IN (6071801, 6071802, 6072301, 6072302, 6072501, 6073401, 6073402, 6073403, 6073404, 6073405, 6073501, 6073502, 6073503, 6073504, 6073505, 6073506, 6073601, 6073602, 6073603, 6073701, 6073702, 6073703, 6073704, 6073705, 6073706, 6073707, 6073708, 6073709);
INSERT INTO `creature_ai_scripts`
(`id`, `delay`, `priority`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`)
VALUES
(6073601, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 6073601, 0, 0, 0, 0, 0, 0, 0, 0, 'Engineer Figgles - aggro line'),
(6073603, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 6073603, 0, 0, 0, 0, 0, 0, 0, 0, 'Engineer Figgles - death line'),
(6073602, 0, 0, 15, 24111, 0, 0, 0, 0, 0, 1, 8, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Engineer Figgles - Corrosive Poison on its victim, once'),
(6073401, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 6073401, 0, 0, 0, 0, 0, 0, 0, 0, 'Hatereaver Annihilator - aggro line'),
(6073403, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 6073403, 0, 0, 0, 0, 0, 0, 0, 0, 'Hatereaver Annihilator - death line'),
(6073402, 0, 0, 15, 28438, 0, 0, 0, 0, 0, 1, 8, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Hatereaver Annihilator - Knockback on its victim'),
(6073404, 0, 0, 15, 19983, 0, 0, 0, 0, 0, 1, 8, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Hatereaver Annihilator - Cleave on its victim'),
(6073405, 0, 0, 15, 11876, 0, 0, 0, 0, 0, 1, 8, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Hatereaver Annihilator - War Stomp'),
(6073501, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 6073501, 0, 0, 0, 0, 0, 0, 0, 0, 'High Foreman Bargul Blackhammer - aggro line'),
(6073503, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 6073503, 0, 0, 0, 0, 0, 0, 0, 0, 'High Foreman Bargul Blackhammer - death line'),
(6073502, 0, 0, 15, 5703, 0, 0, 0, 0, 0, 1, 8, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Bargul Blackhammer - Stunning Strike on its victim'),
(6073504, 0, 0, 15, 27580, 0, 0, 0, 0, 0, 1, 8, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Bargul Blackhammer - Mortal Strike on its victim'),
(6073505, 0, 0, 15, 27579, 0, 0, 0, 0, 0, 1, 8, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Bargul Blackhammer - Demoralizing Shout'),
(6073506, 0, 0, 0, 6, 0, 0, 0, 0, 0, 0, 0, 6073506, 6073507, 6073508, 0, 0, 0, 0, 0, 0, 'Bargul Blackhammer - one of three work shouts'),
(6073701, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 6073701, 0, 0, 0, 0, 0, 0, 0, 0, 'Har''gesh Doomcaller - aggro line'),
(6073703, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 6073703, 0, 0, 0, 0, 0, 0, 0, 0, 'Har''gesh Doomcaller - death line'),
(6073702, 0, 0, 15, 11668, 0, 0, 0, 0, 0, 1, 8, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Har''gesh Doomcaller - Immolate on its victim'),
(6073704, 0, 0, 15, 27646, 0, 0, 0, 0, 0, 1, 8, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Har''gesh Doomcaller - Shadow Bolt Volley'),
(6073705, 0, 0, 15, 12739, 0, 0, 0, 0, 0, 1, 8, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Har''gesh Doomcaller - Shadow Bolt on its victim'),
(6073706, 0, 0, 44, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Har''gesh Doomcaller - the void (phase 1)'),
(6073706, 0, 1, 15, 29230, 2, 0, 0, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Har''gesh Doomcaller - immune'),
(6073706, 0, 2, 74, 17507, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Har''gesh Doomcaller - rooted (Passive Root)'),
(6073706, 0, 3, 15, 12380, 2, 0, 0, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Har''gesh Doomcaller - Shadow Channeling'),
(6073706, 0, 4, 10, 60738, 0, 0, 0, 0, 0, 0, 0, 0, 0, 4, 8, -8300.825195, -3735.292725, 138.12, 6.020778, 0, 'Har''gesh Doomcaller - a Faceless Terror (1 of 2)'),
(6073706, 0, 5, 10, 60738, 0, 0, 0, 0, 0, 0, 0, 0, 0, 4, 8, -8300.825195, -3735.292725, 138.12, 6.020778, 0, 'Har''gesh Doomcaller - a Faceless Terror (2 of 2)'),
(6073706, 0, 6, 0, 0, 0, 0, 0, 0, 0, 0, 0, 6073706, 0, 0, 0, 0, 0, 0, 0, 0, 'Har''gesh Doomcaller - the void line'),
(6073707, 0, 0, 44, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Har''gesh Doomcaller - one terror left (phase 2)'),
(6073708, 0, 0, 14, 12380, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Har''gesh Doomcaller - Shadow Channeling off'),
(6073708, 0, 1, 14, 29230, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Har''gesh Doomcaller - immunity off'),
(6073708, 0, 2, 14, 17507, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Har''gesh Doomcaller - root off'),
(6073708, 0, 3, 44, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Har''gesh Doomcaller - back to phase 0'),
(6073709, 0, 0, 14, 12380, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Har''gesh Doomcaller - Shadow Channeling off'),
(6073709, 0, 1, 14, 29230, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Har''gesh Doomcaller - immunity off'),
(6073709, 0, 2, 14, 17507, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Har''gesh Doomcaller - root off'),
(6073709, 0, 3, 44, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Har''gesh Doomcaller - back to phase 0'),
(6073709, 0, 4, 18, 0, 0, 0, 0, 60738, 200, 8, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Har''gesh Doomcaller - a Faceless Terror away (1)'),
(6073709, 0, 5, 18, 0, 0, 0, 0, 60738, 200, 8, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Har''gesh Doomcaller - a Faceless Terror away (2)'),
(6073703, 0, 1, 18, 0, 0, 0, 0, 60738, 200, 8, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Har''gesh Doomcaller - a Faceless Terror away as he dies (1)'),
(6073703, 0, 2, 18, 0, 0, 0, 0, 60738, 200, 8, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Har''gesh Doomcaller - a Faceless Terror away as he dies (2)'),
(6071801, 0, 0, 15, 11668, 0, 0, 0, 0, 0, 1, 8, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Hateforge Cleric - Immolate on its victim, once'),
(6071802, 0, 0, 15, 10965, 0, 0, 0, 40, 99, 15, 8, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Hateforge Cleric - Greater Heal on the friend missing most health'),
(6072301, 0, 0, 15, 56522, 0, 0, 0, 5, 0, 14, 8, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Hateforge Taskmaster - its spell on a friend within 5 yd, once'),
(6072302, 0, 0, 15, 13608, 0, 0, 0, 0, 0, 1, 8, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Hateforge Taskmaster - its spell on its victim'),
(6072501, 0, 0, 15, 56524, 0, 0, 0, 10, 0, 14, 8, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Twilight Fireblade - its spell on a friend within 10 yd, once');

