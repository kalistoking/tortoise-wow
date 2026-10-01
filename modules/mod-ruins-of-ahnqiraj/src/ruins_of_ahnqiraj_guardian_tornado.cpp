// The Anubisath Guardian and Ossirian's tornadoes, taken out of ruins_of_ahnqiraj.cpp: they go to
// mod-ruins-of-ahnqiraj and its rows, while the Flesh Hunter and the spell scripts stay in the core
// (trt A24 second pass, AM1).
#include "scriptPCH.h"
#include "dungeons/ruins_of_ahnqiraj/ruins_of_ahnqiraj.h"

namespace mod_ruins_of_ahnqiraj
{


// Anubisath guardian
enum
{
    SPELL_METEOR = 24340,
    SPELL_PLAGUE = 22997,
    SPELL_SHADOW_STORM = 26546,
    SPELL_THUNDER_CLAP = 26554,
    SPELL_REFLECT_ARFR = 13022,
    SPELL_REFLECT_FSSH = 19595,
    SPELL_ENRAGE = 8269, //8559,
    SPELL_EXPLODE = 25699,
    SPELL_INIT_EXPLODE = 25698,

    EMOTE_FRENZY = 10677,

    NPC_ANU_WARRIOR = 15537,
    NPC_ANU_SWARM = 15538,

    OBJ_SMALL_OBSIDIAN_CHUNK = 181068
};

struct mob_anubisath_guardianAI : public ScriptedAI
{
    explicit mob_anubisath_guardianAI(Creature* pCreature) : ScriptedAI(pCreature)
    {
        Reset();
    }

    uint32 m_uiSpell1;
    uint32 m_uiSpell2;
    uint32 m_uiSpell3;
    uint32 m_uiSpell4;
    uint32 m_uiNPCSummon;

    uint32 m_uiSpell1_Timer;
    uint32 m_uiSpell2_Timer;
    uint32 m_uiSummon_Timer;
    uint32 m_uiExplode_Timer;

    uint8 m_uiSummonCount;

    bool m_bIsEnraged;
    bool m_bIsExploding;

    void Reset() override
    {
        m_uiSpell1 = urand(0, 1) ? SPELL_METEOR : SPELL_PLAGUE;
        m_uiSpell2 = urand(0, 1) ? SPELL_SHADOW_STORM : SPELL_THUNDER_CLAP;
        m_uiSpell3 = urand(0, 1) ? SPELL_REFLECT_ARFR : SPELL_REFLECT_FSSH;
        m_uiSpell4 = urand(0, 1) ? SPELL_ENRAGE : SPELL_INIT_EXPLODE;
        m_uiNPCSummon = urand(0, 1) ? NPC_ANU_WARRIOR : NPC_ANU_SWARM;

        m_uiSpell1_Timer = 10000;
        m_uiSpell2_Timer = 20000;
        m_uiSummon_Timer = 10000;
        m_bIsEnraged = false;
        m_bIsExploding = false;
        m_uiSummonCount = 0;
        m_uiExplode_Timer = 6000;

        m_creature->RemoveAllAuras();
    }

    void JustDied(Unit* pKiller) override
    {
        m_creature->SummonGameObject(OBJ_SMALL_OBSIDIAN_CHUNK, m_creature->GetPositionX(), m_creature->GetPositionY(), m_creature->GetPositionZ(), 0, 0, 0, 0, 0, -1, false);
        m_creature->ForcedDespawn(8000); // 8 Seconds until despawn
    }

    void Aggro(Unit* pWho) override
    {
        DoCast(m_creature, m_uiSpell3);
    }

    void JustSummoned(Creature* pSummoned) override
    {
        pSummoned->AI()->AttackStart(m_creature->GetVictim());
        ++m_uiSummonCount;
    }

    void SummonedCreatureDespawn(Creature *pDespawned) override
    {
        -- m_uiSummonCount;
    }

    void DamageTaken(Unit* pDoneBy, uint32 &uiDamage) override
    {
        if (!m_bIsEnraged && (m_creature->GetHealth() * 100 / m_creature->GetMaxHealth()) < 10)
        {
            if (m_uiSpell4 == SPELL_ENRAGE)
            {
                DoCast(m_creature->GetVictim(), m_uiSpell4);
                DoScriptText(EMOTE_FRENZY, m_creature);
                m_bIsEnraged = true;
            }
            else
            {
                m_creature->CastSpell(m_creature, m_uiSpell4, false);
                m_bIsExploding = true;
                m_uiExplode_Timer = 6000;
            }
        }
    }

    void UpdateAI(const uint32 uiDiff) override
    {
        if (!m_creature->SelectHostileTarget() || !m_creature->GetVictim())
            return;

        if (m_uiExplode_Timer < uiDiff && m_bIsExploding)
        {
            if (DoCastSpellIfCan(m_creature, SPELL_EXPLODE) == CAST_OK)
                m_uiExplode_Timer = 15000;
        }
        else
            m_uiExplode_Timer -= uiDiff;

        if (m_uiSpell1_Timer < uiDiff)
        {
            // Spell1 shall be cast on random target
            if (Unit* pUnit = m_creature->SelectAttackingTarget(ATTACKING_TARGET_RANDOM, 0))
            {
                // Create visual animation of the spell
                m_creature->SendSpellGo(m_creature, m_uiSpell1);

                if (DoCastSpellIfCan(pUnit, m_uiSpell1) == CAST_OK)
                    m_uiSpell1_Timer = 15000;
            }
        }
        else
            m_uiSpell1_Timer -= uiDiff;

        if (m_uiSpell2_Timer < uiDiff)
        {
            if (DoCastSpellIfCan(m_creature->GetVictim(), m_uiSpell2) == CAST_OK)
                m_uiSpell2_Timer = 15000;
        }
        else
            m_uiSpell2_Timer -= uiDiff;

        if (m_uiSummon_Timer < uiDiff)
        {
            if (m_uiSummonCount < 4 && m_creature->IsAlive())
            {
                m_creature->SummonCreature(m_uiNPCSummon,
                                           m_creature->GetPositionX(),
                                           m_creature->GetPositionY(),
                                           m_creature->GetPositionZ(),
                                           0,
                                           TEMPSUMMON_TIMED_DESPAWN,
                                           60000);
                // Create visual animation of the teleportation spell
                m_creature->SendSpellGo(m_creature, 25681);
            }

            m_uiSummon_Timer = 15000;
        }
        else
            m_uiSummon_Timer -= uiDiff;

        DoMeleeAttackIfReady();
    }
};

struct OssirianTornadoAI : public ScriptedAI
{
    explicit OssirianTornadoAI(Creature* pCreature) : ScriptedAI(pCreature)
    {
        SetCombatMovement(false);
        m_creature->CastSpell(m_creature, 25160, false);
        m_creature->CastSpell(m_creature, 10092, false);
        m_creature->SetDefaultMovementType(RANDOM_MOTION_TYPE);
        m_creature->SetWanderDistance(55.0f);
        m_creature->GetMotionMaster()->Initialize();
        Reset();
    }

    void Reset() override
    {
    }

    void Aggro(Unit* pWho) override
    {
        m_creature->SetInCombatWithZone();
    }

    void UpdateAI(const uint32 uiDiff) override
    {
        if (!m_creature->SelectHostileTarget() || !m_creature->GetVictim())
            return;

        DoMeleeAttackIfReady();
    }
};



CreatureAI* GetAI_mob_anubisath_guardian(Creature* pCreature)
{
    return new mob_anubisath_guardianAI(pCreature);
}

CreatureAI* GetAI_OssirianTornado(Creature* pCreature)
{
    return new OssirianTornadoAI(pCreature);
}


void AddSC_ruins_of_ahnqiraj_guardian_tornado()
{
    Script* newscript;

    newscript = new Script;
    newscript->Name = "mob_anubisath_guardian";
    newscript->GetAI = &GetAI_mob_anubisath_guardian;
    newscript->RegisterSelf();

    newscript = new Script;
    newscript->Name = "mob_tornado_ossirian";
    newscript->GetAI = &GetAI_OssirianTornado;
    newscript->RegisterSelf();
}

} // namespace mod_ruins_of_ahnqiraj
