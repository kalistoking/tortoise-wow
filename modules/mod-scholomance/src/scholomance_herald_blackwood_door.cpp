// The Brazier of the Herald, Lord Blackwood and the Viewing Room door, taken out of instance_scholomance.cpp:
// they go to mod-scholomance and their rows, while the instance stays in the core (trt A23 second pass, AM1).
#include "scriptPCH.h"
#include "dungeons/scholomance/scholomance.h"

namespace mod_scholomance
{


bool GOOpen_brazier_herald(Player* pUser, GameObject *pGo)
{
    if (InstanceData* pInst = pGo->GetInstanceData())
    {
        switch (pInst->GetData(TYPE_KIRTONOS))
        {
            case IN_PROGRESS:
            case DONE:
                return false;
        }

        pInst->SetData(TYPE_KIRTONOS, IN_PROGRESS);
        pGo->PlayDirectSound(SOUND_SCREECH, 0);

        pUser->SummonCreature(NPC_KIRTONOS, 315.028f, 70.53845f, 102.1496f, 0.3859715f, TEMPSUMMON_DEAD_DESPAWN, 900000);
    }

    return true;
}
enum
{
    SPELL_MULTI_SHOT        = 20735,
    SPELL_SHOOT             = 16100,//not used for now
    SPELL_SHIELD_BASH       = 11972
};
struct Locations
{
    float x, y, z;
};
//tourne en rond.
static Locations ronde[] =
{
    {221.356903f, 133.581757f, 109.640160f},
    {221.075699f, 160.426987f, 109.640160f},
    {181.770874f, 159.967178f, 109.604874f},
    {181.937195f, 133.052261f, 109.602188f}
};

struct boss_lordblackwoodAI : public ScriptedAI
{
    boss_lordblackwoodAI(Creature* pCreature) : ScriptedAI(pCreature)
    {
        LastWayPoint = 0;
        Reset();
    }

    uint32 ShieldBash_Timer;
    uint32 MultiShot_Timer;
    uint32 LastWayPoint;

    void Reset() override
    {
        ShieldBash_Timer = 8000;
        MultiShot_Timer = 1000;
        m_creature->GetMotionMaster()->MovePoint(LastWayPoint, ronde[LastWayPoint].x, ronde[LastWayPoint].y, ronde[LastWayPoint].z);
    }

    void MovementInform(uint32 uiType, uint32 uiPointId) override
    {
        if (!m_creature->GetVictim())
        {
            m_creature->SetWalk(true);
            if (uiPointId < 3)
                m_creature->GetMotionMaster()->MovePoint(uiPointId + 1, ronde[uiPointId + 1].x, ronde[uiPointId + 1].y, ronde[uiPointId + 1].z);
            else if (uiPointId == 3)
                m_creature->GetMotionMaster()->MovePoint(0, ronde[0].x, ronde[0].y, ronde[0].z);
        }
        if (uiPointId >= 0 && uiPointId < 4)
            LastWayPoint = uiPointId;
    }

    void UpdateAI(const uint32 diff) override
    {
        if (!m_creature->SelectHostileTarget() || !m_creature->GetVictim())
            return;

        if (!m_creature->CanReachWithMeleeAutoAttack(m_creature->GetVictim()))
        {
            if (MultiShot_Timer < diff)
            {
                if (DoCastSpellIfCan(m_creature->GetVictim(), SPELL_MULTI_SHOT) == CAST_OK)
                    MultiShot_Timer = 2000;
            }
            else
                MultiShot_Timer -= diff;
        }
        if (ShieldBash_Timer < diff)
        {
            if (DoCastSpellIfCan(m_creature->GetVictim(), SPELL_SHIELD_BASH) == CAST_OK)
                ShieldBash_Timer = 8000;
        }
        else
            ShieldBash_Timer -= diff;
        DoMeleeAttackIfReady();
    }
};

CreatureAI* GetAI_boss_lordblackwood(Creature* pCreature)
{
    return new boss_lordblackwoodAI(pCreature);
}

struct go_viewing_room_door : public GameObjectAI
{
    go_viewing_room_door(GameObject* pGo) : GameObjectAI(pGo) {}

    bool OnUse(Unit* user) override
    {
        // Save door state to database
        if (user && user->GetInstanceData())
            user->GetInstanceData()->SetData(TYPE_VIEWING_ROOM_DOOR, DONE);
        return false;
    }
};

GameObjectAI* GOGetAI_go_viewing_room_door(GameObject *pGo)
{
    return new go_viewing_room_door(pGo);
}


void AddSC_scholomance_herald_blackwood_door()
{
    Script* newscript;

    newscript = new Script;
    newscript->Name = "go_brazier_herald";
    newscript->GOOpen = &GOOpen_brazier_herald;
    newscript->RegisterSelf();

    newscript = new Script;
    newscript->Name = "boss_lord_blackwood";
    newscript->GetAI = &GetAI_boss_lordblackwood;
    newscript->RegisterSelf();

    newscript = new Script;
    newscript->Name = "go_viewing_room_door";
    newscript->GOGetAI = &GOGetAI_go_viewing_room_door;
    newscript->RegisterSelf();
}

} // namespace mod_scholomance
