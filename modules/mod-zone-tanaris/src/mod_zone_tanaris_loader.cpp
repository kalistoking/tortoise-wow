// Tanaris's scripts, registered from the module: the core has no copy of them (AM1,
// handoff/manager-088). The legacy Script + RegisterSelf registers each under the script_name
// the world database gives it.
#include "scriptPCH.h"
#include "Config/Config.h"

namespace mod_zone_tanaris
{
    void AddSC_tanaris();
}

void Addmod_zone_tanarisScripts()
{
    // conf/mod-zone-tanaris.conf: off, nothing is registered -- the world database's names find no script.
    if (!sConfig.GetBoolDefault("mod-zone-tanaris.Enable", true))
    {
        sLog.outString("[mod-zone-tanaris] disabled by mod-zone-tanaris.Enable -- no script registered");
        return;
    }
    mod_zone_tanaris::AddSC_tanaris();
    sLog.outString("[mod-zone-tanaris] Tanaris's scripts registered from the module");
}
