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
SDName: Uldaman
SD%Complete: 100
SDComment: Quest support: 2278 + 1 trash mob.
SDCategory: Uldaman
EndScriptData */

/* ContentData
mob_jadespine_basilisk
npc_lore_keeper_of_norgannon
EndContentData */

#include "scriptPCH.h"
#include "uldaman.h"

/*######
 ## go_keystone_chamber
 ######*/

bool GOHello_go_keystone_chamber(Player* pPlayer, GameObject* pGo)
{
    ScriptedInstance* pInstance = (ScriptedInstance*)pGo->GetInstanceData();

    if (!pInstance)
        return false;

    if (pPlayer)
        pInstance->SetData64(0, pPlayer->GetGUID()); // Ironaya first victim

    if (pGo)
        pGo->SetUInt32Value(GAMEOBJECT_FLAGS, GO_FLAG_INTERACT_COND);

    // save state
    pInstance->SetData(ULDAMAN_ENCOUNTER_IRONAYA_DOOR, DONE);

    return false;
}

// Return true to avoid db script attempt
bool ProcessEventId_event_awaken_stone_keeper(uint32 eventId, Object* source, Object* target, bool isStart)
{
    if (!source || source->GetTypeId() != TYPEID_PLAYER)
        return true;

    if (!target)
        return true;

    if (ScriptedInstance* instance = dynamic_cast<ScriptedInstance*>(((Player*)source)->GetInstanceData()))
        instance->SetData(ULDAMAN_ENCOUNTER_STONE_KEEPERS, IN_PROGRESS);

    return true;
}

enum
{
    SPELL_FIRE_SHIELD       =   2602,
    SPELL_FLAME_BUFFET      =   10452,

};

struct spell_uldaman_awaken_vault_warder : public SpellScript
{
    void OnSetTargetMap(Spell* /*spell*/, SpellEffectIndex /*effIdx*/, uint32& /*targetMode*/, float& /*radius*/, uint32& unMaxTargets, bool& /*selectClosestTargets*/) const override
    {
        unMaxTargets = 2;
    }
};

SpellScript* GetScript_UldamanAwakenVaultWarder(SpellEntry const*)
{
    return new spell_uldaman_awaken_vault_warder();
}

void AddSC_uldaman()
{
    Script *newscript;

    newscript = new Script;
    newscript->Name = "go_keystone_chamber";
    newscript->pGOHello = &GOHello_go_keystone_chamber;
    newscript->RegisterSelf();

    newscript = new Script;
    newscript->Name = "event_awaken_stone_keeper";
    newscript->pProcessEventId = &ProcessEventId_event_awaken_stone_keeper;
    newscript->RegisterSelf();

    newscript = new Script;
    newscript->Name = "spell_uldaman_awaken_vault_warder";
    newscript->GetSpellScript = &GetScript_UldamanAwakenVaultWarder;
    newscript->RegisterSelf();
}
