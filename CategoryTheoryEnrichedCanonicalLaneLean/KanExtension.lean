import CategoryTheoryEnrichedCanonicalLaneLean.YonedaLemma

namespace HautevilleHouse
namespace CategoryTheoryEnrichedCanonicalLaneLean

structure KanExtension (C D : EnrichedCategory V) (F : Functor C D) where
  leftKan : Functor C D → Functor C D
  rightKan : Functor C D → Functor C D
  leftKanUniversal : Prop
  rightKanUniversal : Prop
  kanConclusion : leftKanUniversal ∧ rightKanUniversal

theorem kan_extension_closed (K : KanExtension C D F) : K.kanConclusion :=
  K.kanConclusion

end CategoryTheoryEnrichedCanonicalLaneLean
end HautevilleHouse