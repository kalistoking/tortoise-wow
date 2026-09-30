// The Barrens's scripts, registered from the module: the core has no copy of them (AM1,
// handoff/manager-088). The legacy Script + RegisterSelf registers each under the script_name
// the world database gives it.
#include "scriptPCH.h"
#include "Config/Config.h"

namespace mod_zone_the_barrens
{
    void AddSC_the_barrens();
}

void Addmod_zone_the_barrensScripts()
{
    // conf/mod-zone-the-barrens.conf: off, nothing is registered -- the world database's names find no script.
    if (!sConfig.GetBoolDefault("mod-zone-the-barrens.Enable", true))
    {
        sLog.outString("[mod-zone-the-barrens] disabled by mod-zone-the-barrens.Enable -- no script registered");
        return;
    }
    mod_zone_the_barrens::AddSC_the_barrens();
    sLog.outString("[mod-zone-the-barrens] The Barrens's scripts registered from the module");
}
