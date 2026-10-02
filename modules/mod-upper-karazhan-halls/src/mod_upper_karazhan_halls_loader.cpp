// Upper Karazhan Halls' creature scripts, registered from the module: the core has no copy of them
// (AM1, handoff/manager-091). The legacy Script + RegisterSelf registers each under the script_name
// the world database gives it. The dungeon's spell and aura scripts stay in the core
// (src/scripts/dungeons/upper_karazhan_halls/upper_karazhan_halls_spells.cpp).
#include "scriptPCH.h"
#include "Config/Config.h"

namespace mod_upper_karazhan_halls
{
    void AddSC_boss_anomalus();
    void AddSC_boss_echo_of_medivh();
    void AddSC_boss_incantagos();
    void AddSC_boss_keeper_gnarlmoon();
    void AddSC_boss_kings_council();
    void AddSC_boss_kruul();
    void AddSC_boss_sanv_tasdal();
}

void Addmod_upper_karazhan_hallsScripts()
{
    // conf/mod-upper-karazhan-halls.conf: off, nothing is registered -- the world database's names find no script.
    if (!sConfig.GetBoolDefault("mod-upper-karazhan-halls.Enable", true))
    {
        sLog.outString("[mod-upper-karazhan-halls] disabled by mod-upper-karazhan-halls.Enable -- no script registered");
        return;
    }
    mod_upper_karazhan_halls::AddSC_boss_anomalus();
    mod_upper_karazhan_halls::AddSC_boss_echo_of_medivh();
    mod_upper_karazhan_halls::AddSC_boss_incantagos();
    mod_upper_karazhan_halls::AddSC_boss_keeper_gnarlmoon();
    mod_upper_karazhan_halls::AddSC_boss_kings_council();
    mod_upper_karazhan_halls::AddSC_boss_kruul();
    mod_upper_karazhan_halls::AddSC_boss_sanv_tasdal();
    sLog.outString("[mod-upper-karazhan-halls] Upper Karazhan Halls' scripts registered from the module");
}
