// Dun Morogh's scripts, registered from the module: the core has no copy of them (AM1,
// handoff/manager-088). The legacy Script + RegisterSelf registers each under the script_name
// the world database gives it.
#include "scriptPCH.h"
#include "Config/Config.h"

namespace mod_zone_dun_morogh
{
    void AddSC_dun_morogh();
}

void Addmod_zone_dun_moroghScripts()
{
    // conf/mod-zone-dun-morogh.conf: off, nothing is registered -- the world database's names find no script.
    if (!sConfig.GetBoolDefault("mod-zone-dun-morogh.Enable", true))
    {
        sLog.outString("[mod-zone-dun-morogh] disabled by mod-zone-dun-morogh.Enable -- no script registered");
        return;
    }
    mod_zone_dun_morogh::AddSC_dun_morogh();
    sLog.outString("[mod-zone-dun-morogh] Dun Morogh's scripts registered from the module");
}
