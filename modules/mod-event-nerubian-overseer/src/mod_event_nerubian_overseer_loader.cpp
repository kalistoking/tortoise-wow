// Nerubian Overseer's scripts, registered from the module: the core has no copy of them (AM1,
// handoff/manager-088). The legacy Script + RegisterSelf registers each under the script_name
// the world database gives it.
#include "scriptPCH.h"
#include "Config/Config.h"

namespace mod_event_nerubian_overseer
{
    void AddSC_boss_nerubian_overseer();
}

void Addmod_event_nerubian_overseerScripts()
{
    // conf/mod-event-nerubian-overseer.conf: off, nothing is registered -- the world database's names find no script.
    if (!sConfig.GetBoolDefault("mod-event-nerubian-overseer.Enable", true))
    {
        sLog.outString("[mod-event-nerubian-overseer] disabled by mod-event-nerubian-overseer.Enable -- no script registered");
        return;
    }
    mod_event_nerubian_overseer::AddSC_boss_nerubian_overseer();
    sLog.outString("[mod-event-nerubian-overseer] Nerubian Overseer's scripts registered from the module");
}
