// Wetlands's scripts, registered from the module: the core has no copy of them (AM1,
// handoff/manager-088). The legacy Script + RegisterSelf registers each under the script_name
// the world database gives it.
#include "scriptPCH.h"
#include "Config/Config.h"

namespace mod_zone_wetlands
{
    void AddSC_wetlands();
}

void Addmod_zone_wetlandsScripts()
{
    // conf/mod-zone-wetlands.conf: off, nothing is registered -- the world database's names find no script.
    if (!sConfig.GetBoolDefault("mod-zone-wetlands.Enable", true))
    {
        sLog.outString("[mod-zone-wetlands] disabled by mod-zone-wetlands.Enable -- no script registered");
        return;
    }
    mod_zone_wetlands::AddSC_wetlands();
    sLog.outString("[mod-zone-wetlands] Wetlands's scripts registered from the module");
}
