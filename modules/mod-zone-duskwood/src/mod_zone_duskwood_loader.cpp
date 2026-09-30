// Duskwood's scripts, registered from the module: the core has no copy of them (AM1,
// handoff/manager-088). The legacy Script + RegisterSelf registers each under the script_name
// the world database gives it.
#include "scriptPCH.h"
#include "Config/Config.h"

namespace mod_zone_duskwood
{
    void AddSC_duskwood();
}

void Addmod_zone_duskwoodScripts()
{
    // conf/mod-zone-duskwood.conf: off, nothing is registered -- the world database's names find no script.
    if (!sConfig.GetBoolDefault("mod-zone-duskwood.Enable", true))
    {
        sLog.outString("[mod-zone-duskwood] disabled by mod-zone-duskwood.Enable -- no script registered");
        return;
    }
    mod_zone_duskwood::AddSC_duskwood();
    sLog.outString("[mod-zone-duskwood] Duskwood's scripts registered from the module");
}
