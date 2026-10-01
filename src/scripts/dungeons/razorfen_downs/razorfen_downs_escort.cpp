// Belnistrasz's escort and the Idol ritual, taken out of razorfen_downs.cpp: an escort quest whose
// failure reads the escorting group stays in the core while the rest of the dungeon is
// mod-razorfen-downs's and its rows (trt A35, AM1).
#include "scriptPCH.h"
#include "razorfen_downs.h"

enum
{
    QUEST_EXTINGUISHING_THE_IDOL = 3525,
    SAY_BELNISTRASZ_READY = -1129005,
    SAY_BELNISTRASZ_START_RIT = -1129006,
    SAY_BELNISTRASZ_AGGRO_1 = -1129007,
    SAY_BELNISTRASZ_AGGRO_2 = -1129008,
    SAY_BELNISTRASZ_3_MIN = -1129009,
    SAY_BELNISTRASZ_2_MIN = -1129010,
    SAY_BELNISTRASZ_1_MIN = -1129011,
    SAY_BELNISTRASZ_FINISH = -1129012,

    NPC_IDOL_ROOM_SPAWNER = 8611,
    NPC_WITHERED_BATTLE_BOAR = 7333,
    NPC_WITHERED_QUILGUARD = 7329,
    NPC_DEATHS_HEAD_GEOMANCER = 7335,
    NPC_PLAGUEMAW_THE_ROTTING = 7356,

    GO_BELNISTRASZ_BRAZIER = 152097,
    GO_IDOL_OVEN_FIRE = 151951,
    GO_IDOL_MOUTH_FIRE = 151973,

    SPELL_ARCANE_INTELLECT = 13326, // use this somewhere (he has it as default)
    SPELL_FIREBALL = 9053,
    SPELL_FROST_NOVA = 11831,
    SPELL_IDOL_SHUTDOWN = 12774,

    // summon spells only exist in 1.x
    //SPELL_SUMMON_1 = 12694, // NPC_WITHERED_BATTLE_BOAR
    //SPELL_SUMMON_2 = 14802, // NPC_DEATHS_HEAD_GEOMANCER
    //SPELL_SUMMON_3 = 14801, // NPC_WITHERED_QUILGUARD
};

static float m_fSpawnerCoord[3][4] =
{
    {2582.79f, 954.392f, 52.4821f, 3.78736f},
    {2569.42f, 956.380f, 52.2732f, 5.42797f},
    {2570.62f, 942.393f, 53.7433f, 0.71558f}
};

struct npc_belnistraszAI : public npc_escortAI
{
    npc_belnistraszAI(Creature* pCreature) : npc_escortAI(pCreature)
    {
        pInstance = (ScriptedInstance*)pCreature->GetInstanceData();
        m_uiRitualPhase = 0;
        m_uiRitualTimer = 1000;
        m_bAggro = false;
        Reset();
    }

    ScriptedInstance* pInstance;
    uint8 m_uiRitualPhase;
    uint32 m_uiRitualTimer;
    bool m_bAggro;
    uint32 m_uiFireballTimer;
    uint32 m_uiFrostNovaTimer;
    uint32 m_uiRegenTimer;

    void Reset() override
    {
        m_uiFireballTimer = 1000;
        m_uiFrostNovaTimer = 6000;
        m_uiRegenTimer = 5000;
    }

    void AttackedBy(Unit* pAttacker) override
    {
        if (HasEscortState(STATE_ESCORT_PAUSED))
        {
            if (!m_bAggro)
            {
                DoScriptText(urand(0, 1) ? SAY_BELNISTRASZ_AGGRO_1 : SAY_BELNISTRASZ_AGGRO_2, m_creature, pAttacker);
                m_bAggro = true;
            }
            return;
        }
        ScriptedAI::AttackedBy(pAttacker);
    }

    void AttackStart(Unit* pWho) override
    {
        if (HasEscortState(STATE_ESCORT_PAUSED) && (m_uiRitualPhase > 0))
            return;

        npc_escortAI::AttackStart(pWho);
    }

    void SpawnerSummon(Creature* pSummoner)
    {
        Creature * pCreature = nullptr;
        if (m_uiRitualPhase > 7)
        {
            if (pCreature = pSummoner->SummonCreature(NPC_PLAGUEMAW_THE_ROTTING, pSummoner->GetPositionX(), pSummoner->GetPositionY(), pSummoner->GetPositionZ(), pSummoner->GetOrientation(), TEMPSUMMON_TIMED_DESPAWN_OUT_OF_COMBAT, 60000))
                pCreature->SetRespawnDelay(600000);
            return;
        }

        for (int i = 0; i < 4; ++i)
        {
            uint32 uiEntry = 0;
            // ref TARGET_RANDOM_CIRCUMFERENCE_POINT
            float angle = 2.0f * M_PI_F * rand_norm_f();
            float fX, fZ, fY;
            pSummoner->GetClosePoint(fX, fY, fZ, 0.0f, 2.0f, angle);
            switch (i)
            {
                case 0:
                case 1:
                    uiEntry = NPC_WITHERED_BATTLE_BOAR;
                    break;
                case 2:
                    uiEntry = NPC_WITHERED_QUILGUARD;
                    break;
                case 3:
                    uiEntry = NPC_DEATHS_HEAD_GEOMANCER;
                    break;
            }
            if (pCreature = pSummoner->SummonCreature(uiEntry, fX, fY, fZ, 0.0f, TEMPSUMMON_TIMED_DESPAWN_OUT_OF_COMBAT, 60000))
            {
                pCreature->SetRespawnDelay(600000);
                if (Player* pPlayer = pCreature->FindNearestHostilePlayer(15.0f))
                    pCreature->AddThreat(pPlayer, 100.0f);
            }
        }
    }

    void JustSummoned(Creature* pSummoned) override
    {
        SpawnerSummon(pSummoned);
    }

    void DoSummonRandom()
    {
        uint32 type = urand(0, 2);
        if (Creature* pSpawner = m_creature->SummonCreature(NPC_IDOL_ROOM_SPAWNER, m_fSpawnerCoord[type][0], m_fSpawnerCoord[type][1], m_fSpawnerCoord[type][2], m_fSpawnerCoord[type][3], TEMPSUMMON_TIMED_DESPAWN, 10000))
            pSpawner->SetRespawnDelay(600000);
    }

    void WaypointReached(uint32 uiPointId) override
    {
        if (uiPointId == 24)
        {
            DoScriptText(SAY_BELNISTRASZ_START_RIT, m_creature);
            SetEscortPaused(true);
        }
    }

    void UpdateEscortAI(const uint32 uiDiff) override
    {
        if (m_uiRegenTimer < uiDiff)
        {
            if (m_creature->GetHealth() < m_creature->GetMaxHealth())
                m_creature->SetHealth(m_creature->GetHealth() + std::min(m_creature->GetMaxHealth() - m_creature->GetHealth(), 100u));
            m_uiRegenTimer = 5000;
        }
        else
            m_uiRegenTimer -= uiDiff;

        if (HasEscortState(STATE_ESCORT_PAUSED))
        {
            if (m_uiRitualTimer < uiDiff)
            {
                switch (m_uiRitualPhase)
                {
                    case 0:
                        SetCombatMovement(false);
                        DoCastSpellIfCan(m_creature, SPELL_IDOL_SHUTDOWN);
                        m_uiRitualTimer = 1000;
                        break;
                    case 1:
                        DoSummonRandom();
                        m_uiRitualTimer = 39000;
                        break;
                    case 2:
                        DoSummonRandom();
                        m_uiRitualTimer = 20000;
                        break;
                    case 3:
                        DoScriptText(SAY_BELNISTRASZ_3_MIN, m_creature, m_creature);
                        m_uiRitualTimer = 20000;
                        break;
                    case 4:
                        DoSummonRandom();
                        m_uiRitualTimer = 40000;
                        break;
                    case 5:
                        DoSummonRandom();
                        DoScriptText(SAY_BELNISTRASZ_2_MIN, m_creature, m_creature);
                        m_uiRitualTimer = 40000;
                        break;
                    case 6:
                        DoSummonRandom();
                        m_uiRitualTimer = 20000;
                        break;
                    case 7:
                        DoScriptText(SAY_BELNISTRASZ_1_MIN, m_creature, m_creature);
                        m_uiRitualTimer = 40000;
                        break;
                    case 8:
                        DoSummonRandom();
                        m_uiRitualTimer = 20000;
                        break;
                    case 9:
                        DoScriptText(SAY_BELNISTRASZ_FINISH, m_creature, m_creature);
                        m_uiRitualTimer = 3000;
                        break;
                    case 10:
                    {
                        if (Player* pPlayer = GetPlayerForEscort())
                        {
                            pPlayer->GroupEventHappens(QUEST_EXTINGUISHING_THE_IDOL, m_creature);
                        }
                        m_creature->RemoveAurasDueToSpell(SPELL_IDOL_SHUTDOWN);
                        m_creature->SummonGameObject(GO_BELNISTRASZ_BRAZIER, 2577.196f, 947.0781f, 53.16757f, 2.356195f, 0, 0, 0.9238796f, 0.3826832f, 3600);
                        if (GameObject* pGoOvenFire = GetClosestGameObjectWithEntry(m_creature, GO_IDOL_OVEN_FIRE, 50))
                            pGoOvenFire->SetLootState(GO_JUST_DEACTIVATED);
                        if (GameObject* pGoMouthFire = GetClosestGameObjectWithEntry(m_creature, GO_IDOL_MOUTH_FIRE, 50))
                            pGoMouthFire->SetLootState(GO_JUST_DEACTIVATED);
                        // The cup fires put out here, not through the instance (trt A35): the
                        // instance script is rows now, and the generic store only keeps the value.
                        std::list<GameObject*> cupFires;
                        GetGameObjectListWithEntryInGrid(cupFires, m_creature, GO_IDOL_CUP_FIRE, 50.0f);
                        for (GameObject* pCupFire : cupFires)
                            pCupFire->SetLootState(GO_JUST_DEACTIVATED);
                        SetEscortPaused(false);
                        break;
                    }
                }
                ++m_uiRitualPhase;
            }
            else
                m_uiRitualTimer -= uiDiff;
            return;
        }

        if (!m_creature->SelectHostileTarget() || !m_creature->GetVictim())
            return;

        if (m_uiFireballTimer < uiDiff)
        {
            DoCastSpellIfCan(m_creature->GetVictim(), SPELL_FIREBALL);
            m_uiFireballTimer = urand(2000, 3000);
        }
        else
            m_uiFireballTimer -= uiDiff;

        if (m_uiFrostNovaTimer < uiDiff)
        {
            DoCastSpellIfCan(m_creature->GetVictim(), SPELL_FROST_NOVA);
            m_uiFrostNovaTimer = urand(10000, 15000);
        }
        else
            m_uiFrostNovaTimer -= uiDiff;

        if (!HasEscortState(STATE_ESCORT_PAUSED))
            DoMeleeAttackIfReady();
    }

};

CreatureAI* GetAI_npc_belnistrasz(Creature* pCreature)
{
    return new npc_belnistraszAI(pCreature);
}

bool QuestAccept_npc_belnistrasz(Player* pPlayer, Creature* pCreature, const Quest* pQuest)
{
    if (pQuest->GetQuestId() == QUEST_EXTINGUISHING_THE_IDOL)
    {
        if (npc_belnistraszAI* pEscortAI = dynamic_cast<npc_belnistraszAI*>(pCreature->AI()))
        {
            pEscortAI->Start(false, pPlayer->GetGUID(), pQuest);
            DoScriptText(SAY_BELNISTRASZ_READY, pCreature, pPlayer);
            pCreature->SetFactionTemplateId(FACTION_ESCORT_N_NEUTRAL_ACTIVE);
        }
    }
    return true;
}

void AddSC_razorfen_downs_escort()
{
    Script* newscript;

    newscript = new Script;
    newscript->Name = "npc_belnistrasz";
    newscript->GetAI = &GetAI_npc_belnistrasz;
    newscript->pQuestAcceptNPC = &QuestAccept_npc_belnistrasz;
    newscript->RegisterSelf();
}
