// Darkshore's scripts, registered from the module: the core has no copy of them (AM1,
// handoff/manager-088). The legacy Script + RegisterSelf registers each under the script_name
// the world database gives it.
#include "scriptPCH.h"
#include "Config/Config.h"

namespace mod_zone_darkshore
{
    void AddSC_darkshore();
}

void Addmod_zone_darkshoreScripts()
{
    // conf/mod-zone-darkshore.conf: off, nothing is registered -- the world database's names find no script.
    if (!sConfig.GetBoolDefault("mod-zone-darkshore.Enable", true))
    {
        sLog.outString("[mod-zone-darkshore] disabled by mod-zone-darkshore.Enable -- no script registered");
        return;
    }
    mod_zone_darkshore::AddSC_darkshore();
    sLog.outString("[mod-zone-darkshore] Darkshore's scripts registered from the module");
}
