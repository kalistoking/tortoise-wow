// Princess Huhuran, taken out of boss_huhuran.cpp: she goes to mod-temple-of-ahnqiraj and its rows, while
// her Poison Bolt Volley's spell script stays in the core (trt A29, AM1).
#include "scriptPCH.h"
#include "dungeons/temple_of_ahnqiraj/temple_of_ahnqiraj.h"

namespace mod_temple_of_ahnqiraj
{


enum
{
    EMOTE_GENERIC_FRENZY_KILL = 7797,
    EMOTE_GENERIC_BERSERK = -1000004,

    SPELL_ACIDSPIT = 26050,
    SPELL_FRENZY = 26051,
    SPELL_NOXIOUSPOISON = 26053,
    SPELL_BERSERK = 26068,
    SPELL_WYVERNSTING = 26180
};

struct boss_huhuranAI : public ScriptedAI
{
    boss_huhuranAI(Creature* pCreature) : ScriptedAI(pCreature)
    {
        m_pInstance = (ScriptedInstance*)pCreature->GetInstanceData();
        Reset();
    }

    ScriptedInstance* m_pInstance;

    uint32 m_uiFrenzyTimer;
    uint32 m_uiWyvernTimer;
    uint32 m_uiSpitTimer;
    uint32 m_uiNoxiousPoisonTimer;

    bool m_bBerserk;

    void MoveInLineOfSight(Unit* pWho) override
    {
        if (pWho->GetTypeId() == TYPEID_PLAYER
            && !m_creature->IsInCombat()
            && m_creature->IsWithinDistInMap(pWho, 80.0f)
            && !pWho->HasAuraType(SPELL_AURA_FEIGN_DEATH)
            && !pWho->HasAuraType(SPELL_AURA_MOD_UNATTACKABLE))
        {
            AttackStart(pWho);
        }
        ScriptedAI::MoveInLineOfSight(pWho);
    }

    void Aggro(Unit* /*pWho*/) override
    {
        if (m_pInstance)
            m_pInstance->SetData(TYPE_HUHURAN, IN_PROGRESS);
    }

    void JustReachedHome() override
    {
        if (m_pInstance)
            m_pInstance->SetData(TYPE_HUHURAN, FAIL);
    }

    void JustDied(Unit*) override
    {
        if (m_pInstance)
            m_pInstance->SetData(TYPE_HUHURAN, DONE);
    }

    void Reset() override
    {
        m_uiFrenzyTimer = urand(10000, 20000);
        m_uiWyvernTimer = urand(18000, 28000);
        m_uiSpitTimer = 8000;
        m_uiNoxiousPoisonTimer = urand(10000, 20000);

        m_bBerserk = false;
    }

    void UpdateAI(const uint32 uiDiff) override
    {
        //Return since we have no target
        if (!m_creature->SelectHostileTarget() || !m_creature->GetVictim())
            return;

        //m_uiFrenzyTimer
        if (m_uiFrenzyTimer < uiDiff && !m_creature->HasAura(SPELL_FRENZY) && !m_bBerserk)
        {
            if (DoCastSpellIfCan(m_creature, SPELL_FRENZY) == CAST_OK)
            {
                DoScriptText(EMOTE_GENERIC_FRENZY_KILL, m_creature);
                m_uiFrenzyTimer = urand(10000, 20000);
            }
        }
        else
            m_uiFrenzyTimer -= uiDiff;

        // No longer cast wyvern string during enrage
        if (!m_bBerserk)
        {
            // Wyvern Timer
            if (m_uiWyvernTimer < uiDiff)
            {
                if (DoCastSpellIfCan(m_creature->GetVictim(), SPELL_WYVERNSTING) == CAST_OK)
                    m_uiWyvernTimer = urand(15000, 32000);
            }
            else
                m_uiWyvernTimer -= uiDiff;
        }

        //Spit Timer
        if (m_uiSpitTimer < uiDiff)
        {
            if (DoCastSpellIfCan(m_creature->GetVictim(), SPELL_ACIDSPIT) == CAST_OK)
                m_uiSpitTimer = urand(5000, 10000);
        }
        else
            m_uiSpitTimer -= uiDiff;

        // Noxious Poison
        if (m_uiNoxiousPoisonTimer < uiDiff)
        {
            if (Unit* pTarget = m_creature->SelectAttackingTarget(ATTACKING_TARGET_RANDOM, 0))
                if (DoCastSpellIfCan(pTarget, SPELL_NOXIOUSPOISON) == CAST_OK)
                    m_uiNoxiousPoisonTimer = urand(12000, 24000);
        }
        else
            m_uiNoxiousPoisonTimer -= uiDiff;

        if (m_creature->GetHealthPercent() < 30.0f && !m_bBerserk)
        {
            m_creature->RemoveAurasDueToSpell(SPELL_FRENZY);

            if (DoCastSpellIfCan(m_creature, SPELL_BERSERK, CF_AURA_NOT_PRESENT))
            {
                DoScriptText(EMOTE_GENERIC_BERSERK, m_creature);
                m_bBerserk = true;
            }
        }

        DoMeleeAttackIfReady();
    }
};

CreatureAI* GetAI_boss_huhuran(Creature* pCreature)
{
    return new boss_huhuranAI(pCreature);
}


void AddSC_temple_of_ahnqiraj_huhuran()
{
    Script* newscript;

    newscript = new Script;
    newscript->Name = "boss_huhuran";
    newscript->GetAI = &GetAI_boss_huhuran;
    newscript->RegisterSelf();
}

} // namespace mod_temple_of_ahnqiraj
