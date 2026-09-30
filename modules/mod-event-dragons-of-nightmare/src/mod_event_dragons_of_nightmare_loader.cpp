// the Dragons of Nightmare's scripts, registered from the module: the core has no copy of them (AM1,
// handoff/manager-088). The legacy Script + RegisterSelf registers each under the script_name
// the world database gives it.
#include "scriptPCH.h"
#include "Config/Config.h"

namespace mod_event_dragons_of_nightmare
{
    void AddSC_dragons_of_nightmare();
}

void Addmod_event_dragons_of_nightmareScripts()
{
    // conf/mod-event-dragons-of-nightmare.conf: off, nothing is registered -- the world database's names find no script.
    if (!sConfig.GetBoolDefault("mod-event-dragons-of-nightmare.Enable", true))
    {
        sLog.outString("[mod-event-dragons-of-nightmare] disabled by mod-event-dragons-of-nightmare.Enable -- no script registered");
        return;
    }
    mod_event_dragons_of_nightmare::AddSC_dragons_of_nightmare();
    sLog.outString("[mod-event-dragons-of-nightmare] the Dragons of Nightmare's scripts registered from the module");
}
