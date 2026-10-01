// Sunken Temple's scripts, registered from the module: the core has no copy of them (AM1,
// handoff/manager-091). The legacy Script + RegisterSelf registers each under the script_name
// the world database gives it.
#include "scriptPCH.h"
#include "Config/Config.h"

namespace mod_sunken_temple
{
    void AddSC_sunken_temple();
}

void Addmod_sunken_templeScripts()
{
    // conf/mod-sunken-temple.conf: off, nothing is registered -- the world database's names find no script.
    if (!sConfig.GetBoolDefault("mod-sunken-temple.Enable", true))
    {
        sLog.outString("[mod-sunken-temple] disabled by mod-sunken-temple.Enable -- no script registered");
        return;
    }
    mod_sunken_temple::AddSC_sunken_temple();
    sLog.outString("[mod-sunken-temple] Sunken Temple's scripts registered from the module");
}
