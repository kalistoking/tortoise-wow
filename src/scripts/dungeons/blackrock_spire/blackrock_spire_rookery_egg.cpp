// Freeze Rookery Egg, taken out of instance_blackrock_spire.cpp: a spell script, which rows cannot
// say. It stays in the core; the instance and Urok's challenge are mod-blackrock-spire's and their
// rows' (trt A18, AM1).
#include "scriptPCH.h"

struct spell_ubrs_freeze_rookery_egg : public SpellScript
{
    bool OnEffectExecute(Spell* spell, SpellEffectIndex effIdx) const override
    {
        if (effIdx != EFFECT_INDEX_0)
            return true;

        GameObject* go = spell->GetGOTarget();
        if (!go)
            return false;

        if (go->getLootState() == GO_READY)
            go->UseDoorOrButton(0, true);

        return false;
    }
};

SpellScript* GetScript_UBRSFreezeRookeryEgg(SpellEntry const*)
{
    return new spell_ubrs_freeze_rookery_egg();
}

void AddSC_blackrock_spire_rookery_egg()
{
    Script* pNewScript = new Script;
    pNewScript->Name = "spell_ubrs_freeze_rookery_egg";
    pNewScript->GetSpellScript = &GetScript_UBRSFreezeRookeryEgg;
    pNewScript->RegisterSelf();
}
