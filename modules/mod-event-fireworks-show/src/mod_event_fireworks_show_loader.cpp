// Fireworks Show's scripts, registered from the module: the core has no copy of them (AM1,
// handoff/manager-088). The legacy Script + RegisterSelf registers each under the script_name
// the world database gives it.
#include "scriptPCH.h"
#include "Config/Config.h"

namespace mod_event_fireworks_show
{
    void AddSC_event_fireworks();
}

void Addmod_event_fireworks_showScripts()
{
    // conf/mod-event-fireworks-show.conf: off, nothing is registered -- the world database's names find no script.
    if (!sConfig.GetBoolDefault("mod-event-fireworks-show.Enable", true))
    {
        sLog.outString("[mod-event-fireworks-show] disabled by mod-event-fireworks-show.Enable -- no script registered");
        return;
    }
    mod_event_fireworks_show::AddSC_event_fireworks();
    sLog.outString("[mod-event-fireworks-show] Fireworks Show's scripts registered from the module");
}
