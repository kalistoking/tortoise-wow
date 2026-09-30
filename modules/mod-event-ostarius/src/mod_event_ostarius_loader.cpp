// Ostarius's scripts, registered from the module: the core has no copy of them (AM1,
// handoff/manager-088). The legacy Script + RegisterSelf registers each under the script_name
// the world database gives it.
#include "scriptPCH.h"
#include "Config/Config.h"

namespace mod_event_ostarius
{
    void AddSC_boss_ostarius();
}

void Addmod_event_ostariusScripts()
{
    // conf/mod-event-ostarius.conf: off, nothing is registered -- the world database's names find no script.
    if (!sConfig.GetBoolDefault("mod-event-ostarius.Enable", true))
    {
        sLog.outString("[mod-event-ostarius] disabled by mod-event-ostarius.Enable -- no script registered");
        return;
    }
    mod_event_ostarius::AddSC_boss_ostarius();
    sLog.outString("[mod-event-ostarius] Ostarius's scripts registered from the module");
}
