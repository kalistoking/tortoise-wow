// Orgrimmar's scripts, registered from the module: the core has no copy of them (AM1,
// handoff/manager-088). The legacy Script + RegisterSelf registers each under the script_name
// the world database gives it.
#include "scriptPCH.h"
#include "Config/Config.h"

namespace mod_zone_orgrimmar
{
    void AddSC_orgrimmar();
}

void Addmod_zone_orgrimmarScripts()
{
    // conf/mod-zone-orgrimmar.conf: off, nothing is registered -- the world database's names find no script.
    if (!sConfig.GetBoolDefault("mod-zone-orgrimmar.Enable", true))
    {
        sLog.outString("[mod-zone-orgrimmar] disabled by mod-zone-orgrimmar.Enable -- no script registered");
        return;
    }
    mod_zone_orgrimmar::AddSC_orgrimmar();
    sLog.outString("[mod-zone-orgrimmar] Orgrimmar's scripts registered from the module");
}
