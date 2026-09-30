// Snowball's scripts, registered from the module: the core has no copy of them (AM1,
// handoff/manager-088). The legacy Script + RegisterSelf registers each under the script_name
// the world database gives it.
#include "scriptPCH.h"
#include "Config/Config.h"

namespace mod_event_snowball
{
    void AddSC_boss_xmas_wolf();
}

void Addmod_event_snowballScripts()
{
    // conf/mod-event-snowball.conf: off, nothing is registered -- the world database's names find no script.
    if (!sConfig.GetBoolDefault("mod-event-snowball.Enable", true))
    {
        sLog.outString("[mod-event-snowball] disabled by mod-event-snowball.Enable -- no script registered");
        return;
    }
    mod_event_snowball::AddSC_boss_xmas_wolf();
    sLog.outString("[mod-event-snowball] Snowball's scripts registered from the module");
}
