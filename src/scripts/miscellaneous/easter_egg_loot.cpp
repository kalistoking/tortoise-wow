// The easter eggs' loot and its refund, taken out of random_scripts_3.cpp: the core loads it at
// start (World.cpp calls LoadPlayerEggLoot), so it stays in the core while the rest of
// miscellaneous/ is a module (trt AM1).
#include "scriptPCH.h"
enum
{
    GOSSIP_REFUND_EGG_ITEMS = 64000
};


std::unordered_map<uint32, std::vector<PlayerEggLoot>> playerEggLoot;

uint32 currentEggId = 0;

bool GossipHello_EggRefundNPC(Player* player, Creature* creature)
{
    auto& eggItems = playerEggLoot[player->GetGUIDLow()];

    uint32 count = 0;
    for (const auto& eggLoot : eggItems)
    {
        Item* targetItem = nullptr;
        player->ApplyForAllItems([&targetItem, itemGuid = eggLoot.ItemGuid](Item* item)
            {
                if (targetItem)
                    return;

                if (item->GetGUIDLow() == itemGuid && !item->IsEquipped())
                    targetItem = item;
            });

        if (!eggLoot.Refunded && targetItem)
        {
            if (ItemPrototype const* pProto = sObjectMgr.GetItemPrototype(eggLoot.ItemId))
            {
                std::string const* name = &pProto->Name1;
                int loc_idx = player->GetSession()->GetSessionDbLocaleIndex();
                if (loc_idx >= 0)
                {
                    ItemLocale const* il = sObjectMgr.GetItemLocale(pProto->ItemId);
                    if (il)
                    {
                        if (il->Name.size() > size_t(loc_idx) && !il->Name[loc_idx].empty())
                            name = &il->Name[loc_idx];
                    }
                }
                std::string msg = *name;
                msg += " -> 40 tokens";
                player->ADD_GOSSIP_ITEM(GOSSIP_ICON_MONEY_BAG, msg.c_str(), GOSSIP_SENDER_MAIN, eggLoot.Id);

                if (++count >= GOSSIP_MAX_MENU_ITEMS)
                    break;
            }
        }
    }
    player->SEND_GOSSIP_MENU(GOSSIP_REFUND_EGG_ITEMS, creature->GetGUID());

    return true;
}


bool GossipSelect_EggRefundNPC(Player* player, Creature* creature, uint32 /*uiSender*/, uint32 action)
{
    auto& eggLoot = playerEggLoot[player->GetGUIDLow()];

    auto itr = std::find_if(eggLoot.begin(), eggLoot.end(), [action](PlayerEggLoot& loot) { return action == loot.Id; });
    if (itr != eggLoot.end())
    {

        Item* targetItem = nullptr;
        player->ApplyForAllItems([&targetItem, itemGuid = itr->ItemGuid](Item* item)
            {
                if (targetItem)
                    return;

                if (item->GetGUIDLow() == itemGuid && !item->IsEquipped())
                    targetItem = item;
            });

        if (!itr->Refunded && targetItem)
        {
            player->DestroyItem(targetItem->GetBagSlot(), targetItem->GetSlot(), true);
            itr->Refunded = true;
            LoginDatabase.PExecute("UPDATE `shop_coins` SET `coins` = (`coins`+%u) WHERE `id` = %u", 40, player->GetSession()->GetAccountId());
            CharacterDatabase.PExecute("UPDATE `character_egg_loot` SET refunded = 1 WHERE `id` = %u", itr->Id);
        }
        player->SaveInventoryAndGoldToDB();
    }

    player->CLOSE_GOSSIP_MENU();

    return true;
}


void LoadPlayerEggLoot()
{
    auto result = std::unique_ptr<QueryResult>(CharacterDatabase.Query("SELECT * FROM character_egg_loot"));

    if (result)
    {
        do {
            auto fields = result->Fetch();
            PlayerEggLoot loot{ fields[0].GetUInt32(), fields[1].GetUInt32(), fields[2].GetUInt32() , fields[3].GetUInt32(), fields[4].GetBool() };
            playerEggLoot[loot.PlayerGuid].push_back(std::move(loot));
        } while (result->NextRow());
    }

    result = std::unique_ptr<QueryResult>(CharacterDatabase.Query("SELECT MAX(id) FROM character_egg_loot"));

    if (result)
        currentEggId = (*result)[0].GetUInt32();
}


bool ItemUseSpell_easter_egg(Player* player, Item* item, const SpellCastTargets&)
{
    static std::map<uint32, uint32> weightedDrops;

    static uint32 currentKey = 0;

    if (!currentKey)
    {
        std::vector<uint32> possibleItemIds =
        {
            12303, 13582, 13584, 18768, 23193, 23705, 50003, 50004, 50005, 50007,
            50009, 50011, 50081, 50399, 50400, 50407, 50602, 51421, 51700, 51715,
            51891, 60982, 69001, 69002, 69004, 69006, 80430, 80449, 81081, 81082,
            81085, 81091, 81102, 81152, 81153, 81155, 81158, 81207, 81231, 81232,
            81234, 81235, 81236, 81258, 83150, 83300, 83301, 83302,
            92011, 92012, 92013, 92014, 92016, 92017, 92018, 92019
        };

        if (sWorld.getConfig(CONFIG_BOOL_SEA_NETWORK))
        {
            //clouds on CN
            possibleItemIds.push_back(81239);
            possibleItemIds.push_back(81240);
        }

        for (uint32 itemId : possibleItemIds)
        {
            if (auto shopInfo = sObjectMgr.GetShopEntryInfo(itemId))
            {
                currentKey += static_cast<uint32>(ceil(10'000 / shopInfo->Price));
                weightedDrops[currentKey] = itemId;
            }
            else
            {
                //Shop-exclusive drops, semi-hardcoded for now.
                uint32 price = 100;

                uint32 normalPets[] = { 13582, 50081, 69001, 69002, 81152, 92016};
                uint32 shirts[] = { 92011, 92012, 92013, 92014, 92019 };


                if (std::find(std::begin(normalPets), std::end(normalPets), itemId) != std::end(normalPets))
                {
                    price = 100;
                }
                else if (itemId == 51700 || itemId == 51891) // special pets
                    price = 150;
                else if (std::find(std::begin(shirts), std::end(shirts), itemId) != std::end(shirts))
                {
                    price = 250;
                }
                else if (itemId == 60982) // socks
                    price = 300;
                else
                {
                    //mounts
                    price = 300;
                }


                currentKey += static_cast<uint32>(ceil(10'000 / price));
                weightedDrops[currentKey] = itemId;
            }
        }

        /*int idx = 0;
        float totalOdds = 0.f;
        uint32 maxKey = weightedDrops.rbegin()->first;
        if (FILE* pFile = fopen("eggodds.txt", "w"))
        {
            for (const auto& [key, val] : weightedDrops)
            {
                float odd = (float)(key - idx) / maxKey * 100;
                idx = key;
                totalOdds += odd;
                auto proto = sObjectMgr.GetItemPrototype(val);
                fprintf(pFile, "Item %s (%u) has odds %.2f.\n", proto->Name1.c_str(), val, odd);
            }
            fprintf(pFile, "Total odds : %.2f", totalOdds);
            fclose(pFile);
        }*/
    }

    uint32 rand = urand(0, currentKey);
    auto itr = weightedDrops.lower_bound(rand);

    if (itr != weightedDrops.end())
    {
        auto lootedItem = player->AddItem(itr->second);
        if (lootedItem)
        {
            uint32 eggId = ++currentEggId;
            item->preventCancel = true;
            player->DestroyItem(item->GetBagSlot(), item->GetSlot(), true);
            playerEggLoot[player->GetGUIDLow()].push_back(PlayerEggLoot{ eggId, player->GetGUIDLow(), lootedItem->GetEntry(), lootedItem->GetGUIDLow(), false });
            CharacterDatabase.PExecute("INSERT INTO character_egg_loot VALUES (%u, %u, %u, %u, 0)",
                eggId, player->GetGUIDLow(), lootedItem->GetEntry(), lootedItem->GetGUIDLow());
            player->SaveInventoryAndGoldToDB();
        }
        else
            ChatHandler(player).SendSysMessage("Try again!");
    }

    return true;
}

void AddSC_easter_egg_loot()
{
    Script* newscript = new Script;
    newscript->Name = "item_easter_egg";
    newscript->pItemUseSpell = &ItemUseSpell_easter_egg;
    newscript->RegisterSelf();

    newscript = new Script;
    newscript->Name = "npc_egg_hunter";
    newscript->pGossipHello = &GossipHello_EggRefundNPC;
    newscript->pGossipSelect = &GossipSelect_EggRefundNPC;
    newscript->RegisterSelf();
}
