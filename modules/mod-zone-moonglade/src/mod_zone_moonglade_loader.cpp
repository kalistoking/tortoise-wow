// Moonglade's scripts, registered from the module: the core has no copy of them (AM1,
// handoff/manager-088). The legacy Script + RegisterSelf registers each under the script_name
// the world database gives it.
#include "scriptPCH.h"
#include "Config/Config.h"

namespace mod_zone_moonglade
{
    void AddSC_moonglade();
}

void Addmod_zone_moongladeScripts()
{
    // conf/mod-zone-moonglade.conf: off, nothing is registered -- the world database's names find no script.
    if (!sConfig.GetBoolDefault("mod-zone-moonglade.Enable", true))
    {
        sLog.outString("[mod-zone-moonglade] disabled by mod-zone-moonglade.Enable -- no script registered");
        return;
    }
    mod_zone_moonglade::AddSC_moonglade();
    sLog.outString("[mod-zone-moonglade] Moonglade's scripts registered from the module");
}
