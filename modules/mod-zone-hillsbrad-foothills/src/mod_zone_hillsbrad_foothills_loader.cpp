// Hillsbrad Foothills's scripts, registered from the module: the core has no copy of them (AM1,
// handoff/manager-088). The legacy Script + RegisterSelf registers each under the script_name
// the world database gives it.
#include "scriptPCH.h"
#include "Config/Config.h"

namespace mod_zone_hillsbrad_foothills
{
    void AddSC_hillsbrad_foothills();
}

void Addmod_zone_hillsbrad_foothillsScripts()
{
    // conf/mod-zone-hillsbrad-foothills.conf: off, nothing is registered -- the world database's names find no script.
    if (!sConfig.GetBoolDefault("mod-zone-hillsbrad-foothills.Enable", true))
    {
        sLog.outString("[mod-zone-hillsbrad-foothills] disabled by mod-zone-hillsbrad-foothills.Enable -- no script registered");
        return;
    }
    mod_zone_hillsbrad_foothills::AddSC_hillsbrad_foothills();
    sLog.outString("[mod-zone-hillsbrad-foothills] Hillsbrad Foothills's scripts registered from the module");
}
