// Hinterlands's scripts, registered from the module: the core has no copy of them (AM1,
// handoff/manager-088). The legacy Script + RegisterSelf registers each under the script_name
// the world database gives it.
#include "scriptPCH.h"
#include "Config/Config.h"

namespace mod_zone_hinterlands
{
    void AddSC_hinterlands();
}

void Addmod_zone_hinterlandsScripts()
{
    // conf/mod-zone-hinterlands.conf: off, nothing is registered -- the world database's names find no script.
    if (!sConfig.GetBoolDefault("mod-zone-hinterlands.Enable", true))
    {
        sLog.outString("[mod-zone-hinterlands] disabled by mod-zone-hinterlands.Enable -- no script registered");
        return;
    }
    mod_zone_hinterlands::AddSC_hinterlands();
    sLog.outString("[mod-zone-hinterlands] Hinterlands's scripts registered from the module");
}
