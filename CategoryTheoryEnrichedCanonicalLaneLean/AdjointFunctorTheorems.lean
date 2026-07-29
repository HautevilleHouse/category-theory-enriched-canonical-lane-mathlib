import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CategoryTheoryEnrichedCanonicalLaneLean

structure AdjointFunctorPackage (C : Type u) [Category.{v} C] (D : Type w) [Category.{t} D] (F : C ⥤ D) where
  leftAdjointExists : IsLeftAdjoint F
  rightAdjointExists : IsRightAdjoint F
  unitCounit : ∀ (G : D ⥤ C), (F ⊣ G) → (unit : 𝟙 C ⟶ G ⋙ F) ∧ (counit : F ⋙ G ⟶ 𝟙 D)
  freydAdjoint : (∀ (c : C), HasColimit (cospan (F.obj c) (F.obj c))) → IsLeftAdjoint F

structure AdjointFunctorEvidence {C : Type u} [Category.{v} C] {D : Type w} [Category.{t} D] {F : C ⥤ D} (A : AdjointFunctorPackage C D F) where
  leftAdjointClosed : A.leftAdjointExists
  rightAdjointClosed : A.rightAdjointExists
  unitCounitClosed : ∀ (G : D ⥤ C), (F ⊣ G) → (A.unitCounit G).1 ∧ (A.unitCounit G).2

def AdjointFunctorClosed {C : Type u} [Category.{v} C] {D : Type w} [Category.{t} D] {F : C ⥤ D} (A : AdjointFunctorPackage C D F) : Prop :=
  A.leftAdjointExists ∧ A.rightAdjointExists ∧ (∀ (G : D ⥤ C), (F ⊣ G) → (A.unitCounit G).1 ∧ (A.unitCounit G).2)

theorem adjoint_functor_closed_from_evidence {C : Type u} [Category.{v} C] {D : Type w} [Category.{t} D] {F : C ⥤ D} (A : AdjointFunctorPackage C D F) (E : AdjointFunctorEvidence A) : AdjointFunctorClosed A := by
  exact And.intro E.leftAdjointClosed (And.intro E.rightAdjointClosed E.unitCounitClosed)

end CategoryTheoryEnrichedCanonicalLaneLean
end HautevilleHouse