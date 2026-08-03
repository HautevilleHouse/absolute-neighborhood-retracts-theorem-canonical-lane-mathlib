import AbsoluteNeighborhoodRetractsTheoremCanonicalLaneLean.TheoremStatement
import CanonicalLaneMathlibCore
import Mathlib.Data.Set.Basic
import Mathlib.Topology.Basic

namespace HautevilleHouse
namespace AbsoluteNeighborhoodRetractsTheoremCanonicalLaneLean

open HautevilleHouse.CanonicalLaneMathlibCore

universe u v w

structure ANRTopologicalSpace where
  carrier : Type u
  instTop : TopologicalSpace carrier

structure UpstreamANRSubstrate where
  space : ANRTopologicalSpace
  anrGate : Prop
  retractionBridge : Prop
  sourceBoundaryLedger : Set String

structure TheoremSpecificObject where
  sourceKey : String
  theoremObject : String
  claimBoundary : String
deriving Repr, DecidableEq

structure AdmittedTheoremObject where
  object : TheoremSpecificObject
  substrate : UpstreamANRSubstrate
  localWitness : String
  bridgeEvidence : String
  anrGateChecked : Prop
  anrGateWitness : anrGateChecked
  retractionBridgeChecked : Prop
  retractionBridgeWitness : retractionBridgeChecked
  sourceBoundaryLedgerChecked : Prop
  sourceBoundaryLedgerWitness : sourceBoundaryLedgerChecked
  classicalRemainderCarried : formalizationCertificate.sourceConjectureClosureClaimed = false
  sourceKeyChecked : object.sourceKey = sourceRepository
  theoremObjectChecked : object.theoremObject = sourceDescription

structure ClosureState where
  object : AdmittedTheoremObject
  endpointSatisfied : Prop
  remainderRecorded : Prop

def theoremSpecificObject : TheoremSpecificObject := {
  sourceKey := sourceRepository,
  theoremObject := sourceDescription,
  claimBoundary := sourceTheoremBoundary.claimBoundary
}

def NativeBridgeClosed (O : AdmittedTheoremObject) : Prop :=
  O.object.sourceKey = sourceRepository ∧
  O.object.theoremObject = sourceDescription ∧
  O.anrGateChecked ∧
  O.retractionBridgeChecked ∧
  O.sourceBoundaryLedgerChecked ∧
  (formalizationCertificate.sourceConjectureClosureClaimed = false)

def ScopedClosure (O : AdmittedTheoremObject) : Prop :=
  NativeBridgeClosed O

end AbsoluteNeighborhoodRetractsTheoremCanonicalLaneLean
end HautevilleHouse