import CategoryTheoryEnrichedCanonicalLaneLean.EnrichedAdjunction

namespace HautevilleHouse
namespace CategoryTheoryEnrichedCanonicalLaneLean

structure EnrichedLimit (J C : EnrichedCategory V) (D : Functor J C) where
  cone : Cone D
  universalProperty : Prop
  limitConclusion : universalProperty

structure EnrichedColimit (J C : EnrichedCategory V) (D : Functor J C) where
  cocone : Cocone D
  universalProperty : Prop
  colimitConclusion : universalProperty

theorem enriched_limit_closed (L : EnrichedLimit J C D) : L.limitConclusion :=
  L.limitConclusion

theorem enriched_colimit_closed (C : EnrichedColimit J C D) : C.colimitConclusion :=
  C.colimitConclusion

end CategoryTheoryEnrichedCanonicalLaneLean
end HautevilleHouse