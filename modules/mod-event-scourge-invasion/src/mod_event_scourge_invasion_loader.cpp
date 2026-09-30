// Scourge Invasion's scripts, registered from the module: the core has no copy of them (AM1,
// handoff/manager-088). The legacy Script + RegisterSelf registers each under the script_name
// the world database gives it.
#include "scriptPCH.h"
#include "Config/Config.h"

namespace mod_event_scourge_invasion
{
    void AddSC_event_scourge_invasion();
}

void Addmod_event_scourge_invasionScripts()
{
    // conf/mod-event-scourge-invasion.conf: off, nothing is registered -- the world database's names find no script.
    if (!sConfig.GetBoolDefault("mod-event-scourge-invasion.Enable", true))
    {
        sLog.outString("[mod-event-scourge-invasion] disabled by mod-event-scourge-invasion.Enable -- no script registered");
        return;
    }
    mod_event_scourge_invasion::AddSC_event_scourge_invasion();
    sLog.outString("[mod-event-scourge-invasion] Scourge Invasion's scripts registered from the module");
}
