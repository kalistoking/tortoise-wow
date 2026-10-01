// The Tablet of Theka and the Ward of Zum'rah, taken out of zulfarrak.cpp: the ward is a totem, which
// gets TotemAI whatever its ai_name, and the tablet explores 2936 while hiding the quest's turn-in there.
// They stay in the core; the rest of zulfarrak.cpp is mod-zulfarrak's and its rows' (trt A37, AM1).
#include "scriptPCH.h"

bool OnGossipHello_go_table_theka(Player* pPlayer, GameObject* pGo)
{
    if (pPlayer->GetQuestStatus(2936) == QUEST_STATUS_INCOMPLETE)
        pPlayer->AreaExploredOrEventHappens(2936);

    pPlayer->SEND_GOSSIP_MENU(1653, pGo->GetGUID());

    return true;
}

struct ward_zumrahAI : public ScriptedAI
{
    ward_zumrahAI(Creature* pCreature) : ScriptedAI(pCreature)
    {
        Reset();
    }

    uint32 m_uiSkeletonTimer;

    void Reset() override
    {
        m_uiSkeletonTimer = 5000;
        m_creature->SetDefaultMovementType(IDLE_MOTION_TYPE);
    }

    void UpdateAI(const uint32 uiDiff) override
    {
        m_creature->SetDefaultMovementType(IDLE_MOTION_TYPE);

        if (m_uiSkeletonTimer < uiDiff)
        {
            if (DoCastSpellIfCan(m_creature, 11088, true) == CAST_OK)
                m_uiSkeletonTimer = 5000;
        }
        else
            m_uiSkeletonTimer -= uiDiff;
    }
};

CreatureAI* GetAI_ward_zumrah(Creature* pCreature)
{
    return new ward_zumrahAI(pCreature);
}

void AddSC_zulfarrak_tablet_ward()
{
    Script *newscript;

    newscript = new Script;
    newscript->Name = "ward_zumrah";
    newscript->GetAI = &GetAI_ward_zumrah;
    newscript->RegisterSelf();

    newscript = new Script;
    newscript->Name = "go_table_theka";
    newscript->pGOHello = &OnGossipHello_go_table_theka;
    newscript->RegisterSelf();
}
