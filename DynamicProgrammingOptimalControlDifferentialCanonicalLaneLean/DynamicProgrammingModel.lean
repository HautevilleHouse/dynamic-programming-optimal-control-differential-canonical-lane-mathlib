import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DynamicProgrammingOptimalControlDifferentialCanonicalLaneLean

structure DynamicControlModel where
  stateSpace : Type u
  actionSpace : Type v
  timeHorizon : Type w
  dynamics : stateSpace → actionSpace → stateSpace
  runningCost : stateSpace → actionSpace → ℝ
  terminalCost : stateSpace → ℝ
  initialCondition : stateSpace
  modelSmooth : Prop
  dynamicsSmooth : Prop
  costSmooth : Prop

structure DynamicControlModelEvidence (M : DynamicControlModel) where
  modelSmoothClosed : M.modelSmooth
  dynamicsSmoothClosed : M.dynamicsSmooth
  costSmoothClosed : M.costSmooth

def DynamicControlModelClosed (M : DynamicControlModel) : Prop :=
  M.modelSmooth ∧ M.dynamicsSmooth ∧ M.costSmooth

theorem dynamic_control_model_closed_from_evidence
    (M : DynamicControlModel) (E : DynamicControlModelEvidence M) :
    DynamicControlModelClosed M := by
  exact And.intro E.modelSmoothClosed
    (And.intro E.dynamicsSmoothClosed E.costSmoothClosed)

end DynamicProgrammingOptimalControlDifferentialCanonicalLaneLean
end HautevilleHouse