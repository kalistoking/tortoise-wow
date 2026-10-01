/*
 * Copyright (C) 2021-2022 Nolin (nolin.nolin.nolin.nolin@gmail.org)
 *
 * This is private software and may not be shared under any circumstances,
 * absent permission of Nolin.
 */

// Neto, the Logistical Officer, taken out of black_morass_trash.cpp: the gossip that takes a group
// into the Black Morass and its show stand on map 1, outside the dungeon, so they stay in the core
// while the dungeon is mod-black-morass's and its rows (trt A20, AM1). The constants are copied from
// black_morass_trash.hpp, which goes with the module.
#include "scriptPCH.h"

namespace nsLogisticalOfficer
{
	static constexpr uint32 SPELL_ARCANE_CHANNEL{ 23017 };
	static constexpr uint32 SPELL_TELEPORT{ 26638 };
	static constexpr uint32 SPELL_SUBTLETY{ 28398 };

	static constexpr uint32 NPC_DEFENDER{ 65001 };
	static constexpr uint32 NPC_DRAGONSPAWN{ 65100 };

	static constexpr uint32 GOB_GHOST_GATE{ 180322 };
	static constexpr uint32 GOB_SAND_WALL{ 2010865 };
	static constexpr uint32 GOB_PORTAL_GROUND_LEFT{ 5000099 };
	static constexpr uint32 GOB_PORTAL_GROUND_RIGHT{ 5000101 };
	static constexpr uint32 GOB_PORTAL_WATERFALL{ 2002582 };
	static constexpr uint32 GOB_PORTAL_AZSHARA_BUILDING{ 2002578 };
	static constexpr uint32 GOB_PORTAL_NAXX_ZIG{ 2002588 };
	static constexpr uint32 GOB_PORTAL_THUNDERBLUFF{ 2002587 };
	static constexpr uint32 GOB_PORTAL_STORMWIND{ 2002585 };
	static constexpr uint32 GOB_PORTAL_ORG{ 2002583 };
	static constexpr uint32 GOB_PORTAL_SUMMON{ 2010853 };
	static constexpr uint32 GOB_PORTAL_UC{ 2002588 };

	enum class Phase : uint8
	{
		ONE,
		TWO,
		THREE,
		FOUR,
		FIVE,
		SIX,
		SEVEN
	};
}

class npc_logistical_officerAI : public ScriptedAI
{
public:
    explicit npc_logistical_officerAI(Creature* c) : ScriptedAI(c)
    {
        npc_logistical_officerAI::Reset();
    }

private:

    bool m_bDoOnce{};

    int movementPhase{};
    int summonChoice{};
    int currentSummonChoice{};

    uint32 m_uiUpdate_Timer{};

    uint32 m_uiSummonCreatureEntry{};

    GameObject* pPortalLeft{};
    GameObject* pPortalRight{};
    GameObject* pPortal{};

    Map* m_Map{};

    nsLogisticalOfficer::Phase phase{};

public:
    void Reset() override
    {
        m_bDoOnce = false;

        movementPhase = 0;
        summonChoice = 0;
        currentSummonChoice = 0;

        m_uiUpdate_Timer = 1000;

        m_uiSummonCreatureEntry = 0;

        m_Map = m_creature->GetMap();

        if (m_Map)
        {
            pPortalLeft = m_Map->GetGameObject(nsLogisticalOfficer::GOB_PORTAL_GROUND_LEFT);
            pPortalRight = m_Map->GetGameObject(nsLogisticalOfficer::GOB_PORTAL_GROUND_RIGHT);
        }

        pPortal = nullptr;

        phase = nsLogisticalOfficer::Phase::ONE;
    }

    void UpdateAI(uint32 const uiDiff) override
    {
        if (m_creature->GetMapId() == 269)
        {
            if (m_creature->FindNearestGameObject(nsLogisticalOfficer::GOB_SAND_WALL, 50.f))
            {
                m_creature->SetVisibility(VISIBILITY_ON);
            }
            else
            {
                m_creature->SetVisibility(VISIBILITY_OFF);
            }
        }
        else
        {
            if (m_uiUpdate_Timer < uiDiff)
            {
                switch (phase)
                {
                case nsLogisticalOfficer::Phase::ONE:
                {
                    m_bDoOnce = false;

                    m_creature->CastSpell(m_creature, nsLogisticalOfficer::SPELL_ARCANE_CHANNEL, true);
                    m_creature->MonsterSay("Next up ... ");

                    if (GameObject * pSummonPortal{ m_creature->FindNearestGameObject(nsLogisticalOfficer::GOB_PORTAL_SUMMON, 10.f) })
                    {
                        m_creature->SetFacingToObject(pSummonPortal);
                    }

                    phase = nsLogisticalOfficer::Phase::TWO;

                    m_uiUpdate_Timer = 5000;

                    break;
                }
                case nsLogisticalOfficer::Phase::TWO:
                {
                    m_creature->CastSpell(m_creature, nsLogisticalOfficer::SPELL_SUBTLETY, true);

                    do
                    {
                        summonChoice = urand(1, 6);
                    } while (summonChoice == currentSummonChoice);

                    switch (summonChoice)
                    {
                    case 1:
                    {
                        m_uiSummonCreatureEntry = 65132; // Timbermaw
                        break;
                    }

                    case 2:
                    {
                        m_uiSummonCreatureEntry = 65133; // Varian
                        break;
                    }

                    case 3:
                    {
                        m_uiSummonCreatureEntry = 65134; // Baker
                        break;
                    }

                    case 4:
                    {
                        m_uiSummonCreatureEntry = 65135; // Kobold
                        break;
                    }

                    case 5:
                    {
                        m_uiSummonCreatureEntry = 65131; // Baby Thrall
                        break;
                    }

                    case 6:
                    {
                        m_uiSummonCreatureEntry = 65137; // Tauren Primalist
                        break;
                    }
                    default:
                    {
                        break;
                    }
                    }

                    currentSummonChoice = summonChoice;

                    if (Creature * pSummon{ m_creature->SummonCreature(m_uiSummonCreatureEntry, -8473.43f, -4226.01f, -214.74f, 0) })
                    {
                        pSummon->SetFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_SPAWNING);
                        pSummon->SetFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_CONFUSED);

                        pSummon->SetFacingToObject(m_creature);

                        pSummon->CastSpell(pSummon, nsLogisticalOfficer::SPELL_TELEPORT, true);
                    }

                    phase = nsLogisticalOfficer::Phase::THREE;

                    m_uiUpdate_Timer = 2000;

                    break;
                }
                case nsLogisticalOfficer::Phase::THREE:
                {
                    if (Creature * pSummon{ m_creature->FindNearestCreature(m_uiSummonCreatureEntry, 25.f, true) })
                    {
                        switch (summonChoice)
                        {
                        case 1:
                        {
                            pSummon->MonsterTextEmote("The Timbermaw sniffs the air.");
                            pSummon->MonsterSay("Where is this...?");
                            break;
                        }
                        case 2:
                        {
                            pSummon->MonsterSay("What is this? I demand to know who you are!");
                            break;
                        }
                        case 3:
                        {
                            pSummon->MonsterSay("..freshly baked... What? What just happened?");
                            break;
                        }
                        case 4:
                        {
                            pSummon->MonsterTextEmote("The Kobold stares at George.");
                            pSummon->MonsterSay("You has candle?");

                            pSummon->UpdateSpeed(MOVE_RUN, true, 1.f);

                            pSummon->GetMotionMaster()->MovePoint(0, -8472.93f, -4221.71f, -214.39f);

                            pSummon->SetFacingToObject(m_creature);
                            break;
                        }
                        case 5:
                        {
                            pSummon->MonsterSay("Aedelas? Where are you? What is this place?");
                            break;
                        }
                        case 6:
                        {
                            pSummon->MonsterSay("Ancestors watch over me... where am I?");
                            break;
                        }
                        default:
                        {
                            break;
                        }
                        }
                    }

                    phase = nsLogisticalOfficer::Phase::FOUR;

                    m_uiUpdate_Timer = 5000;

                    break;
                }
                case nsLogisticalOfficer::Phase::FOUR:
                {
                    if (Creature * pSummon{ m_creature->FindNearestCreature(m_uiSummonCreatureEntry, 25.f, true) })
                    {
                        switch (summonChoice)
                        {
                        case 1:
                        {
                            m_creature->MonsterSay("Ah yes. One of those Timbermaw creatures. This one is meant to be the first to resist demonic corruption and lead its tribe to freedom.");
                            break;
                        }
                        case 2:
                        {
                            m_creature->MonsterSay("My apologies, King Varian. We are protectors of the sacred timelines and are conducting a minor correction in yours. Please step into this portal.");
                            break;
                        }
                        case 3:
                        {
                            m_creature->MonsterSay("Hmmm... I don't recognize this one. Assistant, I think we summoned the wrong human male.");
                            break;
                        }
                        case 4:
                        {
                            m_creature->MonsterSay("A simple Kobold. Funny, this particular Kobold is responsible for stealing a powerful lantern from Lady Sylvanas. The theft of this lantern led to many deaths and branched timelines.");
                            break;
                        }
                        case 5:
                        {
                            m_creature->MonsterSay("Welcome young one. This young orc will grow to be the mighty Warchief of the Horde!");
                            break;
                        }
                        case 6:
                        {
                            m_creature->MonsterSay("Greetings honored Tamaala, lifemate of Chieftain Cairne Bloodhoof. We are the the protectors of the sacred timelines. Please, let us guide you home to your ancestral spirits.");
                            break;
                        }
                        default:
                        {
                            break;
                        }
                        }
                    }

                    phase = nsLogisticalOfficer::Phase::FIVE;

                    m_uiUpdate_Timer = 6000;

                    break;
                }

                case nsLogisticalOfficer::Phase::FIVE:
                {
                    if (Creature * pSummon{ m_creature->FindNearestCreature(m_uiSummonCreatureEntry, 25.f, true) })
                    {
                        switch (summonChoice)
                        {
                        case 1:
                        {
                            m_creature->MonsterSay("Let's get you to your assigned timeline.");
                            pPortal = m_creature->SummonGameObject(nsLogisticalOfficer::GOB_PORTAL_WATERFALL, -8480.77f, -4221.29f, -215.03f, 0, 0, 0, 0, 0, 10000);
                            break;
                        }
                        case 2:
                        {
                            pSummon->MonsterSay("Although I do not understand, I feel compelled to follow your instructions. Do not let this happen again.");
                            pSummon->HandleEmote(EMOTE_ONESHOT_TALK);
                            pPortal = m_creature->SummonGameObject(nsLogisticalOfficer::GOB_PORTAL_STORMWIND, -8464.56f, -4222.97f, -214.35f, 0, 0, 0, 0, 0, 10000);
                            break;
                        }
                        case 3:
                        {
                            pSummon->MonsterYell("OH MY GOD � IS THAT A DRAGON?? CALL THE GUARDS! HELP!!");
                            pSummon->HandleEmote(EMOTE_ONESHOT_EXCLAMATION);
                            pSummon->GetMotionMaster()->MoveConfused();
                            pPortal = m_creature->SummonGameObject(nsLogisticalOfficer::GOB_PORTAL_STORMWIND, -8464.56f, -4222.97f, -214.35f, 0, 0, 0, 0, 0, 10000);
                            break;
                        }
                        case 4:
                        {
                            m_creature->MonsterSay("Come now little Kobold. Your candle is in this portal here.");
                            pSummon->MonsterYell("CANDLE!!!");
                            pSummon->HandleEmote(EMOTE_ONESHOT_APPLAUD);
                            pPortal = m_creature->SummonGameObject(nsLogisticalOfficer::GOB_PORTAL_UC, -8480.77f, -4221.29f, -215.03f, 0, 0, 0, 0, 0, 10000);
                            break;
                        }
                        case 5:
                        {
                            pSummon->MonsterTextEmote("Go'el laughs to himself.");
                            pSummon->HandleEmote(EMOTE_ONESHOT_LAUGH);
                            pSummon->MonsterSay("You've got a funny energy about you, elf.");
                            pPortal = m_creature->SummonGameObject(nsLogisticalOfficer::GOB_PORTAL_ORG, -8480.77f, -4221.29f, -215.03f, 0, 0, 0, 0, 0, 10000);
                            break;
                        }
                        case 6:
                        {
                            pSummon->MonsterSay("I shall go where my ancestors command, but beware elf. I sense an evil lurking in this place.");
                            pPortal = m_creature->SummonGameObject(nsLogisticalOfficer::GOB_PORTAL_THUNDERBLUFF, -8464.56f, -4222.97f, -214.35f, 0, 0, 0, 0, 0, 10000);
                            break;
                        }
                        default:
                        {
                            break;
                        }
                        }

                        if (pPortal)
                        {
                            m_creature->SetFacingToObject(pPortal);
                        }
                    }

                    phase = nsLogisticalOfficer::Phase::SIX;

                    m_uiUpdate_Timer = 2500;

                    break;
                }
                case nsLogisticalOfficer::Phase::SIX:
                {
                    if (Creature * pSummon{ m_creature->FindNearestCreature(m_uiSummonCreatureEntry, 25.f, true) })
                    {
                        switch (summonChoice)
                        {
                        case 3:
                        {
                            m_creature->MonsterSay("Quickly little human! Run into the portal before the terrifying beast gets you!!");
                            m_creature->MonsterTextEmote("George chuckles.");

                            pSummon->UpdateSpeed(MOVE_RUN, true, 1.f);
                            pSummon->GetMotionMaster()->MovementExpired(true);

                            break;
                        }

                        case 5:
                        {
                            m_creature->MonsterSay("Your shamanistic powers are strong even now. Now into the portal, young warchief.");
                            break;
                        }
                        default:
                        {
                            break;
                        }
                        }

                        m_creature->SetFacingToObject(pPortal);
                    }

                    phase = nsLogisticalOfficer::Phase::SEVEN;

                    m_uiUpdate_Timer = 1000;

                    break;
                }
                case nsLogisticalOfficer::Phase::SEVEN:
                {
                    if (Creature * pSummon{ m_creature->FindNearestCreature(m_uiSummonCreatureEntry, 30.f, true) })
                    {
                        if (pPortal)
                        {
                            if (summonChoice == 3 || summonChoice == 4)
                            {
                                pSummon->MonsterMove(pPortal->GetPositionX(), pPortal->GetPositionY(), pPortal->GetPositionZ());
                            }
                            else
                            {
                                pSummon->MonsterMoveWithSpeed(pPortal->GetPositionX(), pPortal->GetPositionY(), pPortal->GetPositionZ(), 0.f, 1.5f, MOVE_WALK);
                            }
                        }

                        if (pSummon->FindNearestGameObject(3000205, 1))
                        {
                            pSummon->CastSpell(pSummon, nsLogisticalOfficer::SPELL_TELEPORT, true);
                            pSummon->ForcedDespawn(500);

                            switch (summonChoice)
                            {
                            case 2:
                            {
                                if (!m_bDoOnce)
                                {
                                    m_creature->MonsterSay("Kings can be... difficult.");

                                    m_bDoOnce = true;
                                }

                                break;
                            }
                            default:
                            {
                                break;
                            }
                            }
                        }
                    }
                    else
                    {
                        pPortal->AddObjectToRemoveList();
                        phase = nsLogisticalOfficer::Phase::ONE;
                    }

                    m_uiUpdate_Timer = 1000;
                    break;
                }
                default:
                {
                    break;
                }
                }
            }
            else
            {
                m_uiUpdate_Timer -= uiDiff;
            }
        }
    }
};

bool GossipHello_npc_logistics_dialogue(Player* pPlayer, Creature* pCreature)
{
    if (pCreature->GetMapId() == 269)
    {
        pPlayer->ADD_GOSSIP_ITEM(GOSSIP_ICON_INTERACT_1, "I will make this right.", GOSSIP_SENDER_MAIN, 1);
        pPlayer->SEND_GOSSIP_MENU(91976, pCreature->GetGUID());
    }
    else
    {
        pPlayer->SEND_GOSSIP_MENU(91978, pCreature->GetGUID());
    }

    return true;
}

bool GossipSelect_npc_logistics_dialogue(Player* pPlayer, Creature* pCreature, uint32 uiSender, uint32 uiAction)
{
    pPlayer->CLOSE_GOSSIP_MENU();

    switch (uiAction)
    {
    case 1:
    {
        pCreature->MonsterWhisper("Good luck with the challenges ahead.", pPlayer, false);
        pPlayer->TeleportTo(269, -1557.80f, 7102.30f, 23.86f, 3.17f);
        break;
    }
    default:
    {
        break;
    }
    }

    return true;
}

CreatureAI* GetAI_npc_logistical_officer(Creature* pCreature)
{
    return new npc_logistical_officerAI(pCreature);
}

void AddSC_black_morass_neto()
{
    Script* pNewscript{};

    pNewscript = new Script;
    pNewscript->Name = "npc_logistical_officer";
    pNewscript->GetAI = &GetAI_npc_logistical_officer;
    pNewscript->pGossipHello = &GossipHello_npc_logistics_dialogue;
    pNewscript->pGossipSelect = &GossipSelect_npc_logistics_dialogue;
    pNewscript->RegisterSelf();
}
