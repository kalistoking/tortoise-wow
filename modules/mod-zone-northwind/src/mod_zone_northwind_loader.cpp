// Northwind's scripts, registered from the module: the core has no copy of them (AM1,
// handoff/manager-088). The legacy Script + RegisterSelf registers each under the script_name
// the world database gives it.
#include "scriptPCH.h"
#include "Config/Config.h"

namespace mod_zone_northwind
{
    void AddSC_northwind();
}

void Addmod_zone_northwindScripts()
{
    // conf/mod-zone-northwind.conf: off, nothing is registered -- the world database's names find no script.
    if (!sConfig.GetBoolDefault("mod-zone-northwind.Enable", true))
    {
        sLog.outString("[mod-zone-northwind] disabled by mod-zone-northwind.Enable -- no script registered");
        return;
    }
    mod_zone_northwind::AddSC_northwind();
    sLog.outString("[mod-zone-northwind] Northwind's scripts registered from the module");
}
