// Zulfarrak's scripts, registered from the module: the core has no copy of them (AM1,
// handoff/manager-091). The legacy Script + RegisterSelf registers each under the script_name
// the world database gives it.
#include "scriptPCH.h"
#include "Config/Config.h"

namespace mod_zulfarrak
{
    void AddSC_zulfarrak();
}

void Addmod_zulfarrakScripts()
{
    // conf/mod-zulfarrak.conf: off, nothing is registered -- the world database's names find no script.
    if (!sConfig.GetBoolDefault("mod-zulfarrak.Enable", true))
    {
        sLog.outString("[mod-zulfarrak] disabled by mod-zulfarrak.Enable -- no script registered");
        return;
    }
    mod_zulfarrak::AddSC_zulfarrak();
    sLog.outString("[mod-zulfarrak] Zulfarrak's scripts registered from the module");
}
