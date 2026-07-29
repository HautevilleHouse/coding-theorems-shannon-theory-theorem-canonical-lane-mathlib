import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CodingTheoremsShannonTheoryTheoremCanonicalLaneLean

def ConstrainedShannonClosure (A : AdmissibleClass) : Prop :=
  bridgeClosed A ∧ gateClosed A

theorem constrained_shannon_endgame (A : AdmissibleClass) :
    ConstrainedShannonClosure A := by
  exact And.intro (bridge_from_admissible_class A) (gate_from_admissible_class A)

end CodingTheoremsShannonTheoryTheoremCanonicalLaneLean
end HautevilleHouse