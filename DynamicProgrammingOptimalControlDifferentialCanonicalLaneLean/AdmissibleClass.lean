import DynamicProgrammingOptimalControlDifferentialCanonicalLaneLean.MathlibObjects

namespace HautevilleHouse
namespace DynamicProgrammingOptimalControlDifferentialCanonicalLaneLean

structure AdmissibleClass where
  object : DifferentialAdmittedObject
  endpointSatisfied : Prop
  remainderRecorded : Prop
  gateWitness : endpointSatisfied ∨ remainderRecorded

def admittedClosure (A : AdmissibleClass) : Prop :=
  DifferentialWitnessClosed A.object ∧ (A.endpointSatisfied ∨ A.remainderRecorded)

end DynamicProgrammingOptimalControlDifferentialCanonicalLaneLean
end HautevilleHouse