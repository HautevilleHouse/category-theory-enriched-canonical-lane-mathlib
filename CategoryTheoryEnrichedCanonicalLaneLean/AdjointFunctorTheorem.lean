import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CategoryTheoryEnrichedCanonicalLaneLean

structure AdjointFunctorPackage where
  leftAdjoint : Type u
  rightAdjoint : Type v
  unitNaturalTransformation : Prop
  counitNaturalTransformation : Prop
  triangleIdentities : Prop
  uniqueUpToIsomorphism : Prop

structure AdjointFunctorEvidence (A : AdjointFunctorPackage) where
  unitNaturalTransformationClosed : A.unitNaturalTransformation
  counitNaturalTransformationClosed : A.counitNaturalTransformation
  triangleIdentitiesClosed : A.triangleIdentities
  uniqueUpToIsomorphismClosed : A.uniqueUpToIsomorphism

def AdjointFunctorClosed (A : AdjointFunctorPackage) : Prop :=
  A.unitNaturalTransformation ∧ A.counitNaturalTransformation ∧
  A.triangleIdentities ∧ A.uniqueUpToIsomorphism

theorem adjoint_functor_closed_from_evidence (A : AdjointFunctorPackage) (E : AdjointFunctorEvidence A) :
    AdjointFunctorClosed A := by
  exact And.intro E.unitNaturalTransformationClosed
    (And.intro E.counitNaturalTransformationClosed
      (And.intro E.triangleIdentitiesClosed E.uniqueUpToIsomorphismClosed))

end CategoryTheoryEnrichedCanonicalLaneLean
end HautevilleHouse
