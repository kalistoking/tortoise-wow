// Felwood's scripts, registered from the module: the core has no copy of them (AM1,
// handoff/manager-088). The legacy Script + RegisterSelf registers each under the script_name
// the world database gives it.
#include "scriptPCH.h"
#include "Config/Config.h"

namespace mod_zone_felwood
{
    void AddSC_felwood();
}

void Addmod_zone_felwoodScripts()
{
    // conf/mod-zone-felwood.conf: off, nothing is registered -- the world database's names find no script.
    if (!sConfig.GetBoolDefault("mod-zone-felwood.Enable", true))
    {
        sLog.outString("[mod-zone-felwood] disabled by mod-zone-felwood.Enable -- no script registered");
        return;
    }
    mod_zone_felwood::AddSC_felwood();
    sLog.outString("[mod-zone-felwood] Felwood's scripts registered from the module");
}
