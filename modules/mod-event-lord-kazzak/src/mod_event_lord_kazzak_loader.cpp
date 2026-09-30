// Lord Kazzak's scripts, registered from the module: the core has no copy of them (AM1,
// handoff/manager-088). The legacy Script + RegisterSelf registers each under the script_name
// the world database gives it.
#include "scriptPCH.h"
#include "Config/Config.h"

namespace mod_event_lord_kazzak
{
    void AddSC_boss_lord_kazzak();
}

void Addmod_event_lord_kazzakScripts()
{
    // conf/mod-event-lord-kazzak.conf: off, nothing is registered -- the world database's names find no script.
    if (!sConfig.GetBoolDefault("mod-event-lord-kazzak.Enable", true))
    {
        sLog.outString("[mod-event-lord-kazzak] disabled by mod-event-lord-kazzak.Enable -- no script registered");
        return;
    }
    mod_event_lord_kazzak::AddSC_boss_lord_kazzak();
    sLog.outString("[mod-event-lord-kazzak] Lord Kazzak's scripts registered from the module");
}
