import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CategoryTheoryEnrichedCanonicalLaneLean

structure EnrichedCategory (V : Type u) [MonoidalCategory V] where
  Ob : Type v
  Hom : Ob → Ob → V
  id : ∀ (X : Ob), Hom X X ⟶ unit
  comp : ∀ (X Y Z : Ob), Hom Y Z ⊗ Hom X Y ⟶ Hom X Z
  id_left : ∀ (X Y : Ob) (f : Hom X Y), (comp X X Y) ∘ (id X ⊗ f) = f
  id_right : ∀ (X Y : Ob) (f : Hom X Y), (comp X Y Y) ∘ (f ⊗ id Y) = f
  assoc : ∀ (W X Y Z : Ob) (f : Hom W X) (g : Hom X Y) (h : Hom Y Z),
    (comp W X Z) ∘ ((comp W X Y) ⊗ f) ∘ (associator _ _ _) = (comp W Y Z) ∘ (f ⊗ (comp X Y Z)) ∘ (associator _ _ _)

structure EnrichedAdmittedObject (V : Type u) [MonoidalCategory V] where
  cat : EnrichedCategory V
  homClosed : Prop
  functorial : Prop
  conclusion : homClosed ∧ functorial

end CategoryTheoryEnrichedCanonicalLaneLean
end HautevilleHouse