// The gargoyles and the Dark Touched Warriors, taken out of instance_naxxramas.cpp: they go to mod-naxxramas
// and its rows, while the instance, Omarion and the spell scripts (the gargoyles' stoneform aura among them)
// stay in the core (trt A30, AM1).
#include "scriptPCH.h"
#include "dungeons/naxxramas/naxxramas.h"

namespace mod_naxxramas
{


enum
{
    SPELL_INVISIBILITY_AND_STEALTH_DETECTION = 18950,
    SPELL_STONESKIN = 28995, // Periodic Heal and Damage Immunity
    SPELL_GARGOYLE_STONEFORM_VISUAL = 29153, // Dummy Aura
    SPELL_ACID_VOLLEY = 29325,

    BCT_STRANGE_NOISE = 10755, // %s emits a strange noise.
};

struct mob_naxxramasGarboyleAI : public ScriptedAI
{
    mob_naxxramasGarboyleAI(Creature* pCreature)
        : ScriptedAI(pCreature)
    {
        Reset();
        EnterStoneform();

        if (m_creature->GetDefaultMovementType() == IDLE_MOTION_TYPE && m_creature->GetEntry() == 16168)
            m_creature->CastSpell(m_creature, SPELL_INVISIBILITY_AND_STEALTH_DETECTION, true);
    }

    void EnterStoneform()
    {
        if (m_creature->GetDefaultMovementType() == IDLE_MOTION_TYPE && m_creature->GetEntry() == 16168)
            m_creature->CastSpell(m_creature, SPELL_GARGOYLE_STONEFORM_VISUAL, true);
    }

    uint32 m_uiAcidVolleyTimer;

    void Reset() override
    {
        m_uiAcidVolleyTimer = urand(2800, 6500);
    }

    void JustReachedHome() override
    {
        EnterStoneform();
    }

    void MoveInLineOfSight(Unit* pWho) override
    {
        if (m_creature->HasAura(SPELL_GARGOYLE_STONEFORM_VISUAL))
        {
            if (pWho->GetTypeId() == TYPEID_PLAYER
                && !m_creature->IsInCombat()
                && m_creature->IsWithinDistInMap(pWho, 17.0f)
                && m_creature->IsWithinLOSInMap(pWho)
                && !pWho->HasAuraType(SPELL_AURA_FEIGN_DEATH)
                && !pWho->HasAuraType(SPELL_AURA_MOD_UNATTACKABLE))
            {
                AttackStart(pWho);
            }
        }
        else
        {
            ScriptedAI::MoveInLineOfSight(pWho);
        }
    }

    void Aggro(Unit*) override
    {
        if (m_creature->HasAura(SPELL_GARGOYLE_STONEFORM_VISUAL))
            m_creature->RemoveAurasDueToSpellByCancel(SPELL_GARGOYLE_STONEFORM_VISUAL);
    }

    void UpdateAI(const uint32 diff) override
    {
        if (!m_creature->SelectHostileTarget() || !m_creature->GetVictim())
            return;

        if (m_creature->GetHealthPercent() < 30.0f && !m_creature->IsNonMeleeSpellCasted() && !m_creature->HasAura(SPELL_STONESKIN))
        {
            if (DoCastSpellIfCan(m_creature, SPELL_STONESKIN) == CAST_OK)
            {
                m_creature->CastSpell(m_creature, SPELL_STONESKIN, true);
                DoScriptText(BCT_STRANGE_NOISE, m_creature);
            }
        }

        if (m_uiAcidVolleyTimer < diff && !m_creature->IsNonMeleeSpellCasted())
        {
            // supposedly the first gargoyle in plague wing did not do the acid volley, so
            // hackfix here to skip him
            if (m_creature->GetDBTableGUIDLow() != 88095)
            {
                if (DoCastSpellIfCan(m_creature, SPELL_ACID_VOLLEY) == CAST_OK) // acid volley
                    m_uiAcidVolleyTimer = 8000;
            }
        }
        else
            m_uiAcidVolleyTimer -= diff;

        DoMeleeAttackIfReady();
    }
};
struct mob_dark_touched_warriorAI : public ScriptedAI
{
    mob_dark_touched_warriorAI(Creature* pCreature)
        : ScriptedAI(pCreature)
    {
        Reset();
    }

    bool hasFled;
    void Reset() override
    {
        hasFled = false;
    }

    void FleeToHorse()
    {
        if (!m_creature->GetVictim() || m_creature->HasAuraType(SPELL_AURA_PREVENTS_FLEEING))
            return;

        Creature* pNearest = nullptr;
        MaNGOS::NearestCreatureEntryWithLiveStateInObjectRangeCheck u_check(*m_creature, 16067, true, 100.0f);
        MaNGOS::CreatureLastSearcher<MaNGOS::NearestCreatureEntryWithLiveStateInObjectRangeCheck> searcher(pNearest, u_check);

        Cell::VisitGridObjects(m_creature, searcher, 100.0f);
        if (pNearest)
        {
            m_creature->GetMotionMaster()->MoveSeekAssistance(pNearest->GetPositionX(), pNearest->GetPositionY(), pNearest->GetPositionZ());
            m_creature->SetTargetGuid(ObjectGuid());

            m_creature->UpdateSpeed(MOVE_RUN, false);
            m_creature->InterruptSpellsWithInterruptFlags(SPELL_INTERRUPT_FLAG_MOVEMENT);
        }
    }

    void UpdateAI(const uint32 diff) override
    {
        if (!m_creature->SelectHostileTarget() || !m_creature->GetVictim())
            return;

        if (!hasFled && m_creature->GetHealthPercent() < 50.0f)
        {
            hasFled = true;
            FleeToHorse();
        }

        DoMeleeAttackIfReady();
    }

};
CreatureAI* GetAI_mob_naxxramasGargoyle(Creature* pCreature)
{
    return new mob_naxxramasGarboyleAI(pCreature);
}

CreatureAI* GetAI_dark_touched_warrior(Creature* pCreature)
{
    return new mob_dark_touched_warriorAI(pCreature);
}


void AddSC_naxxramas_gargoyles_warriors()
{
    Script* pNewScript;

    pNewScript = new Script;
    pNewScript->Name = "naxxramas_gargoyle_ai";
    pNewScript->GetAI = &GetAI_mob_naxxramasGargoyle;
    pNewScript->RegisterSelf();

    pNewScript = new Script;
    pNewScript->Name = "dark_touched_warriorAI";
    pNewScript->GetAI = &GetAI_dark_touched_warrior;
    pNewScript->RegisterSelf();
}

} // namespace mod_naxxramas
