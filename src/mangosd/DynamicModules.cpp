#include "DynamicModules.h"

#include "Log.h"
#include "ModulesScriptLoader.h"

#include <ace/OS_NS_dlfcn.h>

#include <algorithm>
#include <cstdlib>
#include <cstring>
#include <filesystem>
#include <string>
#include <system_error>
#include <vector>

#ifndef TW_DYNAMIC_MODULES
#define TW_DYNAMIC_MODULES ""
#endif

#ifndef TW_MODULES_BUILD_DIRECTIVE
#define TW_MODULES_BUILD_DIRECTIVE ""
#endif

#ifndef TW_DYNAMIC_MODULES_INSTALL_DIR
#define TW_DYNAMIC_MODULES_INSTALL_DIR ""
#endif

namespace
{
    typedef char const* (*ModuleStringFunction)();
    typedef void (*ModuleScriptLoaderFunction)();

    struct LoadedModule
    {
        std::string path;
        ACE_SHLIB_HANDLE handle;
    };

    std::vector<LoadedModule>& LoadedModules()
    {
        static std::vector<LoadedModule> loadedModules;
        return loadedModules;
    }

    std::vector<std::string> SplitCommaSeparated(std::string const& value)
    {
        std::vector<std::string> result;
        std::string::size_type start = 0;

        while (start <= value.size())
        {
            std::string::size_type end = value.find(',', start);
            std::string item = value.substr(start, end == std::string::npos ? std::string::npos : end - start);
            if (!item.empty())
                result.push_back(item);

            if (end == std::string::npos)
                break;

            start = end + 1;
        }

        return result;
    }

    std::vector<std::string> GetDynamicModuleNames()
    {
        return SplitCommaSeparated(TW_DYNAMIC_MODULES);
    }

    char const* SharedLibraryPrefix()
    {
#if defined(_WIN32)
        return "";
#else
        return "lib";
#endif
    }

    char const* SharedLibraryExtension()
    {
#if defined(_WIN32)
        return ".dll";
#elif defined(__APPLE__)
        return ".dylib";
#else
        return ".so";
#endif
    }

    std::vector<std::string> GetModuleSearchDirectories()
    {
        std::vector<std::string> directories;

        if (std::strlen(TW_DYNAMIC_MODULES_INSTALL_DIR))
            directories.push_back(TW_DYNAMIC_MODULES_INSTALL_DIR);

        directories.push_back("modules");
        directories.push_back("lib/modules");
        directories.push_back("../lib/modules");

        return directories;
    }

    std::vector<std::string> GetModuleCandidatePaths(std::string const& moduleName)
    {
        std::vector<std::string> candidates;
        std::string const libraryName = std::string(SharedLibraryPrefix()) + moduleName + SharedLibraryExtension();

        for (std::string const& directory : GetModuleSearchDirectories())
            candidates.push_back(directory + "/" + libraryName);

        candidates.push_back(libraryName);
        return candidates;
    }

    void* ResolveRequiredSymbol(ACE_SHLIB_HANDLE handle, char const* symbolName, std::string const& modulePath)
    {
        void* symbol = ACE_OS::dlsym(handle, symbolName);
        if (!symbol)
            sLog.outError("Dynamic module %s is missing required symbol %s.", modulePath.c_str(), symbolName);

        return symbol;
    }

    bool ValidateModule(std::string const& moduleName, std::string const& modulePath, ACE_SHLIB_HANDLE handle,
                        ModuleScriptLoaderFunction& addScripts)
    {
        ModuleStringFunction getScriptModule = reinterpret_cast<ModuleStringFunction>(ResolveRequiredSymbol(handle, "GetScriptModule", modulePath));
        addScripts = reinterpret_cast<ModuleScriptLoaderFunction>(ResolveRequiredSymbol(handle, "AddModulesScripts", modulePath));
        ModuleStringFunction getBuildDirective = reinterpret_cast<ModuleStringFunction>(ResolveRequiredSymbol(handle, "GetModulesBuildDirective", modulePath));

        if (!getScriptModule || !addScripts || !getBuildDirective)
            return false;

        char const* scriptModule = getScriptModule();
        if (!scriptModule || moduleName != scriptModule)
        {
            sLog.outError("Dynamic module %s reports module name %s, expected %s.",
                          modulePath.c_str(), scriptModule ? scriptModule : "<null>", moduleName.c_str());
            return false;
        }

        char const* buildDirective = getBuildDirective();
        if (!buildDirective || std::strcmp(buildDirective, TW_MODULES_BUILD_DIRECTIVE) != 0)
        {
            sLog.outError("Dynamic module %s build type mismatch: module=%s core=%s.",
                          modulePath.c_str(), buildDirective ? buildDirective : "<null>", TW_MODULES_BUILD_DIRECTIVE);
            return false;
        }

        return true;
    }

    // A module is loaded from a copy of its file, in "loaded" beside it: Windows keeps a loaded
    // library's file locked, and a newer build must be able to take its place while the server
    // runs (`module load`). Each load has a copy of its own -- a second dlopen of one path
    // would hand back the library already loaded.
    std::string ShadowCopy(std::string const& modulePath)
    {
        static uint32 loads = 0;
        std::error_code error;
        std::filesystem::path const original(modulePath);
        std::filesystem::path const directory = original.parent_path() / "loaded";
        std::filesystem::create_directories(directory, error);
        std::filesystem::path const copy = directory /
            (original.stem().string() + "." + std::to_string(++loads) + original.extension().string());
        std::filesystem::copy_file(original, copy, std::filesystem::copy_options::overwrite_existing, error);
        return error ? modulePath : copy.string();
    }

    // The copies of the last run, locked no more.
    void RemoveShadowCopies()
    {
        for (std::string const& directory : GetModuleSearchDirectories())
        {
            std::error_code error;
            std::filesystem::remove_all(std::filesystem::path(directory) / "loaded", error);
        }
    }

    bool LoadDynamicModule(std::string const& moduleName)
    {
        for (std::string const& candidatePath : GetModuleCandidatePaths(moduleName))
        {
            // A path the system resolves (beside mangosd.exe, on Windows) is loaded as it is.
            std::error_code error;
            bool const found = std::filesystem::is_regular_file(candidatePath, error);
            std::string const modulePath = found ? ShadowCopy(candidatePath) : candidatePath;
            ACE_SHLIB_HANDLE handle = ACE_OS::dlopen(modulePath.c_str(), RTLD_NOW | RTLD_GLOBAL);
            if (!handle)
            {
                // On Windows most often an import mangosd does not export: the module asks for
                // more of the core than when mangosd was linked, and mangosd must be rebuilt.
                if (found)
                    sLog.outError("Dynamic module %s: %s could not be loaded.", moduleName.c_str(), modulePath.c_str());
                continue;
            }

            ModuleScriptLoaderFunction addScripts = nullptr;
            if (!ValidateModule(moduleName, modulePath, handle, addScripts))
            {
                ACE_OS::dlclose(handle);
                return false;
            }

            addScripts();
            LoadedModules().push_back({modulePath, handle});
            sLog.outString("Loaded dynamic module %s from %s.", moduleName.c_str(), modulePath.c_str());
            return true;
        }

        sLog.outError("Could not load dynamic module %s from configured module directories.", moduleName.c_str());
        return false;
    }
}

void AddConfiguredModulesScripts()
{
    AddModulesScripts();
    RemoveShadowCopies();

    std::vector<std::string> const moduleNames = GetDynamicModuleNames();
    for (std::string const& moduleName : moduleNames)
        LoadDynamicModule(moduleName);
}

bool LoadDynamicModuleWhileRunning(char const* moduleName)
{
    std::vector<std::string> const moduleNames = GetDynamicModuleNames();
    if (std::find(moduleNames.begin(), moduleNames.end(), moduleName) == moduleNames.end())
    {
        sLog.outError("%s is not a dynamic module of this build.", moduleName);
        return false;
    }

    return LoadDynamicModule(moduleName);
}
