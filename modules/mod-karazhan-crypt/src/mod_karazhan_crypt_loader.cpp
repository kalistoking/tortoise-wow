// Karazhan Crypt's scripts, registered from the module: the core has no copy of them (AM1,
// handoff/manager-091). The legacy Script + RegisterSelf registers each under the script_name
// the world database gives it.
#include "scriptPCH.h"
#include "Config/Config.h"

namespace mod_karazhan_crypt
{
    void AddSC_instance_karazhan_crypt();
}

void Addmod_karazhan_cryptScripts()
{
    // conf/mod-karazhan-crypt.conf: off, nothing is registered -- the world database's names find no script.
    if (!sConfig.GetBoolDefault("mod-karazhan-crypt.Enable", true))
    {
        sLog.outString("[mod-karazhan-crypt] disabled by mod-karazhan-crypt.Enable -- no script registered");
        return;
    }
    mod_karazhan_crypt::AddSC_instance_karazhan_crypt();
    sLog.outString("[mod-karazhan-crypt] Karazhan Crypt's scripts registered from the module");
}
