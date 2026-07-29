import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CategoryTheoryEnrichedCanonicalLaneLean

structure EnrichedAdmittedObject where
  carrier : Type u
  enrichment : Type v
  yonedaLemma : Prop
  adjointFunctorTheorem : Prop
  limitExistence : Prop
  colimitExistence : Prop
  conclusion : yonedaLemma ∧ adjointFunctorTheorem ∧ limitExistence ∧ colimitExistence

def EnrichedWitnessClosed (O : EnrichedAdmittedObject) : Prop :=
  O.yonedaLemma ∧ O.adjointFunctorTheorem ∧ O.limitExistence ∧ O.colimitExistence

end CategoryTheoryEnrichedCanonicalLaneLean
end HautevilleHouse
