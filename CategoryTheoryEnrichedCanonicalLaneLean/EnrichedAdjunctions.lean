import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.CategoryTheoryEnrichedCanonicalLaneLean.EnrichedCategories

namespace HautevilleHouse
namespace CategoryTheoryEnrichedCanonicalLaneLean

structure EnrichedAdjunctionPackage {V : Type u} [MonoidalCategory V]
    {C : EnrichedCategory V} {D : EnrichedCategory V} where
  leftAdjoint : C.Ob → D.Ob
  rightAdjoint : D.Ob → C.Ob
  adjunctionIso : ∀ X Y, Hom (leftAdjoint X) Y ≅ Hom X (rightAdjoint Y)
  triangleIdentities : Prop
  naturality : Prop

structure EnrichedAdjunctionEvidence {V : Type u} [MonoidalCategory V]
    {C D : EnrichedCategory V} (A : EnrichedAdjunctionPackage V C D) where
  triangleIdentitiesClosed : A.triangleIdentities
  naturalityClosed : A.naturality

def EnrichedAdjunctionClosed {V : Type u} [MonoidalCategory V]
    {C D : EnrichedCategory V} (A : EnrichedAdjunctionPackage V C D) : Prop :=
  A.triangleIdentities ∧ A.naturality

theorem enriched_adjunction_closed_from_evidence {V : Type u} [MonoidalCategory V]
    {C D : EnrichedCategory V} (A : EnrichedAdjunctionPackage V C D)
    (E : EnrichedAdjunctionEvidence A) : EnrichedAdjunctionClosed A :=
  And.intro E.triangleIdentitiesClosed E.naturalityClosed

end CategoryTheoryEnrichedCanonicalLaneLean
end HautevilleHouse