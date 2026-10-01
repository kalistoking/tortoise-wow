// Black Morass's scripts, registered from the module: the core has no copy of them (AM1,
// handoff/manager-091). The legacy Script + RegisterSelf registers each under the script_name
// the world database gives it.
#include "scriptPCH.h"
#include "Config/Config.h"

namespace mod_black_morass
{
    void AddSC_black_morass_trash();
    void AddSC_boss_chronormu();
    void AddSC_boss_gerastrasz();
    void AddSC_instance_black_morass();
}

void Addmod_black_morassScripts()
{
    // conf/mod-black-morass.conf: off, nothing is registered -- the world database's names find no script.
    if (!sConfig.GetBoolDefault("mod-black-morass.Enable", true))
    {
        sLog.outString("[mod-black-morass] disabled by mod-black-morass.Enable -- no script registered");
        return;
    }
    mod_black_morass::AddSC_black_morass_trash();
    mod_black_morass::AddSC_boss_chronormu();
    mod_black_morass::AddSC_boss_gerastrasz();
    mod_black_morass::AddSC_instance_black_morass();
    sLog.outString("[mod-black-morass] Black Morass's scripts registered from the module");
}
