// Searing Gorge's scripts, registered from the module: the core has no copy of them (AM1,
// handoff/manager-088). The legacy Script + RegisterSelf registers each under the script_name
// the world database gives it.
#include "scriptPCH.h"
#include "Config/Config.h"

namespace mod_zone_searing_gorge
{
    void AddSC_searing_gorge();
}

void Addmod_zone_searing_gorgeScripts()
{
    // conf/mod-zone-searing-gorge.conf: off, nothing is registered -- the world database's names find no script.
    if (!sConfig.GetBoolDefault("mod-zone-searing-gorge.Enable", true))
    {
        sLog.outString("[mod-zone-searing-gorge] disabled by mod-zone-searing-gorge.Enable -- no script registered");
        return;
    }
    mod_zone_searing_gorge::AddSC_searing_gorge();
    sLog.outString("[mod-zone-searing-gorge] Searing Gorge's scripts registered from the module");
}
