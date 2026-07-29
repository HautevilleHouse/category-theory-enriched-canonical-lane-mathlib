import canonicalLaneMathlib.GateLemmas

namespace HautevilleHouse
namespace CategoryTheoryEnrichedCanonicalLaneLean

def ConstrainedCategoryClosure (A : AdmissibleClass) : Prop :=
  bridgeClosed A ∧ gateClosed A

theorem constrained_category_endgame (A : AdmissibleClass) :
    ConstrainedCategoryClosure A := by
  exact And.intro (bridge_from_admissible_class A) (gate_from_admissible_class A)

end CategoryTheoryEnrichedCanonicalLaneLean
end HautevilleHouse
