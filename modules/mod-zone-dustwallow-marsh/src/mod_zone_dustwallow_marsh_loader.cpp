// Dustwallow Marsh's scripts, registered from the module: the core has no copy of them (AM1,
// handoff/manager-088). The legacy Script + RegisterSelf registers each under the script_name
// the world database gives it.
#include "scriptPCH.h"
#include "Config/Config.h"

namespace mod_zone_dustwallow_marsh
{
    void AddSC_dustwallow_marsh();
}

void Addmod_zone_dustwallow_marshScripts()
{
    // conf/mod-zone-dustwallow-marsh.conf: off, nothing is registered -- the world database's names find no script.
    if (!sConfig.GetBoolDefault("mod-zone-dustwallow-marsh.Enable", true))
    {
        sLog.outString("[mod-zone-dustwallow-marsh] disabled by mod-zone-dustwallow-marsh.Enable -- no script registered");
        return;
    }
    mod_zone_dustwallow_marsh::AddSC_dustwallow_marsh();
    sLog.outString("[mod-zone-dustwallow-marsh] Dustwallow Marsh's scripts registered from the module");
}
