// The Upper Karazhan Halls' spell and aura scripts, taken out of its seven boss files: a spell's hook,
// not a creature's AI -- they stay in the core while the dungeon's creatures are
// mod-upper-karazhan-halls's and their rows (trt A17, AM1).
#include "scriptPCH.h"

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

// boss_anomalus.cpp
struct spell_arcane_overload : public AuraScript
{
    void OnAfterApply(Aura* aura, bool apply) override
    {
        if (apply)
            return;

        Unit* target = aura->GetTarget();
        target->CastSpell(target, 51101, true);
        target->CastSpell(target, 51099, true, nullptr, nullptr, aura->GetCasterGuid(), aura->GetSpellProto());
    }
};

// boss_incantagos.cpp
struct spell_ley_line_disturbance : public SpellScript
{
    bool OnEffectExecute(Spell* spell, SpellEffectIndex /*effIdx*/) const override
    {
        Creature* caster = ToCreature(spell->m_caster);
        if (!caster)
            return false;

        Position const& home = caster->GetHomePosition();
        static uint32 const affinities[] = { 59987, 59986, 59985, 59984, 59983, 59982 };
        if (Creature* affinity = spell->m_caster->SummonCreature(affinities[urand(0, 5)], home.x, home.y, home.z, M_PI_F, TEMPSUMMON_DEAD_DESPAWN, 30000))
        {
            affinity->m_Events.AddLambdaEventAtOffset([affinity, guid = caster->GetObjectGuid()]()
            {
                if (!affinity->IsAlive())
                    return;

                if (Creature* summoner = affinity->GetMap()->GetCreature(guid))
                {
                    summoner->CastSpell(summoner, 26662, true);
                    summoner->PMonsterEmote(2384, summoner);
                }

                affinity->SendSpellGo(affinity, 1449);
                affinity->DoKillUnit();
            }, 15000);
        }

        return false;
    }
};

// boss_keeper_gnarlmoon.cpp
struct spell_lunar_shift : public SpellScript
{
    bool OnEffectExecute(Spell* spell, SpellEffectIndex /*effIdx*/) const override
    {
        Unit* target = spell->GetUnitTarget();
        if (!spell->m_casterUnit || !target)
            return false;

        if (target->HasAura(51080))
        {
            target->RemoveAurasDueToSpell(51080);
            target->AddAura(51081, 0, spell->m_casterUnit);
        }
        else if (target->HasAura(51081))
        {
            target->RemoveAurasDueToSpell(51081);
            target->AddAura(51080, 0, spell->m_casterUnit);
        }
        else
            return false;

        spell->m_casterUnit->GetThreatManager().modifyThreatPercent(target, -100);
        spell->m_casterUnit->CastSpell(spell->m_casterUnit, 51085, true);
        return false;
    }
};

struct spell_flock_of_ravens : public SpellScript
{
    bool OnEffectExecute(Spell* spell, SpellEffectIndex effIdx) const override
    {
        if (!spell->m_casterUnit)
            return false;

        int32 count = spell->m_spellInfo->EffectBasePoints[effIdx];
        std::list<Player*> players;
        spell->m_casterUnit->GetAlivePlayerListInRange(spell->m_casterUnit, players, 100.0f);
        for (Player* player : players)
        {
            if (count-- < 0)
                break;

            float x;
            float y;
            float z;
            player->GetPosition(x, y, z);
            player->GetRandomPoint(x, y, z, 5.0f, x, y, z);
            if (Creature* raven = spell->m_casterUnit->SummonCreature(spell->m_spellInfo->EffectMiscValue[effIdx], x, y, z, player->GetOrientation(), TEMPSUMMON_TIMED_OR_CORPSE_DESPAWN, 30000))
                raven->AI()->AttackStart(player);
        }

        return false;
    }
};

struct spell_owl_gaze : public AuraScript
{
    void OnAfterApply(Aura* aura, bool apply) override
    {
        if (apply || aura->GetRemoveMode() != AURA_REMOVE_BY_EXPIRE)
            return;

        Unit* target = aura->GetTarget();
        Unit* caster = aura->GetCaster();
        if (!caster)
            return;

        if (target->HasAura(51080))
        {
            target->RemoveAurasDueToSpell(51080);
            target->AddAura(51081, 0, caster);
        }
        else if (target->HasAura(51081))
        {
            target->RemoveAurasDueToSpell(51081);
            target->AddAura(51080, 0, caster);
        }
    }
};

// boss_kings_council.cpp
struct spell_restore_creature_to_life : public SpellScript
{
    bool OnEffectExecute(Spell* spell, SpellEffectIndex /*effIdx*/) const override
    {
        if (Creature* target = ToCreature(spell->GetUnitTarget()))
            target->SetDeathState(JUST_ALIVED);

        return false;
    }
};

struct spell_pawns_advance : public AuraScript
{
    void OnAuraInit(Aura* aura) override
    {
        aura->SetPeriodicTimer(1000);
    }

    void OnPeriodicDummy(Aura* aura) override
    {
        Creature* creature = aura->GetTarget()->ToCreature();
        if (!creature)
            return;

        std::list<Creature*> list;
        creature->GetCreatureListWithEntryInGrid(list, creature->GetEntry(), 100.0f);

        float multiplier = list.size() < 2 ? 1.0f : (list.size() - 1) * 1.3f;
        CreatureInfo const* creatureInfo = creature->GetCreatureInfo();
        creature->SetBaseWeaponDamage(BASE_ATTACK, MINDAMAGE, creatureInfo->dmg_min * multiplier);
        creature->SetBaseWeaponDamage(BASE_ATTACK, MAXDAMAGE, creatureInfo->dmg_max * multiplier);
        creature->UpdateDamagePhysical(BASE_ATTACK);
    }
};

// boss_kruul.cpp
struct spell_kruul_call_from_twisting_nether : public SpellScript
{
    void OnSummon(Spell* /*spell*/, Creature* summon) const override
    {
        summon->CastSpell(summon, 22707, true);
        summon->CastSpell(summon, 51167, true);
    }
};

struct spell_mark_of_the_highlord : public AuraScript
{
    void OnPeriodicTickEnd(Aura* aura) override
    {
        Unit* target = aura->GetTarget();
        if (!target || target->GetPower(POWER_MANA) == 0)
            return;

        target->CastSpell(target, 51165, true, nullptr, aura, aura->GetCasterGuid());
    }
};

// boss_sanv_tasdal.cpp
struct spell_rift_feedback : public SpellScript
{
    bool OnEffectExecute(Spell* spell, SpellEffectIndex /*effIdx*/) const override
    {
        Unit* target = spell->GetUnitTarget();
        if (!spell->m_casterUnit || !target || spell->m_casterUnit == target || target->HasAura(51196))
            return false;

        target->DealDamage(target, 12000, nullptr, DOT, SPELL_SCHOOL_MASK_ARCANE, spell->m_spellInfo, false, nullptr, false, false);
        return false;
    }
};

struct spell_overflowing_hatred : public SpellScript
{
    bool OnEffectExecute(Spell* spell, SpellEffectIndex /*effIdx*/) const override
    {
        Unit* target = spell->GetUnitTarget();
        if (!spell->m_casterUnit || !target || spell->m_casterUnit == target || target->GetEntry() == 59974)
            return false;

        target->DealDamage(target, 6000, nullptr, DOT, SPELL_SCHOOL_MASK_FIRE, spell->m_spellInfo, false, nullptr, false, false);
        return false;
    }
};

struct spell_form_rift_elemental : public SpellScript
{
    bool OnEffectExecute(Spell* spell, SpellEffectIndex /*effIdx*/) const override
    {
        Unit* target = spell->GetUnitTarget();
        if (!spell->m_casterUnit || !target || spell->m_casterUnit == target)
            return false;

        spell->m_casterUnit->SummonCreature(59974, 0, 0, 0, 0, TEMPSUMMON_TIMED_OR_CORPSE_DESPAWN, 30000);
        target->DoKillUnit();
        spell->m_casterUnit->DoKillUnit();
        return false;
    }
};
}

void AddSC_upper_karazhan_halls_spells()
{
    RegisterAuraScript("spell_arcane_overload", &GetAuraScript<spell_arcane_overload>);
    RegisterSpellScript("spell_ley_line_disturbance", &GetSpellScript<spell_ley_line_disturbance>);
    RegisterSpellScript("spell_lunar_shift", &GetSpellScript<spell_lunar_shift>);
    RegisterSpellScript("spell_flock_of_ravens", &GetSpellScript<spell_flock_of_ravens>);
    RegisterAuraScript("spell_owl_gaze", &GetAuraScript<spell_owl_gaze>);
    RegisterSpellScript("spell_restore_creature_to_life", &GetSpellScript<spell_restore_creature_to_life>);
    RegisterAuraScript("spell_pawns_advance", &GetAuraScript<spell_pawns_advance>);
    RegisterSpellScript("spell_kruul_call_from_twisting_nether", &GetSpellScript<spell_kruul_call_from_twisting_nether>);
    RegisterAuraScript("spell_mark_of_the_highlord", &GetAuraScript<spell_mark_of_the_highlord>);
    RegisterSpellScript("spell_rift_feedback", &GetSpellScript<spell_rift_feedback>);
    RegisterSpellScript("spell_overflowing_hatred", &GetSpellScript<spell_overflowing_hatred>);
    RegisterSpellScript("spell_form_rift_elemental", &GetSpellScript<spell_form_rift_elemental>);
}
