import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.CategoryTheoryEnrichedCanonicalLaneLean.MathlibObjects

namespace HautevilleHouse
namespace CategoryTheoryEnrichedCanonicalLaneLean

structure EnrichedCategoriesPackage {V : Type u} [Category V] [MonoidalCategory V] where
  base : V
  enrichedCategory : EnrichedCategoryData V
  enrichedFunctor : EnrichedFunctorData enrichedCategory enrichedCategory
  enrichedNaturalTransformation : EnrichedNaturalTransformationData enrichedFunctor enrichedFunctor
  allDefined : Prop
  categoryClosed : Prop
  functorClosed : Prop
  naturalTransformationClosed : Prop

structure EnrichedCategoriesEvidence {V : Type u} [Category V] [MonoidalCategory V]
  (P : EnrichedCategoriesPackage V) where
  allDefinedClosed : P.allDefined
  categoryClosed : P.categoryClosed
  functorClosed : P.functorClosed
  naturalTransformationClosed : P.naturalTransformationClosed

def EnrichedCategoriesClosed {V : Type u} [Category V] [MonoidalCategory V]
  (P : EnrichedCategoriesPackage V) : Prop :=
  P.allDefined ∧ P.categoryClosed ∧ P.functorClosed ∧ P.naturalTransformationClosed

theorem enriched_categories_closed_from_evidence {V : Type u} [Category V] [MonoidalCategory V]
  (P : EnrichedCategoriesPackage V) (E : EnrichedCategoriesEvidence P) :
  EnrichedCategoriesClosed P := by
  exact And.intro E.allDefinedClosed (And.intro E.categoryClosed (And.intro E.functorClosed E.naturalTransformationClosed))

end CategoryTheoryEnrichedCanonicalLaneLean
end HautevilleHouse