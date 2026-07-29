import DynamicProgrammingOptimalControlDifferentialCanonicalLaneLean.DynamicProgrammingAdmissibleClass

namespace HautevilleHouse
namespace DynamicProgrammingOptimalControlDifferentialCanonicalLaneLean

structure BellmanEquationPackage where
  valueFunction : Type
  hjbOperator : Type
  terminalCost : Prop
  runningCost : Prop
  hjbEquationSatisfied : Prop
  verificationTheorem : Prop

structure BellmanEquationEvidence (B : BellmanEquationPackage) where
  terminalCostClosed : B.terminalCost
  runningCostClosed : B.runningCost
  hjbEquationSatisfiedClosed : B.hjbEquationSatisfied
  verificationTheoremClosed : B.verificationTheorem

def BellmanEquationClosed (B : BellmanEquationPackage) : Prop :=
  B.terminalCost ∧ B.runningCost ∧ B.hjbEquationSatisfied ∧ B.verificationTheorem

theorem bellman_equation_closed_from_evidence (B : BellmanEquationPackage)
    (E : BellmanEquationEvidence B) : BellmanEquationClosed B := by
  exact And.intro E.terminalCostClosed
    (And.intro E.runningCostClosed
      (And.intro E.hjbEquationSatisfiedClosed E.verificationTheoremClosed))

end DynamicProgrammingOptimalControlDifferentialCanonicalLaneLean
end HautevilleHouse
