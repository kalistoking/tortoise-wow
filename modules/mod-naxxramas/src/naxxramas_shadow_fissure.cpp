// Kel'Thuzad's Shadow Fissure, taken out of boss_kelthuzad.cpp: it goes to mod-naxxramas and its rows,
// while Kel'Thuzad, his adds and his spell script stay in the core (trt A30, AM1).
#include "scriptPCH.h"
#include "dungeons/naxxramas/naxxramas.h"

namespace mod_naxxramas
{


enum
{
    SAY_SUMMON_MINIONS                  = -1533105,         //start of phase 1

    EMOTE_PHASE2                        = -1533135,         // %s strikes!, cant find use of it in vanilla
    SAY_AGGRO1                          = -1533094,         // pray for mercy
    SAY_AGGRO2                          = -1533095,         // Scream your dying breath!
    SAY_AGGRO3                          = -1533096,         // The end is upon you!

    SAY_SLAY1                           = -1533097,
    SAY_SLAY2                           = -1533098,

    SAY_DEATH                           = -1533099,

    SAY_CHAIN1                          = -1533100,         // Your soul, is bound to me now!
    SAY_CHAIN2                          = -1533101,         // there will be  no escape
    SAY_FROST_BLAST                     = -1533102,         // I will freeze the blood in your veins!

    SAY_REQUEST_AID                     = -1533103,         // Master! I require aid! 
    SAY_ANSWER_REQUEST                  = -1533104,         // Very well... warriors of the frozen wastes, rise up! I command you to fight, kill, and die for your master. Let none survive...

    SAY_SPECIAL1_MANA_DET               = -1533106,         // Your petty magics are no challenge to the might of the Scourge! 
    SAY_SPECIAL3_MANA_DET               = -1533107,         // Enough! I grow tired of these distractions! 
    SAY_SPECIAL2_DISPELL                = -1533108,         // Fools, you have spread your powers too thin. Be free, my minions!
        
    EMOTE_GUARDIAN                      = -1533134,         // at each guardian summon, cant see that it's used in vanilla

    SPELL_VISUAL_CHANNEL                = 29423,            // channeled throughout phase one

    //spells to be casted
    SPELL_FROST_BOLT                    = 28478,
    SPELL_FROST_BOLT_NOVA               = 28479,

    SPELL_CHAINS_OF_KELTHUZAD           = 28408,           
    SPELL_CHAINS_OF_KELTHUZAD_SCALE     = 28409,
    SPELL_CHAINS_OF_KELTHUZAD_EFFECTS   = 28410,

    SPELL_MANA_DETONATION               = 27819,
    SPELL_SHADOW_FISSURE                = 27810,
    SPELL_VOID_BLAST                    = 27812,
    SPELL_FROST_BLAST                   = 27808,
    SPELL_BERSERK                       = 28498,

    SPELL_DISPELL_SHACKLES              = 28471,            // not used, doing it "manually"

    SPELL_SUMMON_PLAYER                 = 25104,
};

enum AddSpells
{
    // guardian of icecrown
    SPELL_BLOOD_TAP = 28470, 

    // Soul Weaver
    SPELL_WAIL_SOULS_AUR = 28460,

    // Warrior
    SPELL_DARK_BLAST_AUR  = 28458,
    SPELL_DARK_BLAST_TRIG = 28457,

    // Abomination
    // SPELL_MORTAL_WOUND = 28467, // does 6k damage on plate due to abom damage being really high
    // deals 55 damage (+-25) on all classic videos
    // https://youtu.be/pV-56SakQnA?t=302
    SPELL_MORTAL_WOUND = 25646,
};

enum Events
{
    // phase one
    EVENT_SKELETON = 1,
    EVENT_SOUL_WEAVER,
    EVENT_ABOMINATION,
    EVENT_PHASE_TWO_INTRO,
    EVENT_PHASE_TWO_START,
    EVENT_DESPAWN_PORTAL,
    EVENT_PUT_IN_COMBAT,

    // phase two
    EVENT_FROSTBOLT_VOLLEY,
    EVENT_FROST_BLAST,
    EVENT_FROSTBOLT,
    EVENT_SHADOW_FISSURE,
    EVENT_DETONATE_MANA,
    EVENT_CHAINS,

    // phase three
    EVENT_REQUEST_REPLY,
    EVENT_SUMMON_GUARDIAN,
};

// the shiny thing in center that despawns after pull
static constexpr float pullPortal[3] = { 3716.379883f, -5106.779785f, 132.9f };
static constexpr float ROOM_RADIUS = 82.0f;
static constexpr float ROOM_FLOOR_Z = 142.0f;

// Center position of each alcove
static constexpr uint32 NUM_ALCOVES = 7;
static constexpr float alcoves[7][2] = 
{
    { 3768.40f, -5072.00f},
    { 3729.30f, -5044.10f},
    { 3683.00f, -5054.05f},
    { 3654.15f, -5093.48f},
    { 3664.55f, -5140.50f},
    { 3704.00f, -5170.00f},
    { 3751.95f, -5158.90f} 
};

// z-coordinate in the alcoves
static constexpr float alcoveZ = 143.5f; 

// number of soulweavers total, one in each alcove
static constexpr uint32 NUM_SOULWEAVER = 7;
// each soulweaver position
static constexpr float soulweaverPos[NUM_SOULWEAVER][2] =
{
    {3754.95f, -5164.93f},
    {3701.89f, -5176.95f},
    {3656.83f, -5145.56f},
    {3647.53f, -5093.56f},
    {3678.48f, -5050.46f},
    {3730.87f, -5035.93f},
    {3774.78f, -5067.68f},
};
// number of abominations, 3 in each alcove
static constexpr uint32 NUM_ABOM = 21;
// each abomination position
static constexpr float abomPos[NUM_ABOM][2] =
{
    {3740.70f, -5160.89f},
    {3756.42f, -5151.09f},
    {3748.99f, -5155.72f},

    {3694.11f, -5163.96f},
    {3713.90f, -5168.14f},
    {3704.76f, -5166.21f},

    {3661.65f, -5132.06f},
    {3672.37f, -5147.84f},
    {3666.83f, -5139.67f},

    {3658.81f, -5086.46f},
    {3654.80f, -5104.04f},
    {3656.76f, -5095.47f},

    {3691.83f, -5052.45f},
    {3675.15f, -5062.94f},
    {3683.48f, -5057.71f},

    {3738.15f, -5050.12f},
    {3717.76f, -5046.03f},
    {3728.48f, -5047.99f},

    {3772.53f, -5083.21f},
    {3760.03f, -5064.65f},
    {3765.85f, -5073.22f}
};

// total number of soulweaver and abomination waves 
static constexpr uint32 NUM_UNDEAD_SPAWNS = 14;

// milliseconds since pull for each abomination spawn
static constexpr uint32 abominationSpawnMs[NUM_UNDEAD_SPAWNS] =
{
    44000,
    72000,
    100000,
    130000,
    153000,
    176000,
    193000,
    212000,
    232000,
    252000,
    268000,
    285000,
    300000,
    318000,
};

// milliseconds since pull for each soulweaver spawn
static constexpr uint32 soulweaverSpawnMs[NUM_UNDEAD_SPAWNS] =
{
    14000,
    44000,
    68000,
    97000,
    130000,
    155000,
    170000,
    190000,
    213000,
    235000,
    256000,
    271000,
    285000,
    300000,
};

static constexpr uint32 NUM_WINDOW_PORTALS = 4;
static constexpr float windowPortals[NUM_WINDOW_PORTALS][2] =
{
    {3760.57f, -5173.93f},
    {3700.14f, -5185.68f},
    {3732.62f, -5027.67f},
    {3783.36f, -5062.35f}
};

//todo: no idea what the pull range should be
static constexpr float ALCOVE_ADD_PULL_RADIUS = 30.0f;

struct mob_shadow_fissureAI : public ScriptedAI
{
    mob_shadow_fissureAI(Creature* pCreature) : ScriptedAI(pCreature)
    {
        Reset();
    }
    uint32 timer;
    bool haveCasted;
    void Reset() override
    {
        timer = 3000;
        haveCasted = false;
    }

    void Aggro(Unit*) override
    {
    }
    void AttackStart(Unit*) override
    {
    }
    void MoveInLineOfSight(Unit* pWho) override
    {
    }

    void UpdateAI(const uint32 diff) override
    {
        if (haveCasted)
            return;
        if (timer < diff)
        {
            m_creature->CastSpell(m_creature, SPELL_VOID_BLAST, true);
            haveCasted = true;
            m_creature->ForcedDespawn(2250);
        }
        else
            timer -= diff;
    }
};

CreatureAI* GetAI_mob_shadow_fissure(Creature* pCreature)
{
    return new mob_shadow_fissureAI(pCreature);
}


void AddSC_naxxramas_shadow_fissure()
{
    Script* NewScript;

    NewScript = new Script;
    NewScript->Name = "mob_shadow_fissure";
    NewScript->GetAI = &GetAI_mob_shadow_fissure;
    NewScript->RegisterSelf();
}

} // namespace mod_naxxramas
