import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CodingTheoremsShannonTheoryTheoremCanonicalLaneLean

structure NoisyChannelCodingPackage where
  channelModel : Type u
  achievableRate : Prop
  channelCodingTheorem : Prop
  converse : Prop

structure NoisyChannelCodingEvidence (N : NoisyChannelCodingPackage) where
  achievableRateClosed : N.achievableRate
  channelCodingTheoremClosed : N.channelCodingTheorem
  converseClosed : N.converse

def NoisyChannelCodingClosed (N : NoisyChannelCodingPackage) : Prop :=
  N.achievableRate ∧ N.channelCodingTheorem ∧ N.converse

theorem noisy_channel_coding_closed_from_evidence (N : NoisyChannelCodingPackage)
    (E : NoisyChannelCodingEvidence N) : NoisyChannelCodingClosed N := by
  exact And.intro E.achievableRateClosed
    (And.intro E.channelCodingTheoremClosed E.converseClosed)

end CodingTheoremsShannonTheoryTheoremCanonicalLaneLean
end HautevilleHouse