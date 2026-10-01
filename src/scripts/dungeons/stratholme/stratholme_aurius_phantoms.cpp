// Aurius and the Haunting Phantoms aura, taken out of stratholme.cpp: Aurius feigns death as no row
// command can, and the aura picks its own period and acts on its ticks. They stay in the core; the rest of
// stratholme.cpp is mod-stratholme's and its rows' (trt A22, AM1).
#include "scriptPCH.h"
#include "stratholme.h"

/*######
## npc_Aurius
######*/

#define QUEST_AURIUSRECKONING 5125
#define QUEST_THEMEDALLIONOFFAITH 5122
#define NPC_AURIUS_1 10917
#define NPC_AURIUS_2 10931

struct npc_auriusAI : public ScriptedAI
{
    npc_auriusAI(Creature* pCreature) : ScriptedAI(pCreature)
    {
        m_pInstance = (ScriptedInstance*)pCreature->GetInstanceData();
        Reset();
    }

    ScriptedInstance* m_pInstance;
    uint32 ui_entry;
    bool bIsFakeDead;

    void Reset() override
    {
        if (!m_pInstance)
            return;
        ui_entry = (m_creature->GetCreatureInfo()->entry);
        if (ui_entry == NPC_AURIUS_1)
            m_pInstance->SetData(TYPE_EVENT_AURIUS, NOT_STARTED);
        bIsFakeDead = false;
    }

    void FakeDeath()
    {
        if (!bIsFakeDead)
        {
            bIsFakeDead = true;
            m_creature->StopMoving();
            m_creature->SetFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_UNK_29);
            m_creature->SetUInt32Value(UNIT_DYNAMIC_FLAGS, UNIT_DYNFLAG_DEAD);
            m_creature->SetStandState(UNIT_STAND_STATE_DEAD);
            m_creature->AddUnitState(UNIT_STAT_FEIGN_DEATH);
            m_creature->CombatStop();
            //m_creature->RemoveAllAuras();
            //m_creature->DeleteThreatList();
            //m_creature->LoadCreatureAddon();
            //m_creature->GetMotionMaster()->MovementExpired();
            //m_creature->GetMotionMaster()->MoveIdle();
            m_creature->RemoveAurasWithInterruptFlags(AURA_INTERRUPT_FLAG_IMMUNE_OR_LOST_SELECTION);
            m_creature->InterruptNonMeleeSpells(true);
            m_creature->GetHostileRefManager().deleteReferences();
        }
    }

    void DamageTaken(Unit* pDoneBy, uint32& uiDamage) override
    {
        if (uiDamage >= m_creature->GetHealth())
        {
            if (m_creature->GetHealth() > 1)
                uiDamage = m_creature->GetHealth() - 1;
            else
                uiDamage = 0;
            FakeDeath();
        }
    }

    void QuestCompleted(Player* pPlayer, Quest const* pQuest)
    {
        if ((ui_entry == NPC_AURIUS_1) && (pQuest->GetQuestId() == QUEST_THEMEDALLIONOFFAITH))
        {
            m_creature->RemoveFlag(UNIT_NPC_FLAGS, UNIT_NPC_FLAG_QUESTGIVER);
            m_pInstance->SetData64(DATA_QUESTPLAYER, pPlayer->GetGUID());
            m_pInstance->SetData(TYPE_EVENT_AURIUS, SPECIAL);
        }
    }

    void UpdateAI(uint32 const diff) override
    {
        switch (ui_entry)
        {
            case NPC_AURIUS_1:
            {
                switch (m_pInstance->GetData(TYPE_BARON))
                {
                    case IN_PROGRESS :
                    case FAIL :
                    case DONE :
                    {
                        if ((m_pInstance->GetData(TYPE_EVENT_AURIUS)) != NOT_STARTED)
                            m_creature->SetVisibility(VISIBILITY_OFF);
                        break;
                    }
                }
                break;
            }
            case NPC_AURIUS_2:
            {
                switch (m_pInstance->GetData(TYPE_BARON))
                {
                    case IN_PROGRESS :
                    {
                        if (((m_pInstance->GetData(TYPE_EVENT_AURIUS)) == IN_PROGRESS) && (m_creature->GetStandState() != UNIT_STAND_STATE_DEAD))
                        {
                            if (Creature* pTarget = m_creature->GetMap()->GetCreature(m_pInstance->GetData64(DATA_BARON)))
                            {
                                if (pTarget->GetHealthPercent() <= 20.0f)
                                    FakeDeath();
                                else
                                    m_creature->AI()->AttackStart(pTarget);
                            }

                        }
                        break;
                    }
                    case FAIL :
                    {
                        if ((m_pInstance->GetData(TYPE_EVENT_AURIUS)) == IN_PROGRESS)
                        {
                            FakeDeath();
                            m_creature->RemoveFlag(UNIT_NPC_FLAGS, UNIT_NPC_FLAG_QUESTGIVER);
                            m_pInstance->SetData(TYPE_EVENT_AURIUS, FAIL);
                        }
                        break;
                    }
                    case DONE :
                    {
                        if ((m_pInstance->GetData(TYPE_EVENT_AURIUS)) == IN_PROGRESS)
                        {
                            FakeDeath();
                            m_creature->SetFlag(UNIT_NPC_FLAGS, UNIT_NPC_FLAG_QUESTGIVER);
                            m_pInstance->SetData(TYPE_EVENT_AURIUS, DONE);
                        }
                        break;
                    }
                }
                break;
            }
        }
        DoMeleeAttackIfReady();
    }
};

CreatureAI* GetAI_npc_aurius(Creature* pCreature)
{
    return new npc_auriusAI(pCreature);
}

bool QuestComplete_npc_aurius(Player* pPlayer, Creature* pCreature, Quest const* pQuest)
{
    if (npc_auriusAI* pScriptedAI = dynamic_cast<npc_auriusAI*>(pCreature->AI()))
    {
        pScriptedAI->QuestCompleted(pPlayer, pQuest);
        return true;
    }
    return false;
}

struct spell_haunting_phantoms : public AuraScript
{
    void OnBeforeApply(Aura* aura, bool apply) override
    {
        if (apply && aura->GetEffIndex() == EFFECT_INDEX_0)
            aura->SetPeriodicTimer(urand(30, 90) * IN_MILLISECONDS);
    }

    void OnPeriodicDummy(Aura* aura) override
    {
        Unit* target = aura->GetTarget();
        if (!target->GetMap()->IsDungeon())
            return;

        if (urand(0, 1))
            target->CastSpell(target, 16334, true);
        else
            target->CastSpell(target, 16335, true);
    }
};

AuraScript* GetScript_HauntingPhantoms(SpellEntry const*)
{
    return new spell_haunting_phantoms();
}

void AddSC_stratholme_aurius_phantoms()
{
    Script* newscript;

    newscript = new Script;
    newscript->Name = "npc_Aurius";
    newscript->GetAI = &GetAI_npc_aurius;
    newscript->pQuestRewardedNPC = &QuestComplete_npc_aurius;
    newscript->RegisterSelf();

    newscript = new Script;
    newscript->Name = "spell_haunting_phantoms";
    newscript->GetAuraScript = &GetScript_HauntingPhantoms;
    newscript->RegisterSelf();
}
