// What rows replace in Blackrock Depths, taken out of blackrock_depths.cpp: the braziers, Kharan's
// gossip, the portrait, the kegs and Hurley, the relic coffer doors and Doomgrip, Argelmach and the
// Shadowforge bridge go to mod-blackrock-depths with the bosses and the arena (trt A12, AM1).
// Grimstone and the Ring of Law, the Grim Guzzler's chain and the jail break stay in the core with
// the instance.
#include "scriptPCH.h"
#include "dungeons/blackrock_depths/blackrock_depths.h"

namespace mod_blackrock_depths
{


/*######
## go_shadowforge_brazier
######*/

bool GOHello_go_shadowforge_brazier(Player* pPlayer, GameObject* pGo)
{
    if (ScriptedInstance* pInstance = (ScriptedInstance*)pGo->GetInstanceData())
    {
        if (pInstance->GetData(TYPE_LYCEUM) == IN_PROGRESS)
            pInstance->SetData(TYPE_LYCEUM, DONE);
        else
            pInstance->SetData(TYPE_LYCEUM, IN_PROGRESS);
    }
    return false;
}

/*######
## npc_kharan_mighthammer
######*/

#define QUEST_4001      4001
#define QUEST_4342      4342

#define GOSSIP_ITEM_KHARAN_1    "I need to know where the princess are, Kharan!"
#define GOSSIP_ITEM_KHARAN_2    "All is not lost, Kharan!"

#define GOSSIP_ITEM_KHARAN_3    "Gor'shak is my friend, you can trust me."
#define GOSSIP_ITEM_KHARAN_4    "Not enough, you need to tell me more."
#define GOSSIP_ITEM_KHARAN_5    "So what happened?"
#define GOSSIP_ITEM_KHARAN_6    "Continue..."
#define GOSSIP_ITEM_KHARAN_7    "So you suspect that someone on the inside was involved? That they were tipped off?"
#define GOSSIP_ITEM_KHARAN_8    "Continue with your story please."
#define GOSSIP_ITEM_KHARAN_9    "Indeed."
#define GOSSIP_ITEM_KHARAN_10   "The door is open, Kharan. You are a free man."

bool GossipHello_npc_kharan_mighthammer(Player* pPlayer, Creature* pCreature)
{
    if (pCreature->IsQuestGiver())
        pPlayer->PrepareQuestMenu(pCreature->GetGUID());

    if (pPlayer->GetQuestStatus(QUEST_4001) == QUEST_STATUS_INCOMPLETE)
        pPlayer->ADD_GOSSIP_ITEM(GOSSIP_ICON_CHAT, GOSSIP_ITEM_KHARAN_1, GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF + 1);

    if (pPlayer->GetQuestStatus(4342) == QUEST_STATUS_INCOMPLETE)
        pPlayer->ADD_GOSSIP_ITEM(GOSSIP_ICON_CHAT, GOSSIP_ITEM_KHARAN_2, GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF + 3);

    if (pPlayer->GetTeam() == HORDE)
        pPlayer->SEND_GOSSIP_MENU(2473, pCreature->GetGUID());
    else
        pPlayer->SEND_GOSSIP_MENU(2474, pCreature->GetGUID());

    return true;
}

bool GossipSelect_npc_kharan_mighthammer(Player* pPlayer, Creature* pCreature, uint32 uiSender, uint32 uiAction)
{
    switch (uiAction)
    {
        case GOSSIP_ACTION_INFO_DEF+1:
            pPlayer->ADD_GOSSIP_ITEM(GOSSIP_ICON_CHAT, GOSSIP_ITEM_KHARAN_3, GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF + 2);
            pPlayer->SEND_GOSSIP_MENU(2475, pCreature->GetGUID());
            break;
        case GOSSIP_ACTION_INFO_DEF+2:
            pPlayer->ADD_GOSSIP_ITEM(GOSSIP_ICON_CHAT, GOSSIP_ITEM_KHARAN_4, GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF + 3);
            pPlayer->SEND_GOSSIP_MENU(2476, pCreature->GetGUID());
            break;

        case GOSSIP_ACTION_INFO_DEF+3:
            pPlayer->ADD_GOSSIP_ITEM(GOSSIP_ICON_CHAT, GOSSIP_ITEM_KHARAN_5, GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF + 4);
            pPlayer->SEND_GOSSIP_MENU(2477, pCreature->GetGUID());
            break;
        case GOSSIP_ACTION_INFO_DEF+4:
            pPlayer->ADD_GOSSIP_ITEM(GOSSIP_ICON_CHAT, GOSSIP_ITEM_KHARAN_6, GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF + 5);
            pPlayer->SEND_GOSSIP_MENU(2478, pCreature->GetGUID());
            break;
        case GOSSIP_ACTION_INFO_DEF+5:
            pPlayer->ADD_GOSSIP_ITEM(GOSSIP_ICON_CHAT, GOSSIP_ITEM_KHARAN_7, GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF + 6);
            pPlayer->SEND_GOSSIP_MENU(2479, pCreature->GetGUID());
            break;
        case GOSSIP_ACTION_INFO_DEF+6:
            pPlayer->ADD_GOSSIP_ITEM(GOSSIP_ICON_CHAT, GOSSIP_ITEM_KHARAN_8, GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF + 7);
            pPlayer->SEND_GOSSIP_MENU(2480, pCreature->GetGUID());
            break;
        case GOSSIP_ACTION_INFO_DEF+7:
            pPlayer->ADD_GOSSIP_ITEM(GOSSIP_ICON_CHAT, GOSSIP_ITEM_KHARAN_9, GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF + 8);
            pPlayer->SEND_GOSSIP_MENU(2481, pCreature->GetGUID());
            break;
        case GOSSIP_ACTION_INFO_DEF+8:
            pPlayer->ADD_GOSSIP_ITEM(GOSSIP_ICON_CHAT, GOSSIP_ITEM_KHARAN_10, GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF + 9);
            pPlayer->SEND_GOSSIP_MENU(2482, pCreature->GetGUID());
            break;
        case GOSSIP_ACTION_INFO_DEF+9:
            pPlayer->CLOSE_GOSSIP_MENU();
            if (pPlayer->GetTeam() == HORDE)
                pPlayer->AreaExploredOrEventHappens(QUEST_4001);
            else
                pPlayer->AreaExploredOrEventHappens(QUEST_4342);
            break;
    }
    return true;
}

/*######
## go_dark_keeper_portrait
######*/

enum
{
    NPC_DARK_KEEPER_VORFALK    = 9437,
    NPC_DARK_KEEPER_BETHEK     = 9438,
    NPC_DARK_KEEPER_UGGEL      = 9439,
    NPC_DARK_KEEPER_ZIMREL     = 9441,
    NPC_DARK_KEEPER_OFGUT      = 9442,
    NPC_DARK_KEEPER_PELVER     = 9443,

    GO_VORFALK                 = 164820,
    GO_BETHEK                  = 164821,
    GO_UGGEL                   = 164822,
    GO_ZIMREL                  = 164823,
    GO_OFGUT                   = 164824,
    GO_PELVER                  = 164825,
};

bool GOHello_go_dark_keeper_portrait(Player* pPlayer, GameObject* pGo)
{
    ScriptedInstance* pInstance = ((ScriptedInstance*)pGo->GetInstanceData());

    if (!pInstance)
        return true;

    if (pInstance->GetData(TYPE_VAULT) != DONE)
    {
        switch (urand(0, 5))
        {
            case 0:
                pPlayer->SummonCreature(NPC_DARK_KEEPER_VORFALK, 815.60f, -168.54f, -49.75f, 5.97f, TEMPSUMMON_DEAD_DESPAWN, 0);
                pPlayer->SummonGameObject(GO_VORFALK, 831.54f, -339.529f, -46.682f, 0.802851f, 0, 0, 0, 0, 0);
                pInstance->SetData(TYPE_VAULT, DONE);
                break;
            case 1:
                pPlayer->SummonCreature(NPC_DARK_KEEPER_BETHEK, 846.66f, -317.18f, -50.29f, 3.90f, TEMPSUMMON_DEAD_DESPAWN, 0);
                pPlayer->SummonGameObject(GO_BETHEK, 831.54f, -339.529f, -46.682f, 0.802851f, 0, 0, 0, 0, 0);
                pInstance->SetData(TYPE_VAULT, DONE);
                break;
            case 2:
                pPlayer->SummonCreature(NPC_DARK_KEEPER_UGGEL, 963.27f, -343.73f, -71.74f, 2.22f, TEMPSUMMON_DEAD_DESPAWN, 0);
                pPlayer->SummonGameObject(GO_UGGEL, 831.54f, -339.529f, -46.682f, 0.802851f, 0, 0, 0, 0, 0);
                pInstance->SetData(TYPE_VAULT, DONE);
                break;
            case 3:
                pPlayer->SummonCreature(NPC_DARK_KEEPER_ZIMREL, 545.49f, -162.49f, -35.46f, 5.86f, TEMPSUMMON_DEAD_DESPAWN, 0);
                pPlayer->SummonGameObject(GO_ZIMREL, 831.54f, -339.529f, -46.682f, 0.802851f, 0, 0, 0, 0, 0);
                pInstance->SetData(TYPE_VAULT, DONE);
                break;
            case 4:
                pPlayer->SummonCreature(NPC_DARK_KEEPER_OFGUT, 681.52f, -11.55f, -60.06f, 1.98f, TEMPSUMMON_DEAD_DESPAWN, 0);
                pPlayer->SummonGameObject(GO_OFGUT, 831.54f, -339.529f, -46.682f, 0.802851f, 0, 0, 0, 0, 0);
                pInstance->SetData(TYPE_VAULT, DONE);
                break;
            case 5:
                pPlayer->SummonCreature(NPC_DARK_KEEPER_PELVER, 803.64f, -248.00f, -43.30f, 2.60f, TEMPSUMMON_DEAD_DESPAWN, 0);
                pPlayer->SummonGameObject(GO_PELVER, 831.54f, -339.529f, -46.682f, 0.802851f, 0, 0, 0, 0, 0);
                pInstance->SetData(TYPE_VAULT, DONE);
                break;
        }
    }
    return false;
}

/*######
## go_thunderbrew_laguer_keg
######*/

enum
{
    NPC_HURLEY             = 9537,
    NPC_HURLEY_CRONY       = 9541,

    YELL_HURLEY_SPAWN      = -1230069,
    SAY_HURLEY_AGGRO       = -1230070,

    SPELL_FLAME_BREATH     = 9573
};

bool GOHello_go_thunderbrew_laguer_keg(Player* pPlayer, GameObject* pGo)
{
    ScriptedInstance* pInstance = ((ScriptedInstance*)pGo->GetInstanceData());

    if (!pInstance)
        return true;

    if (pInstance->GetData(TYPE_THUNDERBREW) == DONE)
        return false;

    if (pInstance->GetData(TYPE_THUNDERBREW) == NOT_STARTED)
        pInstance->SetData(TYPE_THUNDERBREW, IN_PROGRESS);

    if (pInstance->GetData(TYPE_THUNDERBREW) == DONE)
    {
        // Summon Hurley Blackbreath
        Creature* pHurley = pPlayer->SummonCreature(NPC_HURLEY,
                                                    856.087f, -149.747f, -49.672f, 0.059f, TEMPSUMMON_TIMED_OR_DEAD_DESPAWN, 300000);
        if (!pHurley)
            return true;

        DoScriptText(YELL_HURLEY_SPAWN, pHurley);
        pHurley->SetWalk(false);
        pHurley->GetMotionMaster()->MovePoint(0, 886.652f, -152.042f, -49.76f);

        // Summon cronies around Hurley
        for (uint8 i = 0; i < 4; ++i)
        {
            float fX, fY, fZ;
            pPlayer->GetRandomPoint(856.087f, -149.747f, -49.672f, 2.0f, fX, fY, fZ);
            if (Creature* pSummoned = pPlayer->SummonCreature(NPC_HURLEY_CRONY, fX, fY, fZ, 0.059f, TEMPSUMMON_DEAD_DESPAWN, 0))
            {
                pSummoned->GetMotionMaster()->MoveFollow(pHurley, 2.0f, 0);
            }
        }
    }

    return false;
}


/*######
## npc_hurley_blackbreath
######*/

enum { SPELL_DRUNKEN_RAGE = 14872 };

struct npc_hurley_blackbreathAI : public ScriptedAI
{
    npc_hurley_blackbreathAI(Creature* pCreature) : ScriptedAI(pCreature)
    {
        m_pInstance = (ScriptedInstance*)pCreature->GetInstanceData();
        Reset();
    }

    ScriptedInstance* m_pInstance;

    uint32 uiFlameBreathTimer;
    uint32 m_uiEventTimer;
    bool   bIsEnraged;

    void Reset() override
    {
        uiFlameBreathTimer = 5000;
        bIsEnraged = false;
    }

    void MovementInform(uint32 uiType, uint32 uiPointId) override
    {
        if (uiType != POINT_MOTION_TYPE)
            return;

        switch (uiPointId)
        {
            case 0:
                m_creature->GetMotionMaster()->MovePoint(1, 902.31f, -140.33f, -49.75f);
                break;
            case 1:
                m_creature->GetMotionMaster()->MovePoint(2, 910.31f, -156.713f, -49.759f);
                break;
            case 2:
                m_creature->GetMotionMaster()->MoveTargetedHome();
                break;
        }
    }

    void Aggro(Unit* pWho) override
    {
        DoScriptText(SAY_HURLEY_AGGRO, m_creature);
    }

    void UpdateAI(uint32 const uiDiff) override
    {
        if (!m_creature->SelectHostileTarget() || !m_creature->GetVictim())
            return;

        if (uiFlameBreathTimer < uiDiff)
        {
            if (DoCastSpellIfCan(m_creature->GetVictim(), SPELL_FLAME_BREATH) == CAST_OK)
                uiFlameBreathTimer = urand(8000, 12000);
        }
        else
            uiFlameBreathTimer -= uiDiff;

        if (m_creature->GetHealthPercent() <= 30.0f && !bIsEnraged)
        {
            if (DoCastSpellIfCan(m_creature, SPELL_DRUNKEN_RAGE) == CAST_OK)
                bIsEnraged = true;
        }

        DoMeleeAttackIfReady();
    }
};

CreatureAI* GetAI_npc_hurley_blackbreath(Creature* pCreature)
{
    return new npc_hurley_blackbreathAI(pCreature);
}

/*######
## go_relic_coffer_door
######*/

enum
{
    RUINEPOIGNE_ENTRY    = 9476,
};

bool GOHello_go_relic_coffer_door(Player* pPlayer, GameObject* pGo)
{
    ScriptedInstance* pInstance = ((ScriptedInstance*)pGo->GetInstanceData());

    if (!pInstance)
        return true;

    if (pInstance->GetData(TYPE_RELIC_COFFER) != IN_PROGRESS || pInstance->GetData(TYPE_RELIC_COFFER) != DONE)
        pInstance->SetData(TYPE_RELIC_COFFER, IN_PROGRESS);

    pInstance->SetData(TYPE_RELIC_COFFER, SPECIAL);

    if (pInstance->GetData(TYPE_RELIC_COFFER) == DONE)
    {
        if (Creature* pCreature = pPlayer->SummonCreature(RUINEPOIGNE_ENTRY,
                                                          819.45f, -348.96f, -50.49f, 0.35f, TEMPSUMMON_TIMED_OR_DEAD_DESPAWN, 300000))
        {
            // pCreature->MonsterYell("Ne les laissez pas s'emparer du Coeur de la montagne!!", 0, pPlayer);
            pCreature->MonsterYell("Don't let them take the moutain hearth!", 0, pPlayer);
            // pCreature->MonsterYell(NOST_TEXT(153), 0, pPlayer); // seems to be custom
            pCreature->AI()->AttackStart(pPlayer);
        }

    }

    return false;
}

/*######
## npc_watchman_doomgrip
######*/

#define SPELL_BOIRE_LA_POTION_DE_SOINS    15504
#define SPELL_FRACASSER_ARMURE    11971
#define NPC_WARBRINGER_CONSTRUCT    8905

struct npc_watchman_doomgripAI : public ScriptedAI
{
    npc_watchman_doomgripAI(Creature* pCreature) : ScriptedAI(pCreature)
    {
        m_pInstance = (ScriptedInstance*)pCreature->GetInstanceData();
        Reset();
    }

    ScriptedInstance* m_pInstance;

    uint32 BoireLaPotionDeSoins_Timer;
    uint32 FracasserArmure_Timer;

    void JustDied(Unit* pKiller) override
    {
        if (m_pInstance)
            m_pInstance->SetData(TYPE_DOOMGRIP, DONE);
    }

    void Reset() override
    {
        BoireLaPotionDeSoins_Timer = 0;
        FracasserArmure_Timer = 1000;
    }

    void Aggro(Unit* pWho) override
    {
        std::list<Creature*> lGolems;
        GetCreatureListWithEntryInGrid(lGolems, m_creature, NPC_WARBRINGER_CONSTRUCT, 20.0f);
        if (!lGolems.empty())
        {
            for (const auto& pGolem : lGolems)
            {
                if (pGolem->IsAlive())
                {
                    pGolem->RemoveAurasDueToSpell(10255);
                    pGolem->RemoveFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_NOT_SELECTABLE | UNIT_FLAG_SPAWNING | UNIT_FLAG_IMMUNE_TO_NPC);
                    if (pWho)
                        pGolem->AI()->AttackStart(pWho);
                }
            }
        }
    }

    void UpdateAI(uint32 const diff) override
    {
        if (!m_creature->SelectHostileTarget() || !m_creature->GetVictim())
            return;

        //BoireLaPotionDeSoins_Timer
        if (m_creature->GetHealthPercent() < 51.0f)
        {
            if (BoireLaPotionDeSoins_Timer < diff)
            {
                DoCastSpellIfCan(m_creature->GetVictim(), SPELL_BOIRE_LA_POTION_DE_SOINS);
                BoireLaPotionDeSoins_Timer = 15000;
            }
            else BoireLaPotionDeSoins_Timer -= diff;
        }

        //FracasserArmure_Timer
        if (FracasserArmure_Timer < diff)
        {
            DoCastSpellIfCan(m_creature->GetVictim(), SPELL_FRACASSER_ARMURE);
            FracasserArmure_Timer = 10000;
        }
        else FracasserArmure_Timer -= diff;

        DoMeleeAttackIfReady();
    }
};

CreatureAI* GetAI_npc_watchman_doomgrip(Creature* pCreature)
{
    return new npc_watchman_doomgripAI(pCreature);
}

/*######
## npc_golem_lord_argelmach
######*/

#define SPELL_BOUCLIER_DE_FOUDRE    15507
#define SPELL_CHAINE_D_ECLAIRES    15305
#define SPELL_HORION    15605

struct npc_golem_lord_argelmachAI : public ScriptedAI
{
    npc_golem_lord_argelmachAI(Creature* pCreature) : ScriptedAI(pCreature)
    {
        m_pInstance = (ScriptedInstance*)pCreature->GetInstanceData();
        Reset();
    }

    ScriptedInstance* m_pInstance;

    uint32 BouclierDeFoudre_Timer;
    uint32 ChaineDEclaires_Timer;
    uint32 Horion_Timer;

    void Aggro(Unit* pWho) override
    {
        m_creature->GetMotionMaster()->MovePoint(0, 846.801025f, 16.280600f, -53.639500f);
        //m_creature->MonsterYell("Golems, votre Seigneur a besoin de vous!", 0, pWho);
        //m_creature->MonsterYell(NOST_TEXT(155), 0, pWho); // seems to be custom

        if (m_pInstance)
            m_pInstance->SetData(DATA_ARGELMACH_AGGRO, IN_PROGRESS);
    }

    void JustDied(Unit* pKiller) override
    {
        if (m_pInstance)
            m_pInstance->SetData(DATA_ARGELMACH_AGGRO, DONE);
    }

    void Reset() override
    {
        BouclierDeFoudre_Timer = 0;
        ChaineDEclaires_Timer = 5000;
        Horion_Timer = 2000;
    }

    void UpdateAI(uint32 const diff) override
    {
        if (!m_creature->SelectHostileTarget() || !m_creature->GetVictim())
            return;

        //BouclierDeFoudre_Timer
        if (BouclierDeFoudre_Timer < diff)
        {
            if (!m_creature->HasAura(SPELL_BOUCLIER_DE_FOUDRE))
                if (DoCastSpellIfCan(m_creature, SPELL_BOUCLIER_DE_FOUDRE) == CAST_OK)
                    BouclierDeFoudre_Timer = 15000;
        }
        else BouclierDeFoudre_Timer -= diff;

        //ChaineDEclaires_Timer
        if (ChaineDEclaires_Timer < diff)
        {
            if (DoCastSpellIfCan(m_creature->GetVictim(), SPELL_CHAINE_D_ECLAIRES) == CAST_OK)
                ChaineDEclaires_Timer = 14000;
        }
        else ChaineDEclaires_Timer -= diff;

        //Horion_Timer
        if (Horion_Timer < diff)
        {
            if (DoCastSpellIfCan(m_creature->GetVictim(), SPELL_HORION) == CAST_OK)
                Horion_Timer = 6000;
        }
        else Horion_Timer -= diff;

        DoMeleeAttackIfReady();
    }
};

CreatureAI* GetAI_npc_golem_lord_argelmach(Creature* pCreature)
{
    return new npc_golem_lord_argelmachAI(pCreature);
}

/*######
## at_shadowforge_bridge
######*/

static float const aGuardSpawnPositions[2][4] =
        {
                {642.3660f, -274.5155f, -43.10918f, 0.4712389f},                // First guard spawn position
                {740.1137f, -283.3448f, -42.75082f, 2.8623400f}                 // Second guard spawn position
        };

enum
{
    NPC_ANVILRAGE_GUARDMAN             = 8891,
    SAY_GUARD_AGGRO                    = -1230043
};

// When players cross the shadowforge bridge for the first time, two guards spawn and attack.
bool AreaTrigger_at_shadowforge_bridge(Player* pPlayer, AreaTriggerEntry const* pAt)
{
    if (ScriptedInstance* pInstance = (ScriptedInstance*)pPlayer->GetInstanceData())
    {
        if (pPlayer->IsGameMaster() || !pPlayer->IsAlive() || pInstance->GetData(TYPE_BRIDGE) == DONE)
            return false;

        if (Creature* pMasterGuard = pPlayer->SummonCreature(NPC_ANVILRAGE_GUARDMAN, aGuardSpawnPositions[0][0], aGuardSpawnPositions[0][1], aGuardSpawnPositions[0][2], aGuardSpawnPositions[0][3], TEMPSUMMON_DEAD_DESPAWN, 0))
        {
            pMasterGuard->SetWalk(false);
            pMasterGuard->GetMotionMaster()->MoveWaypoint();
            DoScriptText(SAY_GUARD_AGGRO, pMasterGuard);
            float fX, fY, fZ;
            pPlayer->GetContactPoint(pMasterGuard, fX, fY, fZ);
            pMasterGuard->GetMotionMaster()->MovePoint(1,fX, fY, fZ);

            if (Creature* pSlaveGuard = pPlayer->SummonCreature(NPC_ANVILRAGE_GUARDMAN, aGuardSpawnPositions[1][0], aGuardSpawnPositions[1][1], aGuardSpawnPositions[1][2], aGuardSpawnPositions[1][3], TEMPSUMMON_DEAD_DESPAWN, 0))
            {
                pSlaveGuard->GetMotionMaster()->MoveFollow(pMasterGuard, 2.0f, 0);
            }
        }
        pInstance->SetData(TYPE_BRIDGE, DONE);
    }
    return false;
}


void AddSC_blackrock_depths_objects()
{
    Script* newscript;

    newscript = new Script;
    newscript->Name = "go_shadowforge_brazier";
    newscript->pGOHello = &GOHello_go_shadowforge_brazier;
    newscript->RegisterSelf();

    newscript = new Script;
    newscript->Name = "npc_kharan_mighthammer";
    newscript->pGossipHello =  &GossipHello_npc_kharan_mighthammer;
    newscript->pGossipSelect = &GossipSelect_npc_kharan_mighthammer;
    newscript->RegisterSelf();

    newscript = new Script;
    newscript->Name = "go_dark_keeper_portrait";
    newscript->pGOHello = &GOHello_go_dark_keeper_portrait;
    newscript->RegisterSelf();

    newscript = new Script;
    newscript->Name = "go_thunderbrew_laguer_keg";
    newscript->pGOHello = &GOHello_go_thunderbrew_laguer_keg;
    newscript->RegisterSelf();

    newscript = new Script;
    newscript->Name = "npc_hurley_blackbreath";
    newscript->GetAI = &GetAI_npc_hurley_blackbreath;
    newscript->RegisterSelf();

    newscript = new Script;
    newscript->Name = "go_relic_coffer_door";
    newscript->pGOHello = &GOHello_go_relic_coffer_door;
    newscript->RegisterSelf();

    newscript = new Script;
    newscript->Name = "npc_watchman_doomgrip";
    newscript->GetAI = &GetAI_npc_watchman_doomgrip;
    newscript->RegisterSelf();

    newscript = new Script;
    newscript->Name = "npc_golem_lord_argelmach";
    newscript->GetAI = &GetAI_npc_golem_lord_argelmach;
    newscript->RegisterSelf();

    newscript = new Script;
    newscript->Name = "at_shadowforge_bridge";
    newscript->pAreaTrigger = &AreaTrigger_at_shadowforge_bridge;
    newscript->RegisterSelf();
}

} // namespace mod_blackrock_depths
