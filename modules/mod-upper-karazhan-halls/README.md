# mod-upper-karazhan-halls (local only, not for the core)

Upper Karazhan Halls' creature C++ lives here and nowhere else (EPIC10's AM1, `handoff/manager-091`):
its files are gone from the core, with their lines in `src/scripts/CMakeLists.txt` and
`ScriptLoader.cpp`; the module registers their scripts under the names the world database gives.

Taken from the core:

- `src/scripts/dungeons/upper_karazhan_halls/boss_anomalus.cpp`
- `src/scripts/dungeons/upper_karazhan_halls/boss_echo_of_medivh.cpp`
- `src/scripts/dungeons/upper_karazhan_halls/boss_incantagos.cpp`
- `src/scripts/dungeons/upper_karazhan_halls/boss_keeper_gnarlmoon.cpp`
- `src/scripts/dungeons/upper_karazhan_halls/boss_kings_council.cpp`
- `src/scripts/dungeons/upper_karazhan_halls/boss_kruul.cpp`
- `src/scripts/dungeons/upper_karazhan_halls/boss_sanv_tasdal.cpp`

Their spell and aura scripts (Arcane Overload, Ley-Line Disturbance, Lunar Shift, Flock of Ravens, Owl Gaze,
Redemption, Pawns' Advance, Kruul's Call and Mark, Rift Feedback, Overflowing Hatred, Form Rift Elemental) stay
in the core, in `src/scripts/dungeons/upper_karazhan_halls/upper_karazhan_halls_spells.cpp`: a spell's hook,
not a creature's AI, with no rule to fire on.

## The switch

- **loaded**: its C++ runs, as before;
- **unloaded** (`module unload mod-upper-karazhan-halls` on a running server, or
  `mod-upper-karazhan-halls.Enable = 0` for the next start): the names find no script, and the core gives
  the creatures their `ai_name` -- D6's `upper_karazhan_halls_as_rows.sql` makes it EventAI, with their rows.

Made for trt A17 after `scripts/am1_modules.py`'s shape.
