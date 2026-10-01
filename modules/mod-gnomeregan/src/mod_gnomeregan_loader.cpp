// Gnomeregan's scripts, registered from the module: the core has no copy of them (AM1,
// handoff/manager-091). The legacy Script + RegisterSelf registers each under the script_name
// the world database gives it.
#include "scriptPCH.h"
#include "Config/Config.h"

namespace mod_gnomeregan
{
    void AddSC_gnomeregan_punchograph();
}

void Addmod_gnomereganScripts()
{
    // conf/mod-gnomeregan.conf: off, nothing is registered -- the world database's names find no script.
    if (!sConfig.GetBoolDefault("mod-gnomeregan.Enable", true))
    {
        sLog.outString("[mod-gnomeregan] disabled by mod-gnomeregan.Enable -- no script registered");
        return;
    }
    mod_gnomeregan::AddSC_gnomeregan_punchograph();
    sLog.outString("[mod-gnomeregan] Gnomeregan's scripts registered from the module");
}
