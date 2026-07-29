import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DynamicProgrammingOptimalControlDifferentialCanonicalLaneLean

structure HJBEquationPackage where
  valueFunction : Type u
  hamiltonian : Type v
  optimalControl : Type w
  hjbEquation : Prop
  viscositySolution : Prop
  uniqueness : Prop

structure HJBEquationEvidence (H : HJBEquationPackage) where
  hjbEquationClosed : H.hjbEquation
  viscositySolutionClosed : H.viscositySolution
  uniquenessClosed : H.uniqueness

def HJBEquationClosed (H : HJBEquationPackage) : Prop :=
  H.hjbEquation ∧ H.viscositySolution ∧ H.uniqueness

theorem hjb_equation_closed_from_evidence (H : HJBEquationPackage)
    (E : HJBEquationEvidence H) : HJBEquationClosed H := by
  exact And.intro E.hjbEquationClosed
    (And.intro E.viscositySolutionClosed E.uniquenessClosed)

def bridgeClosed (A : AdmissibleClass) : Prop :=
  HJBEquationClosed (A.object : HJBEquationPackage)

theorem bridge_from_admissible_class (A : AdmissibleClass) : bridgeClosed A := by
  -- Construct HJBEquationEvidence from A.object fields
  have hjb_cert : HJBEquationPackage := A.object
  have evidence : HJBEquationEvidence hjb_cert := A.endpointSatisfied
  exact hjb_equation_closed_from_evidence hjb_cert evidence

end DynamicProgrammingOptimalControlDifferentialCanonicalLaneLean
end HautevilleHouse