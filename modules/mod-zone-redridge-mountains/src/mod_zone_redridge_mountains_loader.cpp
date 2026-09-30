// Redridge Mountains's scripts, registered from the module: the core has no copy of them (AM1,
// handoff/manager-088). The legacy Script + RegisterSelf registers each under the script_name
// the world database gives it.
#include "scriptPCH.h"
#include "Config/Config.h"

namespace mod_zone_redridge_mountains
{
    void AddSC_redridge_mountains();
}

void Addmod_zone_redridge_mountainsScripts()
{
    // conf/mod-zone-redridge-mountains.conf: off, nothing is registered -- the world database's names find no script.
    if (!sConfig.GetBoolDefault("mod-zone-redridge-mountains.Enable", true))
    {
        sLog.outString("[mod-zone-redridge-mountains] disabled by mod-zone-redridge-mountains.Enable -- no script registered");
        return;
    }
    mod_zone_redridge_mountains::AddSC_redridge_mountains();
    sLog.outString("[mod-zone-redridge-mountains] Redridge Mountains's scripts registered from the module");
}
