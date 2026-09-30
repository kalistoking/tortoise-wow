// Maraudon's scripts, registered from the module: the core has no copy of them (AM1,
// handoff/manager-091). The legacy Script + RegisterSelf registers each under the script_name
// the world database gives it.
#include "scriptPCH.h"
#include "Config/Config.h"

namespace mod_maraudon
{
    void AddSC_boss_celebras_the_cursed();
    void AddSC_boss_landslide();
    void AddSC_boss_noxxion();
    void AddSC_boss_ptheradras();
    void AddSC_instance_maraudon();
}

void Addmod_maraudonScripts()
{
    // conf/mod-maraudon.conf: off, nothing is registered -- the world database's names find no script.
    if (!sConfig.GetBoolDefault("mod-maraudon.Enable", true))
    {
        sLog.outString("[mod-maraudon] disabled by mod-maraudon.Enable -- no script registered");
        return;
    }
    mod_maraudon::AddSC_boss_celebras_the_cursed();
    mod_maraudon::AddSC_boss_landslide();
    mod_maraudon::AddSC_boss_noxxion();
    mod_maraudon::AddSC_boss_ptheradras();
    mod_maraudon::AddSC_instance_maraudon();
    sLog.outString("[mod-maraudon] Maraudon's scripts registered from the module");
}
