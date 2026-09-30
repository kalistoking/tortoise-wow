// Westfall's scripts, registered from the module: the core has no copy of them (AM1,
// handoff/manager-088). The legacy Script + RegisterSelf registers each under the script_name
// the world database gives it.
#include "scriptPCH.h"
#include "Config/Config.h"

namespace mod_zone_westfall
{
    void AddSC_westfall();
}

void Addmod_zone_westfallScripts()
{
    // conf/mod-zone-westfall.conf: off, nothing is registered -- the world database's names find no script.
    if (!sConfig.GetBoolDefault("mod-zone-westfall.Enable", true))
    {
        sLog.outString("[mod-zone-westfall] disabled by mod-zone-westfall.Enable -- no script registered");
        return;
    }
    mod_zone_westfall::AddSC_westfall();
    sLog.outString("[mod-zone-westfall] Westfall's scripts registered from the module");
}
