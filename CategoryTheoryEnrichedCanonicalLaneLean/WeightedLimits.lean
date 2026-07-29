import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CategoryTheoryEnrichedCanonicalLaneLean

structure WeightedLimitPackage (V : Type u) [MonoidalCategory V] (C : EnrichedCategoryPackage V) (D : EnrichedCategoryPackage V) where
  weight : D.Obj -> V
  diagram : EnrichedFunctorPackage V D C
  limitObject : C.Obj
  universalMorphism : Prop

structure WeightedLimitEvidence {V : Type u} [MonoidalCategory V] {C D : EnrichedCategoryPackage V} (W : WeightedLimitPackage V C D) where
  universalMorphismClosed : W.universalMorphism

def WeightedLimitClosed {V : Type u} [MonoidalCategory V] {C D : EnrichedCategoryPackage V} (W : WeightedLimitPackage V C D) : Prop :=
  W.universalMorphism

theorem weighted_limit_closed_from_evidence {V : Type u} [MonoidalCategory V] {C D : EnrichedCategoryPackage V} (W : WeightedLimitPackage V C D) (E : WeightedLimitEvidence W) : WeightedLimitClosed W := by
  exact E.universalMorphismClosed

end CategoryTheoryEnrichedCanonicalLaneLean
end HautevilleHouse
