// The Gurubashi Bat Rider, taken out of boss_jeklik.cpp: it goes to mod-zulgurub and its rows, while
// Jeklik and her bomb-dropping bats stay in the core (trt A25, AM1).
#include "scriptPCH.h"
#include "dungeons/zulgurub/zulgurub.h"

namespace mod_zulgurub
{


// TRASH
enum
{
    SPELL_EXPLOSION          = 24024, // [3 sec cast]
    SPELL_DEMORALIZING_SHOUT = 23511, // Reduces the melee attack power of nearby enemies by 40 for 30 sec. [Instant]
    SPELL_BATTLE_COMBAT      = 5115,  // Increases the attack speed of nearby allies by 50% for 6 sec.
    SPELL_INFECTED_BITE      = 16128, // Inflicts Nature damage to an enemy every 10 sec. and increases the Physical damage it takes for 3 sec. [Instant] [Melee Range]
    SPELL_THRASH             = 3391,  // Gives the caster 2 extra attacks. [Instant]
};

struct npc_guru_bat_riderAI : public ScriptedAI
{
    npc_guru_bat_riderAI(Creature* pCreature) : ScriptedAI(pCreature)
    {
        Reset();
    }

    bool GoingToExplose;
    uint32 Despawn_Timer;
    uint32 Combat_Timer;
    uint32 InfectedBite_Timer;
    uint32 Thrash_Timer;

    void Reset() override
    {
        GoingToExplose     = false;
        Despawn_Timer      = 0;
        Combat_Timer       = 8000;
        InfectedBite_Timer = 6500;
        Thrash_Timer       = 6000;
    }

    void Aggro(Unit* pWho) override
    {
        m_creature->CastSpell(m_creature, SPELL_DEMORALIZING_SHOUT, false);
        ScriptedAI::Aggro(pWho);
    }

    void UpdateAI(const uint32 diff) override
    {
        if (!m_creature->SelectHostileTarget() || !m_creature->GetVictim())
            return;

        if (!GoingToExplose && m_creature->GetHealthPercent() < 40.0f)
        {
            GoingToExplose = true;
            if (urand(0, 1))
                m_creature->MonsterTextEmote("Gurubashi Bat Rider becomes fully engulfed in flames.", nullptr, false);
            else
                m_creature->MonsterTextEmote("Gurubashi Bat Rider gets a crazed look in his eye.", nullptr, false);
            m_creature->ApplySpellImmune(0, IMMUNITY_MECHANIC, MECHANIC_FEAR, true); // fear immunity
            m_creature->CastSpell(m_creature, SPELL_EXPLOSION, false);
        }

        if (Combat_Timer < diff)
        {
            if (DoCastSpellIfCan(m_creature, SPELL_BATTLE_COMBAT) == CAST_OK)
                Combat_Timer = 25000;
        }
        else
            Combat_Timer -= diff;

        if (InfectedBite_Timer < diff)
        {
            if (DoCastSpellIfCan(m_creature->GetVictim(), SPELL_INFECTED_BITE) == CAST_OK)
                InfectedBite_Timer = 15000;
        }
        else
            InfectedBite_Timer -= diff;

        if (Thrash_Timer < diff)
        {
            if (DoCastSpellIfCan(m_creature->GetVictim(), SPELL_THRASH) == CAST_OK)
                Thrash_Timer = 6000;
        }
        else
            Thrash_Timer -= diff;

        DoMeleeAttackIfReady();
    }
};

CreatureAI* GetAI_guru_bat_rider(Creature* pCreature)
{
    return new npc_guru_bat_riderAI(pCreature);
}

void AddSC_zulgurub_bat_rider()
{
    Script* newscript;

    newscript = new Script;
    newscript->Name = "npc_guru_bat_rider";
    newscript->GetAI = &GetAI_guru_bat_rider;
    newscript->RegisterSelf();
}

} // namespace mod_zulgurub
