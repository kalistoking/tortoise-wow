// Blackrock Spire's scripts, registered from the module: the core has no copy of them (AM1,
// handoff/manager-091). The legacy Script + RegisterSelf registers each under the script_name
// the world database gives it.
#include "scriptPCH.h"
#include "Config/Config.h"

namespace mod_blackrock_spire
{
    void AddSC_boss_halycon();
    void AddSC_boss_highlordomokk();
    void AddSC_boss_overlordwyrmthalak();
    void AddSC_boss_quatermasterzigris();
    void AddSC_boss_shadowvosh();
    void AddSC_boss_thebeast();
    void AddSC_boss_warmastervoone();
    void AddSC_ubrs_trash();
    void AddSC_boss_pyroguard_emberseer();
}

void Addmod_blackrock_spireScripts()
{
    // conf/mod-blackrock-spire.conf: off, nothing is registered -- the world database's names find no script.
    if (!sConfig.GetBoolDefault("mod-blackrock-spire.Enable", true))
    {
        sLog.outString("[mod-blackrock-spire] disabled by mod-blackrock-spire.Enable -- no script registered");
        return;
    }
    mod_blackrock_spire::AddSC_boss_halycon();
    mod_blackrock_spire::AddSC_boss_highlordomokk();
    mod_blackrock_spire::AddSC_boss_overlordwyrmthalak();
    mod_blackrock_spire::AddSC_boss_quatermasterzigris();
    mod_blackrock_spire::AddSC_boss_shadowvosh();
    mod_blackrock_spire::AddSC_boss_thebeast();
    mod_blackrock_spire::AddSC_boss_warmastervoone();
    mod_blackrock_spire::AddSC_ubrs_trash();
    mod_blackrock_spire::AddSC_boss_pyroguard_emberseer();
    sLog.outString("[mod-blackrock-spire] Blackrock Spire's scripts registered from the module");
}
