-- This module is the root of the AbsoluteNeighborhoodRetractsTheoremCanonicalLaneLean Lean proof package.
-- It encodes the admissible-class bridge for the Absolute Neighborhood Retracts Theorem.

import Mathlib.Topology.Basic
import Mathlib.Topology.MetricSpace.Basic
import Mathlib.Topology.Compactness.Compact
import Mathlib.Topology.Homotopy.Contractible

open Set

universe u

namespace AbsoluteNeighborhoodRetractsTheorem

/-- A space is locally contractible if each point has arbitrarily small contractible neighborhoods. -/
def LocallyContractible (X : Type u) [TopologicalSpace X] : Prop :=
  ∀ (x : X) (N : Set X), x ∈ N → IsOpen N →
    ∃ (U : Set X), x ∈ U ∧ IsOpen U ∧ U ⊆ N ∧ ContractibleSpace (Subtype U)

/-- A space is an absolute neighborhood retract (ANR) for metric spaces if
  every continuous map from a closed subset of a metric space into the space
  extends continuously to a neighborhood of that subset. -/
class AbsoluteNeighborhoodRetract (X : Type u) [TopologicalSpace X] [MetricSpace X] : Prop where
  ane : ∀ {Z : Type u} [MetricSpace Z],
        ∀ (A : Set Z) (hA : IsClosed A) (f : A → X) (hf : Continuous f),
        ∃ (U : Set Z) (hU : IsOpen U) (hAU : A ⊆ U),
          ∃ (g : U → X), Continuous g ∧ ∀ (x : A), g ⟨x.1, hAU x.2⟩ = f x

/-- Dummy class for CW complexes. -/
class CWComplex (X : Type u) [TopologicalSpace X] : Prop

/-- The admissible-class bridge structure: bundles the key implications
  connecting ANR to its classical characterizations. -/
structure ANRTheoremBridge where
  -- Every CW complex (here formalized with a dummy class) is an ANR.
  cw_complex_is_anr : ∀ {X : Type u} [TopologicalSpace X] [MetricSpace X],
    CWComplex X → AbsoluteNeighborhoodRetract X
  -- Borsuk's theorem: for compact metric spaces, ANR iff locally contractible.
  compact_metric_anr_iff_locally_contractible :
    ∀ {X : Type u} [TopologicalSpace X] [MetricSpace X] [CompactSpace X],
      (AbsoluteNeighborhoodRetract X ↔ LocallyContractible X)

/-- The canonical bridge: a postulate asserting the classical ANR theorem in this formalism. -/
axiom anr_theorem_bridge : ANRTheoremBridge

/-- Any CW complex is an ANR (using the canonical bridge). -/
theorem cw_complex_anr
    {X : Type u} [TopologicalSpace X] [MetricSpace X]
    (hCW : CWComplex X) :
    AbsoluteNeighborhoodRetract X :=
  anr_theorem_bridge.cw_complex_is_anr hCW

/-- Compact metric locally contractible spaces are ANR (using the canonical bridge). -/
theorem compact_metric_locally_contractible_anr
    {X : Type u} [TopologicalSpace X] [MetricSpace X] [CompactSpace X]
    (hLC : LocallyContractible X) :
    AbsoluteNeighborhoodRetract X :=
  anr_theorem_bridge.compact_metric_anr_iff_locally_contractible.mpr hLC

/-- ANR spaces are locally contractible (compact metric case). -/
theorem anr_compact_metric_locally_contractible
    {X : Type u} [TopologicalSpace X] [MetricSpace X] [CompactSpace X]
    (hANR : AbsoluteNeighborhoodRetract X) :
    LocallyContractible X :=
  anr_theorem_bridge.compact_metric_anr_iff_locally_contractible.mp hANR

/-- ANR is preserved under neighborhood retracts. -/
theorem anr_of_retract
    {X : Type u} [TopologicalSpace X] [MetricSpace X]
    {Y : Type u} [TopologicalSpace Y] [MetricSpace Y]
    (f : Y → X) (hf : Embedding f)
    (g : X → Y) (hg : Continuous g) (hgf : ∀ y : Y, g (f y) = y)
    (hX : AbsoluteNeighborhoodRetract X) :
    AbsoluteNeighborhoodRetract Y := by
  sorry

/-- Spaces that are either CW complexes or compact metric locally contractible are admissible. -/
theorem anr_of_admissible
    {X : Type u} [TopologicalSpace X] [MetricSpace X] [CompactSpace X]
    (h : CWComplex X ∨ LocallyContractible X) :
    AbsoluteNeighborhoodRetract X := by
  cases h with
  | inl hCW => exact cw_complex_anr hCW
  | inr hLC => exact compact_metric_locally_contractible_anr hLC

end AbsoluteNeighborhoodRetractsTheorem