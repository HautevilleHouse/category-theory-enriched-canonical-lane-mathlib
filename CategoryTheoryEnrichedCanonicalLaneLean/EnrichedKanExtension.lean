import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CategoryTheoryEnrichedCanonicalLaneLean

structure EnrichedKanExtension (V : Type u) [MonoidalCategory V] [ClosedMonoidalCategory V]
  (C : EnrichedCategory V) (D : EnrichedCategory V) (K : EnrichedFunctor V C D) where
  extension : EnrichedFunctor V (EnrichedCategory V) D
  naturalTransformation : EnrichedNaturalTransformation V extension (idFunctor V (EnrichedCategory V))
  universalProperty : ∀ (G : EnrichedFunctor V (EnrichedCategory V) D),
    (EnrichedNaturalTransformation V extension G) ≃ EnrichedNaturalTransformation V (idFunctor V (EnrichedCategory V)) (G ∘ K)

def EnrichedKanExtensionClosed (E : EnrichedKanExtension) : Prop :=
  True

end CategoryTheoryEnrichedCanonicalLaneLean
end HautevilleHouse