import AbsoluteNeighborhoodRetractsTheoremCanonicalLaneLean.TheoremStatement

namespace HautevilleHouse
namespace AbsoluteNeighborhoodRetractsTheoremCanonicalLaneLean

structure ANRTheoremSpecificObject where
  sourceKey : String
  theoremObject : String
  claimBoundary : String
deriving Repr, DecidableEq

structure ANRMathlibSubstrate where
  carrier : Type
  topologicalSpaceCarrier : Prop
  neighborhoodRetractBridge : Prop
  absoluteRetractBoundary : Prop
  sourceBoundaryLedger : String

structure ANRAdmittedTheoremObject where
  object : ANRTheoremSpecificObject
  substrate : ANRMathlibSubstrate
  localWitness : String
  bridgeEvidence : String
  retractBridgeChecked : Prop
  retractBridgeWitness : retractBridgeChecked
  neighborhoodBridgeChecked : Prop
  neighborhoodBridgeWitness : neighborhoodBridgeChecked
  sourceBoundaryLedgerChecked : Prop
  sourceBoundaryLedgerWitness : sourceBoundaryLedgerChecked
  classicalRemainderCarried : formalizationCertificate.sourceConjectureClosureClaimed = false
  sourceKeyChecked : object.sourceKey = sourceRepository
  theoremObjectChecked : object.theoremObject = sourceDescription

def anrTheoremSpecificObject : ANRTheoremSpecificObject := {
  sourceKey := sourceRepository,
  theoremObject := sourceDescription,
  claimBoundary := sourceTheoremBoundary.claimBoundary
}

def ANRNativeBridgeClosed (O : ANRAdmittedTheoremObject) : Prop :=
  O.object.sourceKey = sourceRepository ∧
  O.object.theoremObject = sourceDescription ∧
  O.retractBridgeChecked ∧
  O.neighborhoodBridgeChecked ∧
  O.sourceBoundaryLedgerChecked ∧
  (formalizationCertificate.sourceConjectureClosureClaimed = false)

def ANRScopedClosure (O : ANRAdmittedTheoremObject) : Prop :=
  ANRNativeBridgeClosed O

structure AdmissibleClass where
  object : ANRAdmittedTheoremObject
  endpointSatisfied : Prop
  remainderRecorded : Prop
  gateWitness : endpointSatisfied ∨ remainderRecorded

def admittedClosure (A : AdmissibleClass) : Prop :=
  ANRNativeBridgeClosed A.object ∧ (A.endpointSatisfied ∨ A.remainderRecorded)

end AbsoluteNeighborhoodRetractsTheoremCanonicalLaneLean
end HautevilleHouse