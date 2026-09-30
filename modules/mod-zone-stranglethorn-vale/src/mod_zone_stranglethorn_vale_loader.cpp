// Stranglethorn Vale's scripts, registered from the module: the core has no copy of them (AM1,
// handoff/manager-088). The legacy Script + RegisterSelf registers each under the script_name
// the world database gives it.
#include "scriptPCH.h"
#include "Config/Config.h"

namespace mod_zone_stranglethorn_vale
{
    void AddSC_stranglethorn_vale();
}

void Addmod_zone_stranglethorn_valeScripts()
{
    // conf/mod-zone-stranglethorn-vale.conf: off, nothing is registered -- the world database's names find no script.
    if (!sConfig.GetBoolDefault("mod-zone-stranglethorn-vale.Enable", true))
    {
        sLog.outString("[mod-zone-stranglethorn-vale] disabled by mod-zone-stranglethorn-vale.Enable -- no script registered");
        return;
    }
    mod_zone_stranglethorn_vale::AddSC_stranglethorn_vale();
    sLog.outString("[mod-zone-stranglethorn-vale] Stranglethorn Vale's scripts registered from the module");
}
