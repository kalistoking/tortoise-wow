// Pompa's scripts, registered from the module: the core has no copy of them (AM1,
// handoff/manager-088). The legacy Script + RegisterSelf registers each under the script_name
// the world database gives it.
#include "scriptPCH.h"
#include "Config/Config.h"

namespace mod_event_pompa
{
    void AddSC_boss_avatar_of_pompa();
}

void Addmod_event_pompaScripts()
{
    // conf/mod-event-pompa.conf: off, nothing is registered -- the world database's names find no script.
    if (!sConfig.GetBoolDefault("mod-event-pompa.Enable", true))
    {
        sLog.outString("[mod-event-pompa] disabled by mod-event-pompa.Enable -- no script registered");
        return;
    }
    mod_event_pompa::AddSC_boss_avatar_of_pompa();
    sLog.outString("[mod-event-pompa] Pompa's scripts registered from the module");
}
