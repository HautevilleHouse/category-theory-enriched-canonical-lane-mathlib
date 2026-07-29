import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CategoryTheoryEnrichedCanonicalLaneLean

structure LimitAndColimitPackage where
  limitCone : Type u
  colimitCocone : Type v
  universalPropertyLimit : Prop
  universalPropertyColimit : Prop
  uniquenessLimit : Prop
  uniquenessColimit : Prop

structure LimitAndColimitEvidence (L : LimitAndColimitPackage) where
  universalPropertyLimitClosed : L.universalPropertyLimit
  universalPropertyColimitClosed : L.universalPropertyColimit
  uniquenessLimitClosed : L.uniquenessLimit
  uniquenessColimitClosed : L.uniquenessColimit

def LimitAndColimitClosed (L : LimitAndColimitPackage) : Prop :=
  L.universalPropertyLimit ∧ L.universalPropertyColimit ∧
  L.uniquenessLimit ∧ L.uniquenessColimit

theorem limit_and_colimit_closed_from_evidence (L : LimitAndColimitPackage) (E : LimitAndColimitEvidence L) :
    LimitAndColimitClosed L := by
  exact And.intro E.universalPropertyLimitClosed
    (And.intro E.universalPropertyColimitClosed
      (And.intro E.uniquenessLimitClosed E.uniquenessColimitClosed))

end CategoryTheoryEnrichedCanonicalLaneLean
end HautevilleHouse
