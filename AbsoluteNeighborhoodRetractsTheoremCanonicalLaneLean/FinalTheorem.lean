import AbsoluteNeighborhoodRetractsTheoremCanonicalLaneLean.GateLemmas

namespace HautevilleHouse
namespace AbsoluteNeighborhoodRetractsTheoremCanonicalLaneLean

def ConstrainedTheoremClosure (A : AdmissibleClass) : Prop :=
  bridgeClosed A ∧ gateClosed A ∧ ClassicalSourceBoundaryCarried

def NativeClosureTheorem (A : AdmissibleClass) : Prop :=
  ConstrainedTheoremClosure A

def ConditionalRouteClosure (A : AdmissibleClass) : Prop :=
  ConstrainedTheoremClosure A ∧ ClassicalSourceBoundaryCarried

theorem constrained_theorem_closure (A : AdmissibleClass) :
    ConstrainedTheoremClosure A := by
  exact And.intro (bridge_from_admissible_class A)
    (And.intro (gate_from_admissible_class A) classical_source_boundary_carried_checked)

theorem native_closure_theorem_checked (A : AdmissibleClass) :
    NativeClosureTheorem A := by
  exact constrained_theorem_closure A

theorem conditional_route_closure_checked (A : AdmissibleClass) :
    ConditionalRouteClosure A := by
  exact And.intro (constrained_theorem_closure A) classical_source_boundary_carried_checked

theorem conditional_route_source_boundary_carried (A : AdmissibleClass) :
    ConditionalRouteClosure A -> ClassicalSourceBoundaryCarried := by
  intro h
  exact h.2

def ANRBridgeCanonicalClosure : Prop :=
  ∀ A : AdmissibleClass, ConstrainedTheoremClosure A

theorem anr_bridge_canonical_closure_checked :
    ANRBridgeCanonicalClosure := by
  intro A
  exact constrained_theorem_closure A

end AbsoluteNeighborhoodRetractsTheoremCanonicalLaneLean
end HautevilleHouse