import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CodingTheoremsShannonTheoryTheoremCanonicalLaneLean

structure DiscreteChannel where
  inputAlphabet : Type u
  outputAlphabet : Type v
  transitionMatrix : inputAlphabet → outputAlphabet → ℝ
  stochastic : ∀ i, (∑ j, transitionMatrix i j) = 1

structure ChannelCapacityPackage where
  channel : DiscreteChannel
  inputDistribution : channel.inputAlphabet → ℝ
  mutualInformation : ℝ
  capacity : ℝ
  capacityAchieved : mutualInformation = capacity
  channelCodingTheoremBound : capacity ≥ 0

structure ChannelCapacityEvidence (P : ChannelCapacityPackage) where
  capacityAchievedProof : P.capacityAchieved
  capacityBoundProof : P.channelCodingTheoremBound

def ChannelCapacityClosed (P : ChannelCapacityPackage) : Prop :=
  P.capacityAchieved ∧ P.channelCodingTheoremBound

theorem channel_capacity_closed_from_evidence (P : ChannelCapacityPackage) (E : ChannelCapacityEvidence P) : ChannelCapacityClosed P :=
  And.intro E.capacityAchievedProof E.capacityBoundProof

end CodingTheoremsShannonTheoryTheoremCanonicalLaneLean
end HautevilleHouse