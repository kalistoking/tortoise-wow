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

#ifndef MANGOS_DBCSTORES_H
#define MANGOS_DBCSTORES_H

#include "Common.h"
#include "Database/DBCStore.h"
#include "DBCStructure.h"

#include <list>

bool IsAcceptableClientBuild(uint32 build);
std::string AcceptableClientBuildsListStr();

char const* GetPetName(uint32 petfamily, uint32 dbclang);
uint32 GetTalentSpellCost(uint32 spellId);
uint32 GetTalentSpellCost(TalentSpellPos const* pos);
TalentSpellPos const* GetTalentSpellPos(uint32 spellId);

WMOAreaTableEntry const* GetWMOAreaTableEntryByTripple(int32 rootid, int32 adtid, int32 groupid);

uint32 GetVirtualMapForMapAndZone(uint32 mapid, uint32 zoneId);

// [-ZERO] bool IsTotemCategoryCompatiableWith(uint32 itemTotemCategoryId, uint32 requiredTotemCategoryId);

bool Zone2MapCoordinates(float& x,float& y,uint32 zone);
bool Map2ZoneCoordinates(float& x,float& y,uint32 zone);

uint32 GetTalentInspectBitPosInTab(uint32 talentId);
uint32 GetTalentTabInspectBitSize(uint32 talentTabId);
uint32 const* /*[3]*/ GetTalentTabPages(uint32 cls);

bool IsPointInAreaTriggerZone(AreaTriggerEntry const* atEntry, uint32 mapid, float x, float y, float z, float delta = 0.0f);

typedef std::multimap<uint32, SkillRaceClassInfoEntry const*> SkillRaceClassInfoMap;
typedef std::pair<SkillRaceClassInfoMap::iterator, SkillRaceClassInfoMap::iterator> SkillRaceClassInfoBounds;
SkillRaceClassInfoEntry const* GetSkillRaceClassInfo(uint32 skill, uint8 race, uint8 class_);

uint8 ValidateName(std::wstring const& name);

extern TW_CORE_DATA DBCStorage <AuctionHouseEntry>            sAuctionHouseStore;
extern TW_CORE_DATA DBCStorage <BankBagSlotPricesEntry>       sBankBagSlotPricesStore;
//extern DBCStorage <ChatChannelsEntry>           sChatChannelsStore; -- accessed using function, no usable index
extern TW_CORE_DATA DBCStorage <ChrClassesEntry>              sChrClassesStore;
extern TW_CORE_DATA DBCStorage <ChrRacesEntry>                sChrRacesStore;
extern TW_CORE_DATA DBCStorage <CinematicSequencesEntry>      sCinematicSequencesStore;
extern TW_CORE_DATA DBCStorage <CreatureDisplayInfoEntry>     sCreatureDisplayInfoStore;
extern TW_CORE_DATA DBCStorage <CreatureDisplayInfoExtraEntry>sCreatureDisplayInfoExtraStore;
extern TW_CORE_DATA DBCStorage <CreatureModelDataEntry>       sCreatureModelDataStore;
extern TW_CORE_DATA DBCStorage <CreatureFamilyEntry>          sCreatureFamilyStore;
extern TW_CORE_DATA DBCStorage <CreatureTypeEntry>            sCreatureTypeStore;
extern TW_CORE_DATA DBCStorage <DurabilityCostsEntry>         sDurabilityCostsStore;
extern TW_CORE_DATA DBCStorage <DurabilityQualityEntry>       sDurabilityQualityStore;
extern TW_CORE_DATA DBCStorage <EmotesEntry>                  sEmotesStore;
extern TW_CORE_DATA DBCStorage <EmotesTextEntry>              sEmotesTextStore;
extern TW_CORE_DATA DBCStorage <GameObjectDisplayInfoEntry>   sGameObjectDisplayInfoStore;

extern TW_CORE_DATA DBCStorage <ItemBagFamilyEntry>           sItemBagFamilyStore;
//extern DBCStorage <ItemDisplayInfoEntry>      sItemDisplayInfoStore; -- not used currently
extern TW_CORE_DATA DBCStorage <ItemRandomPropertiesEntry>    sItemRandomPropertiesStore;
extern TW_CORE_DATA DBCStorage <ItemSetEntry>                 sItemSetStore;
extern TW_CORE_DATA DBCStorage <LockEntry>                    sLockStore;
extern TW_CORE_DATA DBCStorage <QuestSortEntry>               sQuestSortStore;
extern TW_CORE_DATA DBCStorage <SkillLineEntry>               sSkillLineStore;
extern TW_CORE_DATA DBCStorage <SkillRaceClassInfoEntry>      sSkillRaceClassInfoStore;
extern TW_CORE_DATA DBCStorage <SkillTiersEntry>				 sSkillTiersStore;
extern TW_CORE_DATA DBCStorage <SpellCastTimesEntry>          sSpellCastTimesStore;
extern TW_CORE_DATA DBCStorage <SpellDurationEntry>           sSpellDurationStore;
extern TW_CORE_DATA DBCStorage <SpellFocusObjectEntry>        sSpellFocusObjectStore;
extern TW_CORE_DATA DBCStorage <SpellItemEnchantmentEntry>    sSpellItemEnchantmentStore;
extern TW_CORE_DATA DBCStorage <SpellCategoryEntry>           sSpellCategoryStore;
extern TW_CORE_DATA SpellCategoriesStore                      sSpellCategoriesStore;
extern TW_CORE_DATA PetFamilySpellsStore                      sPetFamilySpellsStore;
extern TW_CORE_DATA DBCStorage <SpellRadiusEntry>             sSpellRadiusStore;
extern TW_CORE_DATA DBCStorage <SpellRangeEntry>              sSpellRangeStore;
extern TW_CORE_DATA DBCStorage <SpellIconEntry>               sSpellIconStore;
extern TW_CORE_DATA DBCStorage <SpellShapeshiftFormEntry>     sSpellShapeshiftFormStore;
extern TW_CORE_DATA DBCStorage <SpellVisualEntry>             sSpellVisualStore;
extern TW_CORE_DATA DBCStorage <StableSlotPricesEntry>        sStableSlotPricesStore;
extern TW_CORE_DATA DBCStorage <TalentEntry>                  sTalentStore;
extern TW_CORE_DATA DBCStorage <TalentTabEntry>               sTalentTabStore;
extern TW_CORE_DATA DBCStorage <TaxiPathEntry>                sTaxiPathStore;
extern TW_CORE_DATA TaxiMask                                  sTaxiNodesMask;
extern TW_CORE_DATA TaxiPathSetBySource                       sTaxiPathSetBySource;
extern TW_CORE_DATA TaxiPathNodesByPath                       sTaxiPathNodesByPath;
extern TW_CORE_DATA DBCStorage <WMOAreaTableEntry>            sWMOAreaTableStore;
//extern DBCStorage <WorldMapAreaEntry>           sWorldMapAreaStore; -- use Zone2MapCoordinates and Map2ZoneCoordinates
//extern DBCStorage <WorldMapOverlayEntry>         sWorldMapOverlayStore;
extern TW_CORE_DATA DBCStorage <WorldSafeLocsEntry>           sWorldSafeLocsStore;

void LoadDBCStores(std::string const& dataPath);

char const* GetRaceName(uint8 race, uint8 locale);
char const* GetClassName(uint8 class_, uint8 locale);

#endif
