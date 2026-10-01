/* This file is part of the ScriptDev2 Project. See AUTHORS file for Copyright information
* This program is free software; you can redistribute it and/or modify
* it under the terms of the GNU General Public License as published by
* the Free Software Foundation; either version 2 of the License, or
* (at your option) any later version.
*
* This program is distributed in the hope that it will be useful,
* but WITHOUT ANY WARRANTY; without even the implied warranty of
* MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
* GNU General Public License for more details.
*
* You should have received a copy of the GNU General Public License
* along with this program; if not, write to the Free Software
* Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307  USA
*/

#include "scriptPCH.h"
#include "naxxramas.h"

namespace
{
template <class T>
SpellScript* GetSpellScript(SpellEntry const*)
{
    return new T();
}

template <class T>
AuraScript* GetAuraScript(SpellEntry const*)
{
    return new T();
}

void RegisterSpellScript(char const* name, SpellScript* (*getter)(SpellEntry const*))
{
    Script* script = new Script;
    script->Name = name;
    script->GetSpellScript = getter;
    script->RegisterSelf();
}

void RegisterAuraScript(char const* name, AuraScript* (*getter)(SpellEntry const*))
{
    Script* script = new Script;
    script->Name = name;
    script->GetAuraScript = getter;
    script->RegisterSelf();
}

struct spell_grobbulus_cloud_poison : public SpellScript
{
    void OnSetTargetMap(Spell* spell, SpellEffectIndex /*effIdx*/, uint32& /*targetMode*/, float& radius, uint32& /*unMaxTargets*/, bool& /*selectClosestTargets*/) const override
    {
        if (!spell->m_casterUnit)
            return;

        if (SpellAuraHolder* auraHolder = spell->m_casterUnit->GetSpellAuraHolder(28158))
        {
            int const maxDur = auraHolder->GetAuraMaxDuration();
            int const currTick = maxDur - auraHolder->GetAuraDuration();
            radius = 18.0f / maxDur * currTick + 2.0f;
        }
    }
};

struct spell_grobbulus_mutagen_explosion : public SpellScript
{
    bool OnEffectExecute(Spell* spell, SpellEffectIndex effIdx) const override
    {
        if (effIdx != EFFECT_INDEX_0)
            return true;

        if (spell->m_triggeredBySpellInfo)
            spell->damage = uint32(spell->damage * 1.5f);
        else
            spell->damage = uint32(spell->damage / 1.5f);

        return true;
    }
};

struct spell_mutating_injection : public AuraScript
{
    void OnBeforeApply(Aura* aura, bool apply) override
    {
        if (apply)
            return;

        Unit* caster = aura->GetCaster();
        if (!caster)
            return;

        if (aura->GetRemoveMode() == AURA_REMOVE_BY_DISPEL)
            caster->CastSpell(aura->GetTarget(), 28206, true);
        else
            caster->CastSpell(aura->GetTarget(), 28206, true, nullptr, aura);

        aura->GetTarget()->CastSpell(aura->GetTarget(), 28240, true, nullptr, aura);
    }
};
}

void AddSC_boss_grobbulus()
{
    RegisterSpellScript("spell_grobbulus_cloud_poison", &GetSpellScript<spell_grobbulus_cloud_poison>);
    RegisterSpellScript("spell_grobbulus_mutagen_explosion", &GetSpellScript<spell_grobbulus_mutagen_explosion>);
    RegisterAuraScript("spell_mutating_injection", &GetAuraScript<spell_mutating_injection>);
}
