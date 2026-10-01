/* Copyright (C) 2006 - 2009 ScriptDev2 <https://scriptdev2.svn.sourceforge.net/>
* This program is free software licensed under GPL version 2
* Please see the included DOCS/LICENSE.TXT for more information */

#include "scriptPCH.h"
#include "world/silithus/silithus.h"

// AI system
void AddSC_generic_spell_ai();

//battlegrounds
void AddSC_battleground();
void AddSC_bg_alterac();
void AddSC_bg_sunnyglade();

//custom
void AddSC_go_scripts();
void AddSC_event_fireworks();

// Event
void AddSC_elemental_invasions();

// Items
void AddSC_item_orb_of_draconic_energy();

// HT
void AddSC_instance_dire_maul();
void AddSC_boss_immol_thar();
void AddSC_boss_tendris_warpwood();
void AddSC_npc_pusillin();
void AddSC_boss_zevrim();
void AddSC_npc_ecorcefer();
void AddSC_dreadsteed_ritual();
void AddSC_npc_king_gordok();

//world
void AddSC_areatrigger_scripts();
void AddSC_dragons_of_nightmare();
void AddSC_boss_lord_kazzak();
void AddSC_world_event_naxxramas();
void AddSC_event_scourge_invasion();

//eastern kingdoms
void AddSC_instance_blackrock_spire();
void AddSC_blackrock_depths();                       //blackrock_depths
void AddSC_boss_urok();
void AddSC_instance_blackrock_depths();
//void AddSC_boss_mothersmolderweb();
void AddSC_boss_pyroguard_emberseer();
void AddSC_boss_razorgore();                         //blackwing_lair
void AddSC_boss_vael();
void AddSC_boss_chromaggus();
void AddSC_boss_nefarian();
void AddSC_boss_victor_nefarius();
void AddSC_instance_blackwing_lair();


void AddSC_stormwrought_ruins_spells();              // Drazare's Embrace, stays in the core (trt A19)

void AddSC_gnomeregan();                             //gnomeregan
void AddSC_boss_thermaplugg();
void AddSC_instance_gnomeregan();

void AddSC_boss_baron_geddon();
void AddSC_boss_thane();
void AddSC_boss_twin_golems();
void AddSC_boss_majordomo();
void AddSC_boss_ragnaros();
void AddSC_instance_molten_core();
void AddSC_boss_anubrekhan();                        //naxxramas
void AddSC_boss_four_horsemen();
void AddSC_boss_faerlina();
void AddSC_boss_gluth();
void AddSC_boss_gothik();
void AddSC_boss_kelthuzad();
void AddSC_boss_loatheb();
void AddSC_boss_maexxna();
void AddSC_boss_noth();
void AddSC_boss_heigan();
void AddSC_boss_patchwerk();
void AddSC_boss_grobbulus();
void AddSC_boss_thaddius();
void AddSC_boss_razuvious();
void AddSC_boss_sapphiron();
void AddSC_instance_naxxramas();
//void AddSC_boss_azshir_the_sleepless();
void AddSC_instance_scarlet_monastery();
//void AddSC_boss_kormok();
void AddSC_boss_vectus();
//void AddSC_boss_lordblackwood();
void AddSC_instance_scholomance();
void AddSC_boss_baroness_anastari();
void AddSC_boss_sc_attunement();
void AddSC_instance_stratholme();
void AddSC_stratholme_aurius_phantoms();          // Aurius and the phantoms aura (trt A22)
void AddSC_instance_sunken_temple();                 //sunken_temple
void AddSC_instance_uldaman();                       //uldaman
void AddSC_uldaman();                                //uldaman
void AddSC_boss_archaedas();
void AddSC_boss_arlokk();                            //zulgurub
//void AddSC_boss_grilek();
void AddSC_boss_hakkar();
//void AddSC_boss_hazzarah();
void AddSC_boss_jindo();
void AddSC_boss_mandokir();
void AddSC_boss_marli();
void AddSC_boss_ouro();
void AddSC_boss_renataki();
void AddSC_boss_thekal();
//void AddSC_boss_wushoolay();
void AddSC_instance_zulgurub();
void AddSC_zulgurub_pile_dechets();
void AddSC_boss_omen();

//void AddSC_alterac_mountains();
void AddSC_arathi_highlands();
void AddSC_blasted_lands();
void AddSC_burning_steppes();
void AddSC_dun_morogh();
void AddSC_eastern_plaguelands();
void AddSC_elwynn_forest();
void AddSC_grim_reaches();
void AddSC_hillsbrad_foothills();
void AddSC_hinterlands();
void AddSC_ironforge();
void AddSC_loch_modan();
void AddSC_redridge_mountains();
void AddSC_searing_gorge();
void AddSC_silverpine_forest();
void AddSC_stormwind_city();
void AddSC_quest_stormwind_rendezvous();
void AddSC_stranglethorn_vale();
void AddSC_swamp_of_sorrows();
void AddSC_tirisfal_glades();
void AddSC_undercity();
void AddSC_western_plaguelands();
void AddSC_westfall();
void AddSC_wetlands();

//kalimdor
void AddSC_celebras_spirit();                        // Celebras the Redeemed, stays in the core (trt A7)
void AddSC_boss_onyxia();                            //onyxias_lair
void AddSC_razorfen_downs_escort();                 // Belnistrasz's escort, stays in the core (trt A35)
void AddSC_razorfen_kraul_quests();                  // Willix and the gopher, stay in the core (trt A8)
void AddSC_boss_ayamiss();                           //ruins_of_ahnqiraj
void AddSC_boss_buru();
void AddSC_boss_ossirian();
void AddSC_ruins_of_ahnqiraj();
void AddSC_instance_ruins_of_ahnqiraj();
void AddSC_boss_cthun();                             //temple_of_ahnqiraj
void AddSC_boss_viscidus();
void AddSC_boss_fankriss();
void AddSC_boss_huhuran();
void AddSC_bug_trio();
void AddSC_boss_sartura();
void AddSC_boss_skeram();
void AddSC_boss_twinemperors();
void AddSC_mob_anubisath_sentinel();
void AddSC_instance_temple_of_ahnqiraj();
void AddSC_instance_wailing_caverns();               //Wailing caverns
void AddSC_wailing_caverns();
void AddSC_zulfarrak_tablet_ward();               // the tablet and the ward (trt A37)
void AddSC_farraki_arena();
void AddSC_instance_zulfarrak();

void AddSC_ashenvale();
void AddSC_alahthalas();
void AddSC_azshara();
void AddSC_balor();
void AddSC_darkshore();
void AddSC_desolace();
void AddSC_durotar();
void AddSC_dustwallow_marsh();
void AddSC_duskwood();
void AddSC_felwood();
void AddSC_feralas();
void AddSC_moonglade();
void AddSC_moonwhisper_coast();
void AddSC_mulgore();
void AddSC_northwind();
void AddSC_orgrimmar();
void AddSC_silithus();
void AddSC_stonetalon_mountains();
void AddSC_tanaris();
void AddSC_teldrassil();
void AddSC_the_barrens();
void AddSC_thousand_needles();
void AddSC_thunder_bluff();
void AddSC_ungoro_crater();
void AddSC_winterspring();
void AddSC_war_effort();

// Turtle WoW
void AddSC_arena_tournament();
void AddSC_boss_rares();
void AddSC_boss_avatar_of_pompa();
void AddSC_boss_turtlhu();
void AddSC_karazhan_crypt_triggers();             // the trigger objects and the gate (trt A31)
void AddSC_instance_gilneas_city();
void AddSC_boss_celia();
void AddSC_boss_lord_mortimer();
void AddSC_boss_xmas_wolf();
void AddSC_boss_nerubian_overseer();
void AddSC_mirage_raceway();
void AddSC_gardening();
void AddSC_boss_dark_reaver();
void AddSC_boss_ostarius();
void AddSC_CUSTOM_SPELL();
void AddSC_instance_emerald_sanctum();
void AddSC_boss_solnius();
void AddSC_boss_anomalus();
void AddSC_boss_echo_of_medivh();
void AddSC_boss_incantagos();
void AddSC_boss_keeper_gnarlmoon();
void AddSC_boss_kings_council();
void AddSC_boss_kruul();
void AddSC_boss_sanv_tasdal();

void AddSC_random_scripts_0();
void AddSC_random_scripts_1();
void AddSC_random_scripts_2();
void AddSC_random_scripts_3();
void AddSC_npc_j_eevee();
void AddSC_easter_egg_loot();

void AddSC_custom_exploration_triggers();

// Scarlet Citadel
void AddSC_boss_ardaeus();
void AddSC_boss_daelus();
void AddSC_boss_mariella();
void AddSC_instance_scarlet_citadel();

// Hateforge Quarry
void AddSC_hateforge_quarry_spells();                // the dispel counterpart, stays in the core (trt A6)

// Stormwind Vaults
void AddSC_boss_damian_the_ripper();
void AddSC_boss_volkan_cruelblade();
void AddSC_instance_stormwind_vaults();

// Black Morass
void AddSC_black_morass_trash();
void AddSC_instance_black_morass();
void AddSC_boss_gerastrasz();
void AddSC_boss_chronormu();

// Misc
void AddSC_npc_loothelper();
void AddSC_npc_ptr();
void AddSC_jewelcrafting();

// Spell and aura scripts
void AddSC_druid_spell_scripts();
void AddSC_hunter_spell_scripts();
void AddSC_item_spell_scripts();
void AddSC_mage_spell_scripts();
void AddSC_paladin_spell_scripts();
void AddSC_priest_spell_scripts();
void AddSC_rogue_spell_scripts();
void AddSC_shaman_spell_scripts();
void AddSC_special_spell_scripts();
void AddSC_turtle_spell_scripts();
void AddSC_warlock_spell_scripts();
void AddSC_warrior_spell_scripts();

void AddScripts()
{
    //Nostalrius
    AddSC_generic_spell_ai();

    //battlegrounds
    AddSC_battleground();
    AddSC_bg_alterac();
    AddSC_bg_sunnyglade();

    //custom
    AddSC_go_scripts();
    AddSC_event_fireworks();

    // Event
    AddSC_elemental_invasions();

    // Items
    AddSC_item_orb_of_draconic_energy();

    // HT
    AddSC_instance_dire_maul();
    AddSC_boss_immol_thar();
    AddSC_boss_tendris_warpwood();
    AddSC_npc_pusillin();
    AddSC_npc_ecorcefer();
    AddSC_boss_zevrim();
    AddSC_dreadsteed_ritual();
    AddSC_npc_king_gordok();

    //world
    AddSC_areatrigger_scripts();
    AddSC_dragons_of_nightmare();
    AddSC_boss_lord_kazzak();
    AddSC_world_event_naxxramas();
    AddSC_event_scourge_invasion();

    AddSC_war_effort();

    //eastern kingdoms
    AddSC_blackrock_depths();                               //blackrock_depths
    AddSC_boss_urok();
    AddSC_instance_blackrock_depths();
    //AddSC_boss_mothersmolderweb();

    AddSC_instance_blackrock_spire();
    AddSC_boss_pyroguard_emberseer();
    AddSC_boss_razorgore();                                 //blackwing_lair
    AddSC_boss_vael();
    AddSC_boss_chromaggus();
    AddSC_boss_nefarian();
    AddSC_boss_victor_nefarius();
    AddSC_instance_blackwing_lair();
    AddSC_stormwrought_ruins_spells();
    AddSC_gnomeregan();                                     //gnomeregan
    AddSC_boss_thermaplugg();
    AddSC_instance_gnomeregan();
    AddSC_boss_baron_geddon();
    AddSC_boss_thane();
    AddSC_boss_twin_golems();
    AddSC_boss_majordomo();
    AddSC_boss_ragnaros();
    AddSC_instance_molten_core();
    AddSC_boss_anubrekhan();                                //naxxramas
    AddSC_boss_four_horsemen();
    AddSC_boss_faerlina();
    AddSC_boss_gluth();
    AddSC_boss_gothik();
    AddSC_boss_kelthuzad();
    AddSC_boss_loatheb();
    AddSC_boss_maexxna();
    AddSC_boss_noth();
    AddSC_boss_heigan();
    AddSC_boss_patchwerk();
    AddSC_boss_grobbulus();
    AddSC_boss_thaddius();
    AddSC_boss_razuvious();
    AddSC_boss_sapphiron();
    AddSC_instance_naxxramas();
    //AddSC_boss_azshir_the_sleepless();
    AddSC_instance_scarlet_monastery();
    //AddSC_boss_kormok();
    AddSC_boss_vectus();
    //AddSC_boss_lordblackwood();
    AddSC_instance_scholomance();
    AddSC_boss_baroness_anastari();
    AddSC_boss_sc_attunement();
    AddSC_instance_stratholme();
    AddSC_stratholme_aurius_phantoms();
    AddSC_instance_sunken_temple();                         //sunken_temple
    AddSC_instance_uldaman();
    AddSC_uldaman();
    AddSC_boss_archaedas();
    AddSC_boss_arlokk();                                    //zulgurub
    //AddSC_boss_grilek();
    AddSC_boss_hakkar();
    //AddSC_boss_hazzarah();
    AddSC_boss_jindo();
    AddSC_boss_mandokir();
    AddSC_boss_marli();
    AddSC_boss_ouro();
    AddSC_boss_renataki();
    AddSC_boss_thekal();
    //AddSC_boss_wushoolay();
    AddSC_instance_zulgurub();
    AddSC_zulgurub_pile_dechets();
    AddSC_boss_omen();

    //AddSC_alterac_mountains();
    AddSC_arathi_highlands();
    AddSC_blasted_lands();
    AddSC_burning_steppes();
    AddSC_dun_morogh();
    AddSC_eastern_plaguelands();
    AddSC_elwynn_forest();
    AddSC_grim_reaches();
    AddSC_hillsbrad_foothills();
    AddSC_hinterlands();
    AddSC_ironforge();
    AddSC_loch_modan();
    AddSC_redridge_mountains();
    AddSC_searing_gorge();
    AddSC_silverpine_forest();
    AddSC_stormwind_city();
    AddSC_quest_stormwind_rendezvous();
    AddSC_stranglethorn_vale();
    AddSC_swamp_of_sorrows();
    AddSC_tirisfal_glades();
    AddSC_undercity();
    AddSC_western_plaguelands();
    AddSC_westfall();
    AddSC_wetlands();

    //kalimdor
    AddSC_celebras_spirit();
    AddSC_boss_onyxia();                                    //onyxias_lair
    AddSC_razorfen_downs_escort();
    AddSC_razorfen_kraul_quests();
    AddSC_boss_ayamiss();                                   //ruins_of_ahnqiraj
    AddSC_boss_buru();
    AddSC_boss_ossirian();
    AddSC_ruins_of_ahnqiraj();
    AddSC_instance_ruins_of_ahnqiraj();
    AddSC_boss_cthun();                                     //temple_of_ahnqiraj
    AddSC_boss_viscidus();
    AddSC_boss_fankriss();
    AddSC_boss_huhuran();
    AddSC_bug_trio();
    AddSC_boss_sartura();
    AddSC_boss_skeram();
    AddSC_boss_twinemperors();
    AddSC_mob_anubisath_sentinel();
    AddSC_instance_temple_of_ahnqiraj();
    AddSC_wailing_caverns();                               //Wailing caverns
    AddSC_instance_wailing_caverns();
    AddSC_zulfarrak_tablet_ward();
    AddSC_farraki_arena();
    AddSC_instance_zulfarrak();

    AddSC_ashenvale();
    AddSC_alahthalas();
    AddSC_azshara();
    AddSC_balor();
    AddSC_darkshore();
    AddSC_desolace();
    AddSC_durotar();
    AddSC_dustwallow_marsh();
    AddSC_duskwood();
    AddSC_felwood();
    AddSC_feralas();
    AddSC_moonglade();
    AddSC_moonwhisper_coast();
    AddSC_mulgore();
    AddSC_northwind();
    AddSC_orgrimmar();
    AddSC_silithus();
    RegisterScripts_Silithus();
    AddSC_stonetalon_mountains();
    AddSC_tanaris();
    AddSC_teldrassil();
    AddSC_the_barrens();
    AddSC_thousand_needles();
    AddSC_thunder_bluff();
    AddSC_ungoro_crater();
    AddSC_winterspring();

    // Stormwind Vaults
    AddSC_boss_damian_the_ripper();
    AddSC_boss_volkan_cruelblade();
    AddSC_instance_stormwind_vaults();

    AddSC_arena_tournament();
    AddSC_boss_rares();
    AddSC_boss_avatar_of_pompa();
    AddSC_boss_turtlhu();
    AddSC_karazhan_crypt_triggers();
    AddSC_instance_gilneas_city();
    AddSC_boss_celia();
    AddSC_boss_lord_mortimer();
    AddSC_boss_xmas_wolf();
    AddSC_boss_nerubian_overseer();
    AddSC_mirage_raceway();
    AddSC_gardening();
    AddSC_boss_dark_reaver();
    AddSC_instance_emerald_sanctum();
    AddSC_boss_solnius();
    AddSC_boss_anomalus();
    AddSC_boss_echo_of_medivh();
    AddSC_boss_incantagos();
    AddSC_boss_keeper_gnarlmoon();
    AddSC_boss_kings_council();
    AddSC_boss_kruul();
    AddSC_boss_sanv_tasdal();
    AddSC_boss_ostarius();
    AddSC_CUSTOM_SPELL();

    // Spell and aura scripts
    AddSC_druid_spell_scripts();
    AddSC_hunter_spell_scripts();
    AddSC_item_spell_scripts();
    AddSC_mage_spell_scripts();
    AddSC_paladin_spell_scripts();
    AddSC_priest_spell_scripts();
    AddSC_rogue_spell_scripts();
    AddSC_shaman_spell_scripts();
    AddSC_special_spell_scripts();
    AddSC_turtle_spell_scripts();
    AddSC_warlock_spell_scripts();
    AddSC_warrior_spell_scripts();

    AddSC_random_scripts_0();
    AddSC_random_scripts_1();
    AddSC_random_scripts_2();
    AddSC_random_scripts_3();
    AddSC_npc_j_eevee();
    AddSC_easter_egg_loot();

    AddSC_custom_exploration_triggers();

    // Scarlet Citadel
    AddSC_boss_ardaeus();
    AddSC_boss_daelus();
    AddSC_boss_mariella();
    AddSC_instance_scarlet_citadel();

    // Hateforge Quarry
    AddSC_hateforge_quarry_spells();

    // Black Morass
    AddSC_black_morass_trash();
    AddSC_instance_black_morass();
    AddSC_boss_gerastrasz();
    AddSC_boss_chronormu();

    // Misc
    AddSC_npc_loothelper();
    AddSC_npc_ptr();
    AddSC_jewelcrafting();
}
