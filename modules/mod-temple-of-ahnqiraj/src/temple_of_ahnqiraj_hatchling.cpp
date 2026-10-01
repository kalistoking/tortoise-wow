// The Vekniss Hatchling, taken out of boss_fankriss.cpp: it goes to mod-temple-of-ahnqiraj and its rows,
// while Fankriss, whose webs hatch them, and his spawn stay in the core (trt A29, AM1).
#include "scriptPCH.h"
#include "dungeons/temple_of_ahnqiraj/temple_of_ahnqiraj.h"

namespace mod_temple_of_ahnqiraj
{


enum
{
    SPELL_MORTAL_WOUND      = 25646,
    SPELL_ENTANGLE_1        = 720,
    SPELL_ENTANGLE_2        = 731,
    SPELL_ENTANGLE_3        = 1121,
    //SPELL_SUMMON_WORM_1     = 518,
    //SPELL_SUMMON_WORM_2     = 25831,
    //SPELL_SUMMON_WORM_3     = 25832,
    SPELL_SPAWN_ENRAGE      = 26662,
    NPC_SPAWN_FANKRISS      = 15630,
};

static constexpr uint32 HATCHLINGS_ATTACK_DELAY = 2500; // ~2.5sec in curse killvideo.

struct creature_vekniss_hatchlingAI : public ScriptedAI
{
    ScriptedInstance* m_pInstance;
    uint32 engageTimer;
    bool hasEngaged;
    bool wasAttacked;
    creature_vekniss_hatchlingAI(Creature* pCreature) : ScriptedAI(pCreature)
    {
        m_pInstance = (ScriptedInstance*)pCreature->GetInstanceData();
        Reset();
    }

    void Reset() override
    {
        engageTimer = HATCHLINGS_ATTACK_DELAY;
        hasEngaged = false;
        wasAttacked = false;
    }

    void AttackedBy(Unit* attacker) override
    {
        engageTimer = 0;
        wasAttacked = true;
        ScriptedAI::AttackedBy(attacker);
    }
    void AttackStart(Unit* u) override
    {
        if (hasEngaged)
            ScriptedAI::AttackStart(u);
    }
    void EnterCombat(Unit* u) override
    {
        if (hasEngaged)
            ScriptedAI::EnterCombat(u);
    }
    void MoveInLineOfSight(Unit* u) override
    {
        if (hasEngaged)
            ScriptedAI::MoveInLineOfSight(u);
    }
    void Aggro(Unit* u) override
    {
        if (hasEngaged)
            ScriptedAI::Aggro(u);
    }

    void UpdateAI(const uint32 diff) override
    {
        if (engageTimer <= diff && !hasEngaged)
        {
            hasEngaged = true;
            m_creature->SetInCombatWithZone();
            if (!wasAttacked)
            {
                if (Unit* pTarget = m_creature->SelectAttackingTarget(AttackingTarget::ATTACKING_TARGET_NEAREST, 0))
                {
                    if (m_creature->GetDistance(pTarget) > 200) {
                        return; //avoid running after people far off in the instance somewhere
                    }
                    m_creature->GetThreatManager().addThreat(pTarget, 1);
                    AttackStart(pTarget);

                }
            }
        }
        else if(!hasEngaged) {
            engageTimer -= diff;
            return;
        }

        if (!m_creature->SelectHostileTarget() || !m_creature->GetVictim()) {
            return;
        }
        DoMeleeAttackIfReady();
    }

};

CreatureAI* GetAI_creature_vekniss_hatchling(Creature* pCreature)
{
    return new creature_vekniss_hatchlingAI(pCreature);
}


void AddSC_temple_of_ahnqiraj_hatchling()
{
    Script* pNewScript;

    pNewScript = new Script;
    pNewScript->Name = "creature_vekniss_hatchling";
    pNewScript->GetAI = &GetAI_creature_vekniss_hatchling;
    pNewScript->RegisterSelf();
}

} // namespace mod_temple_of_ahnqiraj
