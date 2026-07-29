import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CodingTheoremsShannonTheoryTheoremCanonicalLaneLean

structure ChannelCodingPackage where
  channel : ChannelPackage
  capacity : ℝ
  achievableRate : ℝ → Prop
  capacityAchievable : capacity = sup {R | achievableRate R}

structure ChannelCodingEvidence (C : ChannelCodingPackage) where
  capacityAchievableClosed : C.capacityAchievable

def ChannelCodingClosed (C : ChannelCodingPackage) : Prop :=
  C.capacityAchievable

theorem channel_coding_closed_from_evidence (C : ChannelCodingPackage) (E : ChannelCodingEvidence C) : ChannelCodingClosed C :=
  E.capacityAchievableClosed

end CodingTheoremsShannonTheoryTheoremCanonicalLaneLean
end HautevilleHouse
