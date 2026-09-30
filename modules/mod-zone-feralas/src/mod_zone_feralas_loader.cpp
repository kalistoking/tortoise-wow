// Feralas's scripts, registered from the module: the core has no copy of them (AM1,
// handoff/manager-088). The legacy Script + RegisterSelf registers each under the script_name
// the world database gives it.
#include "scriptPCH.h"
#include "Config/Config.h"

namespace mod_zone_feralas
{
    void AddSC_feralas();
}

void Addmod_zone_feralasScripts()
{
    // conf/mod-zone-feralas.conf: off, nothing is registered -- the world database's names find no script.
    if (!sConfig.GetBoolDefault("mod-zone-feralas.Enable", true))
    {
        sLog.outString("[mod-zone-feralas] disabled by mod-zone-feralas.Enable -- no script registered");
        return;
    }
    mod_zone_feralas::AddSC_feralas();
    sLog.outString("[mod-zone-feralas] Feralas's scripts registered from the module");
}
