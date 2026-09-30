// Scarlet Monastery's scripts, registered from the module: the core has no copy of them (AM1,
// handoff/manager-091). The legacy Script + RegisterSelf registers each under the script_name
// the world database gives it.
#include "scriptPCH.h"
#include "Config/Config.h"

namespace mod_scarlet_monastery
{
    void AddSC_boss_arcanist_doan();
    void AddSC_boss_bloodmage_thalnos();
    void AddSC_boss_herod();
    void AddSC_boss_high_inquisitor_fairbanks();
    void AddSC_boss_houndmaster_loksey();
    void AddSC_boss_interrogator_vishas();
    void AddSC_boss_scorn();
}

void Addmod_scarlet_monasteryScripts()
{
    // conf/mod-scarlet-monastery.conf: off, nothing is registered -- the world database's names find no script.
    if (!sConfig.GetBoolDefault("mod-scarlet-monastery.Enable", true))
    {
        sLog.outString("[mod-scarlet-monastery] disabled by mod-scarlet-monastery.Enable -- no script registered");
        return;
    }
    mod_scarlet_monastery::AddSC_boss_arcanist_doan();
    mod_scarlet_monastery::AddSC_boss_bloodmage_thalnos();
    mod_scarlet_monastery::AddSC_boss_herod();
    mod_scarlet_monastery::AddSC_boss_high_inquisitor_fairbanks();
    mod_scarlet_monastery::AddSC_boss_houndmaster_loksey();
    mod_scarlet_monastery::AddSC_boss_interrogator_vishas();
    mod_scarlet_monastery::AddSC_boss_scorn();
    sLog.outString("[mod-scarlet-monastery] Scarlet Monastery's scripts registered from the module");
}
