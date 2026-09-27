# mod-trttemplate

Generated from `modules/templates/basic`.

## Layout

- `src/` contains C++ scripts.
- `conf/mod-trttemplate.conf.dist` contains module config defaults. Copy or move it to `mod-trttemplate.conf` in the installed module config directory before enabling the module.
- `data/sql/auth`, `data/sql/character`, and `data/sql/world` are optional module migration folders.
- `mod-trttemplate.cmake` is optional and only needed for custom CMake hooks.

## Build

Use one of:

```sh
cmake -S . -B build -DMODULES=static
cmake -S . -B build -DMODULES=dynamic
cmake -S . -B build -DMODULE_MOD_TRTTEMPLATE=static
```

The exact per-module cache variable is printed by CMake during configuration.
