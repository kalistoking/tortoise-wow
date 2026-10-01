// Viscidus's globs and toxin trigger, taken out of boss_viscidus.cpp: they go to mod-temple-of-ahnqiraj and
// its rows, while Viscidus stays in the core (trt A29, AM1).
#include "scriptPCH.h"
#include "dungeons/temple_of_ahnqiraj/temple_of_ahnqiraj.h"

namespace mod_temple_of_ahnqiraj
{


enum
{
    // emotes
    EMOTE_SLOW                  = -1531041, // Viscidus begins to slow.
    EMOTE_FREEZE                = -1531042, // Viscidus is freezing up.
    EMOTE_FROZEN                = -1531043, // Viscidus is frozen solid.
    // These are currently handled in UnitAuraProcHandler.cpp.
    EMOTE_CRACK                 = -1531044, // Viscidus begins to crack.
    EMOTE_SHATTER               = -1531045, // Viscidus looks ready to shatter.

    // Timer spells
    SPELL_POISON_SHOCK          = 25993,
    SPELL_POISONBOLT_VOLLEY     = 25991,
    SPELL_TOXIN                 = 26575,                    // Triggers toxin cloud - 25989
    SPELL_TOXIN_CLOUD           = 25989,

    // Debuffs gained by the boss on frost damage
    SPELL_VISCIDUS_SLOWED       = 26034,
    SPELL_VISCIDUS_SLOWED_MORE  = 26036,
    SPELL_VISCIDUS_FREEZE       = 25937,

    // When frost damage exceeds a certain limit, then boss explodes
    SPELL_REJOIN_VISCIDUS       = 25896,
    SPELL_VISCIDUS_EXPLODE      = 25938,
    SPELL_VISCIDUS_SUICIDE      = 26003,                    // cast when boss explodes and is below 5% Hp - should trigger 26002
    SPELL_DESPAWN_GLOBS         = 26608,

    SPELL_MEMBRANE_VISCIDUS     = 25994,                    // damage reduction spell
    SPELL_VISCIDUS_WEAKNESS     = 25926,                    // aura which procs at damage - should trigger the slow spells
    SPELL_VISCIDUS_SHRINKS      = 25893,
    SPELL_VISCIDUS_SHRINKS_HP   = 27934,                    // should be scripted properly
    SPELL_VISCIDUS_GROWS        = 25897,
    SPELL_SUMMON_GLOBS          = 25885,                    // summons npc 15667 using spells from 25865 to 25884; All spells have target coords
    SPELL_VISCIDUS_TELEPORT     = 25904,                    // teleport to room center
    SPELL_SUMMONT_TRIGGER       = 26564,                    // summons 15922

    SPELL_GLOB_SPEED            = 26633,                    // apply aura 26634 each second
    
    NPC_GLOB_OF_VISCIDUS        = 15667,
    NPC_VISCIDUS_TRIGGER        = 15922,                    // handles aura 26575

    MAX_VISCIDUS_GLOBS          = 20,                       // there are 20 summoned globs; each glob = 5% hp

    // hitcounts
    HITCOUNT_SLOW               = 100,
    HITCOUNT_SLOW_MORE          = 150,
    HITCOUNT_FREEZE             = 200,

    // phases
    PHASE_NORMAL                = 1,
    PHASE_FROZEN                = 2,
    PHASE_EXPLODED              = 3,

    SPELL_WAND_SHOOT            = 5019,
};

static const uint32 auiGlobSummonSpells[MAX_VISCIDUS_GLOBS] = { 25865, 25866, 25867, 25868, 25869, 25870, 25871, 25872, 25873, 25874, 25875, 25876, 25877, 25878, 25879, 25880, 25881, 25882, 25883, 25884 };

//-----------------------------------------------------------------------------
// mob_viscidus_globAI
//-----------------------------------------------------------------------------

struct mob_viscidus_globAI : public ScriptedAI
{
    // Acceleration delay
    uint32 m_uiGlobStartAccelerationTimer;
    // prevents SPELL_GLOB_SPEED casting multiple times
    bool m_spellCasted;

    // Everything is an approximated here. Need data from official.
    // Initial glob speed is 0.335625. They start acceleration with 4 seconds delay timer.
    // Each tick of the aura(id:26634) doubles their speed.
    // This solution gives smooth movement and acceleration.

    mob_viscidus_globAI(Creature* pCreature)
        : ScriptedAI(pCreature), m_uiGlobStartAccelerationTimer(4000), m_spellCasted(false)
    { }

    // dummy methods
    void Reset() override { }
    void AttackStart(Unit* /*pWho*/) override { }
    void MoveInLineOfSight(Unit* /*pWho*/) override { }

    // Implements acceleration on timer, prevents combat.
    void UpdateAI(const uint32 uiDiff) override
    {
        if (m_uiGlobStartAccelerationTimer <= uiDiff)
        {
            // SPELL_GLOB_SPEED should be casted only once
            if (!m_spellCasted)
            {
                m_spellCasted = true;
                m_creature->CastSpell(m_creature, SPELL_GLOB_SPEED, true);
            }
        }
        else
        {
            m_uiGlobStartAccelerationTimer -= uiDiff;
        }
    }
};

CreatureAI* GetAI_mob_viscidus_glob(Creature* pCreature)
{
    return new mob_viscidus_globAI(pCreature);
}

//-----------------------------------------------------------------------------
// mob_viscidus_triggerAI
//-----------------------------------------------------------------------------
struct mob_viscidus_triggerAI : public ScriptedAI
{
    // Acceleration delay
    uint32 m_uiToxinDelayTimer;
    bool m_spellCasted;

    mob_viscidus_triggerAI(Creature* pCreature)
     : ScriptedAI(pCreature), m_uiToxinDelayTimer(3000), m_spellCasted(false)
    { }

    // dummy methods
    void Reset() override { }
    void AttackStart(Unit* /*pWho*/) override { }
    void MoveInLineOfSight(Unit* /*pWho*/) override { }
    // Implements toxin cloud on timer, prevents combat.
    void UpdateAI(const uint32 uiDiff) override
    {
        if (m_uiToxinDelayTimer <= uiDiff)
        {
            if (!m_spellCasted)
            {
                // set faction and flags before toxin cloud, so it won't damage a boss.
                m_creature->SetFactionTemplateId(14); // 14 is a hostile faction
                m_creature->SetFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_NOT_ATTACKABLE_1);

                m_spellCasted = true;
                // cast spell instantly, only once
                m_creature->CastSpell(m_creature, SPELL_TOXIN_CLOUD, true);
                // apply an aura, which will continously repeat this spell.
                m_creature->CastSpell(m_creature, SPELL_TOXIN, true);
            }
        }
        else
        {
            m_uiToxinDelayTimer -= uiDiff;
        }
    }
};

CreatureAI* GetAI_mob_viscidus_trigger(Creature* pCreature)
{
    return new mob_viscidus_triggerAI(pCreature);
}


void AddSC_temple_of_ahnqiraj_viscidus_globs()
{
    Script* pNewScript;

    pNewScript = new Script;
    pNewScript->Name = "mob_viscidus_glob";
    pNewScript->GetAI = &GetAI_mob_viscidus_glob;
    pNewScript->RegisterSelf();

    pNewScript = new Script;
    pNewScript->Name = "mob_viscidus_trigger";
    pNewScript->GetAI = &GetAI_mob_viscidus_trigger;
    pNewScript->RegisterSelf();
}

} // namespace mod_temple_of_ahnqiraj
