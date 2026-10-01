// The Death Talon Captain and Seethers, taken out of boss_vaelastrasz.cpp: they go to mod-blackwing-lair and
// their rows, while Vaelastrasz (his quest binds the instance) stays in the core (trt A28 second pass, AM1).
#include "scriptPCH.h"
#include "dungeons/blackwing_lair/blackwing_lair.h"

namespace mod_blackwing_lair
{


enum
{
    MOB_RONGE_GRIFFEMORT        = 12464,
    MOB_WYRMIDE_GRIFFEMORT      = 12465,
    MOB_FLAMMECAILLE_GRIFFEMORT = 12463,

    SPELL_MARK_DETONATION       = 22438,
    SPELL_MARK_FLAMES           = 25050,
    SPELL_COMMANDING_SHOUT      = 22440,
    SPELL_CLEAVE2               = 15496,
    SPELL_AURA_FLAMES           = 22436
};

struct npc_death_talon_CaptainAI : public ScriptedAI
{
    npc_death_talon_CaptainAI(Creature* pCreature) : ScriptedAI(pCreature)
    {
        m_pInstance = (ScriptedInstance*)pCreature->GetInstanceData();
        Reset();
    }

    ScriptedInstance* m_pInstance;

    uint32 m_uiMarkDetonationTimer;
    uint32 m_uiMarkFlamesTimer;
    uint32 m_uiCommandingShoutTimer;
    uint32 m_uiCleaveTimer;

    void Reset() override
    {
        m_uiMarkDetonationTimer = 10000;
        m_uiMarkFlamesTimer = 6000;
        m_uiCommandingShoutTimer = urand(12000, 25000);
        m_uiCleaveTimer = urand(4000, 8000);
        DoCastSpellIfCan(m_creature, SPELL_AURA_FLAMES, CF_AURA_NOT_PRESENT);
        SetAuraFlames(false);
    }

    void MoveInLineOfSight(Unit *pWho) override
    {
        if (!pWho || m_creature->GetVictim())
            return;

        if (pWho->GetTypeId() == TYPEID_PLAYER
            && !m_creature->IsInCombat()
            && m_creature->IsWithinDistInMap(pWho, 29.0f)
            && m_creature->IsWithinLOSInMap(pWho)
            && !pWho->HasAuraType(SPELL_AURA_FEIGN_DEATH)
            && !pWho->HasAuraType(SPELL_AURA_MOD_UNATTACKABLE))
        {
            AttackStart(pWho);
        }
    }

    void Aggro(Unit* /*pWho*/) override
    {
        if (!m_creature->HasAura(SPELL_AURA_FLAMES))
            m_creature->AddAura(SPELL_AURA_FLAMES, ADD_AURA_PERMANENT);

        DoCastSpellIfCan(m_creature, SPELL_COMMANDING_SHOUT, CF_TRIGGERED);
    }

    void JustDied(Unit* /*pKiller*/) override
    {
        SetAuraFlames(false);
    }

    void SetAuraFlames(bool on)
    {
        std::list<Creature *> lCreature;
        GetCreatureListWithEntryInGrid(lCreature, m_creature, MOB_FLAMMECAILLE_GRIFFEMORT, 50.0f);
        GetCreatureListWithEntryInGrid(lCreature, m_creature, MOB_WYRMIDE_GRIFFEMORT, 50.0f);
        GetCreatureListWithEntryInGrid(lCreature, m_creature, MOB_RONGE_GRIFFEMORT, 50.0f);

        for (const auto& itr : lCreature)
        {
            if (!itr->IsAlive())
                continue;

            if (on && m_creature->IsAlive())
            {
                if (m_creature->IsWithinDistInMap(itr, 15.0f))
                {
                    if (!itr->HasAura(SPELL_AURA_FLAMES))
                        itr->AddAura(SPELL_AURA_FLAMES);
                }
                else
                    itr->RemoveAurasDueToSpell(SPELL_AURA_FLAMES);
            }
            else
                itr->RemoveAurasDueToSpell(SPELL_AURA_FLAMES);
        }
    }

    void UpdateAI(const uint32 uiDiff) override
    {
        if (!m_creature->SelectHostileTarget() || !m_creature->GetVictim())
            return;

        SetAuraFlames(true);

        if (m_uiCleaveTimer < uiDiff)
        {
            if (DoCastSpellIfCan(m_creature->GetVictim(), SPELL_CLEAVE2) == CAST_OK)
                m_uiCleaveTimer = urand(4000, 8000);
        }
        else
            m_uiCleaveTimer -= uiDiff;

        if (m_uiCommandingShoutTimer < uiDiff)
        {
            if (DoCastSpellIfCan(m_creature, SPELL_COMMANDING_SHOUT) == CAST_OK)
                m_uiCommandingShoutTimer = urand(12000, 25000);
        }
        else
            m_uiCommandingShoutTimer -= uiDiff;

        if (m_uiMarkFlamesTimer < uiDiff)
        {
            if (Unit* pUnit = m_creature->SelectAttackingTarget(ATTACKING_TARGET_RANDOM, 0))
            {
                if (DoCastSpellIfCan(pUnit, SPELL_MARK_FLAMES) == CAST_OK)
                    m_uiMarkFlamesTimer = 15000;
            }
        }
        else
            m_uiMarkFlamesTimer -= uiDiff;

        if (m_uiMarkDetonationTimer < uiDiff)
        {
            if (Unit* pUnit = m_creature->SelectAttackingTarget(ATTACKING_TARGET_RANDOM, 0))
            {
                if (pUnit->IsAlive())
                {
                    pUnit->CastSpell(pUnit, SPELL_MARK_DETONATION, true);
                    m_uiMarkDetonationTimer = 20000;
                }
            }
        }
        else
            m_uiMarkDetonationTimer -= uiDiff;

        DoMeleeAttackIfReady();
    }
};

CreatureAI* GetAI_npc_death_talon_Captain(Creature* pCreature)
{
    return new npc_death_talon_CaptainAI(pCreature);
}

/**************************
*** Death Talon Seether ***
***************************/

enum
{
    SPELL_FRENZY         = 22428,
    SPELL_FLAME_BUFFET   = 22433,

    EMOTE_FRENZY         = 7797
};

struct npc_death_talon_SeetherAI : public ScriptedAI
{
    npc_death_talon_SeetherAI(Creature* pCreature) : ScriptedAI(pCreature)
    {
        Reset();
    }

    uint32 m_uiFlameBuffetTimer;
    uint32 m_uiFrenzyTimer;
    bool m_bEngaged;

    void Reset() override
    {
        m_uiFlameBuffetTimer = urand(5000, 10000);
        m_uiFrenzyTimer = 15000;
        m_bEngaged = false;
    }

    void UpdateAI(const uint32 uiDiff) override
    {
        if (!m_creature->SelectHostileTarget() || !m_creature->GetVictim())
            return;

        if (m_uiFrenzyTimer < uiDiff)
        {
            if (DoCastSpellIfCan(m_creature, SPELL_FRENZY) == CAST_OK)
            {
                DoScriptText(EMOTE_FRENZY, m_creature);
                m_uiFrenzyTimer = 15000;
            }
        }
        else m_uiFrenzyTimer -= uiDiff;

        if (!m_bEngaged)
        {
            if (m_creature->CanReachWithMeleeAutoAttack(m_creature->GetVictim()))
                m_bEngaged = true;
        }
        else
        {
            if (m_uiFlameBuffetTimer < uiDiff)
            {
                if (DoCastSpellIfCan(m_creature->GetVictim(), SPELL_FLAME_BUFFET) == CAST_OK)
                    m_uiFlameBuffetTimer = urand(8000, 12000);
            }
            else m_uiFlameBuffetTimer -= uiDiff;
        }

        DoMeleeAttackIfReady();
    }
};

CreatureAI* GetAI_npc_death_talon_Seether(Creature* pCreature)
{
    return new npc_death_talon_SeetherAI(pCreature);
}


void AddSC_blackwing_lair_death_talon_captain()
{
    Script* pNewScript;

    pNewScript = new Script;
    pNewScript->Name = "npc_death_talon_Captain";
    pNewScript->GetAI = &GetAI_npc_death_talon_Captain;
    pNewScript->RegisterSelf();

    pNewScript = new Script;
    pNewScript->Name = "npc_death_talon_Seether";
    pNewScript->GetAI = &GetAI_npc_death_talon_Seether;
    pNewScript->RegisterSelf();
}

} // namespace mod_blackwing_lair
