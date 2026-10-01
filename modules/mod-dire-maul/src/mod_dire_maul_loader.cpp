// Dire Maul's scripts, registered from the module: the core has no copy of them (AM1,
// handoff/manager-091). The legacy Script + RegisterSelf registers each under the script_name
// the world database gives it.
#include "scriptPCH.h"
#include "Config/Config.h"

namespace mod_dire_maul
{
    void AddSC_npc_king_gordok();
    void AddSC_boss_immol_thar();
    void AddSC_boss_tendris_warpwood();
    void AddSC_boss_zevrim();
    void AddSC_npc_ecorcefer();
    void AddSC_npc_pusillin();
}

void Addmod_dire_maulScripts()
{
    // conf/mod-dire-maul.conf: off, nothing is registered -- the world database's names find no script.
    if (!sConfig.GetBoolDefault("mod-dire-maul.Enable", true))
    {
        sLog.outString("[mod-dire-maul] disabled by mod-dire-maul.Enable -- no script registered");
        return;
    }
    mod_dire_maul::AddSC_npc_king_gordok();
    mod_dire_maul::AddSC_boss_immol_thar();
    mod_dire_maul::AddSC_boss_tendris_warpwood();
    mod_dire_maul::AddSC_boss_zevrim();
    mod_dire_maul::AddSC_npc_ecorcefer();
    mod_dire_maul::AddSC_npc_pusillin();
    sLog.outString("[mod-dire-maul] Dire Maul's scripts registered from the module");
}
