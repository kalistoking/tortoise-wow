// Burning Steppes's scripts, registered from the module: the core has no copy of them (AM1,
// handoff/manager-088). The legacy Script + RegisterSelf registers each under the script_name
// the world database gives it.
#include "scriptPCH.h"
#include "Config/Config.h"

namespace mod_zone_burning_steppes
{
    void AddSC_burning_steppes();
}

void Addmod_zone_burning_steppesScripts()
{
    // conf/mod-zone-burning-steppes.conf: off, nothing is registered -- the world database's names find no script.
    if (!sConfig.GetBoolDefault("mod-zone-burning-steppes.Enable", true))
    {
        sLog.outString("[mod-zone-burning-steppes] disabled by mod-zone-burning-steppes.Enable -- no script registered");
        return;
    }
    mod_zone_burning_steppes::AddSC_burning_steppes();
    sLog.outString("[mod-zone-burning-steppes] Burning Steppes's scripts registered from the module");
}
