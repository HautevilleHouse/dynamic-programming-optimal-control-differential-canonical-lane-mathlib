import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.DynamicProgrammingOptimalControlDifferentialCanonicalLaneLean.DynamicProgrammingModel

namespace HautevilleHouse
namespace DynamicProgrammingOptimalControlDifferentialCanonicalLaneLean

structure OptimalFeedbackControlPackage {M : DynamicControlModel} where
  valueFunctionDefined : Prop
  optimalPolicyExists : Prop
  closedLoopStability : Prop
  robustnessMargin : Prop
  numericalApproximation : Prop

structure OptimalFeedbackControlEvidence {M : DynamicControlModel} (O : OptimalFeedbackControlPackage M) where
  valueFunctionDefinedClosed : O.valueFunctionDefined
  optimalPolicyExistsClosed : O.optimalPolicyExists
  closedLoopStabilityClosed : O.closedLoopStability
  robustnessMarginClosed : O.robustnessMargin
  numericalApproximationClosed : O.numericalApproximation

def OptimalFeedbackControlClosed {M : DynamicControlModel} (O : OptimalFeedbackControlPackage M) : Prop :=
  O.valueFunctionDefined ∧ O.optimalPolicyExists ∧ O.closedLoopStability ∧ O.robustnessMargin ∧ O.numericalApproximation

theorem optimal_feedback_control_closed_from_evidence
    {M : DynamicControlModel} (O : OptimalFeedbackControlPackage M) (E : OptimalFeedbackControlEvidence O) :
    OptimalFeedbackControlClosed O := by
  exact And.intro E.valueFunctionDefinedClosed
    (And.intro E.optimalPolicyExistsClosed
      (And.intro E.closedLoopStabilityClosed
        (And.intro E.robustnessMarginClosed E.numericalApproximationClosed)))

end DynamicProgrammingOptimalControlDifferentialCanonicalLaneLean
end HautevilleHouse