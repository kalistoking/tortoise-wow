// Eastern Plaguelands's scripts, registered from the module: the core has no copy of them (AM1,
// handoff/manager-088). The legacy Script + RegisterSelf registers each under the script_name
// the world database gives it.
#include "scriptPCH.h"
#include "Config/Config.h"

namespace mod_zone_eastern_plaguelands
{
    void AddSC_eastern_plaguelands();
}

void Addmod_zone_eastern_plaguelandsScripts()
{
    // conf/mod-zone-eastern-plaguelands.conf: off, nothing is registered -- the world database's names find no script.
    if (!sConfig.GetBoolDefault("mod-zone-eastern-plaguelands.Enable", true))
    {
        sLog.outString("[mod-zone-eastern-plaguelands] disabled by mod-zone-eastern-plaguelands.Enable -- no script registered");
        return;
    }
    mod_zone_eastern_plaguelands::AddSC_eastern_plaguelands();
    sLog.outString("[mod-zone-eastern-plaguelands] Eastern Plaguelands's scripts registered from the module");
}
