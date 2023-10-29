#!/usr/bin/env janet
(use /src/object-blueprints)
(use /src/population-tables)

(use cbt)

(build-metadata
  :qud-dlls "/home/petrak/.local/share/Steam/steamapps/common/Caves of Qud/CoQ_Data/Managed/"
  :qud-mods-folder "/home/petrak/.config/unity3d/Freehold Games/CavesOfQud/Mods/")

(declare-mod
  "silly-entropic-beings"
  "Silly Entropic Beings"
  "petrak@"
  "0.1.0"
  :description "Ersatz and stochastic entropic beings intersecting our paper-thin slice of Qud.
For the Monster Mash Jam 2023 -- https://itch.io/jam/caves-of-qud-modding-jam-1")

(generate-xml "ObjectBlueprints.xml" object-blueprints)
(generate-xml "PopulationTables.xml" population-tables)

# (set-debug-output true)

