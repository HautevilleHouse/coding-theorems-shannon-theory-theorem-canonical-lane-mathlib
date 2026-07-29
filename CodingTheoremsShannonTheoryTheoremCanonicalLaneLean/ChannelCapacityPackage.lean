import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CodingTheoremsShannonTheoryTheoremCanonicalLaneLean

structure ChannelCapacityPackage where
  capacity : ℝ
  mutualInfoMax : Prop
  capacityFormula : mutualInfoMax → capacity = 0
  mutualInfoMaxTerm : mutualInfoMax
  capacityFormulaTerm : capacityFormula mutualInfoMaxTerm

def ChannelCapacityClosed (C : ChannelCapacityPackage) : Prop :=
  C.mutualInfoMax ∧ C.capacity = 0

theorem channel_capacity_closed (C : ChannelCapacityPackage) :
    ChannelCapacityClosed C := by
  exact And.intro C.mutualInfoMaxTerm C.capacityFormulaTerm

end CodingTheoremsShannonTheoryTheoremCanonicalLaneLean
end HautevilleHouse