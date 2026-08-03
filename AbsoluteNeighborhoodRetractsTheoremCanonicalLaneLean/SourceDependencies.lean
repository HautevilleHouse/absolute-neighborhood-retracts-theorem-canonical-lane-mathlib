import AbsoluteNeighborhoodRetractsTheoremCanonicalLaneLean.SourcePackage

/-!
# Source dependency model for `absolute-neighborhood-retracts-theorem-canonical-lane`

This module records the import and data-route surface used by the source
package/scripts before translation into Lean data.

It also encodes the admissible-class bridge statements for the key theorems
and structures in the absolute neighborhood retracts (ANR) theory.
-/

namespace HautevilleHouse
namespace AbsoluteNeighborhoodRetractsTheoremCanonicalLaneLean

universe u v

/-- A source import dependency as recorded from a Python file. -/
structure SourceImportDependency where
  file : String
  kind : String
  module : String
  name : String
  alias : String
  level : Nat
deriving Repr, DecidableEq

/-- A source path dependency as recorded from a manifest. -/
structure SourcePathDependency where
  file : String
  name : String
  path : String
  role : String
  line : Nat
deriving Repr, DecidableEq

/-- A dependency edge between mathematical theorems or definitions. -/
structure TheoremDependency where
  theorem : String
  dependsOn : List String
  role : String
  level : Nat
deriving Repr, DecidableEq

/-- A forward bridge: every space in class `P` is also in class `Q`. -/
structure ForwardBridge (P Q : Type u -> Prop) : Prop where
  forward : ∀ (X : Type u), P X -> Q X

/-- An equivalence bridge: classes `P` and `Q` coincide. -/
structure EquivalenceBridge (P Q : Type u -> Prop) : Prop where
  forward : ∀ (X : Type u), P X -> Q X
  backward : ∀ (X : Type u), Q X -> P X

/-- A very small model of a topological space (only open-set axioms). -/
structure TopologicalSpace (X : Type u) where
  IsOpen : (X -> Prop) -> Prop
  isOpen_univ : IsOpen (fun _ => True)
  isOpen_inter : ∀ {A B : X -> Prop}, IsOpen A -> IsOpen B -> IsOpen (fun x => A x ∧ B x)
  isOpen_union : ∀ (ι : Type v) (A : ι -> X -> Prop), (∀ i, IsOpen (A i)) -> IsOpen (fun x => ∃ i, A i x)

-- The admissible classes of spaces used in the ANR theory.
axiom CompactMetricSpace (X : Type u) : Prop
axiom FiniteDimensional (X : Type u) : Prop
axiom ANR (X : Type u) : Prop
axiom AR (X : Type u) : Prop
axiom LocallyContractible (X : Type u) : Prop
axiom NeighborhoodRetract (X : Type u) : Prop

-- Key bridge statements in absolute neighborhood retract theory.
/-- Borsuk's theorem: every finite-dimensional compact metric space is an ANR. -/
axiom finite_dimensional_compact_metric_anr :
  ForwardBridge (fun X : Type u => CompactMetricSpace X ∧ FiniteDimensional X) ANR

/-- Every absolute retract is an absolute neighborhood retract. -/
axiom ar_is_anr : ForwardBridge AR ANR

/-- Every absolute neighborhood retract is locally contractible. -/
axiom anr_is_locally_contractible : ForwardBridge ANR LocallyContractible

/-- A space is an ANR iff it is a neighborhood retract of every metric space containing it as a closed subset. -/
axiom anr_characterization : EquivalenceBridge ANR NeighborhoodRetract

-- Concrete source dependency data for the ANR package.

def sourceImportDependencies : List SourceImportDependency := [
  { file := "scripts/extract_anr_constants.py", kind := "from_import", module := "__future__", name := "annotations", alias := "", level := 0 },
  { file := "scripts/extract_anr_constants.py", kind := "import", module := "json", name := "", alias := "", level := 0 },
  { file := "scripts/extract_anr_constants.py", kind := "import", module := "math", name := "", alias := "", level := 0 },
  { file := "scripts/check_anr_manifest.py", kind := "from_import", module := "pathlib", name := "Path", alias := "", level := 0 },
  { file := "scripts/check_anr_manifest.py", kind := "import", module := "hashlib", name := "", alias := "", level := 0 },
  { file := "scripts/promote_anr_bridges.py", kind := "from_import", module := "dataclasses", name := "dataclass", alias := "", level := 0 },
  { file := "scripts/promote_anr_bridges.py", kind := "from_import", module := "typing", name := "Optional", alias := "", level := 0 }
]

def sourcePathDependencies : List SourcePathDependency := [
  { file := "scripts/extract_anr_constants.py", name := "ANR_THEOREM_NAMES", path := "anr/constants.py", role := "import", line := 12 },
  { file := "scripts/extract_anr_constants.py", name := "BRIDGE_STATEMENTS", path := "anr/bridges.py", role := "import", line := 27 },
  { file := "scripts/check_anr_manifest.py", name := "ANR_MANIFEST", path := "anr/manifest.json", role := "read", line := 5 },
  { file := "scripts/promote_anr_bridges.py", name := "BRIDGE_REGISTRY", path := "anr/registry.py", role := "write", line := 41 }
]

def theoremDependencies : List TheoremDependency := [
  { theorem := "AbsoluteNeighborhoodRetractTheorem", dependsOn := ["NeighborhoodRetractDefinition", "TietzeExtensionTheorem", "FiniteDimensionalCompactMetricANR"], role := "main", level := 0 },
  { theorem := "FiniteDimensionalCompactMetricANR", dependsOn := ["CompactMetricDefinition", "FiniteDimensionalDefinition"], role := "bridge", level := 1 },
  { theorem := "ANRCharacterization", dependsOn := ["NeighborhoodRetractDefinition", "LocallyContractibleDefinition"], role := "equivalence", level := 1 },
  { theorem := "AR_ANR", dependsOn := ["AR_Definition", "ANR_Definition"], role := "inclusion", level := 2 }
]

end AbsoluteNeighborhoodRetractsTheoremCanonicalLaneLean
end HautevilleHouse