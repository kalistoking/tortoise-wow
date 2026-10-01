// Stratholme's scripts, registered from the module: the core has no copy of them (AM1,
// handoff/manager-091). The legacy Script + RegisterSelf registers each under the script_name
// the world database gives it.
#include "scriptPCH.h"
#include "Config/Config.h"

namespace mod_stratholme
{
    void AddSC_boss_atiesh();
    void AddSC_boss_cannon_master_willey();
    void AddSC_boss_magistrate_barthilas();
    void AddSC_boss_maleki_the_pallid();
    void AddSC_boss_nerubenkan();
    void AddSC_boss_postmaster_malown();
    void AddSC_boss_ramstein_the_gorger();
    void AddSC_boss_timmy_the_cruel();
    void AddSC_stratholme();
    void AddSC_boss_dathrohan_balnazzar();
}

void Addmod_stratholmeScripts()
{
    // conf/mod-stratholme.conf: off, nothing is registered -- the world database's names find no script.
    if (!sConfig.GetBoolDefault("mod-stratholme.Enable", true))
    {
        sLog.outString("[mod-stratholme] disabled by mod-stratholme.Enable -- no script registered");
        return;
    }
    mod_stratholme::AddSC_boss_atiesh();
    mod_stratholme::AddSC_boss_cannon_master_willey();
    mod_stratholme::AddSC_boss_magistrate_barthilas();
    mod_stratholme::AddSC_boss_maleki_the_pallid();
    mod_stratholme::AddSC_boss_nerubenkan();
    mod_stratholme::AddSC_boss_postmaster_malown();
    mod_stratholme::AddSC_boss_ramstein_the_gorger();
    mod_stratholme::AddSC_boss_timmy_the_cruel();
    mod_stratholme::AddSC_stratholme();
    mod_stratholme::AddSC_boss_dathrohan_balnazzar();
    sLog.outString("[mod-stratholme] Stratholme's scripts registered from the module");
}
