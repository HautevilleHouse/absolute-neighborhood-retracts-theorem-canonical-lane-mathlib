universe u

namespace HautevilleHouse
namespace AbsoluteNeighborhoodRetractsTheoremCanonicalLaneLean

structure Projection (α : Type u) where
  toFun : α → α
  idempotent : ∀ x : α, toFun (toFun x) = toFun x

structure NeighborhoodRetraction (U : Type u) (A : Type u) where
  inclusion : A → U
  retraction : U → A
  left_inverse : ∀ a : A, retraction (inclusion a) = a

namespace NeighborhoodRetraction

def toProjection {U A : Type u} (nr : NeighborhoodRetraction U A) : Projection U := {
  toFun := fun u => nr.inclusion (nr.retraction u)
  idempotent := by
    intro u
    change nr.inclusion (nr.retraction (nr.inclusion (nr.retraction u))) = nr.inclusion (nr.retraction u)
    rw [nr.left_inverse (nr.retraction u)]
}

end NeighborhoodRetraction

structure ANR (A : Type u) : Type (u+1) where
  neighborhood_retraction : ∀ {X : Type u} (e : A → X), Function.Injective e →
    ∃ (U : Type u) (i : A → U) (r : U → A), NeighborhoodRetraction U A

theorem ANR.exists_projection {A X : Type u} (h : ANR A) (e : A → X) (hinj : Function.Injective e) :
    ∃ (U : Type u) (p : Projection U), True := by
  rcases h.neighborhood_retraction e hinj with ⟨U, i, r, nr⟩
  exact ⟨U, nr.toProjection, trivial⟩

def singletonANR : ANR PUnit.{u} := {
  neighborhood_retraction := by
    intro X e hinj
    exact ⟨X, e, fun _ => PUnit.unit, {
      inclusion := e
      retraction := fun _ => PUnit.unit
      left_inverse := by
        intro a
        cases a
        rfl
    }⟩
}

def unitNeighborhoodRetraction : NeighborhoodRetraction Bool PUnit.{u} := {
  inclusion := fun _ => true
  retraction := fun _ => PUnit.unit
  left_inverse := by
    intro a
    cases a
    rfl
}

def theoremProjection : Projection Bool :=
  unitNeighborhoodRetraction.toProjection

theorem theorem_projection_idempotent (x : Bool) :
    theoremProjection.toFun (theoremProjection.toFun x) = theoremProjection.toFun x := by
  exact theoremProjection.idempotent x

end AbsoluteNeighborhoodRetractsTheoremCanonicalLaneLean
end HautevilleHouse