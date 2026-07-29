import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.DynamicProgrammingOptimalControlDifferentialCanonicalLaneLean.OptimalControlSystemPackage

namespace HautevilleHouse
namespace DynamicProgrammingOptimalControlDifferentialCanonicalLaneLean

structure HamiltonJacobiBellmanPackage {O : OptimalControlSystemPackage} where
  valueFunction : O.timeDomain → O.stateSpace → ℝ
  hjbEquation : (t : O.timeDomain) → (x : O.stateSpace) →
    ∂/∂t (valueFunction t x) + min_{u : O.controlSpace} (
      (∇_x (valueFunction t x)) • (O.dynamics t x u) + O.runningCost t x u
    ) = 0
  terminalCondition : (x : O.stateSpace) → valueFunction (O.timeDomain.last) x = O.terminalCost x
  valueSmooth : Prop
  hjbEquationHolds : Prop
  terminalConditionHolds : Prop

structure HamiltonJacobiBellmanEvidence {O : OptimalControlSystemPackage}
    (H : HamiltonJacobiBellmanPackage O) where
  valueSmoothClosed : H.valueSmooth
  hjbEquationHoldsClosed : H.hjbEquationHolds
  terminalConditionHoldsClosed : H.terminalConditionHolds

def HamiltonJacobiBellmanClosed {O : OptimalControlSystemPackage}
    (H : HamiltonJacobiBellmanPackage O) : Prop :=
  H.valueSmooth ∧ H.hjbEquationHolds ∧ H.terminalConditionHolds

theorem hamilton_jacobi_bellman_closed_from_evidence
    {O : OptimalControlSystemPackage} (H : HamiltonJacobiBellmanPackage O)
    (E : HamiltonJacobiBellmanEvidence H) : HamiltonJacobiBellmanClosed H := by
  exact And.intro E.valueSmoothClosed
    (And.intro E.hjbEquationHoldsClosed E.terminalConditionHoldsClosed)

end DynamicProgrammingOptimalControlDifferentialCanonicalLaneLean
end HautevilleHouse
