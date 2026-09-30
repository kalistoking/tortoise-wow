// Arathi Highlands's scripts, registered from the module: the core has no copy of them (AM1,
// handoff/manager-088). The legacy Script + RegisterSelf registers each under the script_name
// the world database gives it.
#include "scriptPCH.h"
#include "Config/Config.h"

namespace mod_zone_arathi_highlands
{
    void AddSC_arathi_highlands();
}

void Addmod_zone_arathi_highlandsScripts()
{
    // conf/mod-zone-arathi-highlands.conf: off, nothing is registered -- the world database's names find no script.
    if (!sConfig.GetBoolDefault("mod-zone-arathi-highlands.Enable", true))
    {
        sLog.outString("[mod-zone-arathi-highlands] disabled by mod-zone-arathi-highlands.Enable -- no script registered");
        return;
    }
    mod_zone_arathi_highlands::AddSC_arathi_highlands();
    sLog.outString("[mod-zone-arathi-highlands] Arathi Highlands's scripts registered from the module");
}
