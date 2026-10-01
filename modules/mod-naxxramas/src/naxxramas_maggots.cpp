// The rotting and diseased maggots, taken out of boss_loatheb.cpp: they go to mod-naxxramas and its rows,
// while Loatheb, his eye stalks and his spell script stay in the core (trt A30, AM1).
#include "scriptPCH.h"
#include "dungeons/naxxramas/naxxramas.h"

namespace mod_naxxramas
{


enum
{
    // No emotes in vanilla afaik
    //EMOTE_AURA_BLOCKING = -1533143,
    //EMOTE_AURA_FADING   = -1533145,
    //EMOTE_AURA_WANE     = -1533144,

    SPELL_CORRUPTED_MIND  = 29201, // this triggers the following spells on targets (based on class): 29185, 29194, 29196, 29198
    SPELL_POISON_AURA     = 29865,
    SPELL_INEVITABLE_DOOM = 29204,
    SPELL_REMOVE_CURSE    = 30281, // He periodically removes all curses on himself
    SPELL_FUNGAL_BLOOM    = 29232, // Cast by spores

    NPC_SPORE             = 16286,
};

enum Events
{
    EVENT_SUMMON_SPORE = 1,
    EVENT_CORRUPTED_MIND,
    EVENT_POISON_AURA,
    EVENT_INEVITABLE_DOOM,
    EVENT_REMOVE_CURSE
};

// Can't really see much of a system in where the spores spawn.
// In guides it say "oposite side of where the majority of the raid stands".
// Unless this is a snapshot check by the boss on pull, which it dosent seem to be based on videos,
// it simply seems like one of 2 (potentially 4) location is chosed at random on pull, after that it's
// constantly spawning there throughout the fight.
// Presumably spell 29234 was used, it has a radius of 70yd. Can't figure out exactly how it would have been used though.
static constexpr float SporeLocs[2][3] = 
{
    {2951.0f, -4016.0f, 274.0f},
    {2870.0f, -3978.0f, 274.0f}
};

static constexpr uint8 MAX_STALKS_UP = 6;

struct mob_rottingMaggotAI : public ScriptedAI
{
    mob_rottingMaggotAI(Creature* pCreature, bool isDiseased) :
        ScriptedAI(pCreature),
        isDiseased(isDiseased)
    {
        m_pInstance = (instance_naxxramas*)pCreature->GetInstanceData();
        m_creature->SetNoCallAssistance(true);
        Reset();
    }
    const bool isDiseased;
    WorldLocation aggroPossition;
    static constexpr uint32 SPELL_RETCHING_PLAGUE = 30079;

    instance_naxxramas* m_pInstance;

    void Reset() override
    {
    }

    void MoveInLineOfSight(Unit* pWho) override
    {
        if (!pWho)
            return;

        if (pWho->GetTypeId() == TYPEID_PLAYER
            && !m_creature->IsInCombat()
            && m_creature->IsWithinDistInMap(pWho, 1.5f) // Custom, tiny aggro radius
            && m_creature->IsWithinLOSInMap(pWho)
            && !pWho->HasAuraType(SPELL_AURA_FEIGN_DEATH)
            && !pWho->HasAuraType(SPELL_AURA_MOD_UNATTACKABLE))
        {
            m_creature->SetNoCallAssistance(true);

            if (!m_creature->GetVictim())
                AttackStart(pWho);
            else if (m_creature->GetMap()->IsDungeon())
            {
                pWho->SetInCombatWith(m_creature);
                m_creature->AddThreat(pWho);
            }
        }
    }

    void Aggro(Unit*) override
    {
        m_creature->SetNoCallAssistance(true);
        m_creature->GetPosition(aggroPossition);
    }

    void UpdateAI(const uint32 uiDiff) override
    {
        if (m_pInstance->GetData(TYPE_HEIGAN) == DONE)
        {
            m_creature->ForcedDespawn();
        }

        if (!m_creature->SelectHostileTarget() || !m_creature->GetVictim())
            return;

        if (isDiseased)
        {
            if (!m_creature->HasAura(SPELL_RETCHING_PLAGUE))
                m_creature->CastSpell(m_creature, SPELL_RETCHING_PLAGUE, true);
        }

        if (m_creature->GetDistance(aggroPossition) > 40.0f)
        {
            EnterEvadeMode();
        }
        else
        {
            DoMeleeAttackIfReady();
        }
    }
};

CreatureAI* GetAI_mob_rottingMaggot(Creature* pCreature)
{
    return new mob_rottingMaggotAI(pCreature, false);
}
CreatureAI* GetAI_mob_diseasedMaggot(Creature* pCreature)
{
    return new mob_rottingMaggotAI(pCreature, true);
}

void AddSC_naxxramas_maggots()
{
    Script* NewScript;

    NewScript = new Script;
    NewScript->Name = "mob_rotting_maggot";
    NewScript->GetAI = &GetAI_mob_rottingMaggot;
    NewScript->RegisterSelf();

    NewScript = new Script;
    NewScript->Name = "mob_diseased_maggot";
    NewScript->GetAI = &GetAI_mob_diseasedMaggot;
    NewScript->RegisterSelf();
}

} // namespace mod_naxxramas
