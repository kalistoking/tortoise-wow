// The Gong of Bethekk, taken out of boss_arlokk.cpp: it goes to mod-zulgurub and its rows (the gong's
// own event), while Arlokk and her prowlers stay in the core (trt A25, AM1).
#include "scriptPCH.h"
#include "dungeons/zulgurub/zulgurub.h"

namespace mod_zulgurub
{


bool GOHello_go_gong_of_bethekk(Player* pPlayer, GameObject* pGo)
{
    if (ScriptedInstance* pInstance = (ScriptedInstance*)pGo->GetInstanceData())
    {
        if (pInstance->GetData(TYPE_ARLOKK) == DONE || pInstance->GetData(TYPE_ARLOKK) == IN_PROGRESS)
            return true;

        pInstance->SetData(TYPE_ARLOKK, IN_PROGRESS);
    }

    return false;
}

enum
{
    SAY_AGGRO                   = -1309011,
    SAY_FEAST_PANTHER           = -1309012,
    SAY_DEATH                   = -1309013,

    SPELL_SHADOWWORDPAIN        = 24212, // Mot de l'ombre : douleur
    SPELL_GOUGE                 = 12540, // Suriner
    SPELL_MARK                  = 24210,
    SPELL_CLEAVE                = 26350,                    //Perhaps not right. Not a red aura...
    SPELL_PANTHER_TRANSFORM     = 24190,
    SPELL_BACKSTAB              = 15582, // Attaque sournoise
    SPELL_TOURBILLON            = 15589,
    SPELL_ATTAQUE_MENTALE       = 15587,
    SPELL_ROSSER                = 3391,
    SPELL_RAVAGE                = 24213,

    MODEL_ID_NORMAL             = 15218,
    MODEL_ID_PANTHER            = 15215,
    MODEL_ID_BLANK              = 11686,

    NPC_ZULIAN_PROWLER          = 15101,
//    NPC_ARLOKK                  = 14515, // zulgurub.h
    MAX_PANTHER_COUNT           = 30,

    GO_ARLOKK_FORCE_FIELD       = 180497,
    GO_ARLOKK_GONG              = 180526
};

/*
[SQL]
INSERT INTO creature_template SET entry=14968, modelid_1=15013, modelid_2=15013, name="High Priestess Arlokk Transform Visual", faction=35
*/

void AddSC_zulgurub_gong()
{
    Script* newscript;

    newscript = new Script;
    newscript->Name = "go_gong_of_bethekk";
    newscript->pGOHello = &GOHello_go_gong_of_bethekk;
    newscript->RegisterSelf();
}

} // namespace mod_zulgurub
