// Western Plaguelands's scripts, registered from the module: the core has no copy of them (AM1,
// handoff/manager-088). The legacy Script + RegisterSelf registers each under the script_name
// the world database gives it.
#include "scriptPCH.h"
#include "Config/Config.h"

namespace mod_zone_western_plaguelands
{
    void AddSC_western_plaguelands();
}

void Addmod_zone_western_plaguelandsScripts()
{
    // conf/mod-zone-western-plaguelands.conf: off, nothing is registered -- the world database's names find no script.
    if (!sConfig.GetBoolDefault("mod-zone-western-plaguelands.Enable", true))
    {
        sLog.outString("[mod-zone-western-plaguelands] disabled by mod-zone-western-plaguelands.Enable -- no script registered");
        return;
    }
    mod_zone_western_plaguelands::AddSC_western_plaguelands();
    sLog.outString("[mod-zone-western-plaguelands] Western Plaguelands's scripts registered from the module");
}
