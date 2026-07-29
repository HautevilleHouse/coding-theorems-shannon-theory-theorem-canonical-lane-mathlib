import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CodingTheoremsShannonTheoryTheoremCanonicalLaneLean

structure SourceChannelPackage where
  inputAlphabet : Type u
  outputAlphabet : Type v
  transitionMatrix : inputAlphabet → outputAlphabet → ℝ
  memoryless : Prop
  stationary : Prop
  stationaryTerm : stationary
  memorylessTerm : memoryless

structure SourceChannelEvidence (C : SourceChannelPackage) where
  stationaryClosed : C.stationary
  memorylessClosed : C.memoryless

def SourceChannelClosed (C : SourceChannelPackage) : Prop :=
  C.stationary ∧ C.memoryless

theorem source_channel_closed_from_evidence (C : SourceChannelPackage)
    (E : SourceChannelEvidence C) : SourceChannelClosed C := by
  exact And.intro E.stationaryClosed E.memorylessClosed

end CodingTheoremsShannonTheoryTheoremCanonicalLaneLean
end HautevilleHouse