import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DynamicProgrammingOptimalControlDifferentialCanonicalLaneLean

structure PMPPackage where
  stateSpace : Type u
  controlSpace : Type v
  costFunctional : Type w
  adjointVariable : Type x
  hamiltonian : Type y
  necessaryConditions : Prop
  transversality : Prop

structure PMPEvidence (P : PMPPackage) where
  necessaryConditionsClosed : P.necessaryConditions
  transversalityClosed : P.transversality

def PMPClosed (P : PMPPackage) : Prop :=
  P.necessaryConditions ∧ P.transversality

theorem pmp_closed_from_evidence (P : PMPPackage)
    (E : PMPEvidence P) : PMPClosed P := by
  exact And.intro E.necessaryConditionsClosed E.transversalityClosed

def gateClosed (A : AdmissibleClass) : Prop :=
  A.endpointSatisfied ∨ A.remainderRecorded

theorem gate_from_admissible_class (A : AdmissibleClass) : gateClosed A := by
  exact A.gateWitness

end DynamicProgrammingOptimalControlDifferentialCanonicalLaneLean
end HautevilleHouse