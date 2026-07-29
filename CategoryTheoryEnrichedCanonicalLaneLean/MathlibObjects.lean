import canonicalLaneMathlib.AdmissibleClass
import Mathlib.CategoryTheory.Enriched.Basic

namespace HautevilleHouse
namespace CategoryTheoryEnrichedCanonicalLaneLean

open CategoryTheory

structure EnrichedCategoryData (V : Type u) [Category V] [MonoidalCategory V] where
  carrier : Type v
  hom : carrier → carrier → V
  id : ∀ x : carrier, (𝟙_ V) ⟶ hom x x
  comp : ∀ x y z : carrier, hom y z ⊗ hom x y ⟶ hom x z
  assoc : ∀ w x y z : carrier, ... -- not fully specified
  unit : ∀ x y : carrier, ...

structure EnrichedFunctorData {V : Type u} [Category V] [MonoidalCategory V]
  (C D : EnrichedCategoryData V) where
  map : C.carrier → D.carrier
  action : ∀ x y : C.carrier, C.hom x y ⟶ D.hom (map x) (map y)
  functoriality : ...

structure EnrichedNaturalTransformationData {V : Type u} [Category V] [MonoidalCategory V]
  {C D : EnrichedCategoryData V} (F G : EnrichedFunctorData C D) where
  component : ∀ x : C.carrier, 𝟙_ V ⟶ D.hom (F.map x) (G.map x)
  naturality : ...

structure EnrichedAdmittedObject where
  baseCategory : Type u
  monoidalStructure : MonoidalCategory.{u} baseCategory
  enrichedCategory : EnrichedCategoryData baseCategory
  yonedaEmbedding : Prop
  representableFunctor : Prop
  conclusion : yonedaEmbedding ∧ representableFunctor

def EnrichedWitnessClosed (O : EnrichedAdmittedObject) : Prop :=
  O.conclusion

end CategoryTheoryEnrichedCanonicalLaneLean
end HautevilleHouse