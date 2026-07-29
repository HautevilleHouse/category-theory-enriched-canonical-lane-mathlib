import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CategoryTheoryEnrichedCanonicalLaneLean

structure LimitsColimitsPackage (C : CategoryObjectMorphismPackage) (E : EnrichedCategoryPackage C) where
  diagramType : Type u
  cone : Type v
  cocone : Type w
  limitExists : Prop
  colimitExists : Prop
  universalPropertyLimit : Prop
  universalPropertyColimit : Prop

structure LimitsColimitsEvidence {C : CategoryObjectMorphismPackage} {E : EnrichedCategoryPackage C}
    (L : LimitsColimitsPackage C E) where
  limitExistsClosed : L.limitExists
  colimitExistsClosed : L.colimitExists
  universalPropertyLimitClosed : L.universalPropertyLimit
  universalPropertyColimitClosed : L.universalPropertyColimit

def LimitsColimitsClosed {C : CategoryObjectMorphismPackage} {E : EnrichedCategoryPackage C}
    (L : LimitsColimitsPackage C E) : Prop :=
  L.limitExists ∧ L.colimitExists ∧ L.universalPropertyLimit ∧ L.universalPropertyColimit

theorem limits_colimits_closed_from_evidence {C : CategoryObjectMorphismPackage} {E : EnrichedCategoryPackage C}
    (L : LimitsColimitsPackage C E) (Ev : LimitsColimitsEvidence L) : LimitsColimitsClosed L := by
  exact And.intro Ev.limitExistsClosed (And.intro Ev.colimitExistsClosed
    (And.intro Ev.universalPropertyLimitClosed Ev.universalPropertyColimitClosed))

end CategoryTheoryEnrichedCanonicalLaneLean
end HautevilleHouse