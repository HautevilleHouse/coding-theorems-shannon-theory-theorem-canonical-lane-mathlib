import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CodingTheoremsShannonTheoryTheoremCanonicalLaneLean

structure ChannelPackage where
  inputAlphabet : Type u
  outputAlphabet : Type v
  transitionMatrix : inputAlphabet -> outputAlphabet -> ℝ
  stochasticCondition : ∀ x, (∑' y, transitionMatrix x y) = 1

structure ChannelEvidence (C : ChannelPackage) where
  stochasticConditionClosed : C.stochasticCondition

def ChannelClosed (C : ChannelPackage) : Prop :=
  C.stochasticCondition

theorem channel_closed_from_evidence (C : ChannelPackage) (E : ChannelEvidence C) : ChannelClosed C :=
  E.stochasticConditionClosed

end CodingTheoremsShannonTheoryTheoremCanonicalLaneLean
end HautevilleHouse
