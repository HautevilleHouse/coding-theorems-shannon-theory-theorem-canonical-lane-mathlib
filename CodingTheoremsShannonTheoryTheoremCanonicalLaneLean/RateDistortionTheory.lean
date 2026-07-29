import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CodingTheoremsShannonTheoryTheoremCanonicalLaneLean

structure SourceDestinationPair where
  sourceDistribution : ℝ
  distortionMeasure : ℝ → ℝ → ℝ
  allowedDistortion : ℝ

structure RateDistortionPackage where
  pair : SourceDestinationPair
  rateDistortionFunction : ℝ → ℝ
  rateDistortionTheorem : rateDistortionFunction pair.allowedDistortion = inf_{conditional distribution} mutualInformation
  rateDistortionAchievability : ∀ R ≥ rateDistortionFunction pair.allowedDistortion, ∃ code with rate R and distortion ≤ pair.allowedDistortion
  rateDistortionConverse : ∀ code with distortion ≤ pair.allowedDistortion, rate ≥ rateDistortionFunction pair.allowedDistortion

structure RateDistortionEvidence (P : RateDistortionPackage) where
  functionDefinitionProof : P.rateDistortionTheorem
  achievabilityProof : P.rateDistortionAchievability
  converseProof : P.rateDistortionConverse

def RateDistortionClosed (P : RateDistortionPackage) : Prop :=
  P.rateDistortionTheorem ∧ P.rateDistortionAchievability ∧ P.rateDistortionConverse

theorem rate_distortion_closed_from_evidence (P : RateDistortionPackage) (E : RateDistortionEvidence P) : RateDistortionClosed P :=
  And.intro E.functionDefinitionProof (And.intro E.achievabilityProof E.converseProof)

end CodingTheoremsShannonTheoryTheoremCanonicalLaneLean
end HautevilleHouse