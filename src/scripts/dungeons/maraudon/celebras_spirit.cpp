/* Copyright (C) 2006 - 2009 ScriptDev2 <https://scriptdev2.svn.sourceforge.net/>
 * This program is free software licensed under GPL version 2
 * Please see the included DOCS/LICENSE.TXT for more information */

// Celebras the Redeemed's escort and the book he reads, taken out of boss_celebras_the_cursed.cpp:
// an escort paused on a book a player reads is more than rows say today, so it stays in the core
// while Maraudon's bosses and instance are mod-maraudon's (trt A7, AM1).
#include "scriptPCH.h"

namespace
{
const uint32 NPC_CELEBRAS_REDEEMED = 13716;
}

enum
{
    GO_CREATOR = 178560,
    GO_CELEBRAS_BLUE_AURA = 178964,
    GO_TOME = 178965,

    SAY_WP_1 = 8953,
    SAY_WP_3 = 8954,
    SAY_WP_5 = 8949,
    SAY_WP_6 = 8955,
    SAY_ACCEPT = 8952,
    SAY_PRE_READ = 8950,
    SAY_POST_READ = 8948,

    SPELL_CHANNEL = 21916,
    EMOTE_CHANNEL = 8951,

    QUEST_SCEPTER = 7046
};

struct celebrasSpiritAI : public npc_escortAI
{
    celebrasSpiritAI(Creature* pCreature) : npc_escortAI(pCreature)
    {
        m_pInstance = (ScriptedInstance*)pCreature->GetInstanceData();
        Event_Timer = 0;
        SetEscortPaused(true);
        auraGUID = 0;
        Reset();
    }

    ScriptedInstance* m_pInstance;
    uint8 m_uiPhase;
    uint32 Event_Timer;
    uint64 auraGUID;
    bool m_bBookRead;

    void Reset() override
    {
        m_uiPhase = 0;
        Event_Timer = 0;
        auraGUID = 0;
        m_bBookRead = false;
    }

    void WaypointReached(uint32 i) override
    {
        std::list<GameObject*> scepterList;
        switch (i)
        {
            case 0:
                m_creature->SetOrientation(5.342044f);
                m_creature->SetHomePosition(m_creature->GetPositionX(), m_creature->GetPositionY(), m_creature->GetPositionZ(), m_creature->GetOrientation());
                break;

            case 1:
                DoScriptText(SAY_WP_1, m_creature);
                SetRun(false);
                break;

            case 3:
                if (Player* pPlayer = GetPlayerForEscort())
                    DoScriptText(SAY_WP_3, m_creature, pPlayer);
                Event_Timer = 4000;
                break;

            case 4:
                m_creature->SetOrientation(3.009412f);
                SetEscortPaused(true);
                break;

            case 5:
                //trigger => Player click on the book
                if (GameObject* pGo = m_creature->FindNearestGameObject(GO_CELEBRAS_BLUE_AURA, 250.0f))
                {
                    pGo->SetRespawnTime(6*MINUTE);
                    pGo->Refresh();
                }
                DoScriptText(SAY_WP_5, m_creature);
                if (GameObject* obj = m_creature->SummonGameObject(GO_CELEBRAS_BLUE_AURA, 652.463013f, 74.085098f, -85.335297f, 3.054616f, 0, 0, 0, 0, -1, false))
                    auraGUID = obj->GetGUID();
                break;

            case 6:
                DoScriptText(SAY_WP_6, m_creature);

                GetGameObjectListWithEntryInGrid(scepterList, m_creature, GO_CREATOR, 40.0f);
                for (const auto& it : scepterList)
                    it->UseDoorOrButton(0, false);
                scepterList.clear();

                break;
            case 9:
                if (GameObject* pAura = m_creature->GetMap()->GetGameObject(auraGUID))
                    pAura->Delete();
                break;
            case 13:
                Stop();
                Event_Timer = 3000;
                break;
        }
    }

    void QuestAccepted(Player* pPlayer, Quest const* pQuest)
    {
        Reset();
        DoScriptText(SAY_ACCEPT, m_creature);
        Start(true, pPlayer->GetGUID(), pQuest);
    }

    void JustStartedEscort() override
    {
        SetEscortPaused(true);
        Event_Timer = 5000;
        m_uiPhase = 1;
    }

    void BookRead()
    {
        m_bBookRead = true;
        if (Event_Timer > 1000)
            Event_Timer = 1000;
    }

    void UpdateEscortAI(const uint32 uiDiff) override
    {
        if (Event_Timer && !m_creature->GetVictim())
        {
            if (Event_Timer <= uiDiff)
            {
                Event_Timer = 0;

                switch (m_uiPhase)
                {
                    case 1:
                        SetEscortPaused(false);
                        break;
                    case 2:
                        DoScriptText(SAY_PRE_READ, m_creature);
                        Event_Timer = 1000;
                        break;
                    case 3:
                        m_creature->SummonGameObject(GO_TOME, 652.175f, 74.069f, -85.334327f, 5.6635f, 0, 0, 0, 0, -1, false);
                        Event_Timer = 1000;
                        break;
                    case 4:
                        // m_creature->CastSpell(m_creature, SPELL_CHANNEL, true);
                        DoScriptText(EMOTE_CHANNEL, m_creature, 0, CHAT_TYPE_TEXT_EMOTE);
                        SetEscortPaused(true);
                        Event_Timer = m_bBookRead ? 1000 : 30000;
                        break;
                    case 5:
                        if (!m_bBookRead)
                        {
                            // timed out waiting for book to be read
                            ResetEscort();
                            return;
                        }

                        DoScriptText(SAY_POST_READ, m_creature);
                        Event_Timer = 1000;
                        break;
                    case 6:
                        SetEscortPaused(false);
                        break;
                    case 7:
                        m_creature->SetFlag(UNIT_NPC_FLAGS, UNIT_NPC_FLAG_QUESTGIVER | UNIT_NPC_FLAG_GOSSIP);

                        if (Player* player = GetPlayerForEscort())
                        {
                            if (player->GetQuestStatus(QUEST_SCEPTER) == QUEST_STATUS_INCOMPLETE)
                            {
                                player->AreaExploredOrEventHappens(QUEST_SCEPTER);
                                player->PrepareGossipMenu(m_creature, m_creature->GetCreatureInfo()->gossip_menu_id);
                                player->SendPreparedGossip(m_creature);
                            }
                        }
                        break;
                }
                m_uiPhase++;
            }
            else
                Event_Timer -= uiDiff;
        }

        if (!m_creature->SelectHostileTarget() || !m_creature->GetVictim())
            return;

        DoMeleeAttackIfReady();
    }
};

bool GOHello_go_book_celebras(Player* pPlayer, GameObject* pGo)
{
    if (pPlayer->GetQuestStatus(QUEST_SCEPTER) == QUEST_STATUS_INCOMPLETE)
    {
        pPlayer->Say("Shal myrinan ishnu daldorah...", 0);
        pGo->Delete();

        std::list<Creature*> celebrasList;
        GetCreatureListWithEntryInGrid(celebrasList, pPlayer, NPC_CELEBRAS_REDEEMED, 40.0f);
        for (const auto& it : celebrasList)
        {
            if (celebrasSpiritAI* pcelebrasSpirit = dynamic_cast<celebrasSpiritAI*>(it->AI()))
                pcelebrasSpirit->BookRead();
        }
        celebrasList.clear();
    }
    return true;
}

bool QuestAccept_celebras_spirit(Player* pPlayer, Creature* pQuestGiver, Quest const* pQuest)
{
    if (pQuest->GetQuestId() != QUEST_SCEPTER)
        return false;
    if (celebrasSpiritAI* pcelebrasSpirit = dynamic_cast<celebrasSpiritAI*>(pQuestGiver->AI()))
        pcelebrasSpirit->QuestAccepted(pPlayer, pQuest);
    return true;
}


CreatureAI* GetAI_celebras_spirit(Creature* pCreature)
{
    return new celebrasSpiritAI(pCreature);
}

void AddSC_celebras_spirit()
{
    Script *newscript;
    newscript = new Script;
    newscript->Name = "celebras_spirit";
    newscript->GetAI = &GetAI_celebras_spirit;
    newscript->pQuestAcceptNPC = &QuestAccept_celebras_spirit;
    newscript->RegisterSelf();

    newscript = new Script;
    newscript->Name = "go_book_celebras";
    newscript->pGOHello = &GOHello_go_book_celebras;
    newscript->RegisterSelf();
}
