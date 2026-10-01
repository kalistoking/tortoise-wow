// The Crypt Guards and Anub'Rekhan's door, taken out of boss_anubrekhan.cpp: they go to mod-naxxramas and its
// rows, while Anub'Rekhan stays in the core (trt A30, AM1).
#include "scriptPCH.h"
#include "dungeons/naxxramas/naxxramas.h"

namespace mod_naxxramas
{


enum AnubrekhanData
{
    SAY_GREET = 13004,
    SAY_AGGRO1 = 13000,
    SAY_AGGRO2 = 13002,
    SAY_AGGRO3 = 13003,
    SAY_TAUNT1 = 13006,
    SAY_TAUNT2 = 13007,
    SAY_TAUNT3 = 13008,
    SAY_TAUNT4 = 13009,
    SAY_SLAY = 13005,

    EMOTE_GENERIC_ENRAGE = 7798,            // Used by crypt guards

    SPELL_IMPALE = 28783,                   // May be wrong spell id. Causes more dmg than I expect
    SPELL_LOCUSTSWARM = 28785,              // This is a self buff that triggers the dmg debuff

    SPELL_SELF_SPAWN_5 = 29105,             // These spells should spawn corpse scarabs, but only show the explosion anim.
    SPELL_SELF_SPAWN_10 = 28864,            // If we fix them to spawn scarbs, code must be changed to not manually spawn them too.

    SPELL_CRYPTGUARD_ENRAGE = 28747,        // 50% attackspeed increase and 100 extra dmg on attack. PROBABLY WRONG SPELL!!!
    SPELL_CRYPTGUARD_CLEAVE = 26350,        // could be wrong spell. 
    SPELL_CRYPTGUARD_WEB = 28991,
    SPELL_CRYPTGUARD_ACID = 28969,

    MOB_CRYPT_GUARD = 16573,
    MOB_CORPSE_SCARAB = 16698
};

static float const CGs[3][4] =
{
    { 3291.26f, -3502.08f, 287.26f, 2.14f },
    { 3285.29f, -3446.64f, 287.26f, 4.2f },
    { 3316.46f, -3476.23f, 287.26f, 3.18f } // this third entry is used as spawn loc during fight.
};

static constexpr uint32 CRYPTGUARD_CLEAVE_CD = 6000;  // Todo: find correct timer
static constexpr uint32 CRYPTGUARD_WEB_CD = 12000;    // 10 second duration, so 12sec cd makes sense. 
                                                      // From videos you can see there is 1-2sec between consecutive nets.
static constexpr uint32 CRYPTGUARD_ACID_CD = 5000;    // Todo: find correct timer. 

static uint32 IMPALE_CD() { return urand(12000, 18000); }

static uint32 LOCUST_SWARM_CD(bool initial) { return initial ? urand(80000, 120000) : urand(90000, 110000); }

struct mob_cryptguardsAI : public ScriptedAI
{
    instance_naxxramas* m_pInstance;
    bool isEnraged;
    uint32 webTimer;
    uint32 acidSpitTimer;
    uint32 cleaveTimer;

    mob_cryptguardsAI(Creature* pCreature) : ScriptedAI(pCreature)
    {
        m_pInstance = (instance_naxxramas*)pCreature->GetInstanceData();
        Reset();
    }

    void Reset() override
    {
        isEnraged = false;

        webTimer = CRYPTGUARD_WEB_CD;
        acidSpitTimer = CRYPTGUARD_ACID_CD;
        cleaveTimer = CRYPTGUARD_CLEAVE_CD;
    }

    void Aggro(Unit* pWho) override
    {
        // Make sure anub is pulled too. Anub will take care of pulling the other crypt-guard
        if (Creature* anub = m_pInstance->GetSingleCreatureFromStorage(NPC_ANUB_REKHAN))
        {
            anub->AI()->AttackStart(pWho);
        }
    }

    void UpdateAI(uint32 const diff) override
    {
        if (!m_creature->SelectHostileTarget() || !m_creature->GetVictim())
            return;

        // Crypt guards enrage at 50%
        if (!isEnraged && m_creature->GetHealthPercent() <= 50.0f)
        {
            if (DoCastSpellIfCan(m_creature, SPELL_CRYPTGUARD_ENRAGE) == CanCastResult::CAST_OK)
            {
                DoScriptText(EMOTE_GENERIC_ENRAGE, m_creature);
                isEnraged = true;
            }
        }

        if (webTimer < diff)
        {
            if (DoCastSpellIfCan(m_creature, SPELL_CRYPTGUARD_WEB) == CanCastResult::CAST_OK)
            {
                DoResetThreat();
                webTimer = CRYPTGUARD_WEB_CD;
            }
        }
        else
        {
            webTimer -= diff;
        }

        if (cleaveTimer < diff)
        {
            if (DoCastSpellIfCan(m_creature->GetVictim(), SPELL_CRYPTGUARD_CLEAVE) == CanCastResult::CAST_OK)
            {
                cleaveTimer = CRYPTGUARD_CLEAVE_CD;
            }
        }
        else
        {
            cleaveTimer -= diff;
        }

        if (acidSpitTimer < diff)
        {
            if (DoCastSpellIfCan(m_creature->GetVictim(), SPELL_CRYPTGUARD_ACID) == CanCastResult::CAST_OK)
            {
                acidSpitTimer = CRYPTGUARD_ACID_CD;
            }
        }
        else
        {
            acidSpitTimer -= diff;
        }

        DoMeleeAttackIfReady();
    }
};

struct anub_doorAI : public GameObjectAI
{
    bool haveDoneIntro;
    instance_naxxramas* m_pInstance;

    anub_doorAI(GameObject* pGo) : GameObjectAI(pGo), haveDoneIntro(false)
    {
        m_pInstance = (instance_naxxramas*)me->GetInstanceData();
        if (!m_pInstance)
            sLog.outError("anub_doorAI could not find instanceData");
    }

    bool OnUse(Unit* user) override
    {
        if (haveDoneIntro)
            return false;

        haveDoneIntro = true;

        if (!m_pInstance)
        {
            sLog.outInfo("[boss_anubrekhan/anub_doorAI][Inst %03u] ERROR: No instance", user->GetInstanceId());
            return false;
        }

        // Not entirely sure if anub should be able to do all of these SAY_TAUNT* texts on door-open.
        // Wowwiki seems quite sure of it, but it makes more sense if it's just the GREET being used
        // on door open, while the rest are said at random points during the fight?
        if (Creature* anubRekhan = m_pInstance->GetSingleCreatureFromStorage(NPC_ANUB_REKHAN))
        {
            if (anubRekhan->IsAlive())
                DoScriptText(PickRandomValue(SAY_GREET, SAY_TAUNT1, SAY_TAUNT2, SAY_TAUNT3, SAY_TAUNT4), anubRekhan);
        }
        me->SetFlag(GAMEOBJECT_FLAGS, GO_FLAG_NO_INTERACT);
        return false;
    }
};

CreatureAI* GetAI_mob_cryptguards(Creature* pCreature)
{
    return new mob_cryptguardsAI(pCreature);
}

GameObjectAI* GetAI_anub_door(GameObject* pGo)
{
    return new anub_doorAI(pGo);
}


void AddSC_naxxramas_crypt_guards()
{
    Script* NewScript;

    NewScript = new Script;
    NewScript->Name = "mob_cryptguards";
    NewScript->GetAI = &GetAI_mob_cryptguards;
    NewScript->RegisterSelf();

    NewScript = new Script;
    NewScript->Name = "go_anub_door";
    NewScript->GOGetAI = &GetAI_anub_door;
    NewScript->RegisterSelf();
}

} // namespace mod_naxxramas
