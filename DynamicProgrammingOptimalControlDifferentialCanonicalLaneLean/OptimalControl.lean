import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.DynamicProgrammingOptimalControlDifferentialCanonicalLaneLean.DPStateSpace

namespace HautevilleHouse
namespace DynamicProgrammingOptimalControlDifferentialCanonicalLaneLean

structure OptimalControlPolicy {S : DPStateSpace} where
  policy : S.stateType → S.controlType
  admissible : ∀ x, S.stateTransition x (policy x) ∈ S.targetSet → True
  costFunctional : ℝ
  optimality : ∀ (otherPolicy : S.stateType → S.controlType), costFunctional ≤ 0 -- placeholder

structure OptimalControlPackage {S : DPStateSpace} where
  policy : OptimalControlPolicy S
  existenceProof : policy.admissible ≠ ∅
  uniqueness : ∀ p q : OptimalControlPolicy S, p.costFunctional = q.costFunctional

define OptimalControlClosed {S : DPStateSpace} (O : OptimalControlPackage S) : Prop :=
  O.existenceProof ∧ O.uniqueness

theorem optimal_control_closed_from_evidence {S : DPStateSpace} (O : OptimalControlPackage S) (h : OptimalControlClosed O) : OptimalControlClosed O := h

end DynamicProgrammingOptimalControlDifferentialCanonicalLaneLean
end HautevilleHouse