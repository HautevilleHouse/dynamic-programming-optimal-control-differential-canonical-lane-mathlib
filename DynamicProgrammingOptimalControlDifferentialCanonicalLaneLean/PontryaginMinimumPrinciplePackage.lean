import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.DynamicProgrammingOptimalControlDifferentialCanonicalLaneLean.OptimalControlSystemPackage

namespace HautevilleHouse
namespace DynamicProgrammingOptimalControlDifferentialCanonicalLaneLean

structure PontryaginMinimumPrinciplePackage {O : OptimalControlSystemPackage} where
  adjointState : O.timeDomain → O.stateSpace → ℝ
  hamiltonian : O.timeDomain → O.stateSpace → O.controlSpace → ℝ
  adjointEquation : (t : O.timeDomain) → (x : O.stateSpace) →
    ∂/∂t (adjointState t x) = - ∇_x (hamiltonian t x (optimalControl t x))
  optimalityCondition : (t : O.timeDomain) → (x : O.stateSpace) →
    argmin_{u : O.controlSpace} (hamiltonian t x u) = optimalControl t x
  adjointSmooth : Prop
  adjointEquationHolds : Prop
  optimalityConditionHolds : Prop
  optimalControl : O.timeDomain → O.stateSpace → O.controlSpace

structure PontryaginMinimumPrincipleEvidence {O : OptimalControlSystemPackage}
    (P : PontryaginMinimumPrinciplePackage O) where
  adjointSmoothClosed : P.adjointSmooth
  adjointEquationHoldsClosed : P.adjointEquationHolds
  optimalityConditionHoldsClosed : P.optimalityConditionHolds

def PontryaginMinimumPrincipleClosed {O : OptimalControlSystemPackage}
    (P : PontryaginMinimumPrinciplePackage O) : Prop :=
  P.adjointSmooth ∧ P.adjointEquationHolds ∧ P.optimalityConditionHolds

theorem pontryagin_minimum_principle_closed_from_evidence
    {O : OptimalControlSystemPackage} (P : PontryaginMinimumPrinciplePackage O)
    (E : PontryaginMinimumPrincipleEvidence P) : PontryaginMinimumPrincipleClosed P := by
  exact And.intro E.adjointSmoothClosed
    (And.intro E.adjointEquationHoldsClosed E.optimalityConditionHoldsClosed)

end DynamicProgrammingOptimalControlDifferentialCanonicalLaneLean
end HautevilleHouse
