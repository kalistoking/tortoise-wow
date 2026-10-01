// The Death Talons, the corrupted whelps and the Vael-room trigger, taken out of
// instance_blackwing_lair.cpp: they go to mod-blackwing-lair and its rows, while the instance,
// the technicians (one threat list shared through it) and the other bosses stay in the core (trt A28, AM1).
#include "scriptPCH.h"
#include "dungeons/blackwing_lair/blackwing_lair.h"

namespace mod_blackwing_lair
{


enum { AT_ENTER_VAEL_ROOM = 3626 };

bool AreaTrigger_at_enter_vael_room(Player *pPlayer, const AreaTriggerEntry* pAt)
{
    if (pAt->id == AT_ENTER_VAEL_ROOM)
    {
        if (pPlayer->IsGameMaster())
            return false;

        if (ScriptedInstance* pInstance = (ScriptedInstance*)pPlayer->GetMap()->GetInstanceData())
        {
            if (pInstance->GetData(TYPE_VAEL_EVENT) != DONE)
                pInstance->SetData(TYPE_VAEL_EVENT, DONE);
        }
    }

    return false;
}

/*######
## npc_death_talon
######*/

enum
{
    NPC_OVERSEER                = 12461,
    NPC_WYRMGUARD               = 12460,

    SPELL_CLEAVE                = 15284,
    SPELL_WARSTOMP              = 24375,
    SPELL_FIREBLAST             = 20623,
    SPELL_BROODPOWER_BLUE       = 22285,
    SPELL_BROODPOWER_BLACK      = 22287,
    SPELL_BROODPOWER_BRONZE     = 22286,
    SPELL_BROODPOWER_RED        = 22283,
    SPELL_BROODPOWER_GREEN      = 22288,

    SPELL_FIRE_VULNERABILITY    = 22277,
    SPELL_FROST_VULNERABILITY   = 22278,
    SPELL_SHADOW_VULNERABILITY  = 22279,
    SPELL_NATURE_VULNERABILITY  = 22280,
    SPELL_ARCANE_VULNERABILITY  = 22281
};

struct npc_death_talonAI : public ScriptedAI
{
    npc_death_talonAI(Creature* pCreature) : ScriptedAI(pCreature)
    {
        m_uiBroodPower = RandomPower();
        m_uiSchoolSensibility = RandomSensibility();
        m_bIsOverSeer = (pCreature->GetEntry() == NPC_OVERSEER);
        Reset();
    }

    uint32 m_uiCleaveTimer;
    uint32 m_uiWarStompTimer;
    uint32 m_uiFireBlastTimer;
    uint32 m_uiBroodPower;
    uint32 m_uiSchoolSensibility;
    bool m_bIsOverSeer;

    void Reset() override
    {
        m_uiCleaveTimer = urand(5000, 9000);
        m_uiWarStompTimer = 8000;
        m_uiFireBlastTimer = 8000;
    }

    void JustDied(Unit* /*pKiller*/) override
    {
        m_uiBroodPower = RandomPower();
        m_uiSchoolSensibility = RandomSensibility();
    }

    void Aggro(Unit* /*pWho*/) override
    {
        // aggro Master Elementalist with the pull
        if (!m_bIsOverSeer)
            m_creature->CallForHelp(15.0f);
    }

    uint32 RandomPower()
    {
        switch (urand(0, 4))
        {
            case 0:
                return SPELL_BROODPOWER_BLUE;
            case 1:
                return SPELL_BROODPOWER_BLACK;
            case 2:
                return SPELL_BROODPOWER_BRONZE;
            case 3:
                return SPELL_BROODPOWER_RED;
            case 4:
                return SPELL_BROODPOWER_GREEN;
        }
        return (0);
    }

    uint32 RandomSensibility()
    {
        switch (urand(0, 4))
        {
            case 0:
                return SPELL_FIRE_VULNERABILITY;
            case 1:
                return SPELL_FROST_VULNERABILITY;
            case 2:
                return SPELL_SHADOW_VULNERABILITY;
            case 3:
                return SPELL_NATURE_VULNERABILITY;
            case 4:
                return SPELL_ARCANE_VULNERABILITY;
        }
        return (0);
    }

    void UpdateAI(const uint32 uiDiff) override
    {
        if (!m_bIsOverSeer && !m_creature->HasAura(m_uiBroodPower))
            m_creature->AddAura(m_uiBroodPower);

        if (!m_creature->HasAura(m_uiSchoolSensibility))
            m_creature->AddAura(m_uiSchoolSensibility);

        if (!m_creature->SelectHostileTarget() || !m_creature->GetVictim())
            return;

        if (m_uiCleaveTimer < uiDiff)
        {
            if (DoCastSpellIfCan(m_creature->GetVictim(), SPELL_CLEAVE) == CAST_OK)
                m_uiCleaveTimer = urand(5000, 9000);
        }
        else
            m_uiCleaveTimer -= uiDiff;

        if (!m_bIsOverSeer)
        {
            if (m_uiWarStompTimer < uiDiff)
            {
                if (DoCastSpellIfCan(m_creature, SPELL_WARSTOMP) == CAST_OK)
                    m_uiWarStompTimer = urand(8000, 14000);
            }
            else
                m_uiWarStompTimer -= uiDiff;
        }
        else
        {
            if (m_uiFireBlastTimer < uiDiff)
            {
                if (Unit* pTarget = m_creature->SelectAttackingTarget(ATTACKING_TARGET_RANDOM, 0))
                {
                    if (DoCastSpellIfCan(pTarget, SPELL_FIREBLAST) == CAST_OK)
                        m_uiFireBlastTimer = 10000;
                }
            }
            else
                m_uiFireBlastTimer -= uiDiff;
        }

        DoMeleeAttackIfReady();
    }
};

CreatureAI* GetAI_npc_death_talon(Creature* pCreature)
{
    return new npc_death_talonAI(pCreature);
}

struct CorruptedWhelpAI : public ScriptedAI
{
    CorruptedWhelpAI(Creature* pCreature) : ScriptedAI(pCreature)
    {
        Reset();
    }

    void Reset() override
    {
    }

    void UpdateAI(const uint32 uiDiff) override
    {
        if (!m_creature->SelectHostileTarget() || !m_creature->GetVictim())
            return;

        DoMeleeAttackIfReady();
    }
};

CreatureAI* GetAI_npc_corrupted_whelp(Creature* pCreature)
{
    return new CorruptedWhelpAI(pCreature);
}


void AddSC_blackwing_lair_trash()
{
    Script* pNewscript;

    pNewscript = new Script;
    pNewscript->Name = "at_enter_vael_room";
    pNewscript->pAreaTrigger = &AreaTrigger_at_enter_vael_room;
    pNewscript->RegisterSelf();

    pNewscript = new Script;
    pNewscript->Name = "npc_death_talon";
    pNewscript->GetAI = &GetAI_npc_death_talon;
    pNewscript->RegisterSelf();

    pNewscript = new Script;
    pNewscript->Name = "npc_corrupted_whelp";
    pNewscript->GetAI = &GetAI_npc_corrupted_whelp;
    pNewscript->RegisterSelf();
}

} // namespace mod_blackwing_lair
