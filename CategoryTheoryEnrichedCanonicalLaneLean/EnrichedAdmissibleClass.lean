import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CategoryTheoryEnrichedCanonicalLaneLean

structure EnrichedAdmissibleObject where
  V : Type u
  [monoidal : MonoidalCategory V]
  [closed : ClosedMonoidalCategory V]
  C : EnrichedCategory V
  categoryEvidence : EnrichedCategoryEvidence C

def EnrichedBridgeClosed (A : EnrichedAdmissibleObject) : Prop :=
  EnrichedCategoryClosed A.C

theorem enriched_bridge_from_admissible_class (A : EnrichedAdmissibleObject) : EnrichedBridgeClosed A :=
  enriched_category_closed_from_evidence A.C A.categoryEvidence

end CategoryTheoryEnrichedCanonicalLaneLean
end HautevilleHouse