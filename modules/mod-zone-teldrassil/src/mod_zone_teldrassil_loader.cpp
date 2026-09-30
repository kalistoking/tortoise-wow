// Teldrassil's scripts, registered from the module: the core has no copy of them (AM1,
// handoff/manager-088). The legacy Script + RegisterSelf registers each under the script_name
// the world database gives it.
#include "scriptPCH.h"
#include "Config/Config.h"

namespace mod_zone_teldrassil
{
    void AddSC_teldrassil();
}

void Addmod_zone_teldrassilScripts()
{
    // conf/mod-zone-teldrassil.conf: off, nothing is registered -- the world database's names find no script.
    if (!sConfig.GetBoolDefault("mod-zone-teldrassil.Enable", true))
    {
        sLog.outString("[mod-zone-teldrassil] disabled by mod-zone-teldrassil.Enable -- no script registered");
        return;
    }
    mod_zone_teldrassil::AddSC_teldrassil();
    sLog.outString("[mod-zone-teldrassil] Teldrassil's scripts registered from the module");
}
