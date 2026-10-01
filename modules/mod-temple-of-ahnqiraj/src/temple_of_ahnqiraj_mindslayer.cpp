// The Qiraji Mindslayer, taken out of instance_temple_of_ahnqiraj.cpp: it goes to mod-temple-of-ahnqiraj
// and its rows, while the instance (which turns slayers into mindslayers) stays in the core (trt A29, AM1).
#include "scriptPCH.h"
#include "dungeons/temple_of_ahnqiraj/temple_of_ahnqiraj.h"

namespace mod_temple_of_ahnqiraj
{


struct AI_QirajiMindslayer : public ScriptedAI {
    uint32 insanityTimer;
    uint32 mindBlastTimer;
    uint32 mindFlayTimer;

    AI_QirajiMindslayer(Creature* pCreature) :
        ScriptedAI(pCreature)
    {
        Reset();
    }


    void Reset() override
    {
        insanityTimer = urand(5000, 60000);
        mindBlastTimer = urand(12000, 32000);
        mindFlayTimer = urand(5000, 20000);
    }

    void JustDied(Unit* pWho) override
    {
        if (!m_creature->GetInstanceData())
            return;

        // finding closest player and casting manaburn on that target.
        // todo: should we add a player->GetPowerType() == POWER_MANA check too when choosing valid target?
        Player* closestPlayer = nullptr;
        float closestDist = std::numeric_limits<float>::max();
        MapRefManager const &list = m_creature->GetMap()->GetPlayers();
        for (const auto& i : list)
        {
            if (Player* player = i.getSource()) {
                if (player->IsAlive()) { 
                    float dist = m_creature->GetDistance(player);
                    if (dist < closestDist) {
                        closestPlayer = player;
                        closestDist = dist;
                    }
                }
            }
        }
        if (closestPlayer) {
            DoCastSpellIfCan(closestPlayer, 26049, CF_TRIGGERED | CF_INTERRUPT_PREVIOUS);
        }
    }

    void UpdateAI(const uint32 diff) override
    {
        if (!m_creature->IsNonMeleeSpellCasted()) { // prevents re-targetting of topaggro from happening while channeling mindflay
            if (!m_creature->SelectHostileTarget() || !m_creature->GetVictim())
                return;
        }
            
        if (mindFlayTimer < diff) {
            if (Unit* pU = m_creature->SelectAttackingTarget(AttackingTarget::ATTACKING_TARGET_RANDOM, 0, 26044, SELECT_FLAG_PLAYER | SELECT_FLAG_IN_LOS)) {
                if (DoCastSpellIfCan(pU, 26044) == CAST_OK) {
                    mindFlayTimer = urand(10000, 30000);
                }
            }
        }
        else {
            mindFlayTimer -= diff;
        }

        if (mindBlastTimer < diff) {
            if (Unit* pU = m_creature->SelectAttackingTarget(AttackingTarget::ATTACKING_TARGET_TOPAGGRO, 0, 26048, SELECT_FLAG_PLAYER | SELECT_FLAG_IN_LOS)) {
                if (DoCastSpellIfCan(pU, 26048) == CAST_OK) {
                    mindBlastTimer = urand(17000, 44000);
                }
            }
        }
        else {
            mindBlastTimer -= diff;
        }
        
        if (insanityTimer < diff) {
            if (Unit* pU = m_creature->SelectAttackingTarget(AttackingTarget::ATTACKING_TARGET_RANDOM, 0, 26079, SELECT_FLAG_PLAYER | SELECT_FLAG_IN_LOS)) {
                if (DoCastSpellIfCan(pU, 26079) == CAST_OK) {
                    insanityTimer = urand(15000, 60000);
                }
            }
        }
        else {
            insanityTimer -= diff;
        }

        DoMeleeAttackIfReady();
    }

};
CreatureAI* GetAI_qirajiMindslayer(Creature* pCreature)
{
    return new AI_QirajiMindslayer(pCreature);
}


void AddSC_temple_of_ahnqiraj_mindslayer()
{
    Script* pNewScript;

    pNewScript = new Script;
    pNewScript->Name = "mob_qiraji_mindslayer";
    pNewScript->GetAI = &GetAI_qirajiMindslayer;
    pNewScript->RegisterSelf();
}

} // namespace mod_temple_of_ahnqiraj
