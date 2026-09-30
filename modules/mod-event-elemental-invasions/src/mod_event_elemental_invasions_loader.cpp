// Elemental Invasions's scripts, registered from the module: the core has no copy of them (AM1,
// handoff/manager-088). The legacy Script + RegisterSelf registers each under the script_name
// the world database gives it.
#include "scriptPCH.h"
#include "Config/Config.h"

namespace mod_event_elemental_invasions
{
    void AddSC_elemental_invasions();
}

void Addmod_event_elemental_invasionsScripts()
{
    // conf/mod-event-elemental-invasions.conf: off, nothing is registered -- the world database's names find no script.
    if (!sConfig.GetBoolDefault("mod-event-elemental-invasions.Enable", true))
    {
        sLog.outString("[mod-event-elemental-invasions] disabled by mod-event-elemental-invasions.Enable -- no script registered");
        return;
    }
    mod_event_elemental_invasions::AddSC_elemental_invasions();
    sLog.outString("[mod-event-elemental-invasions] Elemental Invasions's scripts registered from the module");
}
