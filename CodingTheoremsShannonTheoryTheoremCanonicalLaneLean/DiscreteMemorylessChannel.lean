import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CodingTheoremsShannonTheoryTheoremCanonicalLaneLean

structure DiscreteMemorylessChannel (A : AdmissibleClass) where
  inputAlphabet : Type u
  outputAlphabet : Type v
  transitionMatrix : inputAlphabet → outputAlphabet → ℝ
  memorylessProperty : Prop
  stationaryProperty : Prop
  channelCapacity : ℝ

structure DiscreteMemorylessChannelEvidence (A : AdmissibleClass) (C : DiscreteMemorylessChannel A) where
  inputAlphabetClosed : Nonempty C.inputAlphabet
  outputAlphabetClosed : Nonempty C.outputAlphabet
  transitionMatrixClosed : ∀ x : C.inputAlphabet, (∑ y : C.outputAlphabet, C.transitionMatrix x y) = 1
  memorylessPropertyClosed : C.memorylessProperty
  stationaryPropertyClosed : C.stationaryProperty
  channelCapacityClosed : C.channelCapacity ≥ 0 ∧ C.channelCapacity ≤ 1

def DiscreteMemorylessChannelClosed (A : AdmissibleClass) (C : DiscreteMemorylessChannel A) : Prop :=
  Nonempty C.inputAlphabet ∧ Nonempty C.outputAlphabet ∧
  (∀ x : C.inputAlphabet, (∑ y : C.outputAlphabet, C.transitionMatrix x y) = 1) ∧
  C.memorylessProperty ∧ C.stationaryProperty ∧ C.channelCapacity ≥ 0 ∧ C.channelCapacity ≤ 1

theorem discrete_memoryless_channel_closed_from_evidence
    (A : AdmissibleClass) (C : DiscreteMemorylessChannel A) (E : DiscreteMemorylessChannelEvidence A C) :
    DiscreteMemorylessChannelClosed A C := by
  exact And.intro E.inputAlphabetClosed
    (And.intro E.outputAlphabetClosed
      (And.intro E.transitionMatrixClosed
        (And.intro E.memorylessPropertyClosed
          (And.intro E.stationaryPropertyClosed
            (And.intro E.channelCapacityClosed.1 E.channelCapacityClosed.2)))))

end CodingTheoremsShannonTheoryTheoremCanonicalLaneLean
end HautevilleHouse
