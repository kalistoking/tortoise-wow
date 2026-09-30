// Dragonmaw Retreat's scripts, registered from the module: the core has no copy of them (AM1,
// handoff/manager-091). The legacy Script + RegisterSelf registers each under the script_name
// the world database gives it.
#include "scriptPCH.h"
#include "Config/Config.h"

namespace mod_dragonmaw_retreat
{
    void AddSC_boss_bogpaw_truthsay();
    void AddSC_boss_gowlfang();
    void AddSC_boss_halgan_redbrand();
    void AddSC_boss_searistrasz();
    void AddSC_boss_zuluhed_the_whacked();
    void AddSC_instance_dragonmaw_retreat();
}

void Addmod_dragonmaw_retreatScripts()
{
    // conf/mod-dragonmaw-retreat.conf: off, nothing is registered -- the world database's names find no script.
    if (!sConfig.GetBoolDefault("mod-dragonmaw-retreat.Enable", true))
    {
        sLog.outString("[mod-dragonmaw-retreat] disabled by mod-dragonmaw-retreat.Enable -- no script registered");
        return;
    }
    mod_dragonmaw_retreat::AddSC_boss_bogpaw_truthsay();
    mod_dragonmaw_retreat::AddSC_boss_gowlfang();
    mod_dragonmaw_retreat::AddSC_boss_halgan_redbrand();
    mod_dragonmaw_retreat::AddSC_boss_searistrasz();
    mod_dragonmaw_retreat::AddSC_boss_zuluhed_the_whacked();
    mod_dragonmaw_retreat::AddSC_instance_dragonmaw_retreat();
    sLog.outString("[mod-dragonmaw-retreat] Dragonmaw Retreat's scripts registered from the module");
}
