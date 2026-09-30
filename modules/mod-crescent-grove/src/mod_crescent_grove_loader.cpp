// Crescent Grove's scripts, registered from the module: the core has no copy of them (AM1,
// handoff/manager-091). The legacy Script + RegisterSelf registers each under the script_name
// the world database gives it.
#include "scriptPCH.h"
#include "Config/Config.h"

namespace mod_crescent_grove
{
    void AddSC_instance_crescent_grove();
}

void Addmod_crescent_groveScripts()
{
    // conf/mod-crescent-grove.conf: off, nothing is registered -- Crescent Grove then runs on its rows alone.
    if (!sConfig.GetBoolDefault("mod-crescent-grove.Enable", true))
    {
        sLog.outString("[mod-crescent-grove] disabled by mod-crescent-grove.Enable -- no script registered");
        return;
    }
    mod_crescent_grove::AddSC_instance_crescent_grove();
    sLog.outString("[mod-crescent-grove] Crescent Grove's scripts registered from the module");
}
