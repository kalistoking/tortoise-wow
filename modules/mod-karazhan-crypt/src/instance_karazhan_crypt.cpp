#include "scriptPCH.h"

namespace mod_karazhan_crypt
{


template <typename Functor>
void DoAfterTime(Player* player, uint32 p_time, Functor&& function)
{
    player->m_Events.AddEvent(new LambdaBasicEvent<Functor>(std::move(function)), player->m_Events.CalculateTime(p_time));
}

struct instance_karazhan_crypt : public ScriptedInstance
{
    explicit instance_karazhan_crypt(Map* p_Map) : ScriptedInstance(p_Map)
    {
        Initialize();
    };

    uint64 hivaxxis_door_guid;
    uint64 alarus_door_guid;

    void Initialize() override   
    {
        hivaxxis_door_guid = 0;
        alarus_door_guid = 0;
    }

    void OnObjectCreate(GameObject* pGo) override
    {
        if (pGo->GetEntry() == 177312) hivaxxis_door_guid = pGo->GetGUID();
        if (pGo->GetEntry() == 2006634) alarus_door_guid = pGo->GetGUID();
    }

    void OnCreatureEnterCombat(Creature* pCreature) override
    {
        if (pCreature->IsAlive() && !pCreature->IsInCombat())
            pCreature->SetInCombatWithZone();

        switch (pCreature->GetEntry())
        {
        case 92935: // Guard Captain Gort
            pCreature->MonsterSay(66105);
            break;
        }        
    }

    void OnCreatureDeath(Creature* boss) override
    {
        switch (boss->GetEntry())
        {
        case 91920:
        {
            GameObject* hivaxxis_door = instance->GetGameObject(hivaxxis_door_guid);
            if (hivaxxis_door && hivaxxis_door->GetGoState() !=  GO_STATE_ACTIVE)
            {
                hivaxxis_door->UseDoorOrButton(10800);
                boss->MonsterTextEmote(66108);
                boss->PlayDirectMusic(6762);
            }
            break;
        }
        case 91928:
        {
            GameObject* alarus_door = instance->GetGameObject(alarus_door_guid);
            if (alarus_door && alarus_door->GetGoState() != GO_STATE_ACTIVE)
            {
                alarus_door->UseDoorOrButton(10800);
                boss->MonsterSay(66106);
                boss->PlayDirectMusic(6762);
            }
            break;
        }
        case 92935: // Guard Captain Gort
        {
            boss->MonsterSay(66107);
            boss->PlayDirectMusic(6762);
            break;
        }
        }
    }
};

InstanceData* GetInstanceData_instance_karazhan_crypt(Map* p_Map) { return new instance_karazhan_crypt(p_Map); }

struct tomb_batAI : public ScriptedAI
{
    tomb_batAI(Creature* c) : ScriptedAI(c) { Reset(); }

    void Reset() 
    {
        m_creature->SetFlag(UNIT_DYNAMIC_FLAGS, UNIT_DYNFLAG_DEAD | UNIT_DYNFLAG_TAPPED);
        m_creature->SetFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_NOT_SELECTABLE);
        m_creature->SetStandState(UNIT_STAND_STATE_DEAD);
    }
    void UpdateAI(const uint32 diff)
    {
        GameObject* bat_event_activated = me->FindNearestGameObject(177301, 30.0f);

        if (bat_event_activated)
        {
            m_creature->RemoveFlag(UNIT_DYNAMIC_FLAGS, UNIT_DYNFLAG_DEAD | UNIT_DYNFLAG_TAPPED);
            m_creature->RemoveFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_NOT_SELECTABLE);
            m_creature->SetStandState(UNIT_STAND_STATE_STAND);

            if (!m_creature->HasFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_NOT_SELECTABLE))
            {
                if (!m_creature->SelectHostileTarget() || !m_creature->GetVictim()) return;
                DoMeleeAttackIfReady();
            }
        }
    }
    void JustDied(Unit*) override 
    {
        m_creature->SetRespawnTime(1800); // 30 minutes
    }
    void JustRespawned() { Reset(); }
};

CreatureAI* GetAI_tomb_bat(Creature* _Creature) { return new tomb_batAI(_Creature); }

bool GOHello_necrotic_rune(Player* pPlayer, GameObject* pGo)
{
    if (!pPlayer->IsInCombat())
    {
        pGo->UseDoorOrButton(10800);
        pPlayer->HandleEmote(EMOTE_ONESHOT_KNEEL);

        Creature* alarus_trigger = pGo->FindNearestCreature(91931, 300.0F);

        switch (pGo->GetEntry())
        {
        case 177302: alarus_trigger->MonsterYell("Those runes hold the remains of heroes of many good deeds, much better than you adventurer types will ever be."); break;
        case 177306: alarus_trigger->MonsterYell("Do my words fall on deaf ears? Or are you just doing this out of spite?"); break;
        case 177308: alarus_trigger->MonsterYell("Is this why you've come here, to defile sacred graves in search of precious baubles?"); break;
        }
    }
    else
    {
        pPlayer->GetSession()->SendNotification("You are in combat.");
        return false;
    }
    return true;
}

struct trigger_summon_alarusAI : public ScriptedAI
{
    trigger_summon_alarusAI(Creature* c) : ScriptedAI(c) { Reset(); }

    void Reset() {}
    void UpdateAI(const uint32 diff)
    {
        GameObject* alarus_spawned = me->FindNearestGameObject(177304, 20.0f);

        if (!alarus_spawned)
        {
            GameObject* necrotic_rune_1 = me->FindNearestGameObject(177302, 300.0f);
            GameObject* necrotic_rune_2 = me->FindNearestGameObject(177305, 300.0f);
            GameObject* necrotic_rune_3 = me->FindNearestGameObject(177306, 300.0f);
            GameObject* necrotic_rune_4 = me->FindNearestGameObject(177307, 300.0f);
            GameObject* necrotic_rune_5 = me->FindNearestGameObject(177308, 300.0f);
            GameObject* necrotic_rune_6 = me->FindNearestGameObject(177309, 300.0f);

            if ((necrotic_rune_1 && necrotic_rune_2 && necrotic_rune_3 && necrotic_rune_4 && necrotic_rune_5 && necrotic_rune_6) &&                
                (necrotic_rune_1->GetGoState() == GO_STATE_ACTIVE) && 
                (necrotic_rune_2->GetGoState() == GO_STATE_ACTIVE) && 
                (necrotic_rune_3->GetGoState() == GO_STATE_ACTIVE) && 
                (necrotic_rune_4->GetGoState() == GO_STATE_ACTIVE) && 
                (necrotic_rune_5->GetGoState() == GO_STATE_ACTIVE) && 
                (necrotic_rune_6->GetGoState() == GO_STATE_ACTIVE))
            {
                Creature* alarus_spawned_npc = me->FindNearestCreature(91928, 100.0f);

                if (!alarus_spawned_npc)
                {
                    Creature* alarus = me->SummonCreature(91928, me->GetPositionX(), me->GetPositionY(), me->GetPositionZ(), me->GetOrientation(), TEMPSUMMON_DEAD_DESPAWN, 300 * IN_MILLISECONDS);
                    me->SummonGameObject(177304, me->GetPositionX(), me->GetPositionY(), me->GetPositionZ(), 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 3600, true);

                    if (alarus)
                        alarus->MonsterYell("It seems words alone aren't enough to deter you. Find me, and meet your untimely end!");
                }           
            }
        }
    }
    void JustRespawned() { Reset(); }
};

CreatureAI* GetAI_trigger_summon_alarus(Creature* _Creature) { return new trigger_summon_alarusAI(_Creature); }

struct skeletal_remainsAI : public ScriptedAI
{
    skeletal_remainsAI(Creature* c) : ScriptedAI(c) { Reset(); }

    void Reset()
    {
        m_creature->SetFlag(UNIT_DYNAMIC_FLAGS, UNIT_DYNFLAG_DEAD | UNIT_DYNFLAG_TAPPED);
        m_creature->SetFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_NOT_SELECTABLE);
        m_creature->SetStandState(UNIT_STAND_STATE_DEAD);
    }
    void UpdateAI(const uint32 diff)
    {
        GameObject* remains_activated = me->FindNearestGameObject(177311, 30.0f);

        if (remains_activated)
        {
            m_creature->RemoveFlag(UNIT_DYNAMIC_FLAGS, UNIT_DYNFLAG_DEAD | UNIT_DYNFLAG_TAPPED);
            m_creature->RemoveFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_NOT_SELECTABLE);
            m_creature->SetStandState(UNIT_STAND_STATE_STAND);

            if (!m_creature->HasFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_NOT_SELECTABLE))
            {
                if (!m_creature->SelectHostileTarget() || !m_creature->GetVictim()) return;
                DoMeleeAttackIfReady();
            }
        }
    }
    void JustDied(Unit*) override
    {
        m_creature->SetRespawnTime(1800); // 30 minutes
    }
    void JustRespawned() { Reset(); }
};

CreatureAI* GetAI_skeletal_remains(Creature* _Creature) { return new skeletal_remainsAI(_Creature); }

struct paupers_walk_door : public GameObjectAI
{
    explicit paupers_walk_door(GameObject* pGo) : GameObjectAI(pGo) {}

    virtual void UpdateAI(uint32 const uiDiff) override
    {
        Creature* alarus = me->FindNearestCreature(91928, 100.0f);

        if (alarus && !alarus->IsAlive())
            me->UseDoorOrButton(10800);
    }
};

GameObjectAI* GetAI_paupers_walk_door(GameObject* Obj) { return new paupers_walk_door(Obj); }

void AddSC_instance_karazhan_crypt()
{
    Script* newscript;

    newscript = new Script;
    newscript->Name = "instance_karazhan_crypt";
    newscript->GetInstanceData = &GetInstanceData_instance_karazhan_crypt;
    newscript->RegisterSelf();

    newscript = new Script;
    newscript->Name = "skeletal_remains";
    newscript->GetAI = &GetAI_skeletal_remains;
    newscript->RegisterSelf();

    newscript = new Script;
    newscript->Name = "trigger_summon_alarus";
    newscript->GetAI = &GetAI_trigger_summon_alarus;
    newscript->RegisterSelf();

    newscript = new Script;
    newscript->Name = "necrotic_rune";
    newscript->pGOHello = &GOHello_necrotic_rune;
    newscript->RegisterSelf();

    newscript = new Script;
    newscript->Name = "tomb_bat";
    newscript->GetAI = &GetAI_tomb_bat;
    newscript->RegisterSelf();
}

} // namespace mod_karazhan_crypt
