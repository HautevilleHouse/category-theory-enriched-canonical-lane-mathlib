import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CategoryTheoryEnrichedCanonicalLaneLean

def ConstrainedEnrichedClosure (A : EnrichedAdmissibleObject) : Prop :=
  EnrichedBridgeClosed A ∧ gateClosed A

theorem constrained_enriched_endgame (A : EnrichedAdmissibleObject) : ConstrainedEnrichedClosure A :=
  And.intro (enriched_bridge_from_admissible_class A) (gate_from_admissible_class A)

end CategoryTheoryEnrichedCanonicalLaneLean
end HautevilleHouse