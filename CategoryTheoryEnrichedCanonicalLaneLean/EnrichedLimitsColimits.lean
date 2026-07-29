import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.CategoryTheoryEnrichedCanonicalLaneLean.EnrichedCategories

namespace HautevilleHouse
namespace CategoryTheoryEnrichedCanonicalLaneLean

structure EnrichedLimitPackage {V : Type u} [MonoidalCategory V]
    {C : EnrichedCategory V} (J : EnrichedCategory V) where
  diagram : J.Ob → C.Ob
  cone : Type (max u v)
  universalProperty : Prop
  existence : Prop

structure EnrichedColimitPackage {V : Type u} [MonoidalCategory V]
    {C : EnrichedCategory V} (J : EnrichedCategory V) where
  diagram : J.Ob → C.Ob
  cocone : Type (max u v)
  universalProperty : Prop
  existence : Prop

structure EnrichedLCBoundary (V : Type u) [MonoidalCategory V]
    (C : EnrichedCategory V) where
  limitClosed : ∀ (J : EnrichedCategory V), EnrichedLimitPackage V C J → Prop
  colimitClosed : ∀ (J : EnrichedCategory V), EnrichedColimitPackage V C J → Prop

end CategoryTheoryEnrichedCanonicalLaneLean
end HautevilleHouse