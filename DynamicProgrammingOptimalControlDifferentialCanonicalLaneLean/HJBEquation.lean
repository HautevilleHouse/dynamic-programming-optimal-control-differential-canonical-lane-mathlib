import DynamicProgrammingOptimalControlDifferentialCanonicalLaneLean.AdmissibleClass

namespace HautevilleHouse
namespace DynamicProgrammingOptimalControlDifferentialCanonicalLaneLean

structure HJBEquationPackage (M : DifferentialAdmittedObject) where
  controlSet : Type u
  hamiltonianDefined : Prop
  valueFunctionSatisfiesHJB : Prop
  boundaryConditionMet : Prop
  uniqueness: Prop

structure HJBEquationEvidence {M : DifferentialAdmittedObject} (H : HJBEquationPackage M) where
  hamiltonianDefinedClosed : H.hamiltonianDefined
  valueFunctionSatisfiesHJBClosed : H.valueFunctionSatisfiesHJB
  boundaryConditionMetClosed : H.boundaryConditionMet
  uniquenessClosed : H.uniqueness

def HJBEquationClosed {M : DifferentialAdmittedObject} (H : HJBEquationPackage M) : Prop :=
  H.hamiltonianDefined ∧ H.valueFunctionSatisfiesHJB ∧ H.boundaryConditionMet ∧ H.uniqueness

theorem hjb_equation_closed_from_evidence {M : DifferentialAdmittedObject} (H : HJBEquationPackage M) (E : HJBEquationEvidence H) :
    HJBEquationClosed H := by
  exact And.intro E.hamiltonianDefinedClosed
    (And.intro E.valueFunctionSatisfiesHJBClosed
      (And.intro E.boundaryConditionMetClosed E.uniquenessClosed))

end DynamicProgrammingOptimalControlDifferentialCanonicalLaneLean
end HautevilleHouse