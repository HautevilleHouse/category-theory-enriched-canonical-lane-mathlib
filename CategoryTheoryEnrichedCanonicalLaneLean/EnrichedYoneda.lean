import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CategoryTheoryEnrichedCanonicalLaneLean

structure EnrichedYonedaPackage (C : CategoryObjectMorphismPackage) (E : EnrichedCategoryPackage C) (Y : YonedaLemmaPackage C E) where
  enrichedYonedaEmbedding : Type u
  enrichedNaturalIsomorphism : Prop
  enrichedFullFaithfulness : Prop

structure EnrichedYonedaEvidence {C : CategoryObjectMorphismPackage} {E : EnrichedCategoryPackage C} {Y : YonedaLemmaPackage C E}
    (EY : EnrichedYonedaPackage C E Y) where
  enrichedNaturalIsomorphismClosed : EY.enrichedNaturalIsomorphism
  enrichedFullFaithfulnessClosed : EY.enrichedFullFaithfulness

def EnrichedYonedaClosed {C : CategoryObjectMorphismPackage} {E : EnrichedCategoryPackage C} {Y : YonedaLemmaPackage C E}
    (EY : EnrichedYonedaPackage C E Y) : Prop :=
  EY.enrichedNaturalIsomorphism ∧ EY.enrichedFullFaithfulness

theorem enriched_yoneda_closed_from_evidence {C : CategoryObjectMorphismPackage} {E : EnrichedCategoryPackage C} {Y : YonedaLemmaPackage C E}
    (EY : EnrichedYonedaPackage C E Y) (Ev : EnrichedYonedaEvidence EY) : EnrichedYonedaClosed EY := by
  exact And.intro Ev.enrichedNaturalIsomorphismClosed Ev.enrichedFullFaithfulnessClosed

end CategoryTheoryEnrichedCanonicalLaneLean
end HautevilleHouse