// Durotar's scripts, registered from the module: the core has no copy of them (AM1,
// handoff/manager-088). The legacy Script + RegisterSelf registers each under the script_name
// the world database gives it.
#include "scriptPCH.h"
#include "Config/Config.h"

namespace mod_zone_durotar
{
    void AddSC_durotar();
}

void Addmod_zone_durotarScripts()
{
    // conf/mod-zone-durotar.conf: off, nothing is registered -- the world database's names find no script.
    if (!sConfig.GetBoolDefault("mod-zone-durotar.Enable", true))
    {
        sLog.outString("[mod-zone-durotar] disabled by mod-zone-durotar.Enable -- no script registered");
        return;
    }
    mod_zone_durotar::AddSC_durotar();
    sLog.outString("[mod-zone-durotar] Durotar's scripts registered from the module");
}
