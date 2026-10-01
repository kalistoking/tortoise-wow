// Lower Karazhan Halls's scripts, registered from the module: the core has no copy of them (AM1,
// handoff/manager-091). The legacy Script + RegisterSelf registers each under the script_name
// the world database gives it.
#include "scriptPCH.h"
#include "Config/Config.h"

namespace mod_lower_karazhan_halls
{
    void AddSC_boss_blackwald_ii();
    void AddSC_boss_brood_queen_araxxna();
    void AddSC_boss_clawlord_howlfang();
    void AddSC_boss_grizikil();
    void AddSC_boss_moroes();
    void AddSC_instance_lower_karazhan_halls();
}

void Addmod_lower_karazhan_hallsScripts()
{
    // conf/mod-lower-karazhan-halls.conf: off, nothing is registered -- the world database's names find no script.
    if (!sConfig.GetBoolDefault("mod-lower-karazhan-halls.Enable", true))
    {
        sLog.outString("[mod-lower-karazhan-halls] disabled by mod-lower-karazhan-halls.Enable -- no script registered");
        return;
    }
    mod_lower_karazhan_halls::AddSC_boss_blackwald_ii();
    mod_lower_karazhan_halls::AddSC_boss_brood_queen_araxxna();
    mod_lower_karazhan_halls::AddSC_boss_clawlord_howlfang();
    mod_lower_karazhan_halls::AddSC_boss_grizikil();
    mod_lower_karazhan_halls::AddSC_boss_moroes();
    mod_lower_karazhan_halls::AddSC_instance_lower_karazhan_halls();
    sLog.outString("[mod-lower-karazhan-halls] Lower Karazhan Halls's scripts registered from the module");
}
