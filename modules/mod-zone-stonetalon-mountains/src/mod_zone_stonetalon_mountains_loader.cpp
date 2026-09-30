// Stonetalon Mountains's scripts, registered from the module: the core has no copy of them (AM1,
// handoff/manager-088). The legacy Script + RegisterSelf registers each under the script_name
// the world database gives it.
#include "scriptPCH.h"
#include "Config/Config.h"

namespace mod_zone_stonetalon_mountains
{
    void AddSC_stonetalon_mountains();
}

void Addmod_zone_stonetalon_mountainsScripts()
{
    // conf/mod-zone-stonetalon-mountains.conf: off, nothing is registered -- the world database's names find no script.
    if (!sConfig.GetBoolDefault("mod-zone-stonetalon-mountains.Enable", true))
    {
        sLog.outString("[mod-zone-stonetalon-mountains] disabled by mod-zone-stonetalon-mountains.Enable -- no script registered");
        return;
    }
    mod_zone_stonetalon_mountains::AddSC_stonetalon_mountains();
    sLog.outString("[mod-zone-stonetalon-mountains] Stonetalon Mountains's scripts registered from the module");
}
