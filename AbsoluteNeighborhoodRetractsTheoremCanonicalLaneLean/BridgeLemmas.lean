import AbsoluteNeighborhoodRetractsTheoremCanonicalLaneLean.AdmissibleClass

namespace HautevilleHouse
namespace AbsoluteNeighborhoodRetractsTheoremCanonicalLaneLean

def bridgeClosed (A : AdmissibleClass) : Prop :=
  ANRScopedClosure A.object

theorem bridge_from_admissible_class (A : AdmissibleClass) :
    bridgeClosed A := by
  exact ⟨A.object.sourceKeyChecked,
    A.object.theoremObjectChecked,
    A.object.retractBridgeWitness,
    A.object.neighborhoodBridgeWitness,
    A.object.sourceBoundaryLedgerWitness,
    A.object.classicalRemainderCarried⟩

end AbsoluteNeighborhoodRetractsTheoremCanonicalLaneLean
end HautevilleHouse