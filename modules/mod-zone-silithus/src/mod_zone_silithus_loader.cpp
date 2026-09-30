// Silithus's scripts, registered from the module: the core has no copy of them (AM1,
// handoff/manager-088). The legacy Script + RegisterSelf registers each under the script_name
// the world database gives it.
#include "scriptPCH.h"
#include "Config/Config.h"
#include "silithus/silithus.h"

namespace mod_zone_silithus
{
    void AddSC_silithus();
}

void Addmod_zone_silithusScripts()
{
    // conf/mod-zone-silithus.conf: off, nothing is registered -- the world database's names find no script.
    if (!sConfig.GetBoolDefault("mod-zone-silithus.Enable", true))
    {
        sLog.outString("[mod-zone-silithus] disabled by mod-zone-silithus.Enable -- no script registered");
        return;
    }
    mod_zone_silithus::AddSC_silithus();
    mod_zone_silithus::RegisterScripts_Silithus();
    sLog.outString("[mod-zone-silithus] Silithus's scripts registered from the module");
}
