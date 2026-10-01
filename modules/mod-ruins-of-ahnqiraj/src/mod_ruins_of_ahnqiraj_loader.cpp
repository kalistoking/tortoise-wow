// Ruins Of Ahnqiraj's scripts, registered from the module: the core has no copy of them (AM1,
// handoff/manager-091). The legacy Script + RegisterSelf registers each under the script_name
// the world database gives it.
#include "scriptPCH.h"
#include "Config/Config.h"

namespace mod_ruins_of_ahnqiraj
{
    void AddSC_boss_kurinnaxx();
    void AddSC_boss_moam();
    void AddSC_ruins_of_ahnqiraj_trash();
}

void Addmod_ruins_of_ahnqirajScripts()
{
    // conf/mod-ruins-of-ahnqiraj.conf: off, nothing is registered -- the world database's names find no script.
    if (!sConfig.GetBoolDefault("mod-ruins-of-ahnqiraj.Enable", true))
    {
        sLog.outString("[mod-ruins-of-ahnqiraj] disabled by mod-ruins-of-ahnqiraj.Enable -- no script registered");
        return;
    }
    mod_ruins_of_ahnqiraj::AddSC_boss_kurinnaxx();
    mod_ruins_of_ahnqiraj::AddSC_boss_moam();
    mod_ruins_of_ahnqiraj::AddSC_ruins_of_ahnqiraj_trash();
    sLog.outString("[mod-ruins-of-ahnqiraj] Ruins Of Ahnqiraj's scripts registered from the module");
}
