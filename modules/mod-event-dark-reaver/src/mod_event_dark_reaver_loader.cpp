// Dark Reaver's scripts, registered from the module: the core has no copy of them (AM1,
// handoff/manager-088). The legacy Script + RegisterSelf registers each under the script_name
// the world database gives it.
#include "scriptPCH.h"
#include "Config/Config.h"

namespace mod_event_dark_reaver
{
    void AddSC_boss_dark_reaver();
}

void Addmod_event_dark_reaverScripts()
{
    // conf/mod-event-dark-reaver.conf: off, nothing is registered -- the world database's names find no script.
    if (!sConfig.GetBoolDefault("mod-event-dark-reaver.Enable", true))
    {
        sLog.outString("[mod-event-dark-reaver] disabled by mod-event-dark-reaver.Enable -- no script registered");
        return;
    }
    mod_event_dark_reaver::AddSC_boss_dark_reaver();
    sLog.outString("[mod-event-dark-reaver] Dark Reaver's scripts registered from the module");
}
