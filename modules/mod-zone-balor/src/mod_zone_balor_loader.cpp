// Balor's scripts, registered from the module: the core has no copy of them (AM1,
// handoff/manager-088). The legacy Script + RegisterSelf registers each under the script_name
// the world database gives it.
#include "scriptPCH.h"
#include "Config/Config.h"

namespace mod_zone_balor
{
    void AddSC_balor();
}

void Addmod_zone_balorScripts()
{
    // conf/mod-zone-balor.conf: off, nothing is registered -- the world database's names find no script.
    if (!sConfig.GetBoolDefault("mod-zone-balor.Enable", true))
    {
        sLog.outString("[mod-zone-balor] disabled by mod-zone-balor.Enable -- no script registered");
        return;
    }
    mod_zone_balor::AddSC_balor();
    sLog.outString("[mod-zone-balor] Balor's scripts registered from the module");
}
