// Stormwind Vaults's scripts, registered from the module: the core has no copy of them (AM1,
// handoff/manager-091). The legacy Script + RegisterSelf registers each under the script_name
// the world database gives it.
#include "scriptPCH.h"
#include "Config/Config.h"

namespace mod_stormwind_vaults
{
    void AddSC_boss_major_resonating_crystalAI();
    void AddSC_boss_aszosh_grimflame();
    void AddSC_boss_black_bride();
    void AddSC_boss_nazorna();
    void AddSC_boss_thamgrarr();
}

void Addmod_stormwind_vaultsScripts()
{
    // conf/mod-stormwind-vaults.conf: off, nothing is registered -- the world database's names find no script.
    if (!sConfig.GetBoolDefault("mod-stormwind-vaults.Enable", true))
    {
        sLog.outString("[mod-stormwind-vaults] disabled by mod-stormwind-vaults.Enable -- no script registered");
        return;
    }
    mod_stormwind_vaults::AddSC_boss_major_resonating_crystalAI();
    mod_stormwind_vaults::AddSC_boss_aszosh_grimflame();
    mod_stormwind_vaults::AddSC_boss_black_bride();
    mod_stormwind_vaults::AddSC_boss_nazorna();
    mod_stormwind_vaults::AddSC_boss_thamgrarr();
    sLog.outString("[mod-stormwind-vaults] Stormwind Vaults's scripts registered from the module");
}
