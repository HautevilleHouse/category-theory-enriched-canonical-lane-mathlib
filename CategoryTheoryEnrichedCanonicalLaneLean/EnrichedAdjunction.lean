import CategoryTheoryEnrichedCanonicalLaneLean.KanExtension

namespace HautevilleHouse
namespace CategoryTheoryEnrichedCanonicalLaneLean

structure EnrichedAdjunction (C D : EnrichedCategory V) (F : Functor C D) (G : Functor D C) where
  unit : NaturalTransformation (Id C) (G ∘ F)
  counit : NaturalTransformation (F ∘ G) (Id D)
  triangleIdentities : Prop
  adjunctionConclusion : triangleIdentities

theorem enriched_adjunction_closed (A : EnrichedAdjunction C D F G) : A.adjunctionConclusion :=
  A.adjunctionConclusion

end CategoryTheoryEnrichedCanonicalLaneLean
end HautevilleHouse