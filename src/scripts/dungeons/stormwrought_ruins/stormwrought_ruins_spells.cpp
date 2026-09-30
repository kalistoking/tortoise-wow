// Drazare's Embrace, taken out of boss_lady_drazare.cpp: an aura script (44053 expiring into 44052)
// stays in the core while Lady Drazare is mod-stormwrought-ruins's and its rows (trt A19, AM1).
#include "scriptPCH.h"

namespace
{
template <class T>
AuraScript* GetAuraScript(SpellEntry const*)
{
    return new T();
}

void RegisterAuraScript(char const* name, AuraScript* (*getter)(SpellEntry const*))
{
    Script* script = new Script;
    script->Name = name;
    script->GetAuraScript = getter;
    script->RegisterSelf();
}

struct spell_drazares_embrace : public AuraScript
{
    void OnAfterApply(Aura* aura, bool apply) override
    {
        if (!apply && aura->GetRemoveMode() == AURA_REMOVE_BY_EXPIRE)
            aura->GetTarget()->CastSpell(aura->GetTarget(), 44052, true, nullptr, aura);
    }
};
}

void AddSC_stormwrought_ruins_spells()
{
    RegisterAuraScript("spell_drazares_embrace", &GetAuraScript<spell_drazares_embrace>);
}
