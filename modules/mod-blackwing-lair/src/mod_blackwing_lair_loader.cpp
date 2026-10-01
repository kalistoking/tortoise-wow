// Blackwing Lair's scripts, registered from the module: the core has no copy of them (AM1,
// handoff/manager-091). The legacy Script + RegisterSelf registers each under the script_name
// the world database gives it.
#include "scriptPCH.h"
#include "Config/Config.h"

namespace mod_blackwing_lair
{
    void AddSC_blackwing_lair_trash();
    void AddSC_boss_broodlord();
    void AddSC_boss_ebonroc();
    void AddSC_boss_firemaw();
    void AddSC_boss_flamegor();
    void AddSC_blackwing_lair_death_talon_captain();
    void AddSC_boss_vael();
}

void Addmod_blackwing_lairScripts()
{
    // conf/mod-blackwing-lair.conf: off, nothing is registered -- the world database's names find no script.
    if (!sConfig.GetBoolDefault("mod-blackwing-lair.Enable", true))
    {
        sLog.outString("[mod-blackwing-lair] disabled by mod-blackwing-lair.Enable -- no script registered");
        return;
    }
    mod_blackwing_lair::AddSC_blackwing_lair_trash();
    mod_blackwing_lair::AddSC_boss_broodlord();
    mod_blackwing_lair::AddSC_boss_ebonroc();
    mod_blackwing_lair::AddSC_boss_firemaw();
    mod_blackwing_lair::AddSC_boss_flamegor();
    mod_blackwing_lair::AddSC_blackwing_lair_death_talon_captain();
    mod_blackwing_lair::AddSC_boss_vael();
    sLog.outString("[mod-blackwing-lair] Blackwing Lair's scripts registered from the module");
}
