// Thousand Needles's scripts, registered from the module: the core has no copy of them (AM1,
// handoff/manager-088). The legacy Script + RegisterSelf registers each under the script_name
// the world database gives it.
#include "scriptPCH.h"
#include "Config/Config.h"

namespace mod_zone_thousand_needles
{
    void AddSC_thousand_needles();
}

void Addmod_zone_thousand_needlesScripts()
{
    // conf/mod-zone-thousand-needles.conf: off, nothing is registered -- the world database's names find no script.
    if (!sConfig.GetBoolDefault("mod-zone-thousand-needles.Enable", true))
    {
        sLog.outString("[mod-zone-thousand-needles] disabled by mod-zone-thousand-needles.Enable -- no script registered");
        return;
    }
    mod_zone_thousand_needles::AddSC_thousand_needles();
    sLog.outString("[mod-zone-thousand-needles] Thousand Needles's scripts registered from the module");
}
