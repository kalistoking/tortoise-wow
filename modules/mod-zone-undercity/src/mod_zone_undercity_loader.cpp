// Undercity's scripts, registered from the module: the core has no copy of them (AM1,
// handoff/manager-088). The legacy Script + RegisterSelf registers each under the script_name
// the world database gives it.
#include "scriptPCH.h"
#include "Config/Config.h"

namespace mod_zone_undercity
{
    void AddSC_undercity();
}

void Addmod_zone_undercityScripts()
{
    // conf/mod-zone-undercity.conf: off, nothing is registered -- the world database's names find no script.
    if (!sConfig.GetBoolDefault("mod-zone-undercity.Enable", true))
    {
        sLog.outString("[mod-zone-undercity] disabled by mod-zone-undercity.Enable -- no script registered");
        return;
    }
    mod_zone_undercity::AddSC_undercity();
    sLog.outString("[mod-zone-undercity] Undercity's scripts registered from the module");
}
