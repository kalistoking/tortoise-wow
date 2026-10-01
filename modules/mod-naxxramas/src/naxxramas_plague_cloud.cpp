// The plague clouds, taken out of boss_heigan.cpp: they go to mod-naxxramas and its rows (NullAI), while
// Heigan and his spell script stay in the core (trt A30, AM1).
#include "scriptPCH.h"
#include "dungeons/naxxramas/naxxramas.h"

namespace mod_naxxramas
{


enum
{
    PHASE_GROUND            = 1,
    PHASE_PLATFORM          = 2,

    SAY_AGGRO1              = -1533109,
    SAY_AGGRO2              = -1533110,
    SAY_AGGRO3              = -1533111,
    SAY_SLAY                = -1533112,
    
    SAY_TAUNT1              = -1533113,
    SAY_TAUNT2              = -1533114,
    SAY_TAUNT3              = -1533115,
    SAY_TAUNT4              = -1533117,
    SAY_CHANNELING          = -1533116,
    SAY_DEATH               = -1533118,

    EMOTE_TELEPORT          = -1533136,
    EMOTE_RETURN            = -1533137,

    SPELL_ERUPTION          = 29371,

    //Spells by boss
    SPELL_DECREPIT_FEVER    = 29998,
    SPELL_PLAGUE_CLOUD      = 29350,
    SPELL_TELEPORT_SELF     = 30211,
    SPELL_MANABURN          = 29310,

    NPC_PLAGUE_FISSURE      = 533001,
    NPC_PLAGUE_CLOUD        = 533002,
};

enum Events
{
    EVENT_FEVER = 1,
    EVENT_ERUPT,
    EVENT_DANCE,
    EVENT_DANCE_END,
    EVENT_TAUNT,
    EVENT_DOOR_CLOSE,
    EVENT_MANABURN,
    EVENT_PORT_PLAYER
};

enum Phases
{
    PHASE_FIGHT = 1,
    PHASE_DANCE
};

static const uint8 numSections = 4;

// in tunnel
static constexpr float safespotFissures[3][3] = 
{   
    {2747.0f, -3754.0f, 274.0f},
    {2805.8f, -3695.88f, 273.61f},
    {2812.95f, -3703.52f, 273.61f},
};

static constexpr float sect1SafeSpot[3][3] = 
{
    { 2799.5f, -3691.0f, 273.62f },
    { 2810.67f, -3706.06f, 275.0f },
    { 2803.51f, -3697.42f, 274.1f }
};
static constexpr float sect2SafeSpot[3] = { 2790.51f, -3690.45f, 273.622f };
static constexpr float sect3SafeSpot[3] = { 2778.40f, -3702.645f, 273.621f };
static constexpr float sect4SafeSpot[3][3] = 
{
    { 2777.2f, -3712.41f, 273.63f },
    { 2783.06f, -3717.7f, 273.63f },
    { 2791.62f, -3726.04f, 273.63f },
};

struct mob_plague_cloudAI : public ScriptedAI
{
    mob_plague_cloudAI(Creature* pCreature) : ScriptedAI(pCreature)
    {
        Reset();
    }
    void Reset() override
    {
        m_creature->AddUnitState(UNIT_STAT_ROOT);
        m_creature->StopMoving();
        m_creature->SetRooted(true);
    }

    void AttackStart(Unit*) override { }
    void MoveInLineOfSight(Unit*) override { }

    void UpdateAI(const uint32) override { }
};

CreatureAI* GetAI_mob_plagueCloud(Creature* pCreature)
{
    return new mob_plague_cloudAI(pCreature);
}


void AddSC_naxxramas_plague_cloud()
{
    Script* NewScript;

    NewScript = new Script;
    NewScript->Name = "mob_plague_cloud";
    NewScript->GetAI = &GetAI_mob_plagueCloud;
    NewScript->RegisterSelf();
}

} // namespace mod_naxxramas
