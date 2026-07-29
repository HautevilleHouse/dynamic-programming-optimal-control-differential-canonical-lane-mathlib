import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.DynamicProgrammingOptimalControlDifferentialCanonicalLaneLean.HamiltonJacobiBellmanPackage

namespace HautevilleHouse
namespace DynamicProgrammingOptimalControlDifferentialCanonicalLaneLean

structure DynamicProgrammingPrinciplePackage {O : OptimalControlSystemPackage}
    (H : HamiltonJacobiBellmanPackage O) where
  valueFunctionSatisfiesPrinciple : (t1 t2 : O.timeDomain) → (x : O.stateSpace) →
    H.valueFunction t1 x = min_{u : O.controlSpace} (
      ∫_{s=t1}^{t2} O.runningCost s (stateTrajectory s) (u s) ds +
      H.valueFunction t2 (stateTrajectory t2)
    )
  principleHolds : Prop

structure DynamicProgrammingPrincipleEvidence {O : OptimalControlSystemPackage}
    {H : HamiltonJacobiBellmanPackage O}
    (D : DynamicProgrammingPrinciplePackage O H) where
  principleHoldsClosed : D.principleHolds

def DynamicProgrammingPrincipleClosed {O : OptimalControlSystemPackage}
    {H : HamiltonJacobiBellmanPackage O}
    (D : DynamicProgrammingPrinciplePackage O H) : Prop :=
  D.principleHolds

theorem dynamic_programming_principle_closed_from_evidence
    {O : OptimalControlSystemPackage} {H : HamiltonJacobiBellmanPackage O}
    (D : DynamicProgrammingPrinciplePackage O H)
    (E : DynamicProgrammingPrincipleEvidence D) : DynamicProgrammingPrincipleClosed D := by
  exact E.principleHoldsClosed

end DynamicProgrammingOptimalControlDifferentialCanonicalLaneLean
end HautevilleHouse
