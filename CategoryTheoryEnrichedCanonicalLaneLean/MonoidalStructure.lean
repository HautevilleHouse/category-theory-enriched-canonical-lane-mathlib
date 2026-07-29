import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CategoryTheoryEnrichedCanonicalLaneLean

structure MonoidalStructurePackage (V : Type u) [MonoidalCategory V] where
  tensorProduct : V -> V -> V
  unit : V
  associator : forall (x y z : V), (x ⊗ y) ⊗ z -> x ⊗ (y ⊗ z)
  leftUnitor : forall (x : V), unit ⊗ x -> x
  rightUnitor : forall (x : V), x ⊗ unit -> x
  pentagon : Prop
  triangle : Prop

structure MonoidalStructureEvidence (M : MonoidalStructurePackage V) where
  pentagonClosed : M.pentagon
  triangleClosed : M.triangle

def MonoidalStructureClosed (M : MonoidalStructurePackage V) : Prop :=
  M.pentagon ∧ M.triangle

theorem monoidal_structure_closed_from_evidence (M : MonoidalStructurePackage V) (E : MonoidalStructureEvidence M) : MonoidalStructureClosed M := by
  exact And.intro E.pentagonClosed E.triangleClosed

end CategoryTheoryEnrichedCanonicalLaneLean
end HautevilleHouse
