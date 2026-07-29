import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CodingTheoremsShannonTheoryTheoremCanonicalLaneLean

structure EntropyRatePackage where
  sourceEntropy : ℝ
  conditionalEntropy : ℝ
  mutualInformation : ℝ
  entropyRateDefined : Prop
  entropyRatePositive : entropyRateDefined → sourceEntropy > 0
  entropyRateTerm : entropyRateDefined
  entropyRatePositiveTerm : entropyRatePositive entropyRateTerm

def EntropyRateClosed (E : EntropyRatePackage) : Prop :=
  E.entropyRateDefined ∧ E.sourceEntropy > 0

theorem entropy_rate_closed_from_package (E : EntropyRatePackage) :
    EntropyRateClosed E := by
  exact And.intro E.entropyRateTerm E.entropyRatePositiveTerm

end CodingTheoremsShannonTheoryTheoremCanonicalLaneLean
end HautevilleHouse