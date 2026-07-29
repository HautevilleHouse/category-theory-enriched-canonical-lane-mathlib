import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CategoryTheoryEnrichedCanonicalLaneLean

structure EnrichedCategory (M : MonoidalCategory) where
  ob : Type
  hom : ob → ob → M
  id : ∀ x : ob, hom x x
  comp : ∀ x y z : ob, hom y z ⊗ hom x y → hom x z
  associativity : ...
  identity : ...

structure EnrichedFunctor (C D : EnrichedCategory) where
  onOb : C.ob → D.ob
  onHom : ∀ x y : C.ob, C.hom x y → D.hom (onOb x) (onOb y)
  functoriality : ...

def EnrichedWitnessClosed (O : AdmittedObject) : Prop :=
  O.conclusion

end CategoryTheoryEnrichedCanonicalLaneLean
end HautevilleHouse
