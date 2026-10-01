/* Copyright (C) 2006 - 2011 ScriptDev2 <https://scriptdev2.svn.sourceforge.net/>
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
SDName: boss_vael
SD%Complete: 75
SDComment: the quest accept only; the rest of him is mod-blackwing-lair's and his rows'
SDCategory: Blackwing Lair
EndScriptData */

#include "scriptPCH.h"
#include "blackwing_lair.h"

// Vaelastrasz the Corrupt: his quest binds the instance to the one who accepts it (a guid in a slot, which no
// row can say), so it stays here. The rest of him -- his gossip, speech, Nefarius's intro and the fight -- is
// mod-blackwing-lair's copy of this file while the module is loaded, and his rows while it is not
// (trt A28 second pass, AM1).

enum
{
    QUEST_NEFARIUS_CORRUPTION   = 8730
};

bool QuestAccept_vaelastrasz(Player* pPlayer, Creature* pCreature, const Quest* pQuest)
{
    ScriptedInstance* m_pInstance = (ScriptedInstance*)pCreature->GetInstanceData();

    if (nullptr == m_pInstance)
        return false;

    if (pQuest->GetQuestId() == QUEST_NEFARIUS_CORRUPTION)
    {
            // Only one may accept
            if (m_pInstance->GetData(TYPE_SCEPTER_RUN) != NOT_STARTED)
            {
                pPlayer->FailQuest(QUEST_NEFARIUS_CORRUPTION);
                return false;
            }

            m_pInstance->SetData(TYPE_SCEPTER_RUN, SPECIAL);
            m_pInstance->SetData(DATA_SCEPTER_CHAMPION, pPlayer->GetObjectGuid());

            // Permanently bind player to instance
            pCreature->GetMap()->BindToInstanceOrRaid(pPlayer, pCreature->GetRespawnTimeEx(), true);

            return true;
    }

    return false;
}

void AddSC_boss_vael()
{
    Script* pNewScript;

    pNewScript = new Script;
    pNewScript->Name = "boss_vaelastrasz";
    pNewScript->pQuestAcceptNPC = &QuestAccept_vaelastrasz;
    pNewScript->RegisterSelf();
}
