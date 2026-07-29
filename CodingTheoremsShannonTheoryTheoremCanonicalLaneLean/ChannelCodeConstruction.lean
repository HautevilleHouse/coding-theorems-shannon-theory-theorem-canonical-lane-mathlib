import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CodingTheoremsShannonTheoryTheoremCanonicalLaneLean

structure ChannelCodeConstruction (A : AdmissibleClass) where
  codewordSet : Type u
  encodingFunction : A.object → codewordSet
  decodingFunction : codewordSet → A.object
  errorProbability : ℝ
  codeRate : ℝ
  codeLength : ℕ
  inputDistribution : Prop
  codeConstructionClosed : Prop

structure ChannelCodeEvidence (A : AdmissibleClass) (C : ChannelCodeConstruction A) where
  codewordSetClosed : Nonempty C.codewordSet
  encodingFunctionClosed : Function.Injective C.encodingFunction
  decodingFunctionClosed : Function.Surjective C.decodingFunction
  errorProbabilityClosed : C.errorProbability < 1
  codeRateClosed : C.codeRate ≥ 0
  codeLengthClosed : C.codeLength ≥ 1
  inputDistributionClosed : C.inputDistribution
  codeConstructionClosedClosed : C.codeConstructionClosed

def ChannelCodeConstructionClosed (A : AdmissibleClass) (C : ChannelCodeConstruction A) : Prop :=
  Nonempty C.codewordSet ∧ Function.Injective C.encodingFunction ∧ Function.Surjective C.decodingFunction ∧
  C.errorProbability < 1 ∧ C.codeRate ≥ 0 ∧ C.codeLength ≥ 1 ∧ C.inputDistribution ∧ C.codeConstructionClosed

theorem channel_code_construction_closed_from_evidence
    (A : AdmissibleClass) (C : ChannelCodeConstruction A) (E : ChannelCodeEvidence A C) :
    ChannelCodeConstructionClosed A C := by
  exact And.intro E.codewordSetClosed
    (And.intro E.encodingFunctionClosed
      (And.intro E.decodingFunctionClosed
        (And.intro E.errorProbabilityClosed
          (And.intro E.codeRateClosed
            (And.intro E.codeLengthClosed
              (And.intro E.inputDistributionClosed E.codeConstructionClosedClosed))))))

end CodingTheoremsShannonTheoryTheoremCanonicalLaneLean
end HautevilleHouse
