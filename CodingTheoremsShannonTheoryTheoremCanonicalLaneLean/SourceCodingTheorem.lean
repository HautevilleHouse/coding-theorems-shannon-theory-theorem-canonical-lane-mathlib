import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CodingTheoremsShannonTheoryTheoremCanonicalLaneLean

structure SourceCodingPackage where
  sourceAlphabet : Type u
  entropy : ℝ
  codeLength : ℕ → ℝ
  asymptoticOptimal : ∀ ε > 0, ∃ N, ∀ n ≥ N, codeLength n ≤ n * (entropy + ε)

structure SourceCodingEvidence (S : SourceCodingPackage) where
  asymptoticOptimalClosed : S.asymptoticOptimal

def SourceCodingClosed (S : SourceCodingPackage) : Prop :=
  S.asymptoticOptimal

theorem source_coding_closed_from_evidence (S : SourceCodingPackage) (E : SourceCodingEvidence S) : SourceCodingClosed S :=
  E.asymptoticOptimalClosed

end CodingTheoremsShannonTheoryTheoremCanonicalLaneLean
end HautevilleHouse
