// Elwynn Forest's scripts, registered from the module: the core has no copy of them (AM1,
// handoff/manager-088). The legacy Script + RegisterSelf registers each under the script_name
// the world database gives it.
#include "scriptPCH.h"
#include "Config/Config.h"

namespace mod_zone_elwynn_forest
{
    void AddSC_elwynn_forest();
}

void Addmod_zone_elwynn_forestScripts()
{
    // conf/mod-zone-elwynn-forest.conf: off, nothing is registered -- the world database's names find no script.
    if (!sConfig.GetBoolDefault("mod-zone-elwynn-forest.Enable", true))
    {
        sLog.outString("[mod-zone-elwynn-forest] disabled by mod-zone-elwynn-forest.Enable -- no script registered");
        return;
    }
    mod_zone_elwynn_forest::AddSC_elwynn_forest();
    sLog.outString("[mod-zone-elwynn-forest] Elwynn Forest's scripts registered from the module");
}
