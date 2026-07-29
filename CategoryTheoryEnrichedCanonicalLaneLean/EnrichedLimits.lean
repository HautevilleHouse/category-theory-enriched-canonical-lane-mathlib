import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CategoryTheoryEnrichedCanonicalLaneLean

structure EnrichedLimit (V : Type u) [MonoidalCategory V] [ClosedMonoidalCategory V]
  (J : EnrichedCategory V) (C : EnrichedCategory V) (D : EnrichedFunctor V J C) where
  cone : EnrichedCone V J C D
  universalProperty : ∀ (c : EnrichedCone V J C D),
    hom V (c.apex) (cone.apex) ≃ EnrichedConeMorphism V c cone

def EnrichedLimitClosed (L : EnrichedLimit) : Prop :=
  True

end CategoryTheoryEnrichedCanonicalLaneLean
end HautevilleHouse