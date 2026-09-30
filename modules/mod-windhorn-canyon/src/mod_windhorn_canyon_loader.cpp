// Windhorn Canyon's scripts, registered from the module: the core has no copy of them (AM1,
// handoff/manager-091). The legacy Script + RegisterSelf registers each under the script_name
// the world database gives it.
#include "scriptPCH.h"
#include "Config/Config.h"

namespace mod_windhorn_canyon
{
    void AddSC_boss_bonespeaker_narlgom();
    void AddSC_windhorn_canyon();
}

void Addmod_windhorn_canyonScripts()
{
    // conf/mod-windhorn-canyon.conf: off, nothing is registered -- Windhorn Canyon then runs on its rows alone.
    if (!sConfig.GetBoolDefault("mod-windhorn-canyon.Enable", true))
    {
        sLog.outString("[mod-windhorn-canyon] disabled by mod-windhorn-canyon.Enable -- no script registered");
        return;
    }
    mod_windhorn_canyon::AddSC_boss_bonespeaker_narlgom();
    mod_windhorn_canyon::AddSC_windhorn_canyon();
    sLog.outString("[mod-windhorn-canyon] Windhorn Canyon's scripts registered from the module");
}
