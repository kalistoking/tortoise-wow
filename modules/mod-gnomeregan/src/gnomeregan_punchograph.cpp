// The Matrix Punchographs, taken out of gnomeregan.cpp: their gossip goes to mod-gnomeregan and its
// rows, while Emi Shortfuse, Kernobee, Thermaplugg and the instance stay in the core (trt A13, AM1).
#include "scriptPCH.h"

namespace mod_gnomeregan
{


bool GOHello_matrix_punchograph(Player* pPlayer, GameObject* pGo)
{
    if (pPlayer->GetQuestStatus(2930) == QUEST_STATUS_INCOMPLETE) // Data Resque
    {
        switch (pGo->GetEntry())
        {
        case 142345: // Matrix Punchograph 3005-A
            if (pPlayer->HasItemCount(9279, 1, false) && !pPlayer->HasItemCount(9280, 1, false)) // White Punch Card and !Yellow Punch Card
            {
                pPlayer->ADD_GOSSIP_ITEM(GOSSIP_ICON_TALK, "Acquire Higher Level Access Card", GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF + 1);
                pPlayer->SEND_GOSSIP_MENU(1753, pGo->GetGUID());
            }
            pPlayer->SEND_GOSSIP_MENU(1643, pGo->GetGUID());
            break;
        case 142475: // Matrix Punchograph 3005-B
            if (pPlayer->HasItemCount(9280, 1, false) && !pPlayer->HasItemCount(9282, 1, false)) // Yellow Punch Card and !Blue Punch Card
            {
                pPlayer->ADD_GOSSIP_ITEM(GOSSIP_ICON_TALK, "Acquire Higher Level Access Card", GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF + 2);
                pPlayer->SEND_GOSSIP_MENU(1754, pGo->GetGUID());
            }
            pPlayer->SEND_GOSSIP_MENU(1647, pGo->GetGUID());
            break;
        case 142476: // Matrix Punchograph 3005-C
            if (pPlayer->HasItemCount(9282, 1, false) && !pPlayer->HasItemCount(9281, 1, false)) // Blue Punch Card and !Red Punch Card
            {
                pPlayer->ADD_GOSSIP_ITEM(GOSSIP_ICON_TALK, "Acquire Higher Level Access Card", GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF + 3);
                pPlayer->SEND_GOSSIP_MENU(1755, pGo->GetGUID());
            }
            pPlayer->SEND_GOSSIP_MENU(1649, pGo->GetGUID());
            break;
        case 142696: // Matrix Punchograph 3005-D
            if (pPlayer->HasItemCount(9281, 1, false) && !pPlayer->HasItemCount(9316, 1, false)) // Red Punch Card and !Prismatic Punch Card
            {
                pPlayer->ADD_GOSSIP_ITEM(GOSSIP_ICON_TALK, "Acquire Higher Level Access Card", GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF + 4);
                if (pPlayer->HasItemCount(9327) && pPlayer->GetSkillValue(SKILL_ENGINEERING) >= 160 && !pPlayer->HasSpell(3959)) // Security DELTA Data Access Card
                    pPlayer->ADD_GOSSIP_ITEM(GOSSIP_ICON_TALK, "Use engineering to access hidden schematics!", GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF + 5);
                pPlayer->SEND_GOSSIP_MENU(1756, pGo->GetGUID());
            }
            pPlayer->SEND_GOSSIP_MENU(1651, pGo->GetGUID());
            break;
        }
    }
    else
    {
        switch (pGo->GetEntry())
        {
        case 142345: pPlayer->SEND_GOSSIP_MENU(1643, pGo->GetGUID()); break;
        case 142475: pPlayer->SEND_GOSSIP_MENU(1647, pGo->GetGUID()); break;
        case 142476: pPlayer->SEND_GOSSIP_MENU(1649, pGo->GetGUID()); break;
        case 142696: 
            if (pPlayer->HasItemCount(9327) && pPlayer->GetSkillValue(SKILL_ENGINEERING) >= 160 && !pPlayer->HasSpell(3959)) // Security DELTA Data Access Card
                pPlayer->ADD_GOSSIP_ITEM(GOSSIP_ICON_TALK, "Use engineering to access hidden schematics!", GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF + 5);
            pPlayer->SEND_GOSSIP_MENU(1651, pGo->GetGUID()); 
            break;
        }
    }
    return true;
}

bool GOSelect_matrix_punchograph(Player* pPlayer, GameObject* pGo, uint32 sender, uint32 action)
{
    if (action == GOSSIP_ACTION_INFO_DEF + 1) { pPlayer->CastSpell(pPlayer, 11512, false); } // Create Yellow Punch Card
    if (action == GOSSIP_ACTION_INFO_DEF + 2) { pPlayer->CastSpell(pPlayer, 11525, false); } // Create Blue Punch Card
    if (action == GOSSIP_ACTION_INFO_DEF + 3) { pPlayer->CastSpell(pPlayer, 11528, false); } // Create Red Punch Card
    if (action == GOSSIP_ACTION_INFO_DEF + 4) { pPlayer->CastSpell(pPlayer, 11545, false); } // Create Prismatic Punch Card
    if (action == GOSSIP_ACTION_INFO_DEF + 5) { pPlayer->CastSpell(pPlayer, 4031, false); }  // Schematic: Discombobulator Ray
    pPlayer->CLOSE_GOSSIP_MENU();
    return false;
}

void AddSC_gnomeregan_punchograph()
{
    Script* pNewScript;

    pNewScript = new Script;
    pNewScript->Name = "matrix_punchograph";
    pNewScript->pGOHello = &GOHello_matrix_punchograph;
    pNewScript->pGOGossipSelect = &GOSelect_matrix_punchograph;
    pNewScript->RegisterSelf();
}

} // namespace mod_gnomeregan
