// Gilneas City's scripts, registered from the module: the core has no copy of them (AM1,
// handoff/manager-091). The legacy Script + RegisterSelf registers each under the script_name
// the world database gives it.
#include "scriptPCH.h"
#include "Config/Config.h"

namespace mod_gilneas_city
{
    void AddSC_boss_celia();
    void AddSC_boss_lord_mortimer();
    void AddSC_instance_gilneas_city();
}

void Addmod_gilneas_cityScripts()
{
    // conf/mod-gilneas-city.conf: off, nothing is registered -- the world database's names find no script.
    if (!sConfig.GetBoolDefault("mod-gilneas-city.Enable", true))
    {
        sLog.outString("[mod-gilneas-city] disabled by mod-gilneas-city.Enable -- no script registered");
        return;
    }
    mod_gilneas_city::AddSC_boss_celia();
    mod_gilneas_city::AddSC_boss_lord_mortimer();
    mod_gilneas_city::AddSC_instance_gilneas_city();
    sLog.outString("[mod-gilneas-city] Gilneas City's scripts registered from the module");
}
