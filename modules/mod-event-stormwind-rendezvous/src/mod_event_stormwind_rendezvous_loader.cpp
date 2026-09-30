// the Stormwind rendezvous's scripts, registered from the module: the core has no copy of them (AM1,
// handoff/manager-088). The legacy Script + RegisterSelf registers each under the script_name
// the world database gives it.
#include "scriptPCH.h"
#include "Config/Config.h"

namespace mod_event_stormwind_rendezvous
{
    void AddSC_quest_stormwind_rendezvous();
}

void Addmod_event_stormwind_rendezvousScripts()
{
    // conf/mod-event-stormwind-rendezvous.conf: off, nothing is registered -- the world database's names find no script.
    if (!sConfig.GetBoolDefault("mod-event-stormwind-rendezvous.Enable", true))
    {
        sLog.outString("[mod-event-stormwind-rendezvous] disabled by mod-event-stormwind-rendezvous.Enable -- no script registered");
        return;
    }
    mod_event_stormwind_rendezvous::AddSC_quest_stormwind_rendezvous();
    sLog.outString("[mod-event-stormwind-rendezvous] the Stormwind rendezvous's scripts registered from the module");
}
