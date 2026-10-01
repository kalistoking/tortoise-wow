/* Copyright (C) 2006 - 2009 ScriptDev2 <https://scriptdev2.svn.sourceforge.net/>
* This program is free software licensed under GPL version 2
* Please see the included DOCS/LICENSE.TXT for more information */

#include "scriptPCH.h"

// AI system
void AddSC_generic_spell_ai();

//battlegrounds
void AddSC_battleground();
void AddSC_bg_alterac();
void AddSC_bg_sunnyglade();

//custom

// Event

// Items

// HT

//world

//eastern kingdoms
void AddSC_blackrock_spire_rookery_egg();         // the egg's spell (trt A18)
void AddSC_blackrock_depths();                       //blackrock_depths
void AddSC_instance_blackrock_depths();
//void AddSC_boss_mothersmolderweb();
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

//void AddSC_alterac_mountains();

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
void AddSC_wailing_caverns_disciple();               // the Disciple of Naralex, stays in the core (trt A36)
void AddSC_zulfarrak_tablet_ward();               // the tablet and the ward (trt A37)

void AddSC_war_effort();

// Turtle WoW
void AddSC_karazhan_crypt_triggers();             // the trigger objects and the gate (trt A31)
void AddSC_instance_emerald_sanctum();
void AddSC_boss_solnius();
void AddSC_boss_anomalus();
void AddSC_boss_echo_of_medivh();
void AddSC_boss_incantagos();
void AddSC_boss_keeper_gnarlmoon();
void AddSC_boss_kings_council();
void AddSC_boss_kruul();
void AddSC_boss_sanv_tasdal();

void AddSC_npc_j_eevee();
void AddSC_easter_egg_loot();


// Scarlet Citadel
void AddSC_boss_ardaeus();
void AddSC_instance_scarlet_citadel();

// Hateforge Quarry
void AddSC_hateforge_quarry_spells();                // the dispel counterpart, stays in the core (trt A6)

// Stormwind Vaults
void AddSC_boss_damian_the_ripper();
void AddSC_boss_volkan_cruelblade();
void AddSC_instance_stormwind_vaults();

// Black Morass
void AddSC_black_morass_neto();

// Misc
void AddSC_npc_loothelper();

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

    // Event

    // Items

    // HT

    //world

    AddSC_war_effort();

    //eastern kingdoms
    AddSC_blackrock_depths();                               //blackrock_depths
    AddSC_instance_blackrock_depths();
    //AddSC_boss_mothersmolderweb();

    AddSC_blackrock_spire_rookery_egg();
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

    //AddSC_alterac_mountains();

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
    AddSC_wailing_caverns_disciple();
    AddSC_zulfarrak_tablet_ward();


    // Stormwind Vaults
    AddSC_boss_damian_the_ripper();
    AddSC_boss_volkan_cruelblade();
    AddSC_instance_stormwind_vaults();

    AddSC_karazhan_crypt_triggers();
    AddSC_instance_emerald_sanctum();
    AddSC_boss_solnius();
    AddSC_boss_anomalus();
    AddSC_boss_echo_of_medivh();
    AddSC_boss_incantagos();
    AddSC_boss_keeper_gnarlmoon();
    AddSC_boss_kings_council();
    AddSC_boss_kruul();
    AddSC_boss_sanv_tasdal();

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

    AddSC_npc_j_eevee();
    AddSC_easter_egg_loot();


    // Scarlet Citadel
    AddSC_boss_ardaeus();
    AddSC_instance_scarlet_citadel();

    // Hateforge Quarry
    AddSC_hateforge_quarry_spells();

    // Black Morass
    AddSC_black_morass_neto();

    // Misc
    AddSC_npc_loothelper();
}
