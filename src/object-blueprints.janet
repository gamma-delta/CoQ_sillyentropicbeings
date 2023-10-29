(use cbt/xml-helpers/objects)
(import cbt/colors :as col)

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
           (inventoryobject :PKSXB_FloatingI_Whacker 4))
   (object :PKSXB_FloatingI_Whacker :NaturalWeapon
           (part :Render :DisplayName "paralyzing cornea")
           (part :ModHeatSeeking)
           (part :MeleeWeapon :HitBonus 7604 :BaseDamage "0")
           (part :StunOnHit :Duration 127 :Chance 66 :ChargeUse 0))

   (object :PKSXB_TimepinchFinch :BaseBird
           (render "timepinch finch" "Creatures/sw_crow.bmp"
                   col/dark-blue col/purple)
           (part :Brain :Factions "highly entropic beings-100,birds-80")
           (mutation :TimeDilation 25)
           (stat :Willpower 25)
           (inventoryobject :PKSXB_TimepinchFinch_Peck 1))
   (object :PKSXB_TimepinchFinch_Peck :NaturalWeapon
           (part :Render :DisplayName "temporal peck")
           (part :MeleeWeapon :BaseDamage "1d3"
                 :Skill "ShortBlades" :Slot "Face")
           (part :ModTimereaver :Chance 95))

   (object :PKSXB_SkellyJelly :BaseOoze
           (part :Render :DisplayName "amniotic anachronite")
           (part :Corpse :CorpseBlueprint :PKSXB_SkellyJelly :CorpseChance 99)
           (stat :MS 50))

   (object :PKSXB_Exploder :BaseStar
           (render "dustbringer" "Creatures/sw_monad.bmp"
                   col/white col/red)
           (part :AnimatedMaterialGeneric :AnimationLength 360
                 :LowFrameOffset 1 :HighFrameOffset 300
                 :DetailColorAnimationFrames "0=R,100=r,200=O,250=W,300=o"))
   (object :PKSXB_Exploder_ExplosionBase :InertObject
           (part :Render
                 :DisplayName "fulmination" :Tile "terrain/sw_crack.bmp"
                 :Occluding false)
           (part :Temporary :Duration 1))
   ;(seq [i :down-to [10 1]]
      (object (string :PKSXB_Exploder_Explosion_ i) :PKSXB_Exploder_ExplosionBase
              (part :Render
                    :DisplayName (string "fulmination: " i))
              (part
                :Breeder :Chance 10
                :Blueprint (string :PKSXB_Exploder_Explosion_ (dec i)))))
   (object :PKSXB_Exploder_Explosion_0 :PKSXB_Exploder_ExplosionBase)])

# Automatic tri-holo bracelet

