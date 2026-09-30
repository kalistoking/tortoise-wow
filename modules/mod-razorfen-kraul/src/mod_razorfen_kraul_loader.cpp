// Razorfen Kraul's scripts, registered from the module: the core has no copy of them (AM1,
// handoff/manager-091). The legacy Script + RegisterSelf registers each under the script_name
// the world database gives it.
#include "scriptPCH.h"
#include "Config/Config.h"

namespace mod_razorfen_kraul
{
    void AddSC_instance_razorfen_kraul();
    void AddSC_razorfen_kraul();
}

void Addmod_razorfen_kraulScripts()
{
    // conf/mod-razorfen-kraul.conf: off, nothing is registered -- the world database's names find no script.
    if (!sConfig.GetBoolDefault("mod-razorfen-kraul.Enable", true))
    {
        sLog.outString("[mod-razorfen-kraul] disabled by mod-razorfen-kraul.Enable -- no script registered");
        return;
    }
    mod_razorfen_kraul::AddSC_instance_razorfen_kraul();
    mod_razorfen_kraul::AddSC_razorfen_kraul();
    sLog.outString("[mod-razorfen-kraul] Razorfen Kraul's scripts registered from the module");
}
