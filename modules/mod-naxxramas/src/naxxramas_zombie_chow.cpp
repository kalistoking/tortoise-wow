// The Zombie Chow, taken out of boss_gluth.cpp: it goes to mod-naxxramas and its rows, while Gluth and his
// spell script stay in the core (trt A30, AM1).
#include "scriptPCH.h"
#include "dungeons/naxxramas/naxxramas.h"

namespace mod_naxxramas
{


static float const aZombieSummonLoc[3][3] =
{
    { 3267.9f, -3172.1f, 297.42f },
    { 3253.2f, -3132.3f, 297.42f },
    { 3308.3f, -3185.8f, 297.42f },
};

enum GluthData
{
    EMOTE_FRENZY = 1191,

    SPELL_DOUBLE_ATTACK = 19818, // Added on reset in cmangos, not sure why
    SPELL_MORTALWOUND = 25646,
    SPELL_DECIMATE = 28374,
    SPELL_DECIMATE_OTHER = 28375,
    SPELL_FRENZY = 28371,
    SPELL_BERSERK = 26662,
    SPELL_TERRIFYING_ROAR = 29685,

    NPC_ZOMBIE_CHOW = 16360,
    SPELL_INFECTED_WOUND = 29307
};

enum eGLuthEvents
{
    EVENT_MORTAL_WOUND = 1,
    EVENT_DECIMATE,
    EVENT_FRENZY,
    EVENT_SUMMON,
    EVENT_BERSERK,
    EVENT_TERRIFYING_ROAR,
    EVENT_ZOMBIE_SEARCH,
    EVENT_EVADE_CHECK
};

static constexpr uint32 MORTAL_WOUND_CD = 10000; // Verified by: https://www.youtube.com/watch?v=RAPiZgo-pNA
static constexpr uint32 DECIMATE_CD = 105000; // https://wowpedia.fandom.com/wiki/Gluth_(Classic)
static constexpr uint32 FRENZY_CD = 10000; // https://wowpedia.fandom.com/wiki/Gluth_(Classic)
static constexpr uint32 SUMMON_CD = 6000; // Verified by dbc spell 28216
static constexpr uint32 BERSERK_CD = 330000; // TODO: verify (15 sec after third decimate)
static constexpr uint32 FEAR_CD = 20000; // https://wowpedia.fandom.com/wiki/Gluth_(Classic)
static constexpr uint32 ZOMBIE_SEARCH_CD = 3000; // DBC confirms this one

struct mob_zombieChow : public ScriptedAI
{
    explicit mob_zombieChow(Creature* pCreature) : ScriptedAI(pCreature)
    {
        m_pInstance = static_cast<instance_naxxramas*>(pCreature->GetInstanceData());
        Reset();
    }

    instance_naxxramas* m_pInstance;
    bool isHitByDecimate;

    void Reset() override
    {
        isHitByDecimate = false;
        m_creature->CastSpell(m_creature, SPELL_INFECTED_WOUND, true);
    }

    bool ChaseGluth()
    {
        if (Creature* pGluth = m_pInstance->GetSingleCreatureFromStorage(NPC_GLUTH))
        {
            m_creature->GetMotionMaster()->Clear();
            m_creature->GetMotionMaster()->MoveFollow(pGluth, ATTACK_DISTANCE, 0.0f);
            m_creature->SetTargetGuid(0);
            return true;
        }

        return false;
    }

    void SpellHit(WorldObject* pWho, SpellEntry const* pSpell) override
    {
        ScriptedAI::SpellHit(pWho, pSpell);
        if (pWho->GetEntry() == NPC_GLUTH && pSpell->Id == SPELL_DECIMATE)
        {
            if (ChaseGluth())
            {
                DoCastSpellIfCan(m_creature, SPELL_DECIMATE_OTHER, CF_TRIGGERED);
                isHitByDecimate = true;
            }
        }
    }

    void AttackStart(Unit* pWho) override
    {
        if (isHitByDecimate)
            return;

        ScriptedAI::AttackStart(pWho);
    }

    void UpdateAI(uint32 const diff) override
    {
        if (isHitByDecimate)
        {
            if (m_creature->GetMotionMaster()->GetCurrentMovementGeneratorType() != CHASE_MOTION_TYPE)
                ChaseGluth();

            return;
        }

        if (!m_creature->SelectHostileTarget() || !m_creature->GetVictim())
            return;

        DoMeleeAttackIfReady();
    }
};

CreatureAI* GetAI_mob_zombieChow(Creature* pCreature)
{
    return new mob_zombieChow(pCreature);
}


void AddSC_naxxramas_zombie_chow()
{
    Script* NewScript;

    NewScript = new Script;
    NewScript->Name = "mob_zombie_chow";
    NewScript->GetAI = &GetAI_mob_zombieChow;
    NewScript->RegisterSelf();
}

} // namespace mod_naxxramas
