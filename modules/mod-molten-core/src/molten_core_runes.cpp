// The runes a raid douses with Aqual Quintessence, taken out of instance_molten_core.cpp: they go to
// mod-molten_core and their rows, while the instance stays in the core (trt A27 second pass, AM1).
#include "scriptPCH.h"
#include "dungeons/molten_core/molten_core.h"

namespace mod_molten_core
{


bool GOHello_go_rune_MC(Player* pPlayer, GameObject* pGo)
{
    if (ScriptedInstance* pInstance = (ScriptedInstance*)pGo->GetInstanceData())
    {
        switch (pGo->GetEntry())
        {
            case 176951:                                    //Sulfuron
                if (pInstance->GetData(TYPE_SULFURON) == DONE)
                {
                    if (pInstance->GetData(TypeRuneActive0) != DONE)
                        pInstance->SetData(TypeRuneActive0, DONE);
                    if (GameObject* Rune = pGo->FindNearestGameObject(178187, 20.0f))
                        Rune->Delete();
                }
                else
                    return true;
                break;
            case 176952:                                    //Geddon
                if (pInstance->GetData(TYPE_GEDDON) == DONE)
                {
                    if (pInstance->GetData(TypeRuneActive1) != DONE)
                        pInstance->SetData(TypeRuneActive1, DONE);
                    if (GameObject* Rune = pGo->FindNearestGameObject(178188, 20.0f))
                        Rune->Delete();
                }
                else
                    return true;
                break;
            case 176953:                                    //Shazzrah
                if (pInstance->GetData(TYPE_SHAZZRAH) == DONE)
                {
                    if (pInstance->GetData(TypeRuneActive2) != DONE)
                        pInstance->SetData(TypeRuneActive2, DONE);
                    if (GameObject* Rune = pGo->FindNearestGameObject(178189, 20.0f))
                        Rune->Delete();
                }
                else
                    return true;
                break;
            case 176954:                                    //Golemagg
                if (pInstance->GetData(TYPE_GOLEMAGG) == DONE)
                {
                    if (pInstance->GetData(TypeRuneActive3) != DONE)
                        pInstance->SetData(TypeRuneActive3, DONE);
                    if (GameObject* Rune = pGo->FindNearestGameObject(178190, 20.0f))
                        Rune->Delete();
                }
                else
                    return true;
                break;
            case 176955:                                    //Garr
                if (pInstance->GetData(TYPE_GARR) == DONE)
                {
                    if (pInstance->GetData(TypeRuneActive4) != DONE)
                        pInstance->SetData(TypeRuneActive4, DONE);
                    if (GameObject* Rune = pGo->FindNearestGameObject(178191, 20.0f))
                        Rune->Delete();
                }
                else
                    return true;
                break;
            case 176956:                                    //Magmadar
                if (pInstance->GetData(TYPE_MAGMADAR) == DONE)
                {
                    if (pInstance->GetData(TypeRuneActive5) != DONE)
                        pInstance->SetData(TypeRuneActive5, DONE);
                    if (GameObject* Rune = pGo->FindNearestGameObject(178192, 20.0f))
                        Rune->Delete();
                }
                else
                    return true;
                break;
            case 176957:                                    //Gehennas
                if (pInstance->GetData(TYPE_GEHENNAS) == DONE)
                {
                    if (pInstance->GetData(TypeRuneActive6) != DONE)
                        pInstance->SetData(TypeRuneActive6, DONE);
                    if (GameObject* Rune = pGo->FindNearestGameObject(178193, 20.0f))
                        Rune->Delete();
                }
                else
                    return true;
                break;
        }

        if (pInstance->GetData(TypeRuneActive0) == DONE &&
                pInstance->GetData(TypeRuneActive1) == DONE &&
                pInstance->GetData(TypeRuneActive2) == DONE &&
                pInstance->GetData(TypeRuneActive3) == DONE &&
                pInstance->GetData(TypeRuneActive4) == DONE &&
                pInstance->GetData(TypeRuneActive5) == DONE &&
                pInstance->GetData(TypeRuneActive6) == DONE &&
                pInstance->GetData(TypeDomoSpawn) != DONE &&
                pInstance->GetData(TYPE_RAGNAROS) != DONE)
        {
            pInstance->SetData(TypeDomoSpawn, DONE);
            if (Creature* Domo = pPlayer->SummonCreature(NPC_DOMO, 758.089f, -1176.71f, -118.640f, 3.12414f, TEMPSUMMON_MANUAL_DESPAWN, 2 * HOUR * IN_MILLISECONDS))
                DoScriptText(-1409004, Domo);
        }
    }

    return false;
}


void AddSC_molten_core_runes()
{
    Script* newscript;

    newscript = new Script;
    newscript->Name = "go_rune_MC";
    newscript->pGOHello = &GOHello_go_rune_MC;
    newscript->RegisterSelf();
}

} // namespace mod_molten_core
