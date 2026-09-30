// Stormwind City's scripts, registered from the module: the core has no copy of them (AM1,
// handoff/manager-088). The legacy Script + RegisterSelf registers each under the script_name
// the world database gives it.
#include "scriptPCH.h"
#include "Config/Config.h"

namespace mod_zone_stormwind_city
{
    void AddSC_stormwind_city();
}

void Addmod_zone_stormwind_cityScripts()
{
    // conf/mod-zone-stormwind-city.conf: off, nothing is registered -- the world database's names find no script.
    if (!sConfig.GetBoolDefault("mod-zone-stormwind-city.Enable", true))
    {
        sLog.outString("[mod-zone-stormwind-city] disabled by mod-zone-stormwind-city.Enable -- no script registered");
        return;
    }
    mod_zone_stormwind_city::AddSC_stormwind_city();
    sLog.outString("[mod-zone-stormwind-city] Stormwind City's scripts registered from the module");
}
