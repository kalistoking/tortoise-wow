// Stormwrought Ruins's scripts, registered from the module: the core has no copy of them (AM1,
// handoff/manager-091). The legacy Script + RegisterSelf registers each under the script_name
// the world database gives it.
#include "scriptPCH.h"
#include "Config/Config.h"

namespace mod_stormwrought_ruins
{
    void AddSC_boss_chieftain_stormsong();
    void AddSC_boss_dagar_the_glutton();
    void AddSC_boss_deathlord_tidebane();
    void AddSC_boss_duke_balor_iv();
    void AddSC_boss_eldermaw_the_primordial();
    void AddSC_boss_ighalfor();
    void AddSC_boss_lady_drazare();
    void AddSC_boss_librarian_theodorus();
    void AddSC_boss_mycellakos();
    void AddSC_boss_oronok_torn_heart();
    void AddSC_boss_subjugator_halthas_shadecrest();
    void AddSC_instance_stormwrought_ruins();
}

void Addmod_stormwrought_ruinsScripts()
{
    // conf/mod-stormwrought-ruins.conf: off, nothing is registered -- the world database's names find no script.
    if (!sConfig.GetBoolDefault("mod-stormwrought-ruins.Enable", true))
    {
        sLog.outString("[mod-stormwrought-ruins] disabled by mod-stormwrought-ruins.Enable -- no script registered");
        return;
    }
    mod_stormwrought_ruins::AddSC_boss_chieftain_stormsong();
    mod_stormwrought_ruins::AddSC_boss_dagar_the_glutton();
    mod_stormwrought_ruins::AddSC_boss_deathlord_tidebane();
    mod_stormwrought_ruins::AddSC_boss_duke_balor_iv();
    mod_stormwrought_ruins::AddSC_boss_eldermaw_the_primordial();
    mod_stormwrought_ruins::AddSC_boss_ighalfor();
    mod_stormwrought_ruins::AddSC_boss_lady_drazare();
    mod_stormwrought_ruins::AddSC_boss_librarian_theodorus();
    mod_stormwrought_ruins::AddSC_boss_mycellakos();
    mod_stormwrought_ruins::AddSC_boss_oronok_torn_heart();
    mod_stormwrought_ruins::AddSC_boss_subjugator_halthas_shadecrest();
    mod_stormwrought_ruins::AddSC_instance_stormwrought_ruins();
    sLog.outString("[mod-stormwrought-ruins] Stormwrought Ruins's scripts registered from the module");
}
