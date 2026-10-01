// Zulgurub's scripts, registered from the module: the core has no copy of them (AM1,
// handoff/manager-091). The legacy Script + RegisterSelf registers each under the script_name
// the world database gives it.
#include "scriptPCH.h"
#include "Config/Config.h"

namespace mod_zulgurub
{
    void AddSC_boss_gahzranka();
    void AddSC_boss_venoxis();
    void AddSC_zulgurub_bat_rider();
    void AddSC_zulgurub_gong();
    void AddSC_zg_trash();
    void AddSC_boss_jeklik();
    void AddSC_zulgurub_brazier_tablets();
    void AddSC_zulgurub_shade_of_jindo();
    void AddSC_zulgurub_ohgan();
}

void Addmod_zulgurubScripts()
{
    // conf/mod-zulgurub.conf: off, nothing is registered -- the world database's names find no script.
    if (!sConfig.GetBoolDefault("mod-zulgurub.Enable", true))
    {
        sLog.outString("[mod-zulgurub] disabled by mod-zulgurub.Enable -- no script registered");
        return;
    }
    mod_zulgurub::AddSC_boss_gahzranka();
    mod_zulgurub::AddSC_boss_venoxis();
    mod_zulgurub::AddSC_zulgurub_bat_rider();
    mod_zulgurub::AddSC_zulgurub_gong();
    mod_zulgurub::AddSC_zg_trash();
    mod_zulgurub::AddSC_boss_jeklik();
    mod_zulgurub::AddSC_zulgurub_brazier_tablets();
    mod_zulgurub::AddSC_zulgurub_shade_of_jindo();
    mod_zulgurub::AddSC_zulgurub_ohgan();
    sLog.outString("[mod-zulgurub] Zulgurub's scripts registered from the module");
}
