(use cbt/xml-helpers/objects)
(import cbt/colors :as col)

(defn- dustbringer-animation []
  (part :AnimatedMaterialGeneric :AnimationLength 360
        :LowFrameOffset 1 :HighFrameOffset 300
        :DetailColorAnimationFrames "0=R,100=r,200=O,250=W,300=o"))

(defn object-blueprints []
  [:objects
   (object :PKSXB_BaseEye :BaseOoze
           (render "[Eye]" "PKSXB/eye.png" col/white col/blue
                   :cp437 (utf8->cp437 "Θ"))
           (part :Brain :Factions "highly entropic beings-100")
           (tag :BaseObject :*noinherit))
   (object :PKSXB_FloatingI :PKSXB_BaseEye
           (part :Render :DisplayName "floating {{R|i}}"
                 :DetailColor col/red)
           (description "Starlight refracts through its lens in frequencies the spacially-bounded brain was not meant to examine. It beckons; it flickers; it calls.")
           (part :Brain :Hostile true)
           (inventoryobject :PKSXB_FloatingI_Whacker 1)
           (tag :DynamicObjectsTable:DesertCanyon_Creatures)
           (tag :DynamicObjectsTable:Hills_Creatures)
           (tag :DynamicObjectsTable:Mountains_Creatures))
   (object :PKSXB_FloatingI_Whacker :NaturalWeapon
           (part :Render :DisplayName "cornea")
           (part :ModHeatSeeking)
           (part :MeleeWeapon :HitBonus 7604 :BaseDamage "0")
           (part :StunOnHit :Duration 127 :Chance 66 :SaveTarget 25
                 :ChargeUse 0))

   (object :PKSXB_TimepinchFinch :BaseBird
           (render "{{dreamy|timepinch}} finch" "Creatures/sw_chavvah_bird.bmp"
                   col/purple col/yellow)
           (description "Its leyline-straight beak preens its iridescent feathers across surreal axes. The air around it puckers with stolen time, and savored moments shine in the darkness of its mirror eyes.")
           (part :Brain :Factions "highly entropic beings-100,birds-80")
           (mutation :TimeDilation 25)
           (stat :Level 22)
           (stat :Willpower 25)
           (inventoryobject :PKSXB_TimepinchFinch_Peck 1)
           (part :Corpse :CorpseBlueprint :PKSXB_TimepinchRibbon
                 :CorpseChance 90))
   (object :PKSXB_TimepinchFinch_Peck :NaturalWeapon
           (part :Render :DisplayName "temporal peck")
           (part :MeleeWeapon :BaseDamage "1d10" :HitBonus 4
                 :Skill "ShortBlades" :Slot "Face")
           (part :ModTimereaver :Chance 25))
   (object :PKSXB_TimepinchRibbon :Snack
           (render "{{dreamy|timepinch}} tail" "Items/sw_grass_bundle.bmp"
                   col/dark-blue col/yellow)
           (description "A dream-slick ribbon of octonion sections. It slides through the gaps in your fingers even as it hangs on the empty space between.")
           (part :Physics :Category "Food" :Weight 3)
           (commerce 3000)
           (part :Food :Message "It shatters in your mouth, and the feathers snap and flutter to life on your tongue.\nYou feel peculiarly out of the timestream.")
           (part :EffectOnEat :Effect :TimeCubed
                 :Duration 1))

   (object :PKSXB_SkellyJelly :BaseOoze
           (part :Render :DisplayName "amniotic anachronite")
           (description "Barely a grain of its 6D bulk intersects this soap-bubble slice of the universe. When struck, ripples tesser up its hyper-membrane, and its cytoplasm flows ana and kata to fill the void.")
           (part :Brain :Factions "highly entropic beings-100,Oozes-80"
                 :Hostile true)
           (part :HologramMaterial)
           (part :Corpse :CorpseChance 100
                 :CorpseBlueprint :PKSXB_SkellyJellySpawnerWidget)
           (inventoryobject :PKSXB_SkellyJelly_Whacker 4)
           (stat :Speed 50)
           (stat :Level 4)
           (tag :DynamicObjectsTable:DesertCanyon_Creatures)
           (tag :DynamicObjectsTable:Hills_Creatures)
           (tag :DynamicObjectsTable:Mountains_Creatures))
   (object :PKSXB_SkellyJelly_Lame :PKSXB_SkellyJelly
           # TODO why isn't this working
           [:property {:Name "*XPValue" :Value 0}])
   (object :PKSXB_SkellyJelly_Whacker :NaturalWeapon
           (part :Render :DisplayName "reality acid")
           (part :MeleeWeapon :HitBonus 4 :BaseDamage 0
                 :Skill :Cudgel :Stat :Strength)
           (part :ElementalDamage :Attributes "Acid" :Damage "1d4")
           [:xtagGrammar {:massNoun true}])
   (object :PKSXB_SkellyJellySpawnerWidget :Widget
           (part :PopulationSpawner
                 :Specification "@PKSXB_GnarfApprovedSkellyJellyHorrors"
                 :Range 1))

   (object :PKSXB_Dustbringer_Whacker :NaturalWeapon
           (part :Render :DisplayName "discontinuity")
           (part :MeleeWeapon :BaseDamage "1d3"
                 :Skill "Cudgel" :Slot "Back")
           (part :RustOnHit)
           (part :TemperatureOnHit :Amount "5d20" :OnWielderHit false))
   # we are just going to Not Worry About Why sparks have limbs
   (object :PKSXB_DustbringerBase :BaseStar
           (render "{{sunslag|dust}}bringer [base]" "Creatures/sw_monad.bmp"
                   col/white col/red)
           (dustbringer-animation)
           (part :Brain :Factions "highly entropic beings-100")
           (part :LightSource :Lit true :Radius 8)
           (inventoryobject :PKSXB_Dustbringer_Whacker 1)
           (stat :HeatResistance 200)
           (stat :Level 15)
           (stat :Hitpoints 1) (stat :DV 15) (stat :AV 5)
           (stat :Agility 24)
           (stat :MoveSpeed 180)
           (stat :Speed 150)
           (tag :Restless)
           [:intproperty {:Name "Bleeds" :Value 0}]
           (tag :BaseObject :*noinherit))
   (object :PKSXB_Dustbringer :PKSXB_DustbringerBase
           (part :Render :DisplayName "{{sunslag|dust}}bringer")
           (description "A pointwise limit in the wave-graph of entropy over time, burning like the stars over Babylon, nowhere continuous and Direchlet-deadly.")
           (part :LeavesTrail :OnEnter false :PassAttitudes true
                 :TrailBlueprint :PKSXB_Dustbringer_Drunkard)
           (part :Corpse :CorpseChance 50
                 :CorpseBlueprint :PKSXB_CantorDust
                 :BurntCorpseBlueprint :PolypCache
                 :BurntCorpseChance 50
                 :VaporizedCorpseBlueprint :PolypCache
                 :VaporizedCorpseChance 100)
           (tag :DynamicObjectsTable:Saltdunes_Creatures)
           (tag :DynamicObjectsTable:Saltdunes_Creatures:Weight 3)
           (tag :DynamicObjectsTable:DesertCanyon_Creatures)
           (tag :DynamicObjectsTable:DesertCanyon_Creatures:Weight 3))
   (object :PKSXB_Dustbringer_BaseSpark :PKSXB_DustbringerBase
           (render "[base spark]" "Terrain/sw_crack.bmp"
                   col/white col/red)
           (description "Fractalline energy like the core of a star skitters across the baked earth.")
           (dustbringer-animation)
           (part :Brain
                 :Factions "Newly Sentient Beings-100,highly entropic beings-80")
           (part :Corpse :CorpseChance 10
                 :CorpseBlueprint :PKSXB_CantorDust
                 :BurntCorpseBlueprint :PolypCache
                 :BurntCorpseChance 30
                 :VaporizedCorpseBlueprint :PolypCache
                 :VaporizedCorpseChance 100)
           [:intproperty {:Name "Bleeds" :Value 0}]
           (tag :BaseObject :*noinherit))
   (object :PKSXB_Dustbringer_Drunkard :PKSXB_Dustbringer_BaseSpark
           (part :Render :DisplayName "{{sunslag|fulmination spark}}"
                 :ColorString (col/color-string col/orange col/background))
           (part :Temporary :Duration 12)
           (part :LeavesTrail :OnEnter false :PassAttitudes true
                 :TrailBlueprint "@PKSXB_DustbringerTrail")
           (part :LightSource :Lit true :Radius 4))
   (object :PKSXB_Dustbringer_Fulmination :PKSXB_Dustbringer_BaseSpark
           (part :Render :DisplayName "{{sunslag|fulmination}}")
           (part :Brain :Wanders false :Mobile false)
           (stat :MoveSpeed 0)
           (part :LightSource :Lit true :Radius 2)

           (part :Temporary :Duration 4 :TurnInto "Shimmering Heat"))

   (object :PKSXB_CantorDust :Snack
           (render "{{sunslag|cantor}} dust" "Items/sw_paste.bmp"
                   col/white col/red)
           (description "The dust of the real numbers, precipitated into this space-time in a pocket of order.")
           (dustbringer-animation)
           (part :Physics :Category "Food" :Weight 3)
           (commerce 50)
           (part :RulesDescription :Text "+5 heat resistance permanently.")
           (part :StatOnEat :Stats "HeatResistance:5" :LogInChronology false)
           (part :Food :Message "Each of its aleph-null particles burn your throat and tongue.\nYour heat resistance is permanently increased by {{rules|5}}."))])

# Automatic tri-holo bracelet

