/*
 * Scripted for --> Mangos-Zero Special Thanks for VladimirMangos, Yehonal, Theluda, Drkotas, Shin, Wrath Team.
 * Copyright (C) 2006 - 2009 ScriptDev2 <https://scriptdev2.svn.sourceforge.net/>
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
SDName: Wailing Caverns
SD%Complete:
SDComment:
SDCategory: Wailing Caverns
EndScriptData */

/* ContentData
npc_evolving_ectoplasm
EndContentData */

#include "scriptPCH.h"
#include "dungeons/wailing_caverns/def_wailing_caverns.h"

namespace mod_wailing_caverns
{


enum
{
    SPELL_IMMUNE_FIRE    =   7942,
    SPELL_IMMUNE_FROST   =   7940,
    SPELL_IMMUNE_NATURE  =   7941,
    SPELL_IMMUNE_SHADOW  =   7743,
};

struct EvolvingEctoplasmAI : public ScriptedAI
{
    EvolvingEctoplasmAI(Creature* pCreature) : ScriptedAI(pCreature)
    {
        Reset();
    }

    uint32 m_uiImmuneTimer;
    bool   isImmune;

    void Reset() override
    {
        m_creature->RemoveAllAuras();
        m_uiImmuneTimer = 0;
        isImmune = false;
    }

    void SpellHit(WorldObject* pCaster, const SpellEntry* pSpell) override
    {
        if (!isImmune)
        {
            if (pSpell->School == SPELL_SCHOOL_FROST)
            {
//                m_creature->SetDisplayId(1751);
                DoCastSpellIfCan(m_creature, SPELL_IMMUNE_FROST, CF_AURA_NOT_PRESENT);
                m_uiImmuneTimer = 10000;
                isImmune = true;
            }
            else if (pSpell->School == SPELL_SCHOOL_FIRE)
            {
//                m_creature->SetDisplayId(11138);
                DoCastSpellIfCan(m_creature, SPELL_IMMUNE_FIRE, CF_AURA_NOT_PRESENT);
                m_uiImmuneTimer = 10000;
                isImmune = true;
            }
            else if (pSpell->School == SPELL_SCHOOL_NATURE)
            {
//                m_creature->SetDisplayId(4266);
                DoCastSpellIfCan(m_creature, SPELL_IMMUNE_NATURE, CF_AURA_NOT_PRESENT);
                m_uiImmuneTimer = 10000;
                isImmune = true;
            }
            else if (pSpell->School == SPELL_SCHOOL_SHADOW)
            {
//                m_creature->SetDisplayId(767);
                DoCastSpellIfCan(m_creature, SPELL_IMMUNE_SHADOW, CF_AURA_NOT_PRESENT);
                m_uiImmuneTimer = 10000;
                isImmune = true;
            }
        }
    }

    void UpdateAI(const uint32 uiDiff) override
    {
        if (m_uiImmuneTimer < uiDiff)
        {
//            m_creature->SetDisplayId(1751);
            m_creature->RemoveAurasDueToSpell(SPELL_IMMUNE_SHADOW);
            m_creature->RemoveAurasDueToSpell(SPELL_IMMUNE_FROST);
            m_creature->RemoveAurasDueToSpell(SPELL_IMMUNE_FIRE);
            m_creature->RemoveAurasDueToSpell(SPELL_IMMUNE_NATURE);
            isImmune = false;
        }
        else
            m_uiImmuneTimer -= uiDiff;

        if (!m_creature->SelectHostileTarget() || !m_creature->GetVictim())
            return;

        DoMeleeAttackIfReady();
    }
};

CreatureAI* GetAI_EvolvingEctoplasmAI(Creature* pCreature)
{
    return new EvolvingEctoplasmAI(pCreature);
}

void AddSC_wailing_caverns()
{
    Script *newscript;

    newscript = new Script;
    newscript->Name = "npc_evolving_ectoplasm";
    newscript->GetAI = &GetAI_EvolvingEctoplasmAI;
    newscript->RegisterSelf();
}

} // namespace mod_wailing_caverns
