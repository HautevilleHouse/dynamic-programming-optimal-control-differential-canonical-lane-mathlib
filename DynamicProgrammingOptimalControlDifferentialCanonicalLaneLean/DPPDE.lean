import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.DynamicProgrammingOptimalControlDifferentialCanonicalLaneLean.DPStateSpace

namespace HautevilleHouse
namespace DynamicProgrammingOptimalControlDifferentialCanonicalLaneLean

structure DifferentialComponent {S : DPStateSpace} where
  valueFunction : S.stateType → ℝ
  hjbEquation : S.stateType → Prop
  viscositySolution : Prop
  optimalControlExists : Prop

structure DP_PDE_Package {S : DPStateSpace} where
  diffComp : DifferentialComponent S
  diffCompClosed : diffComp.viscositySolution ∧ diffComp.optimalControlExists

define DP_PDE_Closed {S : DPStateSpace} (P : DP_PDE_Package S) : Prop :=
  P.diffCompClosed

theorem dp_pde_closed_from_evidence {S : DPStateSpace} (P : DP_PDE_Package S) (h : DP_PDE_Closed P) : DP_PDE_Closed P := h

end DynamicProgrammingOptimalControlDifferentialCanonicalLaneLean
end HautevilleHouse