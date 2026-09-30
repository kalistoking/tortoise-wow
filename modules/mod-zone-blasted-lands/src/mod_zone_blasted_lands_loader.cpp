// Blasted Lands's scripts, registered from the module: the core has no copy of them (AM1,
// handoff/manager-088). The legacy Script + RegisterSelf registers each under the script_name
// the world database gives it.
#include "scriptPCH.h"
#include "Config/Config.h"

namespace mod_zone_blasted_lands
{
    void AddSC_blasted_lands();
}

void Addmod_zone_blasted_landsScripts()
{
    // conf/mod-zone-blasted-lands.conf: off, nothing is registered -- the world database's names find no script.
    if (!sConfig.GetBoolDefault("mod-zone-blasted-lands.Enable", true))
    {
        sLog.outString("[mod-zone-blasted-lands] disabled by mod-zone-blasted-lands.Enable -- no script registered");
        return;
    }
    mod_zone_blasted_lands::AddSC_blasted_lands();
    sLog.outString("[mod-zone-blasted-lands] Blasted Lands's scripts registered from the module");
}
