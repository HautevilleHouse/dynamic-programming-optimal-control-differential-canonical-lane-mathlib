import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DynamicProgrammingOptimalControlDifferentialCanonicalLaneLean

structure OptimalControlSystemPackage where
  timeDomain : Type u
  stateSpace : Type v
  controlSpace : Type w
  dynamics : timeDomain → stateSpace → controlSpace → stateSpace
  runningCost : timeDomain → stateSpace → controlSpace → ℝ
  terminalCost : stateSpace → ℝ
  dynamicsSmooth : Prop
  runningCostSmooth : Prop
  terminalCostSmooth : Prop

structure OptimalControlSystemEvidence (O : OptimalControlSystemPackage) where
  dynamicsSmoothClosed : O.dynamicsSmooth
  runningCostSmoothClosed : O.runningCostSmooth
  terminalCostSmoothClosed : O.terminalCostSmooth

def OptimalControlSystemClosed (O : OptimalControlSystemPackage) : Prop :=
  O.dynamicsSmooth ∧ O.runningCostSmooth ∧ O.terminalCostSmooth

theorem optimal_control_system_closed_from_evidence
    (O : OptimalControlSystemPackage)
    (E : OptimalControlSystemEvidence O) : OptimalControlSystemClosed O := by
  exact And.intro E.dynamicsSmoothClosed
    (And.intro E.runningCostSmoothClosed E.terminalCostSmoothClosed)

end DynamicProgrammingOptimalControlDifferentialCanonicalLaneLean
end HautevilleHouse
