// Ohgan, taken out of boss_mandokir.cpp: it goes to mod-zulgurub and its rows, while Mandokir stays in the
// core -- Ohgan's kills reach his KilledUnit, by its rows a script event (trt A25 third pass, AM1).
#include "scriptPCH.h"
#include "dungeons/zulgurub/zulgurub.h"

namespace mod_zulgurub
{

static constexpr uint32 NPC_MANDOKIR{ 11382 };
// Ohgans's spells
static constexpr uint32 SPELL_SUNDERARMOR{ 24317 };
static constexpr uint32 SPELL_THRASH{ 3391 };
static constexpr uint32 SPELL_EXECUTE{ 7160 };

struct mob_ohganAI : public ScriptedAI
{
    explicit mob_ohganAI(Creature* pCreature) : ScriptedAI(pCreature)
    {
        m_pInstance = static_cast<ScriptedInstance*>(pCreature->GetInstanceData());
        mob_ohganAI::Reset();
    }

    uint32 m_uiSunderArmor_Timer{};
    uint32 m_uiThrash_Timer{};
    uint32 m_uiExecute_Timer{};

    ScriptedInstance* m_pInstance{};

    void Reset() override
    {
        m_uiSunderArmor_Timer = 5000;
        m_uiThrash_Timer = urand(5000, 9000);
        m_uiExecute_Timer = 1000;
    }

    void JustDied(Unit* /*pKiller*/) override
    {
        if (m_pInstance)
            m_pInstance->SetData(TYPE_OHGAN, DONE);
    }

    void KilledUnit(Unit* pVictim) override
    {
        if (pVictim->GetTypeId() == TYPEID_PLAYER)
        {
            if (m_creature->IsInCombat())
            {
                if (Creature* pMandokir{ pVictim->FindNearestCreature(NPC_MANDOKIR, 100.f) })
                {
                    pMandokir->AI()->KilledUnit(pVictim);
                }
            }
        }
    }

    void UpdateAI(const uint32 uiDiff) override
    {
        if (!m_creature->SelectHostileTarget() || !m_creature->GetVictim())
        {
            if (!m_creature->IsAlive()) // Is this necessary?
                return;

            if (Creature* pMandokir{ m_creature->FindNearestCreature(NPC_MANDOKIR, 100.f) })
            {
                if (pMandokir->IsAlive() && pMandokir->GetVictim())
                {
                    m_creature->AI()->AttackStart(pMandokir->GetVictim());
                }
                else
                {
                    return;
                }
            }
            else
            {
                return;
            }
        }

        if (m_uiSunderArmor_Timer < uiDiff)
        {
            if (DoCastSpellIfCan(me->GetVictim(), SPELL_SUNDERARMOR) == CAST_OK)
            {
                m_uiSunderArmor_Timer = urand(10000, 15000);
            }
        }
        else
        {
            m_uiSunderArmor_Timer -= uiDiff;
        }

        if (m_uiThrash_Timer < uiDiff)
        {
            if (DoCastSpellIfCan(me, SPELL_THRASH) == CAST_OK)
            {
                m_uiThrash_Timer = urand(5000, 9000);
            }
        }
        else
        {
            m_uiThrash_Timer -= uiDiff;
        }

        if (me->GetVictim()->GetHealth() < (me->GetVictim()->GetMaxHealth() * .2f))
        {
            if (m_uiExecute_Timer < uiDiff)
            {
                if (DoCastSpellIfCan(me->GetVictim(), SPELL_EXECUTE) == CAST_OK)
                {
                    m_uiExecute_Timer = 10000;
                }
            }
            else
            {
                m_uiExecute_Timer -= uiDiff;
            }
        }
        else
        {
            m_uiExecute_Timer -= uiDiff;
        }

        DoMeleeAttackIfReady();
    }
};

CreatureAI* GetAI_mob_ohgan(Creature* pCreature)
{
    return new mob_ohganAI(pCreature);
}


void AddSC_zulgurub_ohgan()
{
    Script* pNewScript{};

    pNewScript = new Script;
    pNewScript->Name = "mob_ohgan";
    pNewScript->GetAI = &GetAI_mob_ohgan;
    pNewScript->RegisterSelf();
}

} // namespace mod_zulgurub
