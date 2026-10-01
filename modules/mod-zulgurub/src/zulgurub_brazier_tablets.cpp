// The brazier's lightning trigger and the tablets of madness, taken out of instance_zulgurub.cpp: they go to
// mod-zulgurub and their rows, while the instance stays in the core (trt A25 second pass, AM1).
#include "scriptPCH.h"
#include "dungeons/zulgurub/zulgurub.h"

namespace mod_zulgurub
{


#define BOSS_GRILEK                     15082
#define BOSS_HAZZARAH                   15083
#define BOSS_RENATAKI                   15084
#define BOSS_WUSHOOLAY                  15085

struct npc_brazierAI: public ScriptedAI
{
    npc_brazierAI(Creature* pCreature) : ScriptedAI(pCreature)
    {
        Reset();
    }

    uint32 Timer;
    uint32 Var;

    void Reset() override
    {
        Timer = 0;
        Var = 0;
    }

    void UseGo(int Nombre)
    {
        int var = 0;
        while (var < Nombre)
        {
            std::list<GameObject*> GOListe;
            GetGameObjectListWithEntryInGrid(GOListe, m_creature, 180252, 100.0f);
            std::list<GameObject*>::iterator itr = GOListe.begin();
            if (itr == GOListe.end())
                return;

            std::advance(itr, rand() % GOListe.size());
            if (GameObject* GO = *itr)
            {
                GO->Use(m_creature);
                GOListe.erase(itr);
                var++;
            }
        }
    }

    void UpdateAI(const uint32 uiDiff) override
    {
        if (Var > 24)
            m_creature->ForcedDespawn();

        if (Timer < uiDiff)
        {
            if (Var > 3)
                UseGo(4);
            else if (Var < 10)
                UseGo(12);
            else
                UseGo(6);
            Timer = 1000;
            Var++;
            return;
        }
        else Timer -= uiDiff;
    }
};

CreatureAI* GetAI_npc_brazier(Creature* pCreature)
{
    return new npc_brazierAI(pCreature);
}

#define TABLET_GRILEK1			180358
#define TABLET_HAZZARAH1		180364
#define TABLET_RENATAKI1		180365
#define TABLET_WUSHOOLAY1		180393
#define TABLET_GRILEK2			987654
#define TABLET_HAZZARAH2		987655
#define TABLET_RENATAKI2		987656
#define TABLET_WUSHOOLAY2		987657
#define TABLET_ALCHEMIST_SPELL	24266

bool OnGossipHello_go_table_madness(Player* pPlayer, GameObject* pGo)
{
    //Check if the player has the alchemist skill at 300 and if he doesn't know yet Mojo Madness recipe
    if(pPlayer->HasSkill(171) && !pPlayer->HasSpell(24266))
        if(pPlayer->GetSkillValue(171) >= 300)    
            pPlayer->LearnSpell(TABLET_ALCHEMIST_SPELL,false);

    ScriptedInstance* m_pInstance = (ScriptedInstance*)pGo->GetInstanceData();
    if(!m_pInstance)
        return false;

    uint32 randomBoss = m_pInstance->GetData(TYPE_RANDOM_BOSS);
                if (sGameEventMgr.IsActiveEvent(29))
                    randomBoss = BOSS_GRILEK;
                else if (sGameEventMgr.IsActiveEvent(30))
                    randomBoss = BOSS_HAZZARAH;
                else if (sGameEventMgr.IsActiveEvent(31))
                    randomBoss = BOSS_RENATAKI;
                else if (sGameEventMgr.IsActiveEvent(32))
                    randomBoss = BOSS_WUSHOOLAY;


    if(randomBoss < 0 || randomBoss > 16000)
        return false;

    //DEBUG
    //char sMessage[200];
    //sprintf(sMessage, "boss ID=%d",randomBoss);
    //pPlayer->Say(sMessage,0);
		
    switch(pGo->GetEntry())
    {
        case TABLET_GRILEK1:
        case TABLET_GRILEK2:
            if (randomBoss == BOSS_GRILEK)
                pPlayer->SEND_GOSSIP_MENU(7669, pGo->GetGUID());
            else
                pPlayer->SEND_GOSSIP_MENU(7643, pGo->GetGUID());			
            break;
	case TABLET_HAZZARAH1:
	case TABLET_HAZZARAH2:
            if (randomBoss == BOSS_HAZZARAH)
                pPlayer->SEND_GOSSIP_MENU(7675, pGo->GetGUID());
            else
                pPlayer->SEND_GOSSIP_MENU(7670, pGo->GetGUID());			
            break;
	case TABLET_RENATAKI1:
	case TABLET_RENATAKI2:
            if (randomBoss == BOSS_RENATAKI)
                pPlayer->SEND_GOSSIP_MENU(7673, pGo->GetGUID());
            else
                pPlayer->SEND_GOSSIP_MENU(7672, pGo->GetGUID());			
            break;
	case TABLET_WUSHOOLAY1:
	case TABLET_WUSHOOLAY2:
            if (randomBoss == BOSS_WUSHOOLAY)
                pPlayer->SEND_GOSSIP_MENU(7682, pGo->GetGUID());
            else
                pPlayer->SEND_GOSSIP_MENU(7674, pGo->GetGUID());			
            break;
    }
    return true;
}


void AddSC_zulgurub_brazier_tablets()
{
    Script* newscript;

    newscript = new Script;
    newscript->Name = "npc_brazier";
    newscript->GetAI = &GetAI_npc_brazier;
    newscript->RegisterSelf();

    newscript = new Script;
    newscript->Name = "go_table_madness";
    newscript->pGOHello = &OnGossipHello_go_table_madness;
    newscript->RegisterSelf();
}

} // namespace mod_zulgurub
