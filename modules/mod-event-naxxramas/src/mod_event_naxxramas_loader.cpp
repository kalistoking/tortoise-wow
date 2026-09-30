// Naxxramas's scripts, registered from the module: the core has no copy of them (AM1,
// handoff/manager-088). The legacy Script + RegisterSelf registers each under the script_name
// the world database gives it.
#include "scriptPCH.h"
#include "Config/Config.h"

namespace mod_event_naxxramas
{
    void AddSC_world_event_naxxramas();
}

void Addmod_event_naxxramasScripts()
{
    // conf/mod-event-naxxramas.conf: off, nothing is registered -- the world database's names find no script.
    if (!sConfig.GetBoolDefault("mod-event-naxxramas.Enable", true))
    {
        sLog.outString("[mod-event-naxxramas] disabled by mod-event-naxxramas.Enable -- no script registered");
        return;
    }
    mod_event_naxxramas::AddSC_world_event_naxxramas();
    sLog.outString("[mod-event-naxxramas] Naxxramas's scripts registered from the module");
}
