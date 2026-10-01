// Scholomance's scripts, registered from the module: the core has no copy of them (AM1,
// handoff/manager-091). The legacy Script + RegisterSelf registers each under the script_name
// the world database gives it.
#include "scriptPCH.h"
#include "Config/Config.h"

namespace mod_scholomance
{
    void AddSC_boss_darkmaster_gandling();
    void AddSC_boss_theolenkrastinov();
    void AddSC_boss_illuciabarov();
    void AddSC_boss_instructormalicia();
    void AddSC_boss_lordalexeibarov();
    void AddSC_boss_lorekeeperpolkelt();
    void AddSC_boss_rasfrost();
    void AddSC_boss_theravenian();
    void AddSC_scholo_trash();
}

void Addmod_scholomanceScripts()
{
    // conf/mod-scholomance.conf: off, nothing is registered -- the world database's names find no script.
    if (!sConfig.GetBoolDefault("mod-scholomance.Enable", true))
    {
        sLog.outString("[mod-scholomance] disabled by mod-scholomance.Enable -- no script registered");
        return;
    }
    mod_scholomance::AddSC_boss_darkmaster_gandling();
    mod_scholomance::AddSC_boss_theolenkrastinov();
    mod_scholomance::AddSC_boss_illuciabarov();
    mod_scholomance::AddSC_boss_instructormalicia();
    mod_scholomance::AddSC_boss_lordalexeibarov();
    mod_scholomance::AddSC_boss_lorekeeperpolkelt();
    mod_scholomance::AddSC_boss_rasfrost();
    mod_scholomance::AddSC_boss_theravenian();
    mod_scholomance::AddSC_scholo_trash();
    sLog.outString("[mod-scholomance] Scholomance's scripts registered from the module");
}
