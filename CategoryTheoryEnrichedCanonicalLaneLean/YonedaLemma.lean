import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CategoryTheoryEnrichedCanonicalLaneLean

structure YonedaLemmaPackage where
  category : Type u
  functorCategory : Type v
  yonedaEmbedding : Type w
  naturalIsomorphism : Prop
  fullFaithfulness : Prop
  representablePresheaves : Prop

structure YonedaLemmaEvidence (Y : YonedaLemmaPackage) where
  naturalIsomorphismClosed : Y.naturalIsomorphism
  fullFaithfulnessClosed : Y.fullFaithfulness
  representablePresheavesClosed : Y.representablePresheaves

def YonedaLemmaClosed (Y : YonedaLemmaPackage) : Prop :=
  Y.naturalIsomorphism ∧ Y.fullFaithfulness ∧ Y.representablePresheaves

theorem yoneda_lemma_closed_from_evidence (Y : YonedaLemmaPackage) (E : YonedaLemmaEvidence Y) :
    YonedaLemmaClosed Y := by
  exact And.intro E.naturalIsomorphismClosed
    (And.intro E.fullFaithfulnessClosed E.representablePresheavesClosed)

end CategoryTheoryEnrichedCanonicalLaneLean
end HautevilleHouse
