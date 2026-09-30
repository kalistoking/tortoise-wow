// Onyxias Lair's scripts, registered from the module: the core has no copy of them (AM1,
// handoff/manager-091). The legacy Script + RegisterSelf registers each under the script_name
// the world database gives it.
#include "scriptPCH.h"
#include "Config/Config.h"

namespace mod_onyxias_lair
{
    void AddSC_instance_onyxia_lair();
    void AddSC_onyxian_whelp();
}

void Addmod_onyxias_lairScripts()
{
    // conf/mod-onyxias-lair.conf: off, nothing is registered -- the world database's names find no script.
    if (!sConfig.GetBoolDefault("mod-onyxias-lair.Enable", true))
    {
        sLog.outString("[mod-onyxias-lair] disabled by mod-onyxias-lair.Enable -- no script registered");
        return;
    }
    mod_onyxias_lair::AddSC_instance_onyxia_lair();
    mod_onyxias_lair::AddSC_onyxian_whelp();
    sLog.outString("[mod-onyxias-lair] Onyxias Lair's scripts registered from the module");
}
