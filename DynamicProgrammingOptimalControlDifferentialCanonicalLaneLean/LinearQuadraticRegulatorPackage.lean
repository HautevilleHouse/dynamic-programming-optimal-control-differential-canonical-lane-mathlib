import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.DynamicProgrammingOptimalControlDifferentialCanonicalLaneLean.OptimalControlSystemPackage

namespace HautevilleHouse
namespace DynamicProgrammingOptimalControlDifferentialCanonicalLaneLean

structure LinearQuadraticRegulatorPackage {O : OptimalControlSystemPackage} where
  linearDynamics : O.dynamics = λ t x u => A t * x + B t * u
  quadraticCost : O.runningCost = λ t x u => x^T * Q t * x + u^T * R t * u
  Q_positiveSemidefinite : ∀ t, Q t ≥ 0
  R_positiveDefinite : ∀ t, R t > 0
  A : O.timeDomain → LinearMap O.stateSpace O.stateSpace
  B : O.timeDomain → LinearMap O.controlSpace O.stateSpace
  Q : O.timeDomain → QuadraticForm O.stateSpace ℝ
  R : O.timeDomain → QuadraticForm O.controlSpace ℝ
  linearDynamicsHolds : Prop
  quadraticCostHolds : Prop
  QPSD : Prop
  RPD : Prop

structure LinearQuadraticRegulatorEvidence {O : OptimalControlSystemPackage}
    (L : LinearQuadraticRegulatorPackage O) where
  linearDynamicsHoldsClosed : L.linearDynamicsHolds
  quadraticCostHoldsClosed : L.quadraticCostHolds
  QPSDClosed : L.QPSD
  RPDClosed : L.RPD

def LinearQuadraticRegulatorClosed {O : OptimalControlSystemPackage}
    (L : LinearQuadraticRegulatorPackage O) : Prop :=
  L.linearDynamicsHolds ∧ L.quadraticCostHolds ∧ L.QPSD ∧ L.RPD

theorem linear_quadratic_regulator_closed_from_evidence
    {O : OptimalControlSystemPackage} (L : LinearQuadraticRegulatorPackage O)
    (E : LinearQuadraticRegulatorEvidence L) : LinearQuadraticRegulatorClosed L := by
  exact And.intro E.linearDynamicsHoldsClosed
    (And.intro E.quadraticCostHoldsClosed (And.intro E.QPSDClosed E.RPDClosed))

end DynamicProgrammingOptimalControlDifferentialCanonicalLaneLean
end HautevilleHouse
