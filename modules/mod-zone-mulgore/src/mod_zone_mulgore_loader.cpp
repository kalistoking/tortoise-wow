// Mulgore's scripts, registered from the module: the core has no copy of them (AM1,
// handoff/manager-088). The legacy Script + RegisterSelf registers each under the script_name
// the world database gives it.
#include "scriptPCH.h"
#include "Config/Config.h"

namespace mod_zone_mulgore
{
    void AddSC_mulgore();
}

void Addmod_zone_mulgoreScripts()
{
    // conf/mod-zone-mulgore.conf: off, nothing is registered -- the world database's names find no script.
    if (!sConfig.GetBoolDefault("mod-zone-mulgore.Enable", true))
    {
        sLog.outString("[mod-zone-mulgore] disabled by mod-zone-mulgore.Enable -- no script registered");
        return;
    }
    mod_zone_mulgore::AddSC_mulgore();
    sLog.outString("[mod-zone-mulgore] Mulgore's scripts registered from the module");
}
