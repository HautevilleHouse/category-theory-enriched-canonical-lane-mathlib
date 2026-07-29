import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.CategoryTheoryEnrichedCanonicalLaneLean.EnrichedCategories

namespace HautevilleHouse
namespace CategoryTheoryEnrichedCanonicalLaneLean

structure EnrichedMonoidalStructurePackage {V : Type u} [MonoidalCategory V]
    (C : EnrichedCategory V) where
  tensorProduct : C.Ob → C.Ob → C.Ob
  unit : C.Ob
  associatorNatural : Prop
  unitIsomorphismsNatural : Prop
  coherenceConditions : Prop

structure EnrichedMonoidalEvidence {V : Type u} [MonoidalCategory V]
    (C : EnrichedCategory V) (M : EnrichedMonoidalStructurePackage V C) where
  associatorNaturalClosed : M.associatorNatural
  unitIsomorphismsNaturalClosed : M.unitIsomorphismsNatural
  coherenceConditionsClosed : M.coherenceConditions

def EnrichedMonoidalClosed {V : Type u} [MonoidalCategory V]
    (C : EnrichedCategory V) (M : EnrichedMonoidalStructurePackage V C) : Prop :=
  M.associatorNatural ∧ M.unitIsomorphismsNatural ∧ M.coherenceConditions

theorem enriched_monoidal_closed_from_evidence {V : Type u} [MonoidalCategory V]
    (C : EnrichedCategory V) (M : EnrichedMonoidalStructurePackage V C)
    (E : EnrichedMonoidalEvidence M) : EnrichedMonoidalClosed C M :=
  And.intro E.associatorNaturalClosed (And.intro E.unitIsomorphismsNaturalClosed E.coherenceConditionsClosed)

end CategoryTheoryEnrichedCanonicalLaneLean
end HautevilleHouse