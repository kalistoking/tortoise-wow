// The Deadmines' boss, instance and object scripts, registered from the module: the core has no
// copy of them. The legacy Script + RegisterSelf registers each under the script_name the world
// database gives it.
#include "scriptPCH.h"
#include "Config/Config.h"

namespace mod_deadmines
{
    void AddSC_boss_mr_smite();
    void AddSC_instance_deadmines();
    void AddSC_deadmines();
}

void Addmod_deadminesScripts()
{
    // conf/mod-deadmines.conf: off, nothing is registered -- the server then runs the
    // Deadmines as it does with no module (the database names scripts no one registered).
    if (!sConfig.GetBoolDefault("mod-deadmines.Enable", true))
    {
        sLog.outString("[mod-deadmines] disabled by mod-deadmines.Enable -- no script registered");
        return;
    }
    mod_deadmines::AddSC_boss_mr_smite();
    mod_deadmines::AddSC_instance_deadmines();
    mod_deadmines::AddSC_deadmines();
    sLog.outString("[mod-deadmines] boss_mr_smite, instance_deadmines and the Deadmines' objects registered from the module");
}
