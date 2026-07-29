import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CodingTheoremsShannonTheoryTheoremCanonicalLaneLean

structure MutualInformationPackage (C : ChannelPackage) where
  inputDistribution : C.inputAlphabet → ℝ
  outputDistribution : C.outputAlphabet → ℝ
  jointDistribution : C.inputAlphabet → C.outputAlphabet → ℝ
  mutualInformationDefinition : ℝ
  positivityCondition : mutualInformationDefinition ≥ 0

structure MutualInformationEvidence {C : ChannelPackage} (I : MutualInformationPackage C) where
  positivityConditionClosed : I.positivityCondition

def MutualInformationClosed {C : ChannelPackage} (I : MutualInformationPackage C) : Prop :=
  I.positivityCondition

theorem mutual_information_closed_from_evidence
    {C : ChannelPackage} (I : MutualInformationPackage C)
    (E : MutualInformationEvidence I) : MutualInformationClosed I :=
  E.positivityConditionClosed

end CodingTheoremsShannonTheoryTheoremCanonicalLaneLean
end HautevilleHouse
