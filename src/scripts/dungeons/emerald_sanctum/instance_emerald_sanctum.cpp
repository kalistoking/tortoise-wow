#include "scriptPCH.h"
#include "emerald_sanctum.h"

instance_emerald_sanctum::instance_emerald_sanctum(Map* p_Map) : ScriptedInstance(p_Map)
{
	instance_emerald_sanctum::Initialize();
}

void instance_emerald_sanctum::Initialize()
{
	m_uiSolniusGUID = 0;
	m_uiErenniusGUID = 0;
	m_mTrashGUID.clear();
	std::memset(m_encounters, 0, sizeof(m_encounters));
}

void instance_emerald_sanctum::OnCreatureCreate(Creature* pCreature)
{
	switch (pCreature->GetEntry())
	{
		case NPC_SOLNIUS:
			m_uiSolniusGUID = pCreature->GetGUID();
			break;
		case NPC_ERENNIUS:
			m_uiErenniusGUID = pCreature->GetGUID();
			break;
		case NPC_SANCTUM_DREAMER:
		case NPC_SANCTUM_DRAGONKIN:
		case NPC_SANCTUM_WYRM:
		case NPC_SANCTUM_SUPRESSOR:
		case NPC_SANCTUM_WYRMKIN:
		case NPC_SANCTUM_SCALEBANE:
			m_mTrashGUID.push_back(pCreature->GetGUID());
			break;
	}
}

uint32 instance_emerald_sanctum::GetData(uint32 type) 
{
	if (type < MAX_DATA)
		return m_encounters[type];
  return 0;
}


void instance_emerald_sanctum::SetData(uint32 type, uint32 data) 
{
	if (type < MAX_DATA)
		m_encounters[type] = data;
}




bool instance_emerald_sanctum::IsEncounterInProgress() const
{
	for (uint32 i : m_encounters)
		if (i == IN_PROGRESS)
			return true;
	return false;
}

void instance_emerald_sanctum::OnCreatureDeath(Creature* pCreature)
{
	switch (pCreature->GetEntry())
	{
		case NPC_SANCTUM_DREAMER:
		case NPC_SANCTUM_DRAGONKIN:
		case NPC_SANCTUM_WYRM:
		case NPC_SANCTUM_SUPRESSOR:
		case NPC_SANCTUM_WYRMKIN:
		case NPC_SANCTUM_SCALEBANE:
			m_mTrashGUID.remove(pCreature->GetGUID());
			break;
	}
}

uint64 instance_emerald_sanctum::GetData64(uint32 uiType)
{
	switch (uiType)
	{
		case DATA_SOLNIUS:
			return m_uiSolniusGUID;
		case DATA_ERENNIUS:
			return m_uiErenniusGUID;
		default:
			return 0;
	}
}

InstanceData* GetInstanceData_instance_emerald_sanctum(Map* p_Map)
{
	return new instance_emerald_sanctum(p_Map);
}

void AddSC_instance_emerald_sanctum()
{
	Script* newscript;

	newscript = new Script;
	newscript->Name = "instance_emerald_sanctum";
	newscript->GetInstanceData = &GetInstanceData_instance_emerald_sanctum;
	newscript->RegisterSelf();
}