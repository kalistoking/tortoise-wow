// Karazhan Crypt's two trigger objects and its gate, taken out of instance_karazhan_crypt.cpp: a type 5
// object has no rule of its own (no timer, no player near), and the gate refuses an open its lock
// allows before any row could run. They stay in the core; the rest is mod-karazhan-crypt's and its
// rows' (trt A31, AM1).
#include "scriptPCH.h"

template <typename Functor>
void DoAfterTime(Player* player, uint32 p_time, Functor&& function)
{
    player->m_Events.AddEvent(new LambdaBasicEvent<Functor>(std::move(function)), player->m_Events.CalculateTime(p_time));
}

#define KARAZHAN_CRYPT_KEY 51356
#define KARAZHAN_GATE_RESET 1

bool GOHello_karazhan_crypt_gate(Player* pPlayer, GameObject* pGo)
{
    if (pPlayer->HasItemCount(KARAZHAN_CRYPT_KEY, 1))
    {
        pGo->UseDoorOrButton(10);
        pPlayer->HandleEmote(EMOTE_ONESHOT_KNEEL);

        if (GameObjectAI* gAI = pGo->AI())
            gAI->SetData(KARAZHAN_GATE_RESET, 1);
    }
    else
        pPlayer->GetSession()->SendNotification("Requires Karazhan Crypt Key.");

    return true;
}

struct karazhan_crypt_gate : public GameObjectAI
{
    explicit karazhan_crypt_gate(GameObject* pGo) : GameObjectAI(pGo) {}
    uint32 BackTimer = 0;

    virtual void UpdateAI(uint32 const uiDiff) override
    {
        if (BackTimer != 0)
        {
            if (BackTimer < uiDiff)
            {
                BackTimer = 0;
                me->ResetDoorOrButton();
            }
            else
            {
                BackTimer -= uiDiff;
                if (BackTimer == 0)
                {
                    me->ResetDoorOrButton();
                }
            }
        }
    }

    virtual void SetData(uint32 id, uint32 value) override
    {
        if (id == KARAZHAN_GATE_RESET)
            BackTimer = 25 * IN_MILLISECONDS;
        GameObjectAI::SetData(id, value);
    }
};

GameObjectAI* GetAI_karazhan_crypt_gate(GameObject* Obj) { return new karazhan_crypt_gate(Obj); }

struct tomb_bat_event_trigger : public GameObjectAI
{
    explicit tomb_bat_event_trigger(GameObject* pGo) : GameObjectAI(pGo)
    {
        m_uiJustUsedTimer = 1;
        m_uiUpdateTimer = 1000;
    }

    uint32 m_uiJustUsedTimer;
    uint32 m_uiUpdateTimer;

    void UpdateAI(uint32 const uiDiff) override
    {
        if (m_uiUpdateTimer < uiDiff)
        {
            GameObject* bat_event_activated = me->FindNearestGameObject(177301, 10.0f);

            if (!bat_event_activated)
            {
                std::list<Player*> players;
                MaNGOS::AnyPlayerInObjectRangeCheck check(me, 20.0f);
                MaNGOS::PlayerListSearcher<MaNGOS::AnyPlayerInObjectRangeCheck> searcher(players, check);

                Cell::VisitWorldObjects(me, searcher, 20.0f);

                for (Player* pPlayer : players)
                {
                    me->SummonGameObject(177301, me->GetPositionX(), me->GetPositionY(), me->GetPositionZ(), 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 1800, true); // 30 minutes
                    pPlayer->PlayDirectMusic(1171);

                    DoAfterTime(pPlayer, 7 * IN_MILLISECONDS, [player = pPlayer]() {
                        Creature* bat = player->FindNearestCreature(91922, 20.0F);
                        if (!bat)
                            player->SummonCreature(91922, -11063.4F, -1795.69F, 56.65F, 3.1F, TEMPSUMMON_TIMED_OR_CORPSE_DESPAWN, 150 * IN_MILLISECONDS);
                        });
                }
                m_uiUpdateTimer = 2500;
            }
        }
        else
            m_uiUpdateTimer -= uiDiff;
    }
};

GameObjectAI* GetAI_tomb_bat_event_trigger(GameObject* gameobject) { return new tomb_bat_event_trigger(gameobject); }

struct skeletal_remains_trigger : public GameObjectAI
{
    explicit skeletal_remains_trigger(GameObject* pGo) : GameObjectAI(pGo)
    {
        m_uiJustUsedTimer = 1;
        m_uiUpdateTimer = 1000;
    }

    uint32 m_uiJustUsedTimer;
    uint32 m_uiUpdateTimer;

    void UpdateAI(uint32 const uiDiff) override
    {
        if (m_uiUpdateTimer < uiDiff)
        {
            GameObject* remains_activated = me->FindNearestGameObject(177311, 10.0f);

            if (!remains_activated)
            {
                std::list<Player*> players;
                MaNGOS::AnyPlayerInObjectRangeCheck check(me, 15.0f);
                MaNGOS::PlayerListSearcher<MaNGOS::AnyPlayerInObjectRangeCheck> searcher(players, check);

                Cell::VisitWorldObjects(me, searcher, 15.0f);

                for (Player* pPlayer : players)
                {
                    me->SummonGameObject(177311, me->GetPositionX(), me->GetPositionY(), me->GetPositionZ(), 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 1800, true); // 30 minutes
                    pPlayer->PlayDirectMusic(335);

                }
                m_uiUpdateTimer = 2500;
            }
        }
        else
            m_uiUpdateTimer -= uiDiff;
    }
};

GameObjectAI* GetAI_skeletal_remains_trigger(GameObject* gameobject) { return new skeletal_remains_trigger(gameobject); }

void AddSC_karazhan_crypt_triggers()
{
    Script* newscript;

    newscript = new Script;
    newscript->Name = "skeletal_remains_trigger";
    newscript->GOGetAI = &GetAI_skeletal_remains_trigger;
    newscript->RegisterSelf();

    newscript = new Script;
    newscript->Name = "tomb_bat_event_trigger";
    newscript->GOGetAI = &GetAI_tomb_bat_event_trigger;
    newscript->RegisterSelf();

    newscript = new Script;
    newscript->Name = "karazhan_crypt_gate";
    newscript->pGOHello = &GOHello_karazhan_crypt_gate;
    newscript->GOGetAI = &GetAI_karazhan_crypt_gate;
    newscript->RegisterSelf();
}
