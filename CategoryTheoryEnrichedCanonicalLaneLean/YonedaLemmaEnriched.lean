import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.CategoryTheoryEnrichedCanonicalLaneLean.EnrichedCategories

namespace HautevilleHouse
namespace CategoryTheoryEnrichedCanonicalLaneLean

structure YonedaLemmaPackage {V : Type u} [MonoidalCategory V] {C : EnrichedCategory V} where
  yonedaEmbedding : Type (max u v)
  naturalIso : Type (max u v)
  fullFaithfulness : Prop
  universalProperty : Prop

structure YonedaEvidence {V : Type u} [MonoidalCategory V] {C : EnrichedCategory V}
    (P : YonedaLemmaPackage V C) where
  fullFaithfulnessClosed : P.fullFaithfulness
  universalPropertyClosed : P.universalProperty

def YonedaClosed {V : Type u} [MonoidalCategory V] {C : EnrichedCategory V}
    (P : YonedaLemmaPackage V C) : Prop :=
  P.fullFaithfulness ∧ P.universalProperty

theorem yoneda_closed_from_evidence {V : Type u} [MonoidalCategory V] {C : EnrichedCategory V}
    (P : YonedaLemmaPackage V C) (E : YonedaEvidence P) : YonedaClosed P :=
  And.intro E.fullFaithfulnessClosed E.universalPropertyClosed

end CategoryTheoryEnrichedCanonicalLaneLean
end HautevilleHouse