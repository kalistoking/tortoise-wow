// Mirage Raceway's scripts, registered from the module: the core has no copy of them (AM1,
// handoff/manager-088). The legacy Script + RegisterSelf registers each under the script_name
// the world database gives it.
#include "scriptPCH.h"
#include "Config/Config.h"

namespace mod_event_mirage_raceway
{
    void AddSC_mirage_raceway();
}

void Addmod_event_mirage_racewayScripts()
{
    // conf/mod-event-mirage-raceway.conf: off, nothing is registered -- the world database's names find no script.
    if (!sConfig.GetBoolDefault("mod-event-mirage-raceway.Enable", true))
    {
        sLog.outString("[mod-event-mirage-raceway] disabled by mod-event-mirage-raceway.Enable -- no script registered");
        return;
    }
    mod_event_mirage_raceway::AddSC_mirage_raceway();
    sLog.outString("[mod-event-mirage-raceway] Mirage Raceway's scripts registered from the module");
}
