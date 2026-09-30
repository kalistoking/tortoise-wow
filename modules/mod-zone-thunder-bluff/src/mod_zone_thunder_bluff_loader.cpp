// Thunder Bluff's scripts, registered from the module: the core has no copy of them (AM1,
// handoff/manager-088). The legacy Script + RegisterSelf registers each under the script_name
// the world database gives it.
#include "scriptPCH.h"
#include "Config/Config.h"

namespace mod_zone_thunder_bluff
{
    void AddSC_thunder_bluff();
}

void Addmod_zone_thunder_bluffScripts()
{
    // conf/mod-zone-thunder-bluff.conf: off, nothing is registered -- the world database's names find no script.
    if (!sConfig.GetBoolDefault("mod-zone-thunder-bluff.Enable", true))
    {
        sLog.outString("[mod-zone-thunder-bluff] disabled by mod-zone-thunder-bluff.Enable -- no script registered");
        return;
    }
    mod_zone_thunder_bluff::AddSC_thunder_bluff();
    sLog.outString("[mod-zone-thunder-bluff] Thunder Bluff's scripts registered from the module");
}
