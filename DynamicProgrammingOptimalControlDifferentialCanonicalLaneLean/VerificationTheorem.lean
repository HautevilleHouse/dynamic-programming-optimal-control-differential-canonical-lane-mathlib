import DynamicProgrammingOptimalControlDifferentialCanonicalLaneLean.AdmissibleClass

namespace HautevilleHouse
namespace DynamicProgrammingOptimalControlDifferentialCanonicalLaneLean

structure VerificationTheoremPackage (M : DifferentialAdmittedObject) where
  candidateValueFunction : Type u
  verifiedSatisfiesHJB : Prop
  verificationInequality : Prop
  optimalControlConstructed : Prop

structure VerificationTheoremEvidence {M : DifferentialAdmittedObject} (V : VerificationTheoremPackage M) where
  verifiedSatisfiesHJBClosed : V.verifiedSatisfiesHJB
  verificationInequalityClosed : V.verificationInequality
  optimalControlConstructedClosed : V.optimalControlConstructed

def VerificationTheoremClosed {M : DifferentialAdmittedObject} (V : VerificationTheoremPackage M) : Prop :=
  V.verifiedSatisfiesHJB ∧ V.verificationInequality ∧ V.optimalControlConstructed

theorem verification_theorem_closed_from_evidence {M : DifferentialAdmittedObject} (V : VerificationTheoremPackage M) (E : VerificationTheoremEvidence V) :
    VerificationTheoremClosed V := by
  exact And.intro E.verifiedSatisfiesHJBClosed
    (And.intro E.verificationInequalityClosed E.optimalControlConstructedClosed)

end DynamicProgrammingOptimalControlDifferentialCanonicalLaneLean
end HautevilleHouse