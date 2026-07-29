import DynamicProgrammingOptimalControlDifferentialCanonicalLaneLean.AdmissibleClass

namespace HautevilleHouse
namespace DynamicProgrammingOptimalControlDifferentialCanonicalLaneLean

structure PontryaginPrinciplePackage (M : DifferentialAdmittedObject) where
  stateSpace : Type u
  adjointEquation : Prop
  optimalityCondition : Prop
  transversalityCondition : Prop
  hamiltonianMinimization : Prop

structure PontryaginPrincipleEvidence {M : DifferentialAdmittedObject} (P : PontryaginPrinciplePackage M) where
  adjointEquationClosed : P.adjointEquation
  optimalityConditionClosed : P.optimalityCondition
  transversalityConditionClosed : P.transversalityCondition
  hamiltonianMinimizationClosed : P.hamiltonianMinimization

def PontryaginPrincipleClosed {M : DifferentialAdmittedObject} (P : PontryaginPrinciplePackage M) : Prop :=
  P.adjointEquation ∧ P.optimalityCondition ∧ P.transversalityCondition ∧ P.hamiltonianMinimization

theorem pontryagin_principle_closed_from_evidence {M : DifferentialAdmittedObject} (P : PontryaginPrinciplePackage M) (E : PontryaginPrincipleEvidence P) :
    PontryaginPrincipleClosed P := by
  exact And.intro E.adjointEquationClosed
    (And.intro E.optimalityConditionClosed
      (And.intro E.transversalityConditionClosed E.hamiltonianMinimizationClosed))

end DynamicProgrammingOptimalControlDifferentialCanonicalLaneLean
end HautevilleHouse