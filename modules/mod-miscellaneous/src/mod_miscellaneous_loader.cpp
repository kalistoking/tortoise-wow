// Miscellaneous's scripts, registered from the module: the core has no copy of them (AM1,
// handoff/manager-088). The legacy Script + RegisterSelf registers each under the script_name
// the world database gives it.
#include "scriptPCH.h"
#include "Config/Config.h"

namespace mod_miscellaneous
{
    void AddSC_areatrigger_scripts();
    void AddSC_custom_exploration_triggers();
    void AddSC_CUSTOM_SPELL();
    void AddSC_gardening();
    void AddSC_go_scripts();
    void AddSC_item_orb_of_draconic_energy();
    void AddSC_jewelcrafting();
    void AddSC_npc_ptr();
    void AddSC_random_scripts_0();
    void AddSC_random_scripts_1();
    void AddSC_random_scripts_2();
    void AddSC_random_scripts_3();
    void AddSC_boss_omen();
}

void Addmod_miscellaneousScripts()
{
    // conf/mod-miscellaneous.conf: off, nothing is registered -- the world database's names find no script.
    if (!sConfig.GetBoolDefault("mod-miscellaneous.Enable", true))
    {
        sLog.outString("[mod-miscellaneous] disabled by mod-miscellaneous.Enable -- no script registered");
        return;
    }
    mod_miscellaneous::AddSC_areatrigger_scripts();
    mod_miscellaneous::AddSC_custom_exploration_triggers();
    mod_miscellaneous::AddSC_CUSTOM_SPELL();
    mod_miscellaneous::AddSC_gardening();
    mod_miscellaneous::AddSC_go_scripts();
    mod_miscellaneous::AddSC_item_orb_of_draconic_energy();
    mod_miscellaneous::AddSC_jewelcrafting();
    mod_miscellaneous::AddSC_npc_ptr();
    mod_miscellaneous::AddSC_random_scripts_0();
    mod_miscellaneous::AddSC_random_scripts_1();
    mod_miscellaneous::AddSC_random_scripts_2();
    mod_miscellaneous::AddSC_random_scripts_3();
    mod_miscellaneous::AddSC_boss_omen();
    sLog.outString("[mod-miscellaneous] Miscellaneous's scripts registered from the module");
}
