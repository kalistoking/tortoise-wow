// The Ouro Spawner, the dirt mounds, the scarabs and the sandworm base, taken out of boss_ouro.cpp: they go
// to mod-temple-of-ahnqiraj and its rows, while Ouro stays in the core (trt A29, AM1).
#include "scriptPCH.h"
#include "dungeons/temple_of_ahnqiraj/temple_of_ahnqiraj.h"

namespace mod_temple_of_ahnqiraj
{


enum
{
    // ground spells
    SPELL_SWEEP = 26103,
    SPELL_SANDBLAST = 26102,
    SPELL_BOULDER = 26616,
    SPELL_BERSERK = 26615,

    // emerge spells
    SPELL_BIRTH = 26262, // The Birth Animation
    SPELL_GROUND_RUPTURE = 26100, // spell not confirmed
    SPELL_SUMMON_BASE = 26133, // summons gameobject 180795
    SPELL_DESPAWN_BASE = 26594,

    // submerge spells
    SPELL_SUBMERGE_VISUAL = 26063,
    SPELL_SUMMON_OURO_MOUNDS = 26058, // summons 5 dirt mounds
    SPELL_SUMMON_TRIGGER = 26284,
    SPELL_SUMMON_OURO = 26061, // used by the script to summon the boss directly

    // other spells - not used
    SPELL_SUMMON_SCARABS = 26060, // triggered after 30 secs - cast by the Dirt Mounds
    SPELL_DIRTMOUND_PASSIVE = 26092, // casts 26093 every 1 sec
    SPELL_SUMMON_OURO_MOUND = 26617,

    // summoned npcs
    NPC_OURO_TRIGGER = 15717,
    NPC_DIRT_MOUND = 15712,
};

/*
 * Sand Blast timers are based on June 2006 values (15-20s) as shown in
 * https://www.youtube.com/watch?v=REmX3uRTFkQ and further reduced to account
 * for April 2006 nerfs (http://blue.cardplace.com/cache/wow-dungeons/481724.htm &
 * http://blue.cardplace.com/cache/wow-general/7950998.htm
 * Sweep timers based on the same video. No known nerfs.
 */
const uint32_t SANDBLAST_TIMER_INITIAL_MIN = 30000;
const uint32_t SANDBLAST_TIMER_INITIAL_MAX = 45000;
const uint32_t SANDBLAST_TIMER_MIN = 12000;
const uint32_t SANDBLAST_TIMER_MAX = 17000;
const uint32_t SUBMERGE_TIMER = 90000;
const uint32_t SUBMERGE_ANIMATION_INVIS = 2000;
const uint32_t SWEEP_TIMER = 15000;

struct npc_ouro_spawnerAI : public Scripted_NoMovementAI
{
    npc_ouro_spawnerAI(Creature* pCreature) : Scripted_NoMovementAI(pCreature) {Reset();}

    bool m_bHasSummoned;

    void Reset() override
    {
        m_bHasSummoned = false;

        DoCastSpellIfCan(m_creature, SPELL_DIRTMOUND_PASSIVE);
        me->EnableMoveInLosEvent();
    }

    void MoveInLineOfSight(Unit* pWho) override
    {
        // Spawn Ouro on LoS check
        if (!m_bHasSummoned
            && !((Player*) pWho)->IsGameMaster()
            && pWho->GetTypeId() == TYPEID_PLAYER
            && m_creature->IsWithinDistInMap(pWho, 25.0f)
            && !pWho->HasAuraType(SPELL_AURA_FEIGN_DEATH)
            && !pWho->HasAuraType(SPELL_AURA_MOD_UNATTACKABLE))
        {
            if (DoCastSpellIfCan(m_creature, SPELL_SUMMON_OURO) == CAST_OK)
            {
                m_bHasSummoned = true;
            }
        }

        ScriptedAI::MoveInLineOfSight(pWho);
    }

    void JustSummoned(Creature* pSummoned) override
    {
        // Despawn when Ouro is spawned
        if (pSummoned->GetEntry() == NPC_OURO)
        {
            pSummoned->CastSpell(pSummoned, SPELL_BIRTH, false);
            pSummoned->SetInCombatWithZone();
            m_creature->ForcedDespawn();
        }
    }

    void UpdateAI(const uint32 /*uiDiff*/) override { }
};

CreatureAI* GetAI_npc_ouro_spawner(Creature* pCreature)
{
    return new npc_ouro_spawnerAI(pCreature);
}

struct npc_dirt_moundAI : public ScriptedAI
{
    npc_dirt_moundAI(Creature* pCreature) : ScriptedAI(pCreature) {Reset();}

    uint32 m_uiChangeTargetTimer;
    uint32 m_uiDespawnTimer;
    ObjectGuid m_TargetGUID;
    ObjectGuid m_CurrentTargetGUID;

    void JustRespawned() override
    {
        m_creature->SetFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_NOT_SELECTABLE | UNIT_FLAG_SPAWNING);
        ScriptedAI::JustRespawned();
    }

    void Reset() override
    {
        m_uiDespawnTimer = 30000;
	    m_TargetGUID.Clear();
	    m_CurrentTargetGUID.Clear();

        DoCastSpellIfCan(m_creature, SPELL_DIRTMOUND_PASSIVE);
        me->EnableMoveInLosEvent();
    }

    void MoveInLineOfSight(Unit *who) override
    {
        if (!m_TargetGUID && who->GetTypeId() == TYPEID_PLAYER)
        {
  	        m_TargetGUID = who->GetGUID();
	    }
    }

    void UpdateAI(const uint32 uiDiff) override
    {
        Unit *pTarget = m_creature->GetMap()->GetUnit(m_CurrentTargetGUID);
        const bool bForceChangeTarget = !pTarget || pTarget->IsDead()
            || pTarget->IsImmuneToDamage(SPELL_SCHOOL_MASK_NATURE);

        if (bForceChangeTarget || m_uiChangeTargetTimer < uiDiff)
        {
            m_CurrentTargetGUID.Clear();

            if (Unit* pTarget = m_creature->GetMap()->GetUnit(m_TargetGUID))
            {
                m_creature->GetMotionMaster()->MoveFollow(pTarget, 0.0f, 0.0f);
                m_CurrentTargetGUID = m_TargetGUID;
                m_TargetGUID.Clear();
            }
            else
            {
                m_creature->GetMotionMaster()->MoveRandom();
            }
            m_uiChangeTargetTimer = urand(0, 10000);
        }
        else
            m_uiChangeTargetTimer -= uiDiff;

        if (m_uiDespawnTimer < uiDiff)
        {
            m_creature->CastSpell(m_creature, SPELL_SUMMON_SCARABS, true);
            m_creature->ForcedDespawn();
        }
        else
        {
            m_uiDespawnTimer -= uiDiff;
        }
    }
};

CreatureAI* GetAI_npc_dirt_mound(Creature* pCreature)
{
    return new npc_dirt_moundAI(pCreature);
}

struct npc_ouro_scarabAI : public ScriptedAI
{
    npc_ouro_scarabAI(Creature* pCreature) : ScriptedAI(pCreature) { Reset(); }

    uint32 m_uiDespawnTimer;

    void Reset() override
    {
        m_uiDespawnTimer = 45000;
        me->EnableMoveInLosEvent();
    }

    void MoveInLineOfSight(Unit *who) override
    {
        if (who->GetTypeId() == TYPEID_PLAYER && !m_creature->GetVictim() && !urand(0, 5))
	    {
            AttackStart(who);
	    }
    }

    void UpdateAI(const uint32 uiDiff) override
    {
        if (m_creature->GetVictim())
            DoMeleeAttackIfReady();

        if (m_uiDespawnTimer < uiDiff)
            m_creature->ForcedDespawn();
        else
            m_uiDespawnTimer -= uiDiff;
    }
};

CreatureAI* GetAI_npc_ouro_scarab(Creature* pCreature)
{
    return new npc_ouro_scarabAI(pCreature);
}

struct go_sandworm_baseAI: public GameObjectAI
{
    go_sandworm_baseAI(GameObject* pGo) : GameObjectAI(pGo), m_bActive(true) {}

    bool m_bActive;

    bool OnUse(Unit* pUser) override
    {
        WorldLocation loc;
        pUser->GetObjectScale();
        pUser->GetPosition(loc);

        if (m_bActive)
        {
            m_bActive = false;
            me->SendGameObjectCustomAnim();
        }
        else
        {
            me->SetRespawnTime(0);
            me->Delete();
        }
        return false;
    }
};

GameObjectAI* GetAIgo_sandworm_base(GameObject *pGo)
{
    return new go_sandworm_baseAI(pGo);
}


void AddSC_temple_of_ahnqiraj_ouro_mounds()
{
    Script* pNewScript;

    pNewScript = new Script;
    pNewScript->Name = "npc_ouro_spawner";
    pNewScript->GetAI = &GetAI_npc_ouro_spawner;
    pNewScript->RegisterSelf();

    pNewScript = new Script;
    pNewScript->Name = "npc_dirt_mound";
    pNewScript->GetAI = &GetAI_npc_dirt_mound;
    pNewScript->RegisterSelf();

    pNewScript = new Script;
    pNewScript->Name = "npc_ouro_scarab";
    pNewScript->GetAI = &GetAI_npc_ouro_scarab;
    pNewScript->RegisterSelf();

    pNewScript = new Script;
    pNewScript->Name = "go_sandworm_base";
    pNewScript->GOGetAI = &GetAIgo_sandworm_base;
    pNewScript->RegisterSelf();
}

} // namespace mod_temple_of_ahnqiraj
