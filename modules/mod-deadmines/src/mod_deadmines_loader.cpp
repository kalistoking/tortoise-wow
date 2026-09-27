// The Deadmines' boss, instance and object scripts, registered from the module: the core has no
// copy of them. The legacy Script + RegisterSelf registers each under the script_name the world
// database gives it.
#include "scriptPCH.h"

namespace mod_deadmines
{
    void AddSC_boss_mr_smite();
    void AddSC_instance_deadmines();
    void AddSC_deadmines();
}

void Addmod_deadminesScripts()
{
    mod_deadmines::AddSC_boss_mr_smite();
    mod_deadmines::AddSC_instance_deadmines();
    mod_deadmines::AddSC_deadmines();
    sLog.outString("[mod-deadmines] boss_mr_smite, instance_deadmines and the Deadmines' objects registered from the module");
}
