// Frostmane Hollow's scripts, registered from the module: the core has no copy of them (AM1,
// handoff/manager-091). The legacy Script + RegisterSelf registers each under the script_name
// the world database gives it.
#include "scriptPCH.h"
#include "Config/Config.h"

namespace mod_frostmane_hollow
{
    void AddSC_boss_hailar_the_frigid();
}

void Addmod_frostmane_hollowScripts()
{
    // conf/mod-frostmane-hollow.conf: off, nothing is registered -- Frostmane Hollow then runs on its rows alone.
    if (!sConfig.GetBoolDefault("mod-frostmane-hollow.Enable", true))
    {
        sLog.outString("[mod-frostmane-hollow] disabled by mod-frostmane-hollow.Enable -- no script registered");
        return;
    }
    mod_frostmane_hollow::AddSC_boss_hailar_the_frigid();
    sLog.outString("[mod-frostmane-hollow] Frostmane Hollow's scripts registered from the module");
}
