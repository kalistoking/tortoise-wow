// Winterspring's scripts, registered from the module: the core has no copy of them (AM1,
// handoff/manager-088). The legacy Script + RegisterSelf registers each under the script_name
// the world database gives it.
#include "scriptPCH.h"
#include "Config/Config.h"

namespace mod_zone_winterspring
{
    void AddSC_winterspring();
}

void Addmod_zone_winterspringScripts()
{
    // conf/mod-zone-winterspring.conf: off, nothing is registered -- the world database's names find no script.
    if (!sConfig.GetBoolDefault("mod-zone-winterspring.Enable", true))
    {
        sLog.outString("[mod-zone-winterspring] disabled by mod-zone-winterspring.Enable -- no script registered");
        return;
    }
    mod_zone_winterspring::AddSC_winterspring();
    sLog.outString("[mod-zone-winterspring] Winterspring's scripts registered from the module");
}
