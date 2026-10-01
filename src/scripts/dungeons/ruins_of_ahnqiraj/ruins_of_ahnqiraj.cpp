/* Copyright (C) 2006 - 2010 ScriptDev2 <https://scriptdev2.svn.sourceforge.net/>
 * This program is free software; you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation; either version 2 of the License, or
 * (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program; if not, write to the Free Software
 * Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307  USA
 */

/* ScriptData
SDName: Ruins of Ahn'Qiraj
SD%Complete: 80
SDComment: fix flesh hunter's spell_consume in core and remove hacks, find right explode spell for anubisath guardian
SDCategory: Ruins of Ahn'Qiraj
EndScriptData */

/* ContentData
mob_anubisath_guardian
mob_flesh_hunter
EndContentData */

#include "scriptPCH.h"
#include "ruins_of_ahnqiraj.h"

// Anubisath guardian
enum
{
    SPELL_METEOR = 24340,
    SPELL_PLAGUE = 22997,
    SPELL_SHADOW_STORM = 26546,
    SPELL_THUNDER_CLAP = 26554,
    SPELL_REFLECT_ARFR = 13022,
    SPELL_REFLECT_FSSH = 19595,
    SPELL_ENRAGE = 8269, //8559,
    SPELL_EXPLODE = 25699,
    SPELL_INIT_EXPLODE = 25698,

    EMOTE_FRENZY = 10677,

    NPC_ANU_WARRIOR = 15537,
    NPC_ANU_SWARM = 15538,

    OBJ_SMALL_OBSIDIAN_CHUNK = 181068
};

struct mob_anubisath_guardianAI : public ScriptedAI
{
    explicit mob_anubisath_guardianAI(Creature* pCreature) : ScriptedAI(pCreature)
    {
        Reset();
    }

    uint32 m_uiSpell1;
    uint32 m_uiSpell2;
    uint32 m_uiSpell3;
    uint32 m_uiSpell4;
    uint32 m_uiNPCSummon;

    uint32 m_uiSpell1_Timer;
    uint32 m_uiSpell2_Timer;
    uint32 m_uiSummon_Timer;
    uint32 m_uiExplode_Timer;

    uint8 m_uiSummonCount;

    bool m_bIsEnraged;
    bool m_bIsExploding;

    void Reset() override
    {
        m_uiSpell1 = urand(0, 1) ? SPELL_METEOR : SPELL_PLAGUE;
        m_uiSpell2 = urand(0, 1) ? SPELL_SHADOW_STORM : SPELL_THUNDER_CLAP;
        m_uiSpell3 = urand(0, 1) ? SPELL_REFLECT_ARFR : SPELL_REFLECT_FSSH;
        m_uiSpell4 = urand(0, 1) ? SPELL_ENRAGE : SPELL_INIT_EXPLODE;
        m_uiNPCSummon = urand(0, 1) ? NPC_ANU_WARRIOR : NPC_ANU_SWARM;

        m_uiSpell1_Timer = 10000;
        m_uiSpell2_Timer = 20000;
        m_uiSummon_Timer = 10000;
        m_bIsEnraged = false;
        m_bIsExploding = false;
        m_uiSummonCount = 0;
        m_uiExplode_Timer = 6000;

        m_creature->RemoveAllAuras();
    }

    void JustDied(Unit* pKiller) override
    {
        m_creature->SummonGameObject(OBJ_SMALL_OBSIDIAN_CHUNK, m_creature->GetPositionX(), m_creature->GetPositionY(), m_creature->GetPositionZ(), 0, 0, 0, 0, 0, -1, false);
        m_creature->ForcedDespawn(8000); // 8 Seconds until despawn
    }

    void Aggro(Unit* pWho) override
    {
        DoCast(m_creature, m_uiSpell3);
    }

    void JustSummoned(Creature* pSummoned) override
    {
        pSummoned->AI()->AttackStart(m_creature->GetVictim());
        ++m_uiSummonCount;
    }

    void SummonedCreatureDespawn(Creature *pDespawned) override
    {
        -- m_uiSummonCount;
    }

    void DamageTaken(Unit* pDoneBy, uint32 &uiDamage) override
    {
        if (!m_bIsEnraged && (m_creature->GetHealth() * 100 / m_creature->GetMaxHealth()) < 10)
        {
            if (m_uiSpell4 == SPELL_ENRAGE)
            {
                DoCast(m_creature->GetVictim(), m_uiSpell4);
                DoScriptText(EMOTE_FRENZY, m_creature);
                m_bIsEnraged = true;
            }
            else
            {
                m_creature->CastSpell(m_creature, m_uiSpell4, false);
                m_bIsExploding = true;
                m_uiExplode_Timer = 6000;
            }
        }
    }

    void UpdateAI(const uint32 uiDiff) override
    {
        if (!m_creature->SelectHostileTarget() || !m_creature->GetVictim())
            return;

        if (m_uiExplode_Timer < uiDiff && m_bIsExploding)
        {
            if (DoCastSpellIfCan(m_creature, SPELL_EXPLODE) == CAST_OK)
                m_uiExplode_Timer = 15000;
        }
        else
            m_uiExplode_Timer -= uiDiff;

        if (m_uiSpell1_Timer < uiDiff)
        {
            // Spell1 shall be cast on random target
            if (Unit* pUnit = m_creature->SelectAttackingTarget(ATTACKING_TARGET_RANDOM, 0))
            {
                // Create visual animation of the spell
                m_creature->SendSpellGo(m_creature, m_uiSpell1);

                if (DoCastSpellIfCan(pUnit, m_uiSpell1) == CAST_OK)
                    m_uiSpell1_Timer = 15000;
            }
        }
        else
            m_uiSpell1_Timer -= uiDiff;

        if (m_uiSpell2_Timer < uiDiff)
        {
            if (DoCastSpellIfCan(m_creature->GetVictim(), m_uiSpell2) == CAST_OK)
                m_uiSpell2_Timer = 15000;
        }
        else
            m_uiSpell2_Timer -= uiDiff;

        if (m_uiSummon_Timer < uiDiff)
        {
            if (m_uiSummonCount < 4 && m_creature->IsAlive())
            {
                m_creature->SummonCreature(m_uiNPCSummon,
                                           m_creature->GetPositionX(),
                                           m_creature->GetPositionY(),
                                           m_creature->GetPositionZ(),
                                           0,
                                           TEMPSUMMON_TIMED_DESPAWN,
                                           60000);
                // Create visual animation of the teleportation spell
                m_creature->SendSpellGo(m_creature, 25681);
            }

            m_uiSummon_Timer = 15000;
        }
        else
            m_uiSummon_Timer -= uiDiff;

        DoMeleeAttackIfReady();
    }
};

struct OssirianTornadoAI : public ScriptedAI
{
    explicit OssirianTornadoAI(Creature* pCreature) : ScriptedAI(pCreature)
    {
        SetCombatMovement(false);
        m_creature->CastSpell(m_creature, 25160, false);
        m_creature->CastSpell(m_creature, 10092, false);
        m_creature->SetDefaultMovementType(RANDOM_MOTION_TYPE);
        m_creature->SetWanderDistance(55.0f);
        m_creature->GetMotionMaster()->Initialize();
        Reset();
    }

    void Reset() override
    {
    }

    void Aggro(Unit* pWho) override
    {
        m_creature->SetInCombatWithZone();
    }

    void UpdateAI(const uint32 uiDiff) override
    {
        if (!m_creature->SelectHostileTarget() || !m_creature->GetVictim())
            return;

        DoMeleeAttackIfReady();
    }
};



// Flesh hunter

enum
{
    SPELL_TRASH         =   3391,
    SPELL_CONSUME       =   25371, //26186, //25371,
    SPELL_CONSUME_HEAL  =   25378,
    SPELL_POISON_BOLT   =   25424,
    SPELL_CONSUME_DMG   =   25373,
    SPELL_SPLIT         =   25383,
};

struct mob_flesh_hunterAI : public ScriptedAI
{
    explicit mob_flesh_hunterAI(Creature* pCreature) : ScriptedAI(pCreature)
    {
        Reset();
    }

    uint64 m_uiConsumeVictim;

    uint32 m_uiPoisonBolt_Timer;
    uint32 m_uiTrash_Timer;
    uint32 m_uiConsume_Timer;
    uint32 m_uiConsumeDamage_Timer;

    bool m_bPlayerConsumed;
    bool m_bPlayerConsumedCharged;

    void Reset() override
    {
        m_uiPoisonBolt_Timer = 3000;
        m_uiTrash_Timer = 5000;
        m_uiConsume_Timer = 3000;
        m_uiConsumeDamage_Timer = 1000;

        m_uiConsumeVictim = 0;
        m_bPlayerConsumed = false;
        m_bPlayerConsumedCharged = false;
    }

    void Aggro(Unit* pWho) override
    {
        m_creature->SetInCombatWithZone();
    }
    /*
    void AttackStart(Unit* who)
    {
        if (!who)
            return;

        if (m_creature->Attack(who, true))
        {
            m_creature->AddThreat(who);
            m_creature->SetInCombatWith(who);
            who->SetInCombatWith(m_creature);

            // Poursuite à 25m
            m_creature->GetMotionMaster()->MoveCaster(who, 25.0f);
        }
    }
    */
    void KilledUnit(Unit* pWho) override
    {
        if (pWho->GetGUID() == m_uiConsumeVictim)
            DoCast(m_creature, SPELL_CONSUME_HEAL);
    }

    void UpdateAI(const uint32 uiDiff) override
    {
        if (!m_creature->SelectHostileTarget() || !m_creature->GetVictim())
            return;

        if (m_uiPoisonBolt_Timer < uiDiff)
        {
            if (Unit* pTarget = m_creature->SelectAttackingTarget(ATTACKING_TARGET_RANDOM, 0))
            {
                if (DoCastSpellIfCan(pTarget, SPELL_POISON_BOLT) == CAST_OK)
                    m_uiPoisonBolt_Timer = 3000;
            }
        }
        else
            m_uiPoisonBolt_Timer -= uiDiff;

        if (m_uiConsume_Timer < uiDiff)
        {
            if (Unit* pTarget = m_creature->SelectAttackingTarget(ATTACKING_TARGET_TOPAGGRO, 0))
            {
                if (DoCastSpellIfCan(pTarget, SPELL_CONSUME) == CAST_OK)
                {
                    m_uiConsumeVictim = pTarget->GetGUID();
                    m_bPlayerConsumed = true;
                    m_uiConsume_Timer = 30000;
                }
            }
        }
        else
            m_uiConsume_Timer -= uiDiff;

        if (Unit* pConsumeTarget = Unit::GetUnit(*m_creature, m_uiConsumeVictim))
        {
            if (pConsumeTarget->HasAura(SPELL_CONSUME))
            {
                if (m_uiConsumeDamage_Timer < uiDiff)
                {
                    if (DoCastSpellIfCan(pConsumeTarget, SPELL_CONSUME_DMG) == CAST_OK)
                    {
                        m_creature->GetMotionMaster()->Initialize();
                        m_creature->StopMoving();
                        m_creature->GetThreatManager().modifyThreatPercent(pConsumeTarget, -100);
                        m_uiConsumeDamage_Timer = 1000;
                        m_bPlayerConsumedCharged = true;
                        pConsumeTarget->SetHealth(pConsumeTarget->GetHealth() - pConsumeTarget->GetMaxHealth() / 10.0f);
                    }
                }
                else
                    m_uiConsumeDamage_Timer -= uiDiff;

                if (!pConsumeTarget->IsAlive())
                {
                    if (Unit* pTarget = m_creature->SelectAttackingTarget(ATTACKING_TARGET_RANDOM, 0))
                        m_creature->GetMotionMaster()->MoveChase(pTarget);
                    m_creature->SetHealth(m_creature->GetMaxHealth());
                }
            }
            else
            {
                if (pConsumeTarget->IsAlive() && m_bPlayerConsumedCharged)
                {
                    if (DoCastSpellIfCan(pConsumeTarget, SPELL_SPLIT) == CAST_OK)
                    {
                        m_bPlayerConsumedCharged = false;
                        m_creature->GetMotionMaster()->MoveChase(m_creature->GetVictim());
                    }
                }
            }
        }

        if (m_uiTrash_Timer < uiDiff)
        {
            if (DoCastSpellIfCan(m_creature->GetVictim(), SPELL_TRASH) == CAST_OK)
                m_uiTrash_Timer = 5000 + rand() % 2000;
        }
        else
            m_uiTrash_Timer -= uiDiff;

        DoMeleeAttackIfReady();
    }
};


CreatureAI* GetAI_mob_anubisath_guardian(Creature* pCreature)
{
    return new mob_anubisath_guardianAI(pCreature);
}

CreatureAI* GetAI_OssirianTornado(Creature* pCreature)
{
    return new OssirianTornadoAI(pCreature);
}

CreatureAI* GetAI_mob_flesh_hunter(Creature* pCreature)
{
    return new mob_flesh_hunterAI(pCreature);
}

namespace
{
template <class T>
SpellScript* GetSpellScript(SpellEntry const*)
{
    return new T();
}

void RegisterSpellScript(char const* name, SpellScript* (*getter)(SpellEntry const*))
{
    Script* script = new Script;
    script->Name = name;
    script->GetSpellScript = getter;
    script->RegisterSelf();
}

struct spell_aq20_drain_mana : public SpellScript
{
    void OnSetTargetMap(Spell* /*spell*/, SpellEffectIndex /*effIdx*/, uint32& /*targetMode*/, float& /*radius*/, uint32& unMaxTargets, bool& /*selectClosestTargets*/) const override
    {
        unMaxTargets = 6;
    }

    bool OnCheckTarget(Spell const* /*spell*/, Unit* target, SpellEffectIndex /*eff*/) const override
    {
        return target->GetPowerType() == POWER_MANA && target->GetPowerPercent(POWER_MANA) >= 1.0f;
    }
};

struct spell_rajaxx_thundercrash : public SpellScript
{
    bool OnEffectExecute(Spell* spell, SpellEffectIndex effIdx) const override
    {
        if (effIdx != EFFECT_INDEX_0)
            return true;

        Unit* target = spell->GetUnitTarget();
        if (!target)
            return true;

        spell->damage = std::max<int32>(200, target->GetHealth() / 2);
        return true;
    }
};
}

void AddSC_ruins_of_ahnqiraj()
{
    Script *newscript;
    newscript = new Script;
    newscript->Name = "mob_anubisath_guardian";
    newscript->GetAI = &GetAI_mob_anubisath_guardian;
    newscript->RegisterSelf();

    newscript = new Script;
    newscript->Name = "mob_flesh_hunter";
    newscript->GetAI = &GetAI_mob_flesh_hunter;
    newscript->RegisterSelf();

    newscript = new Script;
    newscript->Name = "mob_tornado_ossirian";
    newscript->GetAI = &GetAI_OssirianTornado;
    newscript->RegisterSelf();

    RegisterSpellScript("spell_aq20_drain_mana", &GetSpellScript<spell_aq20_drain_mana>);
    RegisterSpellScript("spell_rajaxx_thundercrash", &GetSpellScript<spell_rajaxx_thundercrash>);

}
