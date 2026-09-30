// Alahthalas's scripts, registered from the module: the core has no copy of them (AM1,
// handoff/manager-088). The legacy Script + RegisterSelf registers each under the script_name
// the world database gives it.
#include "scriptPCH.h"
#include "Config/Config.h"

namespace mod_zone_alahthalas
{
    void AddSC_alahthalas();
}

void Addmod_zone_alahthalasScripts()
{
    // conf/mod-zone-alahthalas.conf: off, nothing is registered -- the world database's names find no script.
    if (!sConfig.GetBoolDefault("mod-zone-alahthalas.Enable", true))
    {
        sLog.outString("[mod-zone-alahthalas] disabled by mod-zone-alahthalas.Enable -- no script registered");
        return;
    }
    mod_zone_alahthalas::AddSC_alahthalas();
    sLog.outString("[mod-zone-alahthalas] Alahthalas's scripts registered from the module");
}
