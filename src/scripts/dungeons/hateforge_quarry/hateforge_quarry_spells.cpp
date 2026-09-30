// The Hateforge auras' dispel counterpart, taken out of hateforge_quarry_trash.cpp: a spell's aura
// script, not a creature's AI -- it stays in the core while the dungeon's creatures are
// mod-hateforge-quarry's and their rows (trt A6, AM1).
#include "scriptPCH.h"

class spell_hateforge_dispel_counterpart : public AuraScript
{
public:
    void OnDispel(SpellAuraHolder* holder, Unit* target, Spell* /*dispelSpell*/, uint32 /*dispelCount*/) override
    {
        if (!holder || !target || target->GetMapId() != 807)
            return;

        uint32 counterpartAura = 0;
        switch (holder->GetId())
        {
            case 56508: counterpartAura = 56509; break;
            case 56510: counterpartAura = 56511; break;
            case 56512: counterpartAura = 56513; break;
            case 56514: counterpartAura = 56515; break;
            case 56516: counterpartAura = 56517; break;
            default: break;
        }

        if (counterpartAura && !target->HasAura(counterpartAura))
            target->AddAura(counterpartAura);
    }
};

AuraScript* GetScript_HateforgeDispelCounterpart(SpellEntry const*)
{
    return new spell_hateforge_dispel_counterpart();
}

void AddSC_hateforge_quarry_spells()
{
    Script* pNewscript = new Script;
    pNewscript->Name = "spell_hateforge_dispel_counterpart";
    pNewscript->GetAuraScript = &GetScript_HateforgeDispelCounterpart;
    pNewscript->RegisterSelf();
}
