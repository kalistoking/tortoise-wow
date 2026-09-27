#ifndef _DYNAMIC_MODULES_H_
#define _DYNAMIC_MODULES_H_

void AddConfiguredModulesScripts();

// One configured dynamic module, loaded while the server runs (ScriptMgr::LoadModuleWhileRunning).
bool LoadDynamicModuleWhileRunning(char const* moduleName);

#endif
