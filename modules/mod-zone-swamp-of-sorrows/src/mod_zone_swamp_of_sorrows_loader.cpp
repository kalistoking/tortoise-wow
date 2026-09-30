// Swamp Of Sorrows's scripts, registered from the module: the core has no copy of them (AM1,
// handoff/manager-088). The legacy Script + RegisterSelf registers each under the script_name
// the world database gives it.
#include "scriptPCH.h"
#include "Config/Config.h"

namespace mod_zone_swamp_of_sorrows
{
    void AddSC_swamp_of_sorrows();
}

void Addmod_zone_swamp_of_sorrowsScripts()
{
    // conf/mod-zone-swamp-of-sorrows.conf: off, nothing is registered -- the world database's names find no script.
    if (!sConfig.GetBoolDefault("mod-zone-swamp-of-sorrows.Enable", true))
    {
        sLog.outString("[mod-zone-swamp-of-sorrows] disabled by mod-zone-swamp-of-sorrows.Enable -- no script registered");
        return;
    }
    mod_zone_swamp_of_sorrows::AddSC_swamp_of_sorrows();
    sLog.outString("[mod-zone-swamp-of-sorrows] Swamp Of Sorrows's scripts registered from the module");
}
