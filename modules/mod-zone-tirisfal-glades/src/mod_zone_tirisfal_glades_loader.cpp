// Tirisfal Glades's scripts, registered from the module: the core has no copy of them (AM1,
// handoff/manager-088). The legacy Script + RegisterSelf registers each under the script_name
// the world database gives it.
#include "scriptPCH.h"
#include "Config/Config.h"

namespace mod_zone_tirisfal_glades
{
    void AddSC_tirisfal_glades();
}

void Addmod_zone_tirisfal_gladesScripts()
{
    // conf/mod-zone-tirisfal-glades.conf: off, nothing is registered -- the world database's names find no script.
    if (!sConfig.GetBoolDefault("mod-zone-tirisfal-glades.Enable", true))
    {
        sLog.outString("[mod-zone-tirisfal-glades] disabled by mod-zone-tirisfal-glades.Enable -- no script registered");
        return;
    }
    mod_zone_tirisfal_glades::AddSC_tirisfal_glades();
    sLog.outString("[mod-zone-tirisfal-glades] Tirisfal Glades's scripts registered from the module");
}
