/* This file is part of the ScriptDev2 Project. See AUTHORS file for Copyright information
 * This program is free software licensed under GPL version 2
 * Please see the included DOCS/LICENSE.TXT for more information */

// The Onyxian Whelp, taken out of boss_onyxia.cpp: it goes to mod-onyxias-lair and its rows with
// the instance, while Onyxia stays in the core (trt A33, AM1).
#include "scriptPCH.h"

namespace mod_onyxias_lair
{


struct OnyxianWhelpAI: public ScriptedAI
{
    OnyxianWhelpAI(Creature* pCreature) : ScriptedAI(pCreature)
    {
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

CreatureAI* GetAI_npc_onyxian_whelp(Creature* pCreature)
{
    return new OnyxianWhelpAI(pCreature);
}

void AddSC_onyxian_whelp()
{
    Script* newscript = new Script;
    newscript->Name = "npc_onyxian_whelp";
    newscript->GetAI = &GetAI_npc_onyxian_whelp;
    newscript->RegisterSelf();
}

} // namespace mod_onyxias_lair
