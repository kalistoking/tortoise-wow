// D6 prototype: the Deadmines' boss, instance and object scripts from a module, the core
// untouched. The legacy Script + RegisterSelf is used on purpose: a module's loader runs after
// the core's AddScripts (ScriptMgr.cpp:2408-2409), and RegisterSelf replaces the entry the core
// registered under the same name (ScriptMgr.cpp:2977).
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
