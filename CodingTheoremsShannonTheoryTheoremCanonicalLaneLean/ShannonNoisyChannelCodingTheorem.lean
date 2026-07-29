import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CodingTheoremsShannonTheoryTheoremCanonicalLaneLean

structure ShannonNoisyChannelCodingTheorem (A : AdmissibleClass) where
  channelCapacity : ℝ
  achievableRates : Set ℝ
  converseStatement : Prop
  directStatement : Prop
  errorProbabilityDecay : ℝ → ℝ

structure ShannonNoisyChannelCodingTheoremEvidence (A : AdmissibleClass) (S : ShannonNoisyChannelCodingTheorem A) where
  channelCapacityClosed : S.channelCapacity ≥ 0 ∧ S.channelCapacity ≤ 1
  achievableRatesClosed : S.achievableRates = {r : ℝ | r < S.channelCapacity} ∨ S.achievableRates = {r : ℝ | r ≤ S.channelCapacity}
  converseStatementClosed : S.converseStatement
  directStatementClosed : S.directStatement
  errorProbabilityDecayClosed : ∀ ε > 0, ∃ N : ℕ, ∀ n ≥ N, S.errorProbabilityDecay n < ε

def ShannonNoisyChannelCodingTheoremClosed (A : AdmissibleClass) (S : ShannonNoisyChannelCodingTheorem A) : Prop :=
  (S.channelCapacity ≥ 0 ∧ S.channelCapacity ≤ 1) ∧
  (S.achievableRates = {r : ℝ | r < S.channelCapacity} ∨ S.achievableRates = {r : ℝ | r ≤ S.channelCapacity}) ∧
  S.converseStatement ∧ S.directStatement ∧
  (∀ ε > 0, ∃ N : ℕ, ∀ n ≥ N, S.errorProbabilityDecay n < ε)

theorem shannon_noisy_channel_coding_theorem_closed_from_evidence
    (A : AdmissibleClass) (S : ShannonNoisyChannelCodingTheorem A) (E : ShannonNoisyChannelCodingTheoremEvidence A S) :
    ShannonNoisyChannelCodingTheoremClosed A S := by
  have hcap : S.channelCapacity ≥ 0 ∧ S.channelCapacity ≤ 1 := E.channelCapacityClosed
  have hach : S.achievableRates = {r : ℝ | r < S.channelCapacity} ∨ S.achievableRates = {r : ℝ | r ≤ S.channelCapacity} :=
    E.achievableRatesClosed
  exact And.intro hcap (And.intro hach (And.intro E.converseStatementClosed (And.intro E.directStatementClosed E.errorProbabilityDecayClosed)))

end CodingTheoremsShannonTheoryTheoremCanonicalLaneLean
end HautevilleHouse
