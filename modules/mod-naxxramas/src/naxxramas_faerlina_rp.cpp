// Faerlina's worshippers at prayer, taken out of boss_faerlina.cpp: they go to mod-naxxramas and its rows,
// while Faerlina and her spell script stay in the core (trt A30, AM1).
#include "scriptPCH.h"
#include "dungeons/naxxramas/naxxramas.h"

namespace mod_naxxramas
{


enum
{
    SAY_PULL                    = -1533010, // slay them in the masters name
    SAY_ENRAGE1                 = -1533011, // you cannot hide from me!
    SAY_ENRAGE2                 = -1533012, // kneel before me, worm!
    SAY_ENRAGE3                 = -1533013, // Run while you can!
    SAY_SLAY1                   = -1533014, // You have failed!
    SAY_SLAY2                   = -1533015, // Pathethic Wretch
    SAY_DEATH                   = -1533016, // the master... will avenge me!

    //SOUND_RANDOM_AGGRO          = 8955,   //soundId containing the 4 aggro sounds, we not using this

    SPELL_POSIONBOLT_VOLLEY     = 28796,
    SPELL_ENRAGE                = 28798, 

    SPELL_RAINOFFIRE            = 28794,    //Not sure if targeted AoEs work if casted directly upon a pPlayer

    SPELL_WIDOWS_EMBRACE        = 28732,    // Used by worshippers. ToDo: Spell does NOT add the attackspeed reduction, or is it just castspeed?

    MOB_FOLLOWER                = 16505,    // TODO: should aoe silence (small range, 8-10yd)
    MOB_WORSHIPPER              = 16506
};


/*
https://www.youtube.com/watch?v=pVjB7pCX3XM
https://www.youtube.com/watch?v=iTUc8xUeLgw
^ Around 7-10sec cooldown. Times she's not casting it for 30+sec she is silenced by worshipper sacrifice.
  Might be fixed 8sec cast, but slightly delayed sometimes due to rain of fire or other reasons.
*/
static uint32 POSIONBOLT_VOLLEY_CD() { return urand(10000, 12000); }
static uint32 const INITIAL_POISONBOLT_VOLLEY_CD = 8000;

/*
https://www.youtube.com/watch?v=pVjB7pCX3XM
https://www.youtube.com/watch?v=iTUc8xUeLgw
^ in both videos, happens somewhere between 8 and 20 seconds, though mostly between 8 and 12.
  possibly a rain we dont see when it happens after 20sec

  Initial cd seems to be around 16sec
*/
static uint32 RAINOFFIRE_CD() { return urand(8000, 12000); }
static uint32 const RAINOFFIRE_INITIAL_CD = 16000;

static const float ADD_DESPAWN_TIME = 20000;
static const float followerPos[2][4] =
{
    { 3359.75f, -3621.77f, 261.18f, 4.54f },
    {3346.29f, -3619.32f, 261.18f, 4.61f }
};
static const float worshipPos[4][4] =
{
    {3350.61f, -3619.74f, 261.18f, 4.65f},
    {3341.36f, -3619.35f, 261.18f, 4.68f},
    {3356.69f, -3621.17f, 261.18f, 4.38f},
    {3364.08f, -3622.85f, 261.18f, 4.35f}
};

struct mob_faerlina_rp : public ScriptedAI
{
    enum eEvents {
        EVENT_KNEEL = 1,
        EVENT_CAST,
        EVENT_STAND,
        EVENT_UNAURA
    };
    
    EventMap events;

    mob_faerlina_rp(Creature* pCreature) : ScriptedAI(pCreature)
    {
        Reset();
    }

    void Reset() override
    {
        events.Reset();
        events.ScheduleEvent(EVENT_KNEEL, Seconds(urand(5, 10)));
    }
    
    std::list<Creature*> getGroup()
    {
        std::list<Creature*> creatures;
        GetCreatureListWithEntryInGrid(creatures, m_creature, { NPC_NaxxramasAcolyte, NPC_NaxxramasCultist }, 11.0f);
        return creatures;
    }
    
    void UpdateAI(const uint32 diff) override
    {
        events.Update(diff);
        while (uint32 eventId = events.ExecuteEvent())
        {
            std::list<Creature*> creatures = getGroup();
            if (creatures.empty())
            {
                Reset();
                break;
            }
            if ((*creatures.begin())->IsInCombat())
            {
                Reset();
                break;
            }

            for (auto it = creatures.begin(); it != creatures.end();)
            {
                if ((*it)->IsDead())
                    it = creatures.erase(it);
                else
                    ++it;
            }

            switch (eventId)
            {
            case EVENT_KNEEL:
                for (Creature* pC : creatures)
                    pC->SetStandState(UNIT_STAND_STATE_KNEEL);
                events.ScheduleEvent(EVENT_CAST, Seconds(urand(10, 90)));
                break;
            case EVENT_CAST:
                for (Creature* pC : creatures)
                    pC->CastSpell(pC, 21157, true);
                events.ScheduleEvent(EVENT_STAND, Seconds(1));
                break;
            case EVENT_STAND:
                for (Creature* pC : creatures)
                    pC->SetStandState(UNIT_STAND_STATE_STAND);
                events.ScheduleEvent(EVENT_UNAURA, Seconds(urand(10, 30)));
                break;
            case EVENT_UNAURA:
                for (Creature* pC : creatures)
                    pC->RemoveAurasDueToSpell(21157);
                events.ScheduleEvent(EVENT_KNEEL, Seconds(urand(2, 10)));
                break;
            }
        }
    }
};

CreatureAI* GetAI_mob_faerlina_rp(Creature* pCreature)
{
    return new mob_faerlina_rp(pCreature);
}


void AddSC_naxxramas_faerlina_rp()
{
    Script* NewScript;

    NewScript = new Script;
    NewScript->Name = "mob_faerlina_rp";
    NewScript->GetAI = &GetAI_mob_faerlina_rp;
    NewScript->RegisterSelf();
}

} // namespace mod_naxxramas
