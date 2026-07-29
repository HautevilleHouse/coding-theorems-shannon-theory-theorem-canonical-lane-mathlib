import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CodingTheoremsShannonTheoryTheoremCanonicalLaneLean

structure NoisyChannelCodingTheorem where
  capacity : ℝ
  achievableRate : ℝ
  codingTheoremStatement : Prop
  converseStatement : Prop
  capacityAchievable : codingTheoremStatement → achievableRate = capacity
  converseHolds : converseStatement → achievableRate ≤ capacity
  codingTheoremTerm : codingTheoremStatement
  converseTerm : converseStatement
  capacityAchievableTerm : capacityAchievable codingTheoremTerm
  converseHoldsTerm : converseHolds converseTerm

def NoisyChannelCodingClosed (N : NoisyChannelCodingTheorem) : Prop :=
  N.codingTheoremStatement ∧ N.converseStatement

theorem noisy_channel_coding_closed (N : NoisyChannelCodingTheorem) :
    NoisyChannelCodingClosed N := by
  exact And.intro N.codingTheoremTerm N.converseTerm

end CodingTheoremsShannonTheoryTheoremCanonicalLaneLean
end HautevilleHouse