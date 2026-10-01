// The Pile of Dirt, taken out of zulgurub_trash.cpp: its Will of Hakkar picks among every player near
// its user. It stays in the core; the rest of the trash is mod-zulgurub's and its rows' (trt A25, AM1).
#include "scriptPCH.h"
#include "zulgurub.h"

struct go_pile_dechetsAI: public GameObjectAI
{
    go_pile_dechetsAI(GameObject* pGo) : GameObjectAI(pGo), Actif(false), m_pGo(pGo) {}

    bool Actif;
    GameObject * const m_pGo;

    bool OnUse(Unit* pUser) override
    {
        if (pUser->IsWithinDistInMap(m_pGo, 5.0f) && !Actif && (urand(0, 2)))
        {
            if (Creature* Guru = pUser->SummonCreature(15047, pUser->GetPositionX(), pUser->GetPositionY(), pUser->GetPositionZ(), 0, TEMPSUMMON_TIMED_DESPAWN, 20000))
            {
                Guru->AddUnitState(UNIT_STAT_ROOT);

                Map::PlayerList const& players = Guru->GetMap()->GetPlayers();
                bool OtherPlayerFound = false;
                for (const auto& itr : players)
                {
                    Player* pPlayer = itr.getSource();
                    if (pPlayer && pPlayer->IsAlive() && pUser->IsWithinDistInMap(pPlayer, 60.0f) && pUser->IsWithinLOSInMap(pPlayer) &&
                            pPlayer != pUser->ToPlayer() && !pPlayer->IsGameMaster())
                    {
                        Guru->AddThreat(pPlayer);
                        Guru->SetInCombatWith(pPlayer);
                        OtherPlayerFound = true;
                    }
                }

                if (OtherPlayerFound)
                {
                    Guru->CastSpell(pUser, 24178, true);
                    Guru->SetFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_NOT_SELECTABLE);
                    Guru->SetFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_SPAWNING);
                    Guru->SetFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_PACIFIED);

                    if (Unit* pTarget = Guru->SelectAttackingTarget(ATTACKING_TARGET_RANDOM, 0))
                        Guru->AI()->AttackStart(pTarget);
                }
                else
                {
                    // Ustaag
                    // SelectRandomFriendlyTarget
                    // les amis de faction 28 (troll dans ZG) sont... faction 14 (monster) ???
                    // en attendant...
                    std::list<Creature*> MobList;
                    GetCreatureListWithEntryInGrid(MobList, Guru, 11361, 45.0f);          // Tigre Zulien
                    GetCreatureListWithEntryInGrid(MobList, Guru, 11831, 45.0f);          // Sorcier Docteur
                    GetCreatureListWithEntryInGrid(MobList, Guru, 11350, 45.0f);          // Lanceur de Haches
                    GetCreatureListWithEntryInGrid(MobList, Guru, 11830, 45.0f);          // Pr�tre
                    GetCreatureListWithEntryInGrid(MobList, Guru, 11368, 45.0f);          // Chauve Souris Sanguinaire
                    GetCreatureListWithEntryInGrid(MobList, Guru, 11365, 45.0f);          // Panth�re
                    GetCreatureListWithEntryInGrid(MobList, Guru, 11353, 45.0f);          // Buveur de sang
                    GetCreatureListWithEntryInGrid(MobList, Guru, 11356, 45.0f);          // Champion Guru
                    GetCreatureListWithEntryInGrid(MobList, Guru, 14821, 45.0f);          // Raptor razza
                    GetCreatureListWithEntryInGrid(MobList, Guru, 14532, 45.0f);          // Fils du venin
                    GetCreatureListWithEntryInGrid(MobList, Guru, 11370, 45.0f);          // Sombre veuve
                    GetCreatureListWithEntryInGrid(MobList, Guru, 11360, 45.0f);          // Jeune Zulien
                    GetCreatureListWithEntryInGrid(MobList, Guru, 14825, 45.0f);          // Maitresse dessech�e
                    GetCreatureListWithEntryInGrid(MobList, Guru, 14882, 45.0f);          // Maitresse Atalai
                    GetCreatureListWithEntryInGrid(MobList, Guru, 14826, 45.0f);          // Troll sacrifi�
                    GetCreatureListWithEntryInGrid(MobList, Guru, 11351, 45.0f);          // Chasseur t�te

                    for (const auto& itr : MobList)
                    {
                        if (pUser->IsWithinLOSInMap(itr) && pUser->IsWithinDistInMap(itr, 45.0f) && itr->IsAlive())
                        {
                            if (Player* pPlay = pUser->ToPlayer())
                            {
                                if (pPlay->GetTeam() == HORDE)
                                    Guru->SetFactionTemplateId(1);    // Human
                                else if (pPlay->GetTeam() == ALLIANCE)
                                    Guru->SetFactionTemplateId(2);    // Orc

                                Guru->AddThreat(itr);
                                Guru->SetInCombatWith(itr);
                                Guru->CastSpell(pUser, 24178, true);
                                Guru->AddUnitState(UNIT_STAT_ROOT);
                                Guru->SetFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_NOT_SELECTABLE);
                                Guru->SetFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_SPAWNING);
                                Guru->SetFactionTemplateId(14); // Troll Bloodscalp
                                break;
                            }
                        }
                    }
                }
            }
            Actif = true;
            return true;
        }
        else
            return false;
    }
};

GameObjectAI* GetAIgo_pile_dechets(GameObject *pGo)
{
    return new go_pile_dechetsAI(pGo);
}

void AddSC_zulgurub_pile_dechets()
{
    Script* newscript;

    newscript = new Script;
    newscript->Name = "go_pile_dechets";
    newscript->GOGetAI = &GetAIgo_pile_dechets;
    newscript->RegisterSelf();
}
