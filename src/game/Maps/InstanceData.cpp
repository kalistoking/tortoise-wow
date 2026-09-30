/*
 * Copyright (C) 2005-2011 MaNGOS <http://getmangos.com/>
 * Copyright (C) 2009-2011 MaNGOSZero <https://github.com/mangos/zero>
 * Copyright (C) 2011-2016 Nostalrius <https://nostalrius.org>
 * Copyright (C) 2016-2017 Elysium Project <https://github.com/elysium-project>
 *
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

#include "InstanceData.h"
#include "Database/DatabaseEnv.h"
#include "Map.h"
#include "ScriptedInstance.h"
#include "ObjectMgr.h"

#include <sstream>

void InstanceData::SaveToDB()
{
    // no reason to save BGs/Arenas
    if (instance->IsBattleGround())
        return;

    if (!Save())
        return;

    std::string data = Save();
    CharacterDatabase.escape_string(data);

    if (instance->Instanceable())
        CharacterDatabase.PExecute("UPDATE instance SET data = '%s' WHERE id = '%u'", data.c_str(), instance->GetInstanceId());
    else
        CharacterDatabase.PExecute("UPDATE world SET data = '%s' WHERE map = '%u'", data.c_str(), instance->GetId());
}

void GenericInstanceData::Load(char const* data)
{
    m_slots.clear();
    if (!data)
        return;
    std::istringstream in(data);
    uint32 value;
    while (m_slots.size() < MAX_SLOTS && (in >> value))
        m_slots.push_back(value);

    // An encounter the instance closed on is not going on when it opens again: a slot
    // `instance_data_slot` says so goes from 1 (IN_PROGRESS) back to 0, as the scripts' Load do.
    // A transient slot counts what the instance does not keep -- its summons, the objects used --
    // and starts again from 0 with them.
    if (auto const* described = sObjectMgr.GetInstanceDataSlots(instance->GetId()))
        for (auto const& slot : *described)
            if (slot.first < m_slots.size() && ((slot.second.flags & INSTANCE_SLOT_TRANSIENT) ||
                ((slot.second.flags & INSTANCE_SLOT_RESET_IN_PROGRESS) && m_slots[slot.first] == 1)))
                m_slots[slot.first] = 0;
}

bool GenericInstanceData::IsEncounterInProgress() const
{
    if (auto const* described = sObjectMgr.GetInstanceDataSlots(instance->GetId()))
        for (auto const& slot : *described)
            if ((slot.second.flags & INSTANCE_SLOT_ENCOUNTER) && slot.first < m_slots.size() && m_slots[slot.first] == 1)
                return true;
    return false;
}

char const* GenericInstanceData::Save()
{
    std::ostringstream out;
    for (size_t i = 0; i < m_slots.size(); ++i)
        out << (i ? " " : "") << m_slots[i];
    m_saved = out.str();
    return m_saved.c_str();
}

uint32 GenericInstanceData::GetData(uint32 slot)
{
    return slot < m_slots.size() ? m_slots[slot] : 0;
}

void GenericInstanceData::SetData(uint32 slot, uint32 value)
{
    if (slot >= MAX_SLOTS)
    {
        sLog.outError("GenericInstanceData (map %u): slot %u is past the %u there are, not written.", instance->GetId(), slot, MAX_SLOTS);
        return;
    }
    if (slot >= m_slots.size())
        m_slots.resize(slot + 1, 0);
    m_slots[slot] = value;
    // Saved as written: an instance unloading does not save (Map's destructor), and a store written
    // by rows is written rarely.
    SaveToDB();
}

bool InstanceData::CheckConditionCriteriaMeet(Player const* /*player*/, uint32 map_id, WorldObject const* source, uint32 instance_condition_id) const
{
    sLog.outError("Condition system call InstanceData::CheckConditionCriteriaMeet but instance script for map %u not have implementation for player condition criteria with internal id %u for map %u",
                  instance->GetId(), instance_condition_id, map_id);
    return false;
}
