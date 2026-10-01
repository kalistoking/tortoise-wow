// Wailing Caverns's scripts, registered from the module: the core has no copy of them (AM1,
// handoff/manager-091). The legacy Script + RegisterSelf registers each under the script_name
// the world database gives it.
#include "scriptPCH.h"
#include "Config/Config.h"

namespace mod_wailing_caverns
{
    void AddSC_instance_wailing_caverns();
    void AddSC_wailing_caverns();
}

void Addmod_wailing_cavernsScripts()
{
    // conf/mod-wailing-caverns.conf: off, nothing is registered -- the world database's names find no script.
    if (!sConfig.GetBoolDefault("mod-wailing-caverns.Enable", true))
    {
        sLog.outString("[mod-wailing-caverns] disabled by mod-wailing-caverns.Enable -- no script registered");
        return;
    }
    mod_wailing_caverns::AddSC_instance_wailing_caverns();
    mod_wailing_caverns::AddSC_wailing_caverns();
    sLog.outString("[mod-wailing-caverns] Wailing Caverns's scripts registered from the module");
}
