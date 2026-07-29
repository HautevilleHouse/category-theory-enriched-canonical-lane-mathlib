import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CategoryTheoryEnrichedCanonicalLaneLean

structure AdjointFunctorsPackage (C D : CategoryObjectMorphismPackage) (EC : EnrichedCategoryPackage C) (ED : EnrichedCategoryPackage D) where
  leftAdjoint : C.morphisms → D.morphisms
  rightAdjoint : D.morphisms → C.morphisms
  unit : ∀ (x : C.objects), C.morphisms
  counit : ∀ (y : D.objects), D.morphisms
  triangleIdentities : Prop

structure AdjointFunctorsEvidence {C D : CategoryObjectMorphismPackage} {EC : EnrichedCategoryPackage C} {ED : EnrichedCategoryPackage D}
    (A : AdjointFunctorsPackage C D EC ED) where
  triangleIdentitiesClosed : A.triangleIdentities

def AdjointFunctorsClosed {C D : CategoryObjectMorphismPackage} {EC : EnrichedCategoryPackage C} {ED : EnrichedCategoryPackage D}
    (A : AdjointFunctorsPackage C D EC ED) : Prop :=
  A.triangleIdentities

theorem adjoint_functors_closed_from_evidence {C D : CategoryObjectMorphismPackage} {EC : EnrichedCategoryPackage C} {ED : EnrichedCategoryPackage D}
    (A : AdjointFunctorsPackage C D EC ED) (Ev : AdjointFunctorsEvidence A) : AdjointFunctorsClosed A := by
  exact Ev.triangleIdentitiesClosed

end CategoryTheoryEnrichedCanonicalLaneLean
end HautevilleHouse