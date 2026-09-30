// Uldaman's scripts, registered from the module: the core has no copy of them (AM1,
// handoff/manager-091). The legacy Script + RegisterSelf registers each under the script_name
// the world database gives it.
#include "scriptPCH.h"
#include "Config/Config.h"

namespace mod_uldaman
{
    void AddSC_boss_ironaya();
    void AddSC_uldaman_creatures();
}

void Addmod_uldamanScripts()
{
    // conf/mod-uldaman.conf: off, nothing is registered -- the world database's names find no script.
    if (!sConfig.GetBoolDefault("mod-uldaman.Enable", true))
    {
        sLog.outString("[mod-uldaman] disabled by mod-uldaman.Enable -- no script registered");
        return;
    }
    mod_uldaman::AddSC_boss_ironaya();
    mod_uldaman::AddSC_uldaman_creatures();
    sLog.outString("[mod-uldaman] Uldaman's scripts registered from the module");
}
