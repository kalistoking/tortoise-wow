# mod-deadmines (D6 prototype, local only)

The Deadmines' boss, instance and object scripts (Mr. Smite, instance_deadmines, the
doors and the cannon) moved out of `src/scripts` into a module, **with no core line
changed**: the copies live in `namespace mod_deadmines`, and the loader registers them
with the legacy `Script` + `RegisterSelf`. A module's loader runs after the core's
AddScripts (ScriptMgr.cpp:2408-2409) and `RegisterSelf` overwrites the core's entry
for the same `script_name` (ScriptMgr.cpp:2977), so the module's copy is the one run.
The constructor of `boss_mr_smiteAI` logs `[mod-deadmines] ...` to show which copy runs.

Measured on Windows (MSVC 19.51, Release):

- `-DMODULES=static`: configures, compiles and links; an edit to one module file
  rebuilds in about 5 s (the module's file and mangosd's link) -- then a restart.
- `-DMODULES=dynamic`: the DLL does not link -- 88 unresolved externals
  (`WorldDatabase`, `CharacterDatabase`, the mysql client, G3D, handlers defined in
  mangosd). On Windows the module links `game`, `shared` and `framework` statically,
  so even once linked it would hold private copies of `sScriptMgr`, `sObjectMgr` and
  every other singleton. On Linux mangosd links with `-rdynamic` and the module links
  only fmt, so the module resolves against the running core.
