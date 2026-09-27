# What Windows (MSVC) dynamic modules need from mangosd.exe, written as the .def it links with.
#
# Linux gets this for nothing: mangosd links with -rdynamic and a module resolves against the
# running core. On Windows an executable exports nothing unless told, and it cannot be told
# "everything" -- game alone defines ~88 000 symbols, and an export table holds 65 535. So it
# exports exactly what the modules ask for, in two steps:
#
#   cmake -DMODE=needs -DDUMPBIN=<dumpbin.exe> -DOBJECTS=<obj|obj> -DOUT=<needs.cpp>
#         -P ModuleExports.cmake
#
# before mangosd builds (modules/CMakeLists.txt): every symbol the modules' objects leave
# undefined, one comment line each, into a source file mangosd compiles. It changes only when
# what the modules ask for changes, and then mangosd relinks.
#
#   cmake -DMODE=def -DDUMPBIN=<dumpbin.exe> -DNEEDS=<needs.cpp> -DLIBS=<lib|lib>
#         -DSELF=<obj|obj> -DOUT=<file.def> -P ModuleExports.cmake
#
# just before mangosd links (src/mangosd/CMakeLists.txt): of those, every one the core defines --
# its libraries, or mangosd's own objects (the databases live in Main.cpp) -- into the .def.
#
# (The lists are "|"-separated: a custom command hands them over as one argument each.)
#
# How a symbol goes out is read from the module's own object. A function the module calls
# (dumpbin: "notype ()") goes out plain: the import library gives it a call thunk. Anything else
# goes out DATA -- the import library gives it only its __imp_ address. A module reaches the
# core's data through __declspec(dllimport) (TW_CORE_DATA, Platform/CompilerDefs.h), which asks
# for exactly that address (the name "__imp_<name>"); a module that reads core data declared
# without it fails to link, loudly, instead of reading a thunk's bytes as the variable.

foreach(var MODE DUMPBIN OUT)
  if(NOT DEFINED ${var})
    message(FATAL_ERROR "ModuleExports.cmake: ${var} not given")
  endif()
endforeach()

if(MODE STREQUAL "needs")
  string(REPLACE "|" ";" OBJECTS "${OBJECTS}")
  set(undefined)
  set(called)
  set(defined_here)
  foreach(obj ${OBJECTS})
    execute_process(COMMAND "${DUMPBIN}" /nologo /symbols "${obj}" OUTPUT_VARIABLE dump)
    # dumpbin ends its lines "\r\n": a name stops at either.
    string(REGEX MATCHALL "UNDEF[^\n|]*External[ ]+\\| [^ \r\n]+" hits "${dump}")
    foreach(hit ${hits})
      string(REGEX REPLACE ".*\\| " "" name "${hit}")
      if(name MATCHES "^__imp_")
        string(SUBSTRING "${name}" 6 -1 name)
      elseif(hit MATCHES "\\(\\)")
        list(APPEND called "${name}")
      endif()
      list(APPEND undefined "${name}")
    endforeach()
    string(REGEX MATCHALL "SECT[0-9A-F]+[^\n|]*External[ ]+\\| [^ \r\n]+" hits "${dump}")
    foreach(hit ${hits})
      string(REGEX REPLACE ".*\\| " "" name "${hit}")
      list(APPEND defined_here "${name}")
    endforeach()
  endforeach()
  list(REMOVE_DUPLICATES undefined)
  if(defined_here)
    list(REMOVE_ITEM undefined ${defined_here})
  endif()
  list(SORT undefined)

  set(needs "// What the dynamic modules ask of mangosd (cmake/ModuleExports.cmake). Generated.\n")
  foreach(name ${undefined})
    list(FIND called "${name}" is_called)
    if(is_called EQUAL -1)
      string(APPEND needs "// data ${name}\n")
    else()
      string(APPEND needs "// call ${name}\n")
    endif()
  endforeach()
  file(WRITE "${OUT}.new" "${needs}")
  execute_process(COMMAND "${CMAKE_COMMAND}" -E copy_if_different "${OUT}.new" "${OUT}")
  return()
endif()

if(NOT MODE STREQUAL "def")
  message(FATAL_ERROR "ModuleExports.cmake: MODE is needs or def, not ${MODE}")
endif()
# mangosd links every build the same way; with no dynamic module there is nothing to export.
if(NOT NEEDS)
  return()
endif()
string(REPLACE "|" ";" LIBS "${LIBS}")
string(REPLACE "|" ";" SELF "${SELF}")

# The core's public symbols as text, one " <name>\n" per symbol, searched for each name the
# modules ask about. (A list of the ~100 000 names, searched with list(FIND), took six minutes;
# a literal find takes seconds.) A library's first linker member lists its symbols one
# "<offset> <name>" per line; an object's symbol table, those it defines in a section.
set(core "")
foreach(lib ${LIBS})
  execute_process(COMMAND "${DUMPBIN}" /nologo /linkermember:1 "${lib}" OUTPUT_VARIABLE dump)
  string(REPLACE "\r" "" dump "${dump}")
  string(APPEND core "${dump}")
endforeach()
foreach(obj ${SELF})
  execute_process(COMMAND "${DUMPBIN}" /nologo /symbols "${obj}" OUTPUT_VARIABLE dump)
  string(REGEX MATCHALL "SECT[0-9A-F]+[^\n|]*External[ ]+\\| [^ \r\n]+" hits "${dump}")
  foreach(hit ${hits})
    string(REGEX REPLACE ".*\\| " "" name "${hit}")
    string(APPEND core " ${name}\n")
  endforeach()
endforeach()

file(STRINGS "${NEEDS}" asked REGEX "^// (call|data) ")
set(functions 0)
set(data 0)
set(def "EXPORTS\n")
foreach(line ${asked})
  string(SUBSTRING "${line}" 8 -1 name)
  string(FIND "${core}" " ${name}\n" at)
  if(at EQUAL -1)
    continue()
  endif()
  if(line MATCHES "^// call ")
    string(APPEND def "    ${name}\n")
    math(EXPR functions "${functions} + 1")
  else()
    string(APPEND def "    ${name} DATA\n")
    math(EXPR data "${data} + 1")
  endif()
endforeach()

file(WRITE "${OUT}" "${def}")
message(STATUS "mangosd exports for the dynamic modules: ${functions} functions, ${data} data")
