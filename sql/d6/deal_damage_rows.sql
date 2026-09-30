-- DEAL_DAMAGE damages its target now, as ScriptMgr.h says (core trt/module-structure, trt E22):
-- it read the source, and every row damaged its own. Of the 11 rows that use it (t1_world), 9 say
-- TARGET_SELF and 1 (Questioning Reethe, 12741) swaps to Paval and then TARGET_SELF -- the same
-- unit before and after. One does not: Baxxil's gossip (6003702) runs with Baxxil the source and the
-- player the target, and "Kill Baxxil" would kill the player. TARGET_SELF (4) says Baxxil -- right
-- with the old core and the new. Written by trt; R8: a person applies it. deal_damage_rows_restore.sql
-- undoes it.
UPDATE `gossip_scripts` SET `data_flags` = `data_flags` | 4 WHERE `id` = 6003702 AND `command` = 48;
