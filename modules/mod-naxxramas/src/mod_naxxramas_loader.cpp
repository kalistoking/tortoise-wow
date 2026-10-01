// Naxxramas's scripts, registered from the module: the core has no copy of them (AM1,
// handoff/manager-091). The legacy Script + RegisterSelf registers each under the script_name
// the world database gives it.
#include "scriptPCH.h"
#include "Config/Config.h"

namespace mod_naxxramas
{
    void AddSC_naxxramas_crypt_guards();
    void AddSC_naxxramas_faerlina_rp();
    void AddSC_naxxramas_plague_cloud();
    void AddSC_naxxramas_shadow_fissure();
    void AddSC_naxxramas_spirits_slimes();
    void AddSC_naxxramas_zombie_chow();
}

void Addmod_naxxramasScripts()
{
    // conf/mod-naxxramas.conf: off, nothing is registered -- the world database's names find no script.
    if (!sConfig.GetBoolDefault("mod-naxxramas.Enable", true))
    {
        sLog.outString("[mod-naxxramas] disabled by mod-naxxramas.Enable -- no script registered");
        return;
    }
    mod_naxxramas::AddSC_naxxramas_crypt_guards();
    mod_naxxramas::AddSC_naxxramas_faerlina_rp();
    mod_naxxramas::AddSC_naxxramas_plague_cloud();
    mod_naxxramas::AddSC_naxxramas_shadow_fissure();
    mod_naxxramas::AddSC_naxxramas_spirits_slimes();
    mod_naxxramas::AddSC_naxxramas_zombie_chow();
    sLog.outString("[mod-naxxramas] Naxxramas's scripts registered from the module");
}
