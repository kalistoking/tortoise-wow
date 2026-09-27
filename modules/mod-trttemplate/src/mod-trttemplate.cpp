#include "ScriptObjects.h"
#include "Log.h"
#include "Config/Config.h"
#include "Database/DatabaseEnv.h"
#include "ObjectMgr.h"
#include "Player.h"
#include "Chat.h"
#include "Util.h"

#include <string>
#include <vector>

// A module's three sources of data, each in its own place:
//   conf/mod-trttemplate.conf.dist  -- its settings, read with sConfig;
//   module_string(_locale)          -- its texts, per locale, read with sObjectMgr.GetModuleString;
//   mod_trttemplate_greeting        -- a table it owns, read with WorldDatabase.
// The two tables come from data/sql/world, which the core applies at start.

namespace
{
    char const* const ModuleName = "mod-trttemplate";

    enum ModTrttemplateString : uint32
    {
        STRING_LOADED   = 1,
        STRING_GREETING = 2,
    };

    // Read once at start; a restart reads the table again.
    std::vector<std::string> Greetings;

    bool Enabled()
    {
        return sConfig.GetBoolDefault("mod-trttemplate.Enable", true);
    }

    class ModTrttemplateWorldScript : public WorldScript
    {
    public:
        ModTrttemplateWorldScript()
            : WorldScript("mod-trttemplate_world", { WORLDHOOK_ON_STARTUP })
        {
        }

        void OnStartup() override
        {
            if (!Enabled())
                return;

            Greetings.clear();
            if (std::unique_ptr<QueryResult> result{ WorldDatabase.Query("SELECT `text` FROM `mod_trttemplate_greeting` ORDER BY `id`") })
            {
                do
                    Greetings.push_back(result->Fetch()[0].GetCppString());
                while (result->NextRow());
            }

            sLog.outString(sObjectMgr.GetModuleString(ModuleName, STRING_LOADED, DB_LOCALE_enUS), uint32(Greetings.size()));
        }
    };

    class ModTrttemplatePlayerScript : public PlayerScript
    {
    public:
        ModTrttemplatePlayerScript()
            : PlayerScript("mod-trttemplate_player", { PLAYERHOOK_ON_LOGIN })
        {
        }

        void OnLogin(Player* player) override
        {
            if (!Enabled() || !sConfig.GetBoolDefault("mod-trttemplate.GreetOnLogin", true) || Greetings.empty())
                return;

            std::string const& greeting = Greetings[urand(0, uint32(Greetings.size()) - 1)];
            // The player's own locale; a locale without a row in module_string_locale gets the default.
            char const* format = sObjectMgr.GetModuleString(ModuleName, STRING_GREETING, player->GetSession()->GetSessionDbLocaleIndex());
            ChatHandler(player).PSendSysMessage(format, greeting.c_str());
        }
    };
}

void Addmod_trttemplateScripts()
{
    new ModTrttemplateWorldScript();
    new ModTrttemplatePlayerScript();
}
