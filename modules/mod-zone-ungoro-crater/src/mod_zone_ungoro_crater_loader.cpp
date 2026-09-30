// Ungoro Crater's scripts, registered from the module: the core has no copy of them (AM1,
// handoff/manager-088). The legacy Script + RegisterSelf registers each under the script_name
// the world database gives it.
#include "scriptPCH.h"
#include "Config/Config.h"

namespace mod_zone_ungoro_crater
{
    void AddSC_ungoro_crater();
}

void Addmod_zone_ungoro_craterScripts()
{
    // conf/mod-zone-ungoro-crater.conf: off, nothing is registered -- the world database's names find no script.
    if (!sConfig.GetBoolDefault("mod-zone-ungoro-crater.Enable", true))
    {
        sLog.outString("[mod-zone-ungoro-crater] disabled by mod-zone-ungoro-crater.Enable -- no script registered");
        return;
    }
    mod_zone_ungoro_crater::AddSC_ungoro_crater();
    sLog.outString("[mod-zone-ungoro-crater] Ungoro Crater's scripts registered from the module");
}
