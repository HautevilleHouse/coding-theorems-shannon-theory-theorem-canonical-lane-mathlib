import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CodingTheoremsShannonTheoryTheoremCanonicalLaneLean

structure AdmissibleClass where
  object : ShannonAdmittedObject
  endpointSatisfied : Prop
  remainderRecorded : Prop
  gateWitness : endpointSatisfied ∨ remainderRecorded

def admittedClosure (A : AdmissibleClass) : Prop :=
  ShannonWitnessClosed A.object ∧ (A.endpointSatisfied ∨ A.remainderRecorded)

end CodingTheoremsShannonTheoryTheoremCanonicalLaneLean
end HautevilleHouse