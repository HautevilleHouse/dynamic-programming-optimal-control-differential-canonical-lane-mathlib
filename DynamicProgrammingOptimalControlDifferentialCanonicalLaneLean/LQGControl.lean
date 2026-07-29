import DynamicProgrammingOptimalControlDifferentialCanonicalLaneLean.DynamicProgrammingAdmissibleClass

namespace HautevilleHouse
namespace DynamicProgrammingOptimalControlDifferentialCanonicalLaneLean

structure LQGControlPackage where
  linearDynamics : Prop
  quadraticCost : Prop
  riccatiEquation : Prop
  optimalFeedback : Prop
  lqgSeparationPrinciple : Prop

structure LQGControlEvidence (L : LQGControlPackage) where
  linearDynamicsClosed : L.linearDynamics
  quadraticCostClosed : L.quadraticCost
  riccatiEquationClosed : L.riccatiEquation
  optimalFeedbackClosed : L.optimalFeedback
  lqgSeparationPrincipleClosed : L.lqgSeparationPrinciple

def LQGControlClosed (L : LQGControlPackage) : Prop :=
  L.linearDynamics ∧ L.quadraticCost ∧ L.riccatiEquation ∧ L.optimalFeedback ∧ L.lqgSeparationPrinciple

theorem lqg_control_closed_from_evidence (L : LQGControlPackage)
    (E : LQGControlEvidence L) : LQGControlClosed L := by
  exact And.intro E.linearDynamicsClosed
    (And.intro E.quadraticCostClosed
      (And.intro E.riccatiEquationClosed
        (And.intro E.optimalFeedbackClosed E.lqgSeparationPrincipleClosed)))

end DynamicProgrammingOptimalControlDifferentialCanonicalLaneLean
end HautevilleHouse
