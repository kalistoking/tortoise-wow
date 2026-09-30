// Emerald Sanctum's scripts, registered from the module: the core has no copy of them (AM1,
// handoff/manager-091). The legacy Script + RegisterSelf registers each under the script_name
// the world database gives it.
#include "scriptPCH.h"
#include "Config/Config.h"

namespace mod_emerald_sanctum
{
    void AddSC_sanctum_creatures();
}

void Addmod_emerald_sanctumScripts()
{
    // conf/mod-emerald-sanctum.conf: off, nothing is registered -- the world database's names find no script.
    if (!sConfig.GetBoolDefault("mod-emerald-sanctum.Enable", true))
    {
        sLog.outString("[mod-emerald-sanctum] disabled by mod-emerald-sanctum.Enable -- no script registered");
        return;
    }
    mod_emerald_sanctum::AddSC_sanctum_creatures();
    sLog.outString("[mod-emerald-sanctum] Emerald Sanctum's scripts registered from the module");
}
