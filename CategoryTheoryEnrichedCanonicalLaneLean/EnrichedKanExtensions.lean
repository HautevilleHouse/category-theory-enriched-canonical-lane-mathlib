import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.CategoryTheoryEnrichedCanonicalLaneLean.EnrichedCategories

namespace HautevilleHouse
namespace CategoryTheoryEnrichedCanonicalLaneLean

structure EnrichedKanExtensionPackage {V : Type u} [MonoidalCategory V]
    {C : EnrichedCategory V} {D : EnrichedCategory V} where
  leftKan : (C.Ob → D.Ob) → (C.Ob → D.Ob)
  rightKan : (C.Ob → D.Ob) → (C.Ob → D.Ob)
  universalProperty : Prop
  pointwiseFormula : Prop

structure EnrichedKanExtensionEvidence {V : Type u} [MonoidalCategory V]
    {C D : EnrichedCategory V} (K : EnrichedKanExtensionPackage V C D) where
  universalPropertyClosed : K.universalProperty
  pointwiseFormulaClosed : K.pointwiseFormula

def EnrichedKanExtensionClosed {V : Type u} [MonoidalCategory V]
    {C D : EnrichedCategory V} (K : EnrichedKanExtensionPackage V C D) : Prop :=
  K.universalProperty ∧ K.pointwiseFormula

theorem enriched_kan_extension_closed_from_evidence {V : Type u} [MonoidalCategory V]
    {C D : EnrichedCategory V} (K : EnrichedKanExtensionPackage V C D)
    (E : EnrichedKanExtensionEvidence K) : EnrichedKanExtensionClosed K :=
  And.intro E.universalPropertyClosed E.pointwiseFormulaClosed

end CategoryTheoryEnrichedCanonicalLaneLean
end HautevilleHouse