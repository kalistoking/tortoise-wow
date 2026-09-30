// Ashenvale's scripts, registered from the module: the core has no copy of them (AM1,
// handoff/manager-088). The legacy Script + RegisterSelf registers each under the script_name
// the world database gives it.
#include "scriptPCH.h"
#include "Config/Config.h"

namespace mod_zone_ashenvale
{
    void AddSC_ashenvale();
}

void Addmod_zone_ashenvaleScripts()
{
    // conf/mod-zone-ashenvale.conf: off, nothing is registered -- the world database's names find no script.
    if (!sConfig.GetBoolDefault("mod-zone-ashenvale.Enable", true))
    {
        sLog.outString("[mod-zone-ashenvale] disabled by mod-zone-ashenvale.Enable -- no script registered");
        return;
    }
    mod_zone_ashenvale::AddSC_ashenvale();
    sLog.outString("[mod-zone-ashenvale] Ashenvale's scripts registered from the module");
}
