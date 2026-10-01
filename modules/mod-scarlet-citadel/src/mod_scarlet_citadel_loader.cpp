// Scarlet Citadel's scripts, registered from the module: the core has no copy of them (AM1,
// handoff/manager-091). The legacy Script + RegisterSelf registers each under the script_name
// the world database gives it.
#include "scriptPCH.h"
#include "Config/Config.h"

namespace mod_scarlet_citadel
{
    void AddSC_boss_abbendis();
    void AddSC_trash_mobs_scarlet_citadel();
    void AddSC_trash_bosses_scarlet_citadel();
}

void Addmod_scarlet_citadelScripts()
{
    // conf/mod-scarlet-citadel.conf: off, nothing is registered -- the world database's names find no script.
    if (!sConfig.GetBoolDefault("mod-scarlet-citadel.Enable", true))
    {
        sLog.outString("[mod-scarlet-citadel] disabled by mod-scarlet-citadel.Enable -- no script registered");
        return;
    }
    mod_scarlet_citadel::AddSC_boss_abbendis();
    mod_scarlet_citadel::AddSC_trash_mobs_scarlet_citadel();
    mod_scarlet_citadel::AddSC_trash_bosses_scarlet_citadel();
    sLog.outString("[mod-scarlet-citadel] Scarlet Citadel's scripts registered from the module");
}
