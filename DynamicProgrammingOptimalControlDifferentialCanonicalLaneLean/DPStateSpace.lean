import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DynamicProgrammingOptimalControlDifferentialCanonicalLaneLean

structure DPStateSpace where
  stateType : Type u
  controlType : Type v
  stateTransition : stateType → controlType → stateType
  cost : stateType → controlType → ℝ
  initialSet : Set stateType
  targetSet : Set stateType

define DPStateSpaceClosed (S : DPStateSpace) : Prop :=
  S.stateTransition ≠ ∅ ∧ S.cost ≠ ∅ ∧ S.initialSet.Nonempty ∧ S.targetSet.Nonempty

theorem dp_state_space_closed_from_evidence (S : DPStateSpace) (h : DPStateSpaceClosed S) : DPStateSpaceClosed S := h

end DynamicProgrammingOptimalControlDifferentialCanonicalLaneLean
end HautevilleHouse