// Turtlhu's scripts, registered from the module: the core has no copy of them (AM1,
// handoff/manager-088). The legacy Script + RegisterSelf registers each under the script_name
// the world database gives it.
#include "scriptPCH.h"
#include "Config/Config.h"

namespace mod_event_turtlhu
{
    void AddSC_boss_turtlhu();
}

void Addmod_event_turtlhuScripts()
{
    // conf/mod-event-turtlhu.conf: off, nothing is registered -- the world database's names find no script.
    if (!sConfig.GetBoolDefault("mod-event-turtlhu.Enable", true))
    {
        sLog.outString("[mod-event-turtlhu] disabled by mod-event-turtlhu.Enable -- no script registered");
        return;
    }
    mod_event_turtlhu::AddSC_boss_turtlhu();
    sLog.outString("[mod-event-turtlhu] Turtlhu's scripts registered from the module");
}
