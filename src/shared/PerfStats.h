#ifndef PERFSTATS_H
#define PERFSTATS_H

#include "Platform/CompilerDefs.h"

namespace PerfStats
{
    extern TW_CORE_DATA int g_totalUnits;
    extern TW_CORE_DATA int g_totalCreatures;
    extern TW_CORE_DATA int g_totalPets;
    extern TW_CORE_DATA int g_totalPlayers;
    extern TW_CORE_DATA int g_totalCorpses;
    extern TW_CORE_DATA int g_totalItems;
    extern TW_CORE_DATA int g_totalGameObjects;
    extern TW_CORE_DATA int g_totalDynamicObjects;
    extern TW_CORE_DATA int g_totalQueryResults;
    extern TW_CORE_DATA int g_totalMaps;

    extern TW_CORE_DATA int g_slowestMapId;
    extern TW_CORE_DATA int g_slowestMapUpdateTime;
};

#endif