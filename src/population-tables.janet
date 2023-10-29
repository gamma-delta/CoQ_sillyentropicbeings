(use cbt/xml-helpers/population-tables)

(defn- make-lair-owner [location & xs]
  (alter-population
    (string "LairOwners_" location)
    (group-raw :Options :pickone :Merge
               ;(seq [[obj weight] :in xs]
                  [:object {:Blueprint obj :Weight weight}]))))

(defn population-tables []
  [:populations
   (population :PKSXB_DustbringerTrail
               (group-raw
                 :YourMom :pickone nil
                 (object-one :PKSXB_Dustbringer_Fulmination 1 900)
                 (object-one :PKSXB_Dustbringer_Drunkard 1 5)
                 (object-one :PKSXB_Dustbringer 1 1)))
   (population :PKSXB_GnarfApprovedSkellyJellyHorrors
               (group-raw
                 :YourMom :pickeach nil
                 (object-each :PKSXB_SkellyJelly_Lame 1 95)
                 (object-each :PKSXB_SkellyJelly_Lame 1 5)
                 (object-each "Space-Time Vortex" 1 1)))

   (alter-population :SaltDesertZoneGlobals
                     (group-raw :Creatures :pickone :Merge
                                (object-one :PKSXB_Dustbringer 1 4)))

   ;(seq [tbl :in [:DesertCanyonZoneGlobals-Reachable
                   :HillsZoneGlobals-Reachable
                   :MountainsZoneGlobals-Reachable
                   :RuinsZoneGlobals-Reachable]]
      (alter-population tbl
                        (group-raw :Creatures :pickone :Merge
                                   (object-one :PKSXB_FloatingI 1 8)
                                   (object-one :PKSXB_SkellyJelly 1 8))))

   (alter-population :RuinsZoneGlobals-Creatures
                     (object-each :PKSXB_FloatingI 1 6)
                     (object-each :PKSXB_SkellyJelly "1-2" 5))

   (alter-population :BaroqueRuinsZoneGlobals-Creatures
                     (object-each :PKSXB_TimepinchFinch "1-2" 3)
                     (object-each :PKSXB_Dustbringer 1 3)
                     (object-each :PKSXB_SkellyJelly "1-2" 5))

   (alter-population :MoonStairZoneGlobals-Creatures
                     (object-each :PKSXB_TimepinchFinch "1-3" "30")
                     (object-each :PKSXB_Dustbringer "1" "20"))
   ;(seq [t :in [2 5]]
      (alter-population (string "Tier" t "CaveCreatures")
                        (group-raw :Creatures :pickone :Merge
                                   (object-one :PKSXB_FloatingI 1 5)
                                   (object-one :PKSXB_SkellyJelly 1 2))))
   (make-lair-owner "MoonStair"
                    [:PKSXB_TimepinchFinch 10])])
