// Blackfathom Deeps's scripts, registered from the module: the core has no copy of them (AM1,
// handoff/manager-091). The legacy Script + RegisterSelf registers each under the script_name
// the world database gives it.
#include "scriptPCH.h"
#include "Config/Config.h"

namespace mod_blackfathom_deeps
{
    void AddSC_boss_velthelaxx_the_defiler();
    void AddSC_instance_blackfathom_deeps();
}

void Addmod_blackfathom_deepsScripts()
{
    // conf/mod-blackfathom-deeps.conf: off, nothing is registered -- the world database's names find no script.
    if (!sConfig.GetBoolDefault("mod-blackfathom-deeps.Enable", true))
    {
        sLog.outString("[mod-blackfathom-deeps] disabled by mod-blackfathom-deeps.Enable -- no script registered");
        return;
    }
    mod_blackfathom_deeps::AddSC_boss_velthelaxx_the_defiler();
    mod_blackfathom_deeps::AddSC_instance_blackfathom_deeps();
    sLog.outString("[mod-blackfathom-deeps] Blackfathom Deeps's scripts registered from the module");
}
