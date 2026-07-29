import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CategoryTheoryEnrichedCanonicalLaneLean

structure KanExtensionPackage {C : Type u} [Category.{v} C] {D : Type w} [Category.{t} D] (K : C ⥤ D) where
  leftKan : (C ⥤ E) ⥤ (D ⥤ E)
  rightKan : (C ⥤ E) ⥤ (D ⥤ E)
  leftKanAdjunction : ∀ (F : C ⥤ E), leftKan.obj F ⊣ K ⋙ F
  rightKanAdjunction : ∀ (F : C ⥤ E), K ⋙ F ⊣ rightKan.obj F
  pointwiseFormula : ∀ (F : C ⥤ E) (d : D), (leftKan.obj F).obj d ≅ colimit (Over d ⋙ F)

structure KanExtensionEvidence {C : Type u} [Category.{v} C] {D : Type w} [Category.{t} D] {K : C ⥤ D} (P : KanExtensionPackage K) where
  leftKanAdjunctionClosed : ∀ (F : C ⥤ E), P.leftKanAdjunction F
  rightKanAdjunctionClosed : ∀ (F : C ⥤ E), P.rightKanAdjunction F
  pointwiseFormulaClosed : ∀ (F : C ⥤ E) (d : D), P.pointwiseFormula F d

def KanExtensionClosed {C : Type u} [Category.{v} C] {D : Type w} [Category.{t} D] {K : C ⥤ D} (P : KanExtensionPackage K) : Prop :=
  (∀ (F : C ⥤ E), P.leftKanAdjunction F) ∧ (∀ (F : C ⥤ E), P.rightKanAdjunction F) ∧ (∀ (F : C ⥤ E) (d : D), P.pointwiseFormula F d)

theorem kan_extension_closed_from_evidence {C : Type u} [Category.{v} C] {D : Type w} [Category.{t} D] {K : C ⥤ D} (P : KanExtensionPackage K) (E : KanExtensionEvidence P) : KanExtensionClosed P := by
  exact And.intro E.leftKanAdjunctionClosed (And.intro E.rightKanAdjunctionClosed E.pointwiseFormulaClosed)

end CategoryTheoryEnrichedCanonicalLaneLean
end HautevilleHouse