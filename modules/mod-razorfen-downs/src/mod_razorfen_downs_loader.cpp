// Razorfen Downs's scripts, registered from the module: the core has no copy of them (AM1,
// handoff/manager-091). The legacy Script + RegisterSelf registers each under the script_name
// the world database gives it.
#include "scriptPCH.h"
#include "Config/Config.h"

namespace mod_razorfen_downs
{
    void AddSC_instance_razorfen_downs();
    void AddSC_razorfen_downs();
}

void Addmod_razorfen_downsScripts()
{
    // conf/mod-razorfen-downs.conf: off, nothing is registered -- the world database's names find no script.
    if (!sConfig.GetBoolDefault("mod-razorfen-downs.Enable", true))
    {
        sLog.outString("[mod-razorfen-downs] disabled by mod-razorfen-downs.Enable -- no script registered");
        return;
    }
    mod_razorfen_downs::AddSC_instance_razorfen_downs();
    mod_razorfen_downs::AddSC_razorfen_downs();
    sLog.outString("[mod-razorfen-downs] Razorfen Downs's scripts registered from the module");
}
