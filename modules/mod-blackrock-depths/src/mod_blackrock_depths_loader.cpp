// Blackrock Depths's scripts, registered from the module: the core has no copy of them (AM1,
// handoff/manager-091). The legacy Script + RegisterSelf registers each under the script_name
// the world database gives it.
#include "scriptPCH.h"
#include "Config/Config.h"

namespace mod_blackrock_depths
{
    void AddSC_blackrock_depths_arena_challenge();
    void AddSC_blackrock_depths_objects();
    void AddSC_boss_anubshiah();
    void AddSC_boss_draganthaurissan();
    void AddSC_boss_general_angerforge();
    void AddSC_boss_gorosh_the_dervish();
    void AddSC_boss_grizzle();
    void AddSC_boss_high_interrogator_gerstahn();
    void AddSC_boss_magmus();
    void AddSC_boss_tomb_of_seven();
}

void Addmod_blackrock_depthsScripts()
{
    // conf/mod-blackrock-depths.conf: off, nothing is registered -- the world database's names find no script.
    if (!sConfig.GetBoolDefault("mod-blackrock-depths.Enable", true))
    {
        sLog.outString("[mod-blackrock-depths] disabled by mod-blackrock-depths.Enable -- no script registered");
        return;
    }
    mod_blackrock_depths::AddSC_blackrock_depths_arena_challenge();
    mod_blackrock_depths::AddSC_blackrock_depths_objects();
    mod_blackrock_depths::AddSC_boss_anubshiah();
    mod_blackrock_depths::AddSC_boss_draganthaurissan();
    mod_blackrock_depths::AddSC_boss_general_angerforge();
    mod_blackrock_depths::AddSC_boss_gorosh_the_dervish();
    mod_blackrock_depths::AddSC_boss_grizzle();
    mod_blackrock_depths::AddSC_boss_high_interrogator_gerstahn();
    mod_blackrock_depths::AddSC_boss_magmus();
    mod_blackrock_depths::AddSC_boss_tomb_of_seven();
    sLog.outString("[mod-blackrock-depths] Blackrock Depths's scripts registered from the module");
}
