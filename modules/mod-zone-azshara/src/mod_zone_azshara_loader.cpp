// Azshara's scripts, registered from the module: the core has no copy of them (AM1,
// handoff/manager-088). The legacy Script + RegisterSelf registers each under the script_name
// the world database gives it.
#include "scriptPCH.h"
#include "Config/Config.h"

namespace mod_zone_azshara
{
    void AddSC_azshara();
}

void Addmod_zone_azsharaScripts()
{
    // conf/mod-zone-azshara.conf: off, nothing is registered -- the world database's names find no script.
    if (!sConfig.GetBoolDefault("mod-zone-azshara.Enable", true))
    {
        sLog.outString("[mod-zone-azshara] disabled by mod-zone-azshara.Enable -- no script registered");
        return;
    }
    mod_zone_azshara::AddSC_azshara();
    sLog.outString("[mod-zone-azshara] Azshara's scripts registered from the module");
}
