// Molten Core's scripts, registered from the module: the core has no copy of them (AM1,
// handoff/manager-091). The legacy Script + RegisterSelf registers each under the script_name
// the world database gives it.
#include "scriptPCH.h"
#include "Config/Config.h"

namespace mod_molten_core
{
    void AddSC_boss_garr();
    void AddSC_boss_gehennas();
    void AddSC_boss_golemagg();
    void AddSC_boss_lucifron();
    void AddSC_boss_magmadar();
    void AddSC_boss_shazzrah();
    void AddSC_boss_sulfuron();
    void AddSC_molten_core();
    void AddSC_boss_incindis();
    void AddSC_molten_core_runes();
}

void Addmod_molten_coreScripts()
{
    // conf/mod-molten-core.conf: off, nothing is registered -- the world database's names find no script.
    if (!sConfig.GetBoolDefault("mod-molten-core.Enable", true))
    {
        sLog.outString("[mod-molten-core] disabled by mod-molten-core.Enable -- no script registered");
        return;
    }
    mod_molten_core::AddSC_boss_garr();
    mod_molten_core::AddSC_boss_gehennas();
    mod_molten_core::AddSC_boss_golemagg();
    mod_molten_core::AddSC_boss_lucifron();
    mod_molten_core::AddSC_boss_magmadar();
    mod_molten_core::AddSC_boss_shazzrah();
    mod_molten_core::AddSC_boss_sulfuron();
    mod_molten_core::AddSC_molten_core();
    mod_molten_core::AddSC_boss_incindis();
    mod_molten_core::AddSC_molten_core_runes();
    sLog.outString("[mod-molten-core] Molten Core's scripts registered from the module");
}
