// Master Craftsman Omarion's gossip, taken out of instance_naxxramas.cpp: it goes to mod-naxxramas and his
// rows, while the instance stays in the core (trt A30, AM1).
#include "scriptPCH.h"
#include "dungeons/naxxramas/naxxramas.h"

namespace mod_naxxramas
{

enum OmarionMisc {
    QUEST_OMARIONS_HANDBOOK = 9233,

    BC_TAILOR_TEXT        = 12251, // I am a master tailor, Omarion.
    BC_BLACKSMITH_TEXT    = 12269, // I am a master blacksmith, Omarion.
    BC_LEATHERWORKER_TEXT = 12257, // I am a master leatherworker, Omarion.
    BC_NO_CRAFT_TEXT      = 12279, // Omarion, I am not a craftsman. Can you still help me?
    BC_CLOSE_NO_CRAFTER   = 12281, // Thank you, Omarion. You have taken a fatal blow for the team on this day.
    BC_CLOSE_CRAFTER      = 12270, // I need to go. Evil stirs. Die well, Omarion.

    GOSSIP_MENU_INTRO   = 8507,
    GOSSIP_MENU_CRAFTER = 8508,
    GOSSIP_MENU_NOCRAFT = 8516,

    GOSSIP_OPT_NOT_CRAFTSMAN   = 1,

    GOSSIP_SELECT_TAILOR  = GOSSIP_ACTION_INFO_DEF + 1,
    GOSSIP_SELECT_BS      = GOSSIP_ACTION_INFO_DEF + 2,
    GOSSIP_SELECT_LW      = GOSSIP_ACTION_INFO_DEF + 3,
    GOSSIP_SELECT_NOCRAFT = GOSSIP_ACTION_INFO_DEF + 4,

    GOSSIP_SELECT_CRAFT_BEGIN     = GOSSIP_ACTION_INFO_DEF + 10,

    GOSSIP_SELECT_GLACIAL_GLOVES  = GOSSIP_SELECT_CRAFT_BEGIN + 1,  // tailor honored
    GOSSIP_SELECT_GLACIAL_WRISTS  = GOSSIP_SELECT_CRAFT_BEGIN + 2,  // tailor honored
    GOSSIP_SELECT_GLACIAL_CHEST   = GOSSIP_SELECT_CRAFT_BEGIN + 3,  // tailor exalted
    GOSSIP_SELECT_GLACIAL_CLOAK   = GOSSIP_SELECT_CRAFT_BEGIN + 4,  // tailor exalted

    GOSSIP_SELECT_POLAR_GLOVES    = GOSSIP_SELECT_CRAFT_BEGIN + 5,  // LW honored
    GOSSIP_SELECT_POLAR_WRISTS    = GOSSIP_SELECT_CRAFT_BEGIN + 6, // LW honored
    GOSSIP_SELECT_POLAR_CHEST     = GOSSIP_SELECT_CRAFT_BEGIN + 7, // LW exalted

    GOSSIP_SELECT_ICYSCALE_GLOVES = GOSSIP_SELECT_CRAFT_BEGIN + 8, // LW honored
    GOSSIP_SELECT_ICYSCALE_WRISTS = GOSSIP_SELECT_CRAFT_BEGIN + 9, // LW honored
    GOSSIP_SELECT_ICYSCALE_CHEST  = GOSSIP_SELECT_CRAFT_BEGIN + 10, // LW exalted

    GOSSIP_SELECT_ICEBANE_GLOVES  = GOSSIP_SELECT_CRAFT_BEGIN + 11, // BS exalted
    GOSSIP_SELECT_ICEBANE_WRISTS  = GOSSIP_SELECT_CRAFT_BEGIN + 12, // BS exalted
    GOSSIP_SELECT_ICEBANE_CHEST   = GOSSIP_SELECT_CRAFT_BEGIN + 13, // BS exalted

    GOSSIP_CLOSE = 100,
};


void LearnCraftIfCan(uint32 learnId, uint32 knowId, Player* pPlayer, ReputationRank minRank, uint32 currSkill)
{
    uint32 argentDawnRep = pPlayer->GetReputationRank(529);
    if (argentDawnRep < minRank)
        return;

    if (currSkill < 300)
        return;

    if (!pPlayer->HasSpell(knowId))
        pPlayer->CastSpell(pPlayer, learnId, false);
}

bool GossipSelect_npc_MasterCraftsmanOmarion(Player* pPlayer, Creature* pCreature, uint32 uiSender, uint32 uiAction)
{
    uint32 tailorSkill      = pPlayer->GetSkillValue(SKILL_TAILORING);
    uint32 blacksmithSkill  = pPlayer->GetSkillValue(SKILL_BLACKSMITHING);
    uint32 leatherworkSkill = pPlayer->GetSkillValue(SKILL_LEATHERWORKING);
    uint32 argentDawnRep    = pPlayer->GetReputationRank(529);

    ReputationRank BOOK_REQ_RANK   = REP_REVERED;
    ReputationRank CRACT1_REQ_RANK = REP_REVERED;
    ReputationRank CRAFT2_REQ_RANK = REP_EXALTED;

    if (uiAction == GOSSIP_CLOSE)
    {
        pPlayer->CLOSE_GOSSIP_MENU();
        return true;
    }

    // if rep < honored, spit on player and be done with it.
    if (argentDawnRep < BOOK_REQ_RANK)
    {
        DoScriptText(-1999913, pCreature, pPlayer); // spit on player
        pPlayer->CLOSE_GOSSIP_MENU();
        return true;
    }

    switch (uiAction)
    {
    case GOSSIP_SELECT_TAILOR:
        if (argentDawnRep >= CRACT1_REQ_RANK)
        {
            pPlayer->ADD_GOSSIP_ITEM(GOSSIP_ICON_CHAT, "Glacial Gloves", GOSSIP_SELECT_TAILOR, GOSSIP_SELECT_GLACIAL_GLOVES);
            pPlayer->ADD_GOSSIP_ITEM(GOSSIP_ICON_CHAT, "Glacial Wrists", GOSSIP_SELECT_TAILOR, GOSSIP_SELECT_GLACIAL_WRISTS);
        }
        if (argentDawnRep >= CRAFT2_REQ_RANK)
        {
            pPlayer->ADD_GOSSIP_ITEM(GOSSIP_ICON_CHAT, "Glacial Vest" , GOSSIP_SELECT_TAILOR, GOSSIP_SELECT_GLACIAL_CHEST);
            pPlayer->ADD_GOSSIP_ITEM(GOSSIP_ICON_CHAT, "Glacial Cloak", GOSSIP_SELECT_TAILOR, GOSSIP_SELECT_GLACIAL_CLOAK);
        }
        pPlayer->ADD_GOSSIP_ITEM(GOSSIP_ICON_CHAT, BC_CLOSE_CRAFTER, GOSSIP_SELECT_TAILOR, GOSSIP_CLOSE);
        pPlayer->SEND_GOSSIP_MENU(GOSSIP_MENU_CRAFTER, pCreature->GetGUID());
        return true;
    case GOSSIP_SELECT_BS:
        if (argentDawnRep >= CRACT1_REQ_RANK)
        {
            pPlayer->ADD_GOSSIP_ITEM(GOSSIP_ICON_CHAT, "Icebane Gauntlets", GOSSIP_SELECT_BS, GOSSIP_SELECT_ICEBANE_GLOVES);
            pPlayer->ADD_GOSSIP_ITEM(GOSSIP_ICON_CHAT, "Icebane Bracers", GOSSIP_SELECT_BS, GOSSIP_SELECT_ICEBANE_WRISTS);
        }
        if (argentDawnRep >= CRAFT2_REQ_RANK)
        {
            pPlayer->ADD_GOSSIP_ITEM(GOSSIP_ICON_CHAT, "Icebane Breastplate", GOSSIP_SELECT_BS, GOSSIP_SELECT_ICEBANE_CHEST);
        }
        pPlayer->ADD_GOSSIP_ITEM(GOSSIP_ICON_CHAT, BC_CLOSE_CRAFTER, GOSSIP_SELECT_BS, GOSSIP_CLOSE);
        pPlayer->SEND_GOSSIP_MENU(GOSSIP_MENU_CRAFTER, pCreature->GetGUID());
        return true;
    case GOSSIP_SELECT_LW:
        if (argentDawnRep >= CRACT1_REQ_RANK)
        {
            pPlayer->ADD_GOSSIP_ITEM(GOSSIP_ICON_CHAT, "Polar Gloves", GOSSIP_SELECT_LW, GOSSIP_SELECT_POLAR_GLOVES);
            pPlayer->ADD_GOSSIP_ITEM(GOSSIP_ICON_CHAT, "Icy Scale Gauntlets", GOSSIP_SELECT_LW, GOSSIP_SELECT_ICYSCALE_GLOVES);

            pPlayer->ADD_GOSSIP_ITEM(GOSSIP_ICON_CHAT, "Polar Bracers", GOSSIP_SELECT_LW, GOSSIP_SELECT_POLAR_WRISTS);
            pPlayer->ADD_GOSSIP_ITEM(GOSSIP_ICON_CHAT, "Icy Scale Bracers", GOSSIP_SELECT_LW, GOSSIP_SELECT_ICYSCALE_WRISTS);
        }
        if (argentDawnRep >= CRAFT2_REQ_RANK)
        {
            pPlayer->ADD_GOSSIP_ITEM(GOSSIP_ICON_CHAT, "Polar Tunic", GOSSIP_SELECT_LW, GOSSIP_SELECT_POLAR_CHEST);
            pPlayer->ADD_GOSSIP_ITEM(GOSSIP_ICON_CHAT, "Icy Scale Breastplate", GOSSIP_SELECT_LW, GOSSIP_SELECT_ICYSCALE_CHEST);
        }
        pPlayer->ADD_GOSSIP_ITEM(GOSSIP_ICON_CHAT, BC_CLOSE_CRAFTER, GOSSIP_SELECT_LW, GOSSIP_CLOSE);
        pPlayer->SEND_GOSSIP_MENU(GOSSIP_MENU_CRAFTER, pCreature->GetGUID());
        return true;
    case GOSSIP_SELECT_NOCRAFT:
    {
        if (argentDawnRep >= BOOK_REQ_RANK)
        {
            pPlayer->ADD_GOSSIP_ITEM(GOSSIP_ICON_CHAT, BC_CLOSE_CRAFTER, GOSSIP_SENDER_MAIN, GOSSIP_CLOSE);
            pPlayer->SEND_GOSSIP_MENU(GOSSIP_MENU_NOCRAFT, pCreature->GetGUID());
            if (!pPlayer->HasItemCount(22719, 1, true))
            {
                pPlayer->AddItem(22719);
            }
        }
        return true;
    }


    /***************************
    *       Craft spells
    ****************************/

    case GOSSIP_SELECT_GLACIAL_GLOVES:
    {
        LearnCraftIfCan(28212, 28205, pPlayer, CRACT1_REQ_RANK, tailorSkill);
        break;
    }
    case GOSSIP_SELECT_GLACIAL_WRISTS:
    {
        LearnCraftIfCan(28215, 28209, pPlayer, CRACT1_REQ_RANK, tailorSkill);
        break;
    }
    case GOSSIP_SELECT_GLACIAL_CHEST:
    {
        // spell castbar bug, displays as "glacial gloves"
        LearnCraftIfCan(28213, 28207, pPlayer, CRAFT2_REQ_RANK, tailorSkill);
        break;
    }
    case GOSSIP_SELECT_GLACIAL_CLOAK:
    {
        LearnCraftIfCan(28214, 28208, pPlayer, CRAFT2_REQ_RANK, tailorSkill);
        break;
    }
    case GOSSIP_SELECT_POLAR_GLOVES:
    {
        LearnCraftIfCan(28229, 28220, pPlayer, CRACT1_REQ_RANK, leatherworkSkill);
        break;
    }
    case GOSSIP_SELECT_POLAR_WRISTS:
    {
        LearnCraftIfCan(28230, 28221, pPlayer, CRACT1_REQ_RANK, leatherworkSkill);
        break;
    }
    case GOSSIP_SELECT_POLAR_CHEST:
    {
        LearnCraftIfCan(28228, 28219, pPlayer, CRAFT2_REQ_RANK, leatherworkSkill);
        break;
    }
    case GOSSIP_SELECT_ICYSCALE_GLOVES:
    {
        LearnCraftIfCan(28232, 28223, pPlayer, CRACT1_REQ_RANK, leatherworkSkill);
        break;
    }
    case GOSSIP_SELECT_ICYSCALE_WRISTS:
    {
        LearnCraftIfCan(28233, 28224, pPlayer, CRACT1_REQ_RANK, leatherworkSkill);
        break;
    }
    case GOSSIP_SELECT_ICYSCALE_CHEST:
    {
        LearnCraftIfCan(28231, 28222, pPlayer, CRAFT2_REQ_RANK, leatherworkSkill);
        break;
    }
    case GOSSIP_SELECT_ICEBANE_GLOVES:
    {
        LearnCraftIfCan(28248, 28243, pPlayer, CRACT1_REQ_RANK, blacksmithSkill);
        break;
    }
    case GOSSIP_SELECT_ICEBANE_WRISTS:
    {
        LearnCraftIfCan(28249, 28244, pPlayer, CRACT1_REQ_RANK, blacksmithSkill);
        break;
    }
    case GOSSIP_SELECT_ICEBANE_CHEST:
    {
        LearnCraftIfCan(28245, 28242,  pPlayer, CRAFT2_REQ_RANK, blacksmithSkill);
        break;
    }
    }

    pPlayer->ADD_GOSSIP_ITEM(GOSSIP_ICON_CHAT, BC_CLOSE_CRAFTER, uiSender, GOSSIP_CLOSE);
    pPlayer->SEND_GOSSIP_MENU(GOSSIP_MENU_CRAFTER, pCreature->GetGUID());
    return true;
}

bool GossipHello_npc_MasterCraftsmanOmarion(Player* pPlayer, Creature* pCreature)
{
    uint32 tailorSkill      = pPlayer->GetSkillValue(SKILL_TAILORING);
    uint32 blacksmithSkill  = pPlayer->GetSkillValue(SKILL_BLACKSMITHING);
    uint32 leatherworkSkill = pPlayer->GetSkillValue(SKILL_LEATHERWORKING);

    if(tailorSkill >= 225)
        pPlayer->ADD_GOSSIP_ITEM(GOSSIP_ICON_CHAT, BC_TAILOR_TEXT, GOSSIP_SELECT_TAILOR, GOSSIP_SELECT_TAILOR);
    if(blacksmithSkill >= 225)
        pPlayer->ADD_GOSSIP_ITEM(GOSSIP_ICON_CHAT, BC_BLACKSMITH_TEXT, GOSSIP_SELECT_BS, GOSSIP_SELECT_BS);
    if(leatherworkSkill >= 225)
        pPlayer->ADD_GOSSIP_ITEM(GOSSIP_ICON_CHAT, BC_LEATHERWORKER_TEXT, GOSSIP_SELECT_LW, GOSSIP_SELECT_LW);

    pPlayer->ADD_GOSSIP_ITEM(GOSSIP_ICON_CHAT, BC_NO_CRAFT_TEXT, GOSSIP_SENDER_MAIN, GOSSIP_SELECT_NOCRAFT);

    pPlayer->SEND_GOSSIP_MENU(GOSSIP_MENU_INTRO, pCreature->GetGUID());
    pCreature->HandleEmote(EMOTE_ONESHOT_LAUGH);
    return true;

    /*
    send GOSSIP_INTRO

    if player has 300/300 blacksmithing/leatherworking/taloring
        add option "I am master <profession>, Omarion."
        when clicked
            if <300 in your crafting skill OR less than Honored with AD
                /spits on you
            else
                say "Perhaps I can teach you something..."
                if revered with AD, give option for bracers and gloves
                if exalted with AD, give option for chest
                exit dialogue "I need to go. Evil stirs. Die well, Omarion."


    regardless of any profession, present option:
        "Omarion, I am not a craftsman. Can you still help me?"
        if player reputation < honored
            /spit on you
        else
            send gossip GOSSIP_REPLY_NOT_CRAFTSMAN
            add item 22719 (book) to player
            add exit text "Thank you, Omarion. You have taken a fatal blow for the team on this day."
    */
}

void AddSC_naxxramas_omarion()
{
    Script* pNewScript = new Script;
    pNewScript->Name = "mob_craftsman_omarion";
    pNewScript->pGossipHello = &GossipHello_npc_MasterCraftsmanOmarion;
    pNewScript->pGossipSelect = &GossipSelect_npc_MasterCraftsmanOmarion;
    pNewScript->RegisterSelf();
}

} // namespace mod_naxxramas
