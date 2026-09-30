// Shadowfang Keep's scripts, registered from the module: the core has no copy of them (AM1,
// handoff/manager-091). The legacy Script + RegisterSelf registers each under the script_name
// the world database gives it.
#include "scriptPCH.h"
#include "Config/Config.h"

namespace mod_shadowfang_keep
{
    void AddSC_instance_shadowfang_keep();
}

void Addmod_shadowfang_keepScripts()
{
    // conf/mod-shadowfang-keep.conf: off, nothing is registered -- the world database's names find no script.
    if (!sConfig.GetBoolDefault("mod-shadowfang-keep.Enable", true))
    {
        sLog.outString("[mod-shadowfang-keep] disabled by mod-shadowfang-keep.Enable -- no script registered");
        return;
    }
    mod_shadowfang_keep::AddSC_instance_shadowfang_keep();
    sLog.outString("[mod-shadowfang-keep] Shadowfang Keep's scripts registered from the module");
}
