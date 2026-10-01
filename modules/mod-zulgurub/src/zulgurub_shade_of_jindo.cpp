// The Shade of Jin'do, taken out of boss_jindo.cpp: it goes to mod-zulgurub and its rows, while Jin'do and
// his brain wash totem (which reaches into his AI) stay in the core (trt A25 second pass, AM1).
#include "scriptPCH.h"
#include "dungeons/zulgurub/zulgurub.h"

namespace mod_zulgurub
{


enum
{
    SAY_AGGRO                       = 10449,

    SPELL_BRAIN_WASH_TOTEM          = 24262,
    SPELL_POWERFULL_HEALING_WARD    = 24309,
    SPELL_HEX                       = 17172,
    SPELL_DELUSIONS_OF_JINDO        = 24306,
    SPELL_SHADE_OF_JINDO            = 24308,
    SPELL_BANISH                    = 24466,
    // Brainwash Totem spells
    SPELL_BRAINWASH                 = 24261,
    // Healing Ward spells
    SPELL_HEAL                      = 24311,
    // Shade of Jindo spells
    SPELL_SHADOWSHOCK               = 24458,
    SPELL_INVISIBLE                 = 24307,

    NPC_SHADE                       = 14986,
    NPC_BRAINWASH_TOTEM             = 15112,
    NPC_POWERFULL_HEALING_WARD      = 14987
};

struct mob_shade_of_jindoAI : public ScriptedAI
{
    mob_shade_of_jindoAI(Creature* pCreature) : ScriptedAI(pCreature)
    {
        m_pInstance = (ScriptedInstance*)pCreature->GetInstanceData();
        Reset();
    }

    ScriptedInstance* m_pInstance;

    uint32 ShadowShock_Timer;

    void Reset() override
    {
        ShadowShock_Timer = 1000;
        m_creature->AddAura(SPELL_INVISIBLE, ADD_AURA_PERMANENT);
    }

    void DamageTaken(Unit *done_by, uint32 &damage) override
    {
        if (done_by && !done_by->HasAura(SPELL_DELUSIONS_OF_JINDO))
            damage = 0;
    }

    void UpdateAI(uint32 const diff) override
    {
        if (!m_creature->SelectHostileTarget() || !m_creature->GetVictim())
            return;

        if (m_creature->GetVictim()->HasAura(SPELL_HEX))
            m_creature->GetThreatManager().modifyThreatPercent(m_creature->GetVictim(), -100);

        //ShadowShock_Timer
        if (ShadowShock_Timer < diff)
        {
            DoCastSpellIfCan(m_creature->GetVictim(), SPELL_SHADOWSHOCK);
            ShadowShock_Timer = 2000;
        }
        else
            ShadowShock_Timer -= diff;

        DoMeleeAttackIfReady();
    }
};

CreatureAI* GetAI_mob_shade_of_jindo(Creature* pCreature)
{
    return new mob_shade_of_jindoAI(pCreature);
}


void AddSC_zulgurub_shade_of_jindo()
{
    Script* newscript;

    newscript = new Script;
    newscript->Name = "mob_shade_of_jindo";
    newscript->GetAI = &GetAI_mob_shade_of_jindo;
    newscript->RegisterSelf();
}

} // namespace mod_zulgurub
