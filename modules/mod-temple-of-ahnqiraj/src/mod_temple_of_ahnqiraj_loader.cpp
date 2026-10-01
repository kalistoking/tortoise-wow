// Temple Of Ahnqiraj's scripts, registered from the module: the core has no copy of them (AM1,
// handoff/manager-091). The legacy Script + RegisterSelf registers each under the script_name
// the world database gives it.
#include "scriptPCH.h"
#include "Config/Config.h"

namespace mod_temple_of_ahnqiraj
{
    void AddSC_temple_of_ahnqiraj_hatchling();
    void AddSC_temple_of_ahnqiraj_huhuran();
    void AddSC_temple_of_ahnqiraj_mindslayer();
    void AddSC_temple_of_ahnqiraj_ouro_mounds();
    void AddSC_temple_of_ahnqiraj_viscidus_globs();
}

void Addmod_temple_of_ahnqirajScripts()
{
    // conf/mod-temple-of-ahnqiraj.conf: off, nothing is registered -- the world database's names find no script.
    if (!sConfig.GetBoolDefault("mod-temple-of-ahnqiraj.Enable", true))
    {
        sLog.outString("[mod-temple-of-ahnqiraj] disabled by mod-temple-of-ahnqiraj.Enable -- no script registered");
        return;
    }
    mod_temple_of_ahnqiraj::AddSC_temple_of_ahnqiraj_hatchling();
    mod_temple_of_ahnqiraj::AddSC_temple_of_ahnqiraj_huhuran();
    mod_temple_of_ahnqiraj::AddSC_temple_of_ahnqiraj_mindslayer();
    mod_temple_of_ahnqiraj::AddSC_temple_of_ahnqiraj_ouro_mounds();
    mod_temple_of_ahnqiraj::AddSC_temple_of_ahnqiraj_viscidus_globs();
    sLog.outString("[mod-temple-of-ahnqiraj] Temple Of Ahnqiraj's scripts registered from the module");
}
