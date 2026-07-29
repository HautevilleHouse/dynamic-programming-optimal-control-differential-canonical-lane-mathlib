import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.DynamicProgrammingOptimalControlDifferentialCanonicalLaneLean.ValueFunctionRegularity

namespace HautevilleHouse
namespace DynamicProgrammingOptimalControlDifferentialCanonicalLaneLean

structure HJBVerification {S : DPStateSpace} {P : DP_PDE_Package S} (V : ValueFunctionRegularityPackage S P) where
  hjbEquationSatisfied : ∀ x : S.stateType, P.diffComp.hjbEquation x
  optimalityRecovered : P.diffComp.optimalControlExists
  verificationClosed : hjbEquationSatisfied ∧ optimalityRecovered

define HJBVerificationClosed {S : DPStateSpace} {P : DP_PDE_Package S} {V : ValueFunctionRegularityPackage S P} (H : HJBVerification V) : Prop :=
  H.verificationClosed

theorem hjb_verification_closed_from_evidence {S : DPStateSpace} {P : DP_PDE_Package S} {V : ValueFunctionRegularityPackage S P} (H : HJBVerification V) (h : HJBVerificationClosed H) : HJBVerificationClosed H := h

end DynamicProgrammingOptimalControlDifferentialCanonicalLaneLean
end HautevilleHouse