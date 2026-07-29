import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CategoryTheoryEnrichedCanonicalLaneLean

structure EnrichedCategoryPackage (C : CategoryObjectMorphismPackage) where
  baseCategory : Type u
  enrichment : objects → objects → baseCategory
  compositionLaw : ∀ x y z : objects, baseCategory → baseCategory → baseCategory
  identityLaw : ∀ x : objects, baseCategory
  associativityEnrichment : Prop
  identityLeftEnrichment : Prop
  identityRightEnrichment : Prop

structure EnrichedCategoryEvidence {C : CategoryObjectMorphismPackage}
    (E : EnrichedCategoryPackage C) where
  associativityEnrichmentClosed : E.associativityEnrichment
  identityLeftEnrichmentClosed : E.identityLeftEnrichment
  identityRightEnrichmentClosed : E.identityRightEnrichment

def EnrichedCategoryClosed {C : CategoryObjectMorphismPackage}
    (E : EnrichedCategoryPackage C) : Prop :=
  E.associativityEnrichment ∧ E.identityLeftEnrichment ∧ E.identityRightEnrichment

theorem enriched_category_closed_from_evidence {C : CategoryObjectMorphismPackage}
    (E : EnrichedCategoryPackage C) (Ev : EnrichedCategoryEvidence E) : EnrichedCategoryClosed E := by
  exact And.intro Ev.associativityEnrichmentClosed (And.intro Ev.identityLeftEnrichmentClosed Ev.identityRightEnrichmentClosed)

end CategoryTheoryEnrichedCanonicalLaneLean
end HautevilleHouse