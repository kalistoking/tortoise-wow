// Rares's scripts, registered from the module: the core has no copy of them (AM1,
// handoff/manager-088). The legacy Script + RegisterSelf registers each under the script_name
// the world database gives it.
#include "scriptPCH.h"
#include "Config/Config.h"

namespace mod_event_rares
{
    void AddSC_boss_rares();
}

void Addmod_event_raresScripts()
{
    // conf/mod-event-rares.conf: off, nothing is registered -- the world database's names find no script.
    if (!sConfig.GetBoolDefault("mod-event-rares.Enable", true))
    {
        sLog.outString("[mod-event-rares] disabled by mod-event-rares.Enable -- no script registered");
        return;
    }
    mod_event_rares::AddSC_boss_rares();
    sLog.outString("[mod-event-rares] Rares's scripts registered from the module");
}
