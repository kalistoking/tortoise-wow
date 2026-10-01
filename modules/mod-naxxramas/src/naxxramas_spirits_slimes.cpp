// The Shades and Spirits of Naxxramas, the plague slimes and the toxic tunnels, taken out of
// instance_naxxramas.cpp: they go to mod-naxxramas and its rows, while the instance, the gargoyles, the Dark
// Touched Warrior, Omarion and the spell scripts stay in the core (trt A30, AM1).
#include "scriptPCH.h"
#include "dungeons/naxxramas/naxxramas.h"

namespace mod_naxxramas
{


struct mob_spiritOfNaxxramasAI : public ScriptedAI
{
    mob_spiritOfNaxxramasAI(Creature* pCreature)
        : ScriptedAI(pCreature)
    {
        Reset();
        m_creature->CastSpell(m_creature, 18950, true); // stealth detection
    }

    ObjectGuid portal;
    uint32 portalTimer;
    uint32 shadowboltVolleyTimer;

    void DespawnPortal()
    {
        if (!portal)
            return;

        if (Creature* pPortal = m_creature->GetMap()->GetCreature(portal))
        {
            static_cast<TemporarySummon*>(pPortal)->UnSummon();
        }
        portal = 0;
    }
    void Reset() override
    {
        portalTimer = 5000;
        shadowboltVolleyTimer = 6000;
        DespawnPortal();
    }

    void JustDied(Unit* pKiller) override
    {
        DespawnPortal();
    }

    void UpdateAI(const uint32 diff) override
    {
        if (!m_creature->SelectHostileTarget() || !m_creature->GetVictim())
            return;

        if (portalTimer)
        {
            if (portalTimer < diff)
            {
                // summon portal of shadows
                if (Creature* pCreature = m_creature->SummonCreature(16420, m_creature->GetPositionX(), m_creature->GetPositionY(), m_creature->GetPositionZ(), 0,
                    TEMPSUMMON_TIMED_DESPAWN, 60000))
                {
                    m_creature->SendSpellGo(m_creature, 28383); // since we're manually summoning, we also send the visual that we're not using
                    portal = pCreature->GetObjectGuid();
                    pCreature->CastSpell(pCreature, 28384, true); // pCreature casts portal of shadow spell on self
                    portalTimer = 0;
                }
            }
            else
                portalTimer -= diff;
        }

        // casting shadowbolt volley every 10 sec
        if (shadowboltVolleyTimer < diff)
        {
            if (DoCastSpellIfCan(m_creature, 28599) == CAST_OK)
            {
                shadowboltVolleyTimer = 10000;
            }
        }
        else
            shadowboltVolleyTimer -= diff;

        DoMeleeAttackIfReady();
    }

};
struct mob_naxxramasPlagueSlimeAI : public ScriptedAI
{
    mob_naxxramasPlagueSlimeAI(Creature* pCreature)
        : ScriptedAI(pCreature)
    {
        Reset();
        prev_spell = 0;
    }
    uint32 colorChangeTimer;
    uint32 prev_spell;
    void ChangeColor()
    {
        uint32 spell = urand(28987, 28990);
        if(const SpellEntry* entry = sSpellMgr.GetSpellEntry(spell))
            m_creature->UpdateEntry(entry->EffectMiscValue[0]);
        if (prev_spell)
            m_creature->RemoveAurasDueToSpell(prev_spell);
        DoCastSpellIfCan(m_creature, spell, CF_TRIGGERED);
        m_creature->SetObjectScale(2.0f); // updateentry and the actual spells screws up the scale...
        prev_spell = spell;
    }

    void Reset() override
    {
        colorChangeTimer = 0;
        ChangeColor();
    }

    void Aggro(Unit*) override
    {
        m_creature->CallForHelp(10.0f);
    }

    void UpdateAI(const uint32 diff) override
    {
        if (!m_creature->SelectHostileTarget() || !m_creature->GetVictim())
            return;

        if (colorChangeTimer < diff)
        {
            colorChangeTimer = urand(9000, 12000); // todo: no idea if timer is correct
            ChangeColor();
        }
        else
            colorChangeTimer -= diff;

        DoMeleeAttackIfReady();
    }
};
struct mob_toxic_tunnelAI : public ScriptedAI
{
    mob_toxic_tunnelAI(Creature* pCreature)
        : ScriptedAI(pCreature)
    {
        Reset();
    }
    uint32 checktime;
    uint32 _evadeTimer;
    void Reset() override
    {
        checktime = 0;
        _evadeTimer = 0;
    }

    void AttackStart(Unit*) override { }
    void MoveInLineOfSight(Unit*) override { }

    void EnterCombat(Unit*) override
    {
        // Poison aura is hitting someone. Start a short timer to evade & drop combat
        if (!_evadeTimer)
            _evadeTimer = 5000;
    }

    void UpdateAI(const uint32 diff) override
    {
        if (!!_evadeTimer)
        {
            if (_evadeTimer <= diff)
            {
                EnterEvadeMode();
                _evadeTimer = 0;
            }
            else
                _evadeTimer -= diff;
        }

        // creature_template_addons should make this aura permanent, but check anyway due
        // to some reports of it not recasting
        if (checktime <= diff)
        {
            checktime = 5000;
            if (!m_creature->HasAura(28370))
                m_creature->CastSpell(m_creature, 28370, true);
        }
        else
            checktime -= diff;
    }
};

CreatureAI* GetAI_mob_spiritOfNaxxramas(Creature* pCreature)
{
    return new mob_spiritOfNaxxramasAI(pCreature);
}

CreatureAI* GetAI_mob_plagueSlimeAI(Creature* pCreature)
{
    return new mob_naxxramasPlagueSlimeAI(pCreature);
}

CreatureAI* GetAI_toxic_tunnel(Creature* pCreature)
{
    return new mob_toxic_tunnelAI(pCreature);
}


void AddSC_naxxramas_spirits_slimes()
{
    Script* pNewScript;

    pNewScript = new Script;
    pNewScript->Name = "spirit_of_naxxramas_ai";
    pNewScript->GetAI = &GetAI_mob_spiritOfNaxxramas;
    pNewScript->RegisterSelf();

    pNewScript = new Script;
    pNewScript->Name = "naxxramas_plague_slime_ai";
    pNewScript->GetAI = &GetAI_mob_plagueSlimeAI;
    pNewScript->RegisterSelf();

    pNewScript = new Script;
    pNewScript->Name = "toxic_tunnel_ai";
    pNewScript->GetAI = &GetAI_toxic_tunnel;
    pNewScript->RegisterSelf();
}

} // namespace mod_naxxramas
