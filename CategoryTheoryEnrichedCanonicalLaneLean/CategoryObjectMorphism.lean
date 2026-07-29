import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CategoryTheoryEnrichedCanonicalLaneLean

structure CategoryObjectMorphismPackage where
  objects : Type u
  morphisms : Type v
  source : morphisms → objects
  target : morphisms → objects
  identity : objects → morphisms
  composition : morphisms → morphisms → morphisms
  associativity : Prop
  identityLeft : Prop
  identityRight : Prop

structure CategoryObjectMorphismEvidence (C : CategoryObjectMorphismPackage) where
  associativityClosed : C.associativity
  identityLeftClosed : C.identityLeft
  identityRightClosed : C.identityRight

def CategoryObjectMorphismClosed (C : CategoryObjectMorphismPackage) : Prop :=
  C.associativity ∧ C.identityLeft ∧ C.identityRight

theorem category_object_morphism_closed_from_evidence (C : CategoryObjectMorphismPackage)
    (E : CategoryObjectMorphismEvidence C) : CategoryObjectMorphismClosed C := by
  exact And.intro E.associativityClosed (And.intro E.identityLeftClosed E.identityRightClosed)

end CategoryTheoryEnrichedCanonicalLaneLean
end HautevilleHouse