import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CategoryTheoryEnrichedCanonicalLaneLean

structure LimitsPackage (C : Type u) [Category.{v} C] where
  hasSmallLimits : HasLimitsOfSize.{w, v} C
  hasSmallColimits : HasColimitsOfSize.{w, v} C
  limitFormula : ∀ (F : J ⥤ C), limit F ≅ conePoint (limit.cone F)
  colimitFormula : ∀ (F : J ⥤ C), colimit F ≅ coconePoint (colimit.cocone F)
  functoriality : limit : (J ⥤ C) ⥤ C
  functorialityColimit : colimit : (J ⥤ C) ⥤ C

structure LimitsEvidence (C : Type u) [Category.{v} C] (L : LimitsPackage C) where
  hasSmallLimitsClosed : L.hasSmallLimits
  hasSmallColimitsClosed : L.hasSmallColimits
  limitFormulaClosed : ∀ (F : J ⥤ C), L.limitFormula F
  colimitFormulaClosed : ∀ (F : J ⥤ C), L.colimitFormula F

def LimitsClosed (C : Type u) [Category.{v} C] (L : LimitsPackage C) : Prop :=
  L.hasSmallLimits ∧ L.hasSmallColimits ∧ (∀ (F : J ⥤ C), L.limitFormula F) ∧ (∀ (F : J ⥤ C), L.colimitFormula F)

theorem limits_closed_from_evidence {C : Type u} [Category.{v} C] (L : LimitsPackage C) (E : LimitsEvidence L) : LimitsClosed L := by
  exact And.intro E.hasSmallLimitsClosed (And.intro E.hasSmallColimitsClosed (And.intro E.limitFormulaClosed E.colimitFormulaClosed))

end CategoryTheoryEnrichedCanonicalLaneLean
end HautevilleHouse