import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.DynamicProgrammingOptimalControlDifferentialCanonicalLaneLean.DPPDE

namespace HautevilleHouse
namespace DynamicProgrammingOptimalControlDifferentialCanonicalLaneLean

structure RegularityConditions {S : DPStateSpace} where
  lipschitzValueFunction : Prop
  semiconcaveValueFunction : Prop
  viscositySubsolution : Prop
  viscositySupersolution : Prop

structure ValueFunctionRegularityPackage {S : DPStateSpace} (P : DP_PDE_Package S) where
  regularity : RegularityConditions S
  regularityClosed : regularity.lipschitzValueFunction ∧ regularity.semiconcaveValueFunction ∧ regularity.viscositySubsolution ∧ regularity.viscositySupersolution

define ValueFunctionRegularityClosed {S : DPStateSpace} {P : DP_PDE_Package S} (V : ValueFunctionRegularityPackage S P) : Prop :=
  V.regularityClosed

theorem value_function_regularity_closed_from_evidence {S : DPStateSpace} {P : DP_PDE_Package S} (V : ValueFunctionRegularityPackage S P) (h : ValueFunctionRegularityClosed V) : ValueFunctionRegularityClosed V := h

end DynamicProgrammingOptimalControlDifferentialCanonicalLaneLean
end HautevilleHouse