// Hateforge Quarry's scripts, registered from the module: the core has no copy of them (AM1,
// handoff/manager-091). The legacy Script + RegisterSelf registers each under the script_name
// the world database gives it.
#include "scriptPCH.h"
#include "Config/Config.h"

namespace mod_hateforge_quarry
{
    void AddSC_boss_bargul_blackhammer();
    void AddSC_boss_engineer_figgles();
    void AddSC_boss_hargesh_doomcaller();
    void AddSC_boss_hatereaver_annhilator();
    void AddSC_trash_mobs_hateforge_quarry();
}

void Addmod_hateforge_quarryScripts()
{
    // conf/mod-hateforge-quarry.conf: off, nothing is registered -- the world database's names find no script.
    if (!sConfig.GetBoolDefault("mod-hateforge-quarry.Enable", true))
    {
        sLog.outString("[mod-hateforge-quarry] disabled by mod-hateforge-quarry.Enable -- no script registered");
        return;
    }
    mod_hateforge_quarry::AddSC_boss_bargul_blackhammer();
    mod_hateforge_quarry::AddSC_boss_engineer_figgles();
    mod_hateforge_quarry::AddSC_boss_hargesh_doomcaller();
    mod_hateforge_quarry::AddSC_boss_hatereaver_annhilator();
    mod_hateforge_quarry::AddSC_trash_mobs_hateforge_quarry();
    sLog.outString("[mod-hateforge-quarry] Hateforge Quarry's scripts registered from the module");
}
