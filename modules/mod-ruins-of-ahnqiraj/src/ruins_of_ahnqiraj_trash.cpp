// The destroyers, soldiers, feeders, swarmguards, gladiators, stingers, Captain Tuubid and his warriors and
// needlers, taken out of ruins_of_ahnqiraj.cpp: they go to mod-ruins-of-ahnqiraj and its rows, while the
// Anubisath Guardian, the tornadoes, the Flesh Hunter and the spell scripts stay in the core (trt A24, AM1).
#include "scriptPCH.h"
#include "dungeons/ruins_of_ahnqiraj/ruins_of_ahnqiraj.h"

namespace mod_ruins_of_ahnqiraj
{


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

enum
{
    SPELL_PURGE = 25756,
    SPELL_DRAINMANA = 25754,
};


struct ObsidianDestroyerAI : public ScriptedAI
{
    explicit ObsidianDestroyerAI(Creature* pCreature) : ScriptedAI(pCreature)
    {
        Reset();
    }

    bool m_bIsInCombat;
    uint32 m_uiDrainMana_Timer;

    void Reset() override
    {
        m_uiDrainMana_Timer = 7000;
        m_creature->SetPower(POWER_MANA, 0);

        m_bIsInCombat = false;
    }

    void Aggro(Unit* pWho) override
    {
        m_creature->SetInCombatWithZone();
        if (!m_bIsInCombat)
        {
            m_creature->SetPower(POWER_MANA, 0);
            m_bIsInCombat = true;
        }
    }

    void JustDied(Unit* pKiller) override
    {
        if (GameObject *pObsidian = m_creature->SummonGameObject(OBJ_SMALL_OBSIDIAN_CHUNK, m_creature->GetPositionX(), m_creature->GetPositionY(), m_creature->GetPositionZ(), 0, 0, 0, 0, 0, -1, false))
            pObsidian->SetRespawnTime(345600);
    }

    void UpdateAI(const uint32 uiDiff) override
    {
        if (!m_creature->SelectHostileTarget() || !m_creature->GetVictim())
            return;

        if (m_creature->GetPower(POWER_MANA) >= m_creature->GetMaxPower(POWER_MANA) && m_bIsInCombat)
            DoCast(m_creature, SPELL_PURGE, true);

        //m_uiDrainMana_Timer
        if (m_uiDrainMana_Timer < uiDiff)
        {
            DoCast(m_creature, SPELL_DRAINMANA);
            m_uiDrainMana_Timer = 7000;
        }
        else
            m_uiDrainMana_Timer -= uiDiff;

        DoMeleeAttackIfReady();
    }
};

enum
{
    SPELL_VENOM_SPIT    =   25497,
    SPELL_RETALIATION   =   22857,
};

/******************/
struct HiveZaraSoldierAI : public ScriptedAI
{
    explicit HiveZaraSoldierAI(Creature* pCreature) : ScriptedAI(pCreature)
    {
        Reset();
    }

    uint32 m_uiVenomSpit_Timer;
    bool m_bRetaliation;

    void Reset() override
    {
        m_uiVenomSpit_Timer = 5000;
        m_bRetaliation = false;
    }

    void Aggro(Unit* pWho) override
    {
        m_creature->SetInCombatWithZone();
    }

    void UpdateAI(const uint32 uiDiff) override
    {
        if (!m_creature->SelectHostileTarget() || !m_creature->GetVictim())
            return;

        if (m_uiVenomSpit_Timer < uiDiff)
        {
            Unit* pTarget = m_creature->SelectAttackingTarget(ATTACKING_TARGET_RANDOM, 0);
            if (DoCastSpellIfCan(pTarget, SPELL_VENOM_SPIT) == CAST_OK)
                m_uiVenomSpit_Timer = urand(5000, 10000);
        }
        else
            m_uiVenomSpit_Timer -= uiDiff;

        if (m_creature->GetHealthPercent() < 20.0f && !m_bRetaliation)
        {
            m_creature->CastSpell(m_creature, SPELL_RETALIATION, false);
            m_bRetaliation = true;
        }

        if (m_creature->GetHealthPercent() < 20.0f && !m_bRetaliation)
        {
            m_creature->CastSpell(m_creature, SPELL_RETALIATION, false);
            m_bRetaliation = true;
        }

        DoMeleeAttackIfReady();
    }
};

enum
{
    SPELL_CLOUD_OF_DISEASE    =   17742,
};

/******************/
struct SilicateFeederAI : public ScriptedAI
{

    bool m_bIsAttacked = false;

    explicit SilicateFeederAI(Creature* pCreature) : ScriptedAI(pCreature)
    {
        Reset();
    }

    void Reset() override
    {
        m_creature->SetFactionTemplateId(7);
        m_bIsAttacked = false;
    }

    void JustDied(Unit* pKiller) override
    {
        DoCastSpellIfCan(m_creature, SPELL_CLOUD_OF_DISEASE);
    }

    void UpdateAI(const uint32 uiDiff) override
    {
        if (!m_creature->SelectHostileTarget() || !m_creature->GetVictim())
            return;

        if (!m_bIsAttacked)
        {
            m_creature->SetFactionTemplateId(14);
            m_creature->SetInCombatWithZone();
            m_bIsAttacked = true;
        }

        DoMeleeAttackIfReady();
    }
};

enum
{
    SPELL_SUNDERING_CLEAVE    =   25174,
};

/******************/
struct QirajiSwarmguardAI : public ScriptedAI
{
    explicit QirajiSwarmguardAI(Creature* pCreature) : ScriptedAI(pCreature)
    {
        Reset();
    }

    uint32 m_uiSunder_Timer;

    void Reset() override
    {
        m_uiSunder_Timer = 2000;
    }

    void Aggro(Unit* pWho) override
    {
        m_creature->SetInCombatWithZone();
    }

    void UpdateAI(const uint32 uiDiff) override
    {
        if (m_creature->IsWalking())
            m_creature->SetWalk(false);

        if (!m_creature->SelectHostileTarget() || !m_creature->GetVictim())
            return;

        if (m_uiSunder_Timer < uiDiff)
        {
            if (DoCastSpellIfCan(m_creature->GetVictim(), SPELL_SUNDERING_CLEAVE) == CAST_OK)
                m_uiSunder_Timer = urand(8000, 12000);
        }
        else
            m_uiSunder_Timer -= uiDiff;

        DoMeleeAttackIfReady();
    }
};


enum
{
    SPELL_TRAMPLE    =   5568,
    SPELL_UPPERCUT2  =   10966,
    SPELL_VENGEANCE  =   25164,
};

/******************/
struct QirajiGladiatorAI : public ScriptedAI
{
    explicit QirajiGladiatorAI(Creature* pCreature) : ScriptedAI(pCreature)
    {
        m_pInstance = (ScriptedInstance*)pCreature->GetInstanceData();
        Reset();
    }

    ScriptedInstance* m_pInstance;
    uint32 m_uiTrample_Timer;
    uint32 m_uiUppercut_Timer;
    bool m_bIsEnraged;

    void Reset() override
    {
        m_uiTrample_Timer = 4000;
        m_uiUppercut_Timer = 9000;
        m_bIsEnraged = false;
        if (m_pInstance)
            m_pInstance->SetData(TYPE_QIRAJI_GLADIATOR, 0);
    }

    void Aggro(Unit* pWho) override
    {
        if (m_pInstance)
            m_pInstance->SetData(TYPE_QIRAJI_GLADIATOR, 0);
        m_creature->SetInCombatWithZone();
    }

    void JustDied(Unit* pKiller) override
    {
        if (m_pInstance)
            m_pInstance->SetData(TYPE_QIRAJI_GLADIATOR, 1);
    }

    void UpdateAI(const uint32 uiDiff) override
    {
        if (!m_creature->SelectHostileTarget() || !m_creature->GetVictim())
            return;

        if (m_pInstance && m_pInstance->GetData(TYPE_QIRAJI_GLADIATOR) > 0 && !m_bIsEnraged)
        {
            if (DoCastSpellIfCan(m_creature, SPELL_VENGEANCE) == CAST_OK)
                m_bIsEnraged = true;
        }

        if (m_uiTrample_Timer < uiDiff)
        {
            if (DoCastSpellIfCan(m_creature->GetVictim(), SPELL_TRAMPLE) == CAST_OK)
                m_uiTrample_Timer = urand(4000, 6000);
        }
        else
            m_uiTrample_Timer -= uiDiff;

        if (m_uiUppercut_Timer < uiDiff)
        {
            if (DoCastSpellIfCan(m_creature->GetVictim(), SPELL_UPPERCUT2) == CAST_OK)
                m_uiUppercut_Timer = urand(10000, 15000);
        }
        else
            m_uiUppercut_Timer -= uiDiff;

        DoMeleeAttackIfReady();
    }
};

/*******************/
enum
{
    SPELL_CHARGE_STINGER          =   25190,
};

struct HiveZaraStingerAI : public ScriptedAI
{
    explicit HiveZaraStingerAI(Creature* pCreature) : ScriptedAI(pCreature)
    {
        Reset();
    }

    uint32 m_uiCharge_Timer;
    uint32 m_uiChargeCasted_Timer;
    bool m_bChargeCasted;

    void Reset() override
    {
        m_uiCharge_Timer = 3000;
        m_uiChargeCasted_Timer = 0;
        m_bChargeCasted = false;
    }

    void UpdateAI(const uint32 uiDiff) override
    {
        if (!m_creature->SelectHostileTarget() || !m_creature->GetVictim())
            return;

        if (m_uiCharge_Timer < uiDiff)
        {
            Unit* pTarget = m_creature->SelectAttackingTarget(ATTACKING_TARGET_RANDOM, 0);
            if (DoCastSpellIfCan(pTarget, SPELL_CHARGE_STINGER) == CAST_OK)
            {
                m_uiCharge_Timer = 5000;
                m_bChargeCasted = true;
                m_uiChargeCasted_Timer = 500;
            }

        }
        else
        {
            m_uiCharge_Timer -= uiDiff;
            if (m_bChargeCasted)
            {
                m_uiChargeCasted_Timer -= uiDiff;
                if (m_uiChargeCasted_Timer < uiDiff)
                {
                    m_bChargeCasted = false;
                    m_creature->GetMotionMaster()->MoveChase(m_creature->GetVictim());
                }
            }
        }

//        m_creature->GetMotionMaster()->MoveChase(m_creature->GetVictim());
        DoMeleeAttackIfReady();
    }
};

enum
{
    SAY_TUUBID_KILL       =   -1900117,
    SPELL_ATTACK_ORDER    =   25471,
    SPELL_CLEAVE_T        =   26350,
    SPELL_SUNDER_ARMOR    =   24317,
    LINK_GROUP_TUUBID     =   115,
};

struct TuubidAI : public ScriptedAI
{
    explicit TuubidAI(Creature* pCreature) : ScriptedAI(pCreature)
    {
        Reset();
    }

    uint32 m_uiAttackOrder_Timer;
    uint32 m_uiCleave_Timer;
    uint32 m_uiSunderArmor_Timer;
    uint64 m_uiMarkedGUID;

    void Reset() override
    {
        m_uiMarkedGUID = 0;
        m_uiAttackOrder_Timer = 5000;
        m_uiCleave_Timer = 8000;
        m_uiSunderArmor_Timer = 6000;
    }

    void UpdateAI(const uint32 uiDiff) override
    {
        if (!m_creature->SelectHostileTarget() || !m_creature->GetVictim())
            return;

        if (m_uiAttackOrder_Timer < uiDiff)
        {
            if (Unit* pTarget = m_creature->SelectAttackingTarget(ATTACKING_TARGET_RANDOM, 0))
            {
                if (Unit* pOldMark = m_creature->GetMap()->GetUnit(m_uiMarkedGUID))
                    pOldMark->RemoveAurasDueToSpell(SPELL_ATTACK_ORDER);

                if (Player* pMark = pTarget->GetCharmerOrOwnerPlayerOrPlayerItself())
                {
                    DoCastSpellIfCan(pMark, SPELL_ATTACK_ORDER);
                    m_uiMarkedGUID = pMark->GetGUID();
                    DoScriptText(SAY_TUUBID_KILL, m_creature, pMark);
                }
                else
                {
                    if (m_uiMarkedGUID)
                        m_uiMarkedGUID = 0;

                    sLog.outError("boss_tuubid could not accuire a new target to mark.");
                }
                m_uiAttackOrder_Timer = 9000;
            }
        }
        else
            m_uiAttackOrder_Timer -= uiDiff;

        if (m_uiCleave_Timer < uiDiff)
        {
            if (DoCastSpellIfCan(m_creature->GetVictim(), SPELL_CLEAVE_T) == CAST_OK)
                m_uiCleave_Timer = 10000;
        }
        else
            m_uiCleave_Timer -= uiDiff;

        if (m_uiSunderArmor_Timer < uiDiff)
        {
            if (DoCastSpellIfCan(m_creature, SPELL_SUNDER_ARMOR) == CAST_OK)
                m_uiSunderArmor_Timer = 15000;
        }
        else
            m_uiSunderArmor_Timer -= uiDiff;


        DoMeleeAttackIfReady();
    }
};

enum
{
    SPELL_ENRAGE_QW       =   8599,
    SPELL_THUNDERCLAP     =   15588,
    SPELL_UPPERCUT        =   10966,
    NPC_TUUBID            =   15392,
};

struct QirajiWarriorAI : public ScriptedAI
{
    explicit QirajiWarriorAI(Creature* pCreature) : ScriptedAI(pCreature)
    {
        Reset();
    }

    uint32     m_uiThunderclap_Timer;
    uint32     m_uiUppercut_Timer;
    uint64     m_uiTuubidGuid;
    uint32     m_uiUpdateTarget_Timer;
    bool       m_bisTuubidAlive;
    bool       m_bHasEnraged;

    TuubidAI* GetTuubidAI()
    {
        if (!m_uiTuubidGuid)
            if (Creature* pTuubid = m_creature->FindNearestCreature(NPC_TUUBID, 100.0f, true))
                m_uiTuubidGuid = pTuubid->GetGUID();

        if (Creature* pTuubid = m_creature->GetMap()->GetCreature(m_uiTuubidGuid))
            if (pTuubid->IsAlive())
                return CAST_AI(TuubidAI, pTuubid->AI());
        return nullptr;
    }

    void Reset() override
    {
        m_uiThunderclap_Timer = urand(6000, 12000);
        m_uiUppercut_Timer = urand(10000, 15000);
        m_uiTuubidGuid = 0;
        m_uiUpdateTarget_Timer = 2000;
        m_bHasEnraged = false;
        m_bisTuubidAlive = true;
    }

    void Aggro(Unit* pWho) override
    {
        m_creature->SetInCombatWithZone();
    }

    void DamageTaken(Unit* pDoneBy, uint32 &uiDamage) override
    {
        if (!m_bHasEnraged && ((m_creature->GetHealth() * 100) / m_creature->GetMaxHealth()) <= 20 && !m_creature->IsNonMeleeSpellCasted(false))
        {
            DoCast(m_creature->GetVictim(), SPELL_ENRAGE_QW);
            m_bHasEnraged = true;
        }
    }

    void UpdateAI(const uint32 uiDiff) override
    {
        /** Needed for "marking target system" */
        if (!m_creature->GetCreatureGroup()) // Should not happen
            return;
        if (m_creature->GetCreatureGroup()->GetOriginalLeaderGuid().GetEntry() != NPC_CAPTAIN_TUUBID || !m_bisTuubidAlive)
        {
            // Threat calculation
            if (!m_creature->SelectHostileTarget())
                return;
        }
        if (!m_creature->GetVictim())
            return;

        if (m_uiUpdateTarget_Timer < uiDiff)
        {
            if (TuubidAI* pTuubidAI = GetTuubidAI())
            {
                if (Unit* victim = m_creature->GetMap()->GetUnit(pTuubidAI->m_uiMarkedGUID))
                    AttackStart(victim);
            }
            else
            {
                /** Means that Tuubid is down, creature update their target list */
                m_bisTuubidAlive = false;
            }
            m_uiUpdateTarget_Timer = 1400;
        }
        else
            m_uiUpdateTarget_Timer -= uiDiff;


        if (m_uiThunderclap_Timer < uiDiff)
        {
            if (m_creature->GetDistance2d(m_creature) < 5.0f)
            {
                if (DoCastSpellIfCan(m_creature->GetVictim(), SPELL_THUNDERCLAP) == CAST_OK)
                    m_uiThunderclap_Timer = 6000;
            }
        }
        else
            m_uiThunderclap_Timer -= uiDiff;

        if (m_uiUppercut_Timer < uiDiff)
        {
            if (DoCastSpellIfCan(m_creature->GetVictim(), SPELL_UPPERCUT) == CAST_OK)
                m_uiUppercut_Timer = 10000;
        }
        else
            m_uiUppercut_Timer -= uiDiff;

        DoMeleeAttackIfReady();
    }
};

enum
{
    SPELL_CLEAVE       =   20684,
};

struct SwarmguardNeedlerAI : public ScriptedAI
{
    explicit SwarmguardNeedlerAI(Creature* pCreature) : ScriptedAI(pCreature)
    {
        Reset();
    }

    uint32 m_uiCleave_Timer;
    uint32 m_uiUpdateTarget_Timer;
    uint64 m_uiTuubidGuid;
    bool   m_bisTuubidAlive;

    TuubidAI* GetTuubidAI()
    {
        if (!m_uiTuubidGuid)
            if (Creature* pTuubid = m_creature->FindNearestCreature(NPC_TUUBID, 100.0f, true))
                m_uiTuubidGuid = pTuubid->GetGUID();

        if (Creature* pTuubid = m_creature->GetMap()->GetCreature(m_uiTuubidGuid))
            if (pTuubid->IsAlive())
                return CAST_AI(TuubidAI, pTuubid->AI());
        return nullptr;
    }

    void Reset() override
    {
        m_uiUpdateTarget_Timer = 2000;
        m_uiTuubidGuid = 0;
        m_uiCleave_Timer = urand(4000, 16000);;
        m_bisTuubidAlive = true;
    }

    void Aggro(Unit* pWho) override
    {
        m_creature->SetInCombatWithZone();
    }

    void UpdateAI(const uint32 uiDiff) override
    {
        /** Needed for "marking target system" */
        if (!m_creature->GetCreatureGroup()) // Should not happen
            return;
        if (m_creature->GetCreatureGroup()->GetOriginalLeaderGuid().GetEntry() != NPC_CAPTAIN_TUUBID || !m_bisTuubidAlive)
        {
            // Threat calculation
            if (!m_creature->SelectHostileTarget())
                return;
        }
        if (!m_creature->GetVictim())
            return;

        if (m_uiUpdateTarget_Timer < uiDiff)
        {
            if (TuubidAI* pTuubidAI = GetTuubidAI())
            {
                if (Unit* victim = m_creature->GetMap()->GetUnit(pTuubidAI->m_uiMarkedGUID))
                    AttackStart(victim);
            }
            else
            {
                /** Means that Tuubid is down, creature update their target list */
                m_bisTuubidAlive = false;
            }
            m_uiUpdateTarget_Timer = 1400;
        }
        else
            m_uiUpdateTarget_Timer -= uiDiff;

        if (m_uiCleave_Timer < uiDiff)
        {
            if (DoCastSpellIfCan(m_creature->GetVictim(), SPELL_CLEAVE) == CAST_OK)
                m_uiCleave_Timer = urand(4000, 16000);
        }
        else
            m_uiCleave_Timer -= uiDiff;

        DoMeleeAttackIfReady();
    }
};

/*******************/

CreatureAI* GetAI_Tuubid(Creature* pCreature)
{
    return new TuubidAI(pCreature);
}

CreatureAI* GetAI_SwarmguardNeedler(Creature* pCreature)
{
    return new SwarmguardNeedlerAI(pCreature);
}

CreatureAI* GetAI_QirajiWarrior(Creature* pCreature)
{
    return new QirajiWarriorAI(pCreature);
}

CreatureAI* GetAI_HiveZaraStinger(Creature* pCreature)
{
    return new HiveZaraStingerAI(pCreature);
}

CreatureAI* GetAI_HiveZaraSoldier(Creature* pCreature)
{
    return new HiveZaraSoldierAI(pCreature);
}

CreatureAI* GetAI_ObsidianDestroyer(Creature* pCreature)
{
    return new ObsidianDestroyerAI(pCreature);
}

CreatureAI* GetAI_SilicateFeeder(Creature* pCreature)
{
    return new SilicateFeederAI(pCreature);
}

CreatureAI* GetAI_QirajiGladiator(Creature* pCreature)
{
    return new QirajiGladiatorAI(pCreature);
}

CreatureAI* GetAI_QirajiSwarmguard(Creature* pCreature)
{
    return new QirajiSwarmguardAI(pCreature);
}

void AddSC_ruins_of_ahnqiraj_trash()
{
    Script *newscript;

    newscript = new Script;
    newscript->Name = "mob_qiraji_swarmguard";
    newscript->GetAI = &GetAI_QirajiSwarmguard;
    newscript->RegisterSelf();

    newscript = new Script;
    newscript->Name = "mob_qiraji_gladiator";
    newscript->GetAI = &GetAI_QirajiGladiator;
    newscript->RegisterSelf();

    newscript = new Script;
    newscript->Name = "mob_silicate_feeder";
    newscript->GetAI = &GetAI_SilicateFeeder;
    newscript->RegisterSelf();

    newscript = new Script;
    newscript->Name = "mob_hive_zara_soldier";
    newscript->GetAI = &GetAI_HiveZaraSoldier;
    newscript->RegisterSelf();

    newscript = new Script;
    newscript->Name = "mob_obsidian_destroyer";
    newscript->GetAI = &GetAI_ObsidianDestroyer;
    newscript->RegisterSelf();

    newscript = new Script;
    newscript->Name = "mob_hive_zara_stinger";
    newscript->GetAI = &GetAI_HiveZaraStinger;
    newscript->RegisterSelf();

    newscript = new Script;
    newscript->Name = "mob_qiraji_warrior";
    newscript->GetAI = &GetAI_QirajiWarrior;
    newscript->RegisterSelf();

    newscript = new Script;
    newscript->Name = "mob_swarmguard_needler";
    newscript->GetAI = &GetAI_SwarmguardNeedler;
    newscript->RegisterSelf();

    newscript = new Script;
    newscript->Name = "boss_tuubid";
    newscript->GetAI = &GetAI_Tuubid;
    newscript->RegisterSelf();
}

} // namespace mod_ruins_of_ahnqiraj
