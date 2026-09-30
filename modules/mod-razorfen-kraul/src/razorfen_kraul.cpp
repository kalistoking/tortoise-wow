/* This file is part of the ScriptDev2 Project. See AUTHORS file for Copyright information
 * This program is free software; you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation; either version 2 of the License, or
 * (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program; if not, write to the Free Software
 * Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307  USA
 */

/* ScriptData
SDName: Razorfen_Kraul
SD%Complete: 100
SDComment: Quest support: 1144, 1221
SDCategory: Razorfen Kraul
EndScriptData */

/* ContentData
quest_willix_the_importer
EndContentData */

#include "scriptPCH.h"

namespace mod_razorfen_kraul
{


enum
{
    SPELL_DEFENSIVE_STANCE = 7164,
    SPELL_IMPROVED_BLOCKING = 3248,
    SPELL_SHIELD_BASH = 11972,

};

struct RazorfenDefenderAI : public ScriptedAI
{
    RazorfenDefenderAI(Creature* pCreature) : ScriptedAI(pCreature)
    {
        Reset();
    }

    uint32 m_uiImprovedBlocking_Timer;
    uint32 m_uiShieldBash_Timer;

    void Reset() override
    {
        m_uiImprovedBlocking_Timer = 1000;
        m_uiShieldBash_Timer = 6600;
        DoCastSpellIfCan(m_creature, SPELL_DEFENSIVE_STANCE, true);
    }

    void Aggro(Unit* pWho) override
    {
        m_creature->SetInCombatWithZone();
    }

    void UpdateAI(const uint32 uiDiff) override
    {
        if (!m_creature->SelectHostileTarget() || !m_creature->GetVictim())
            return;

        if (m_uiShieldBash_Timer < uiDiff)
        {
            if (DoCastSpellIfCan(m_creature->GetVictim(), SPELL_SHIELD_BASH) == CAST_OK)
                m_uiShieldBash_Timer = 8100;
        }
        else
            m_uiShieldBash_Timer -= uiDiff;

        if (m_uiImprovedBlocking_Timer < uiDiff)
        {
            if (DoCastSpellIfCan(m_creature, SPELL_IMPROVED_BLOCKING, true) == CAST_OK)
                m_uiImprovedBlocking_Timer = urand(6000, 9000);
        }
        else
            m_uiImprovedBlocking_Timer -= uiDiff;

        DoMeleeAttackIfReady();
    }
};

CreatureAI* GetAI_RazorfenDefenderAI(Creature* pCreature)
{
    return new RazorfenDefenderAI(pCreature);
}

void AddSC_razorfen_kraul()
{
    Script* pNewScript;

    pNewScript = new Script;
    pNewScript->Name = "razorfen_defender";
    pNewScript->GetAI = &GetAI_RazorfenDefenderAI;
    pNewScript->RegisterSelf();


}

} // namespace mod_razorfen_kraul
