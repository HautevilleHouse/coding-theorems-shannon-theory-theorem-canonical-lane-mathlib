import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CodingTheoremsShannonTheoryTheoremCanonicalLaneLean

structure ShannonMcMillanBreimanPackage where
  ergodicSource : Type u
  entropyRate : Type v
  typicalSet : Type w
  asymptoticEquipartition : Prop
  smbDefinition : Prop
  smbProof : Prop

structure ShannonMcMillanBreimanEvidence (S : ShannonMcMillanBreimanPackage) where
  asymptoticEquipartitionClosed : S.asymptoticEquipartition
  smbDefinitionClosed : S.smbDefinition
  smbProofClosed : S.smbProof

def ShannonMcMillanBreimanClosed (S : ShannonMcMillanBreimanPackage) : Prop :=
  S.asymptoticEquipartition ∧ S.smbDefinition ∧ S.smbProof

theorem shannon_mcmillan_breiman_closed_from_evidence (S : ShannonMcMillanBreimanPackage)
    (E : ShannonMcMillanBreimanEvidence S) : ShannonMcMillanBreimanClosed S := by
  exact And.intro E.asymptoticEquipartitionClosed
    (And.intro E.smbDefinitionClosed E.smbProofClosed)

end CodingTheoremsShannonTheoryTheoremCanonicalLaneLean
end HautevilleHouse