// Grim Reaches's scripts, registered from the module: the core has no copy of them (AM1,
// handoff/manager-088). The legacy Script + RegisterSelf registers each under the script_name
// the world database gives it.
#include "scriptPCH.h"
#include "Config/Config.h"

namespace mod_zone_grim_reaches
{
    void AddSC_grim_reaches();
}

void Addmod_zone_grim_reachesScripts()
{
    // conf/mod-zone-grim-reaches.conf: off, nothing is registered -- the world database's names find no script.
    if (!sConfig.GetBoolDefault("mod-zone-grim-reaches.Enable", true))
    {
        sLog.outString("[mod-zone-grim-reaches] disabled by mod-zone-grim-reaches.Enable -- no script registered");
        return;
    }
    mod_zone_grim_reaches::AddSC_grim_reaches();
    sLog.outString("[mod-zone-grim-reaches] Grim Reaches's scripts registered from the module");
}
