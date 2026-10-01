/* Copyright (C) 2006 - 2009 ScriptDev2 <https://scriptdev2.svn.sourceforge.net/>
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
SDName: Razorfen_Downs
SD%Complete: 100
SDComment: Support for Henry Stern(2 recipes)
SDCategory: Razorfen Downs
EndScriptData */

/* ContentData
npc_henry_stern
EndContentData */

#include "scriptPCH.h"
#include "dungeons/razorfen_downs/razorfen_downs.h"

namespace mod_razorfen_downs
{


/*###
# npc_henry_stern
####*/

enum
{
    SPELL_GOLDTHORN_TEA = 13028,
    SPELL_TEACHING_GOLDTHORN_TEA = 13029,
    SPELL_MIGHT_TROLLS_BLOOD_POTION = 3451,
    SPELL_TEACHING_MIGHTY_TROLLS_BLOOD_POTION = 13030,
    GOSSIP_TEXT_TEA_ANSWER = 2114,
    GOSSIP_TEXT_POTION_ANSWER = 2115,
};

#define GOSSIP_ITEM_TEA "Teach me the cooking recipe"
#define GOSSIP_ITEM_POTION "Teach me the alchemy recipe"

bool GossipHello_npc_henry_stern(Player* pPlayer, Creature* pCreature)
{
    if (pPlayer->GetSkillValueBase(SKILL_COOKING) >= 175 && !pPlayer->HasSpell(SPELL_GOLDTHORN_TEA))
        pPlayer->ADD_GOSSIP_ITEM(GOSSIP_ICON_CHAT, GOSSIP_ITEM_TEA, GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF + 1);

    if (pPlayer->GetSkillValueBase(SKILL_ALCHEMY) >= 180 && !pPlayer->HasSpell(SPELL_MIGHT_TROLLS_BLOOD_POTION))
        pPlayer->ADD_GOSSIP_ITEM(GOSSIP_ICON_CHAT, GOSSIP_ITEM_POTION, GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF + 2);

    pPlayer->SEND_GOSSIP_MENU(pPlayer->GetGossipTextId(pCreature), pCreature->GetGUID());
    return true;
}

bool GossipSelect_npc_henry_stern(Player* pPlayer, Creature* pCreature, uint32 uiSender, uint32 uiAction)
{
    if (uiAction == GOSSIP_ACTION_INFO_DEF + 1)
    {
        pCreature->CastSpell(pPlayer, SPELL_TEACHING_GOLDTHORN_TEA, true);
        pPlayer->SEND_GOSSIP_MENU(GOSSIP_TEXT_TEA_ANSWER, pCreature->GetGUID());
    }

    if (uiAction == GOSSIP_ACTION_INFO_DEF + 2)
    {
        pPlayer->SEND_GOSSIP_MENU(GOSSIP_TEXT_POTION_ANSWER, pCreature->GetGUID());
        pCreature->CastSpell(pPlayer, SPELL_TEACHING_MIGHTY_TROLLS_BLOOD_POTION, true);
    }

    return true;
}

enum
{
    SPELL_MIND_BLAST = 8105,
    FACTION_SCOURGE = 974,
    MODEL_ID_UNDEAD = 10698
};

struct boss_ladyFaltheressAI : public ScriptedAI
{
    boss_ladyFaltheressAI(Creature* pCreature) : ScriptedAI(pCreature)
    {
        Reset();
    }

    uint32 MindBlast_Timer;

    void Reset() override
    {
        MindBlast_Timer = 8000;
    }

    void TransformIntoHostile()
    {
        m_creature->SetFactionTemplateId(FACTION_SCOURGE);
        //TODO : find the humain appearance she transforms out of.
        m_creature->SetDisplayId(MODEL_ID_UNDEAD);
    }

    void UpdateAI(const uint32 diff) override
    {
        if (!m_creature->SelectHostileTarget() || !m_creature->GetVictim())
            return;

        if (MindBlast_Timer < diff)
        {
            if (DoCastSpellIfCan(m_creature->GetVictim(), SPELL_MIND_BLAST) == CAST_OK)
                MindBlast_Timer = 8000;
        }
        else
            MindBlast_Timer -= diff;
        DoMeleeAttackIfReady();
    }
};

CreatureAI* GetAI_boss_ladyFaltheress(Creature* pCreature)
{
    return new boss_ladyFaltheressAI(pCreature);
}

bool GOHello_go_holding_pen(Player* pPlayer, GameObject* pGo)
{
    if (Creature* pCreature = pGo->FindNearestCreature(14686, 20.000000, true))
    {
        if (boss_ladyFaltheressAI* pAI = dynamic_cast<boss_ladyFaltheressAI*>(pCreature->AI()))
            pAI->TransformIntoHostile();
    }
    return true;
}

/*######
## go_gong
######*/

bool GOHello_go_gong(Player* pPlayer, GameObject* pGO)
{
    //basic support, not blizzlike data is missing...
    ScriptedInstance* pInstance = (ScriptedInstance*)pGO->GetInstanceData();

    if (pInstance)
    {
        sLog.outString("SERVER STARTUP TIME: %i minutes %i seconds", WorldTimer::getMSTime() / 60000, (WorldTimer::getMSTime() % 60000) / 1000);
        pInstance->SetData(DATA_GONG_WAVES, pInstance->GetData(DATA_GONG_WAVES) + 1);
        return true;
    }

    return false;
}

enum eTombCreature
{
    SPELL_WEB = 745
};

struct npc_tomb_creatureAI : public ScriptedAI
{
    npc_tomb_creatureAI(Creature* pCreature) : ScriptedAI(pCreature)
    {
        pInstance = (ScriptedInstance*)pCreature->GetInstanceData();
        Reset();
    }

    ScriptedInstance* pInstance;

    uint32 uiWebTimer;

    void Reset() override
    {
        uiWebTimer = urand(5000, 8000);
    }

    void UpdateAI(const uint32 uiDiff) override
    {
        if (!UpdateVictim())
            return;

        //from acid
        if (m_creature->GetEntry() == CREATURE_TOMB_REAVER)
        {
            if (uiWebTimer <= uiDiff)
            {
                DoCast(m_creature->GetVictim(), SPELL_WEB);
                uiWebTimer = urand(7000, 16000);
            }
            else uiWebTimer -= uiDiff;
        }

        DoMeleeAttackIfReady();
    }

    void JustDied(Unit* pKiller) override
    {
        if (pInstance)
            pInstance->SetData(DATA_GONG_WAVES, pInstance->GetData(DATA_GONG_WAVES) + 1);
    }
};

CreatureAI* GetAI_npc_tomb_creature(Creature* pCreature)
{
    return new npc_tomb_creatureAI(pCreature);
}

bool GOQuestRewarded_go_belnistrasz(Player* pPlayer, GameObject* pGo, Quest const* pQuest)
{
    if (pQuest->GetQuestId() == 0)
        pGo->Delete();

    return true;
}

void AddSC_razorfen_downs()
{
    Script* newscript;

    newscript = new Script;
    newscript->Name = "npc_henry_stern";
    newscript->pGossipHello = &GossipHello_npc_henry_stern;
    newscript->pGossipSelect = &GossipSelect_npc_henry_stern;
    newscript->RegisterSelf();
    /*
    newscript = new Script;
    newscript->Name = "go_holding_pen";
    newscript->pGOHello = &GOHello_go_holding_pen;
    newscript->RegisterSelf();
    */
    newscript = new Script;
    newscript->Name = "boss_lady_faltheress";
    newscript->GetAI = &GetAI_boss_ladyFaltheress;
    newscript->RegisterSelf();

    newscript = new Script;
    newscript->Name = "go_gong";
    newscript->pGOHello =           &GOHello_go_gong;
    newscript->RegisterSelf();
    /*
    newscript = new Script;
    newscript->Name = "go_belnistrasz";
    newscript->pQuestRewardedGO = &GOQuestRewarded_go_belnistrasz;
    newscript->RegisterSelf();
    */
    newscript = new Script;
    newscript->Name = "npc_tomb_creature";
    newscript->GetAI = &GetAI_npc_tomb_creature;
    newscript->RegisterSelf();
}

} // namespace mod_razorfen_downs
