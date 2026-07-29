import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DynamicProgrammingOptimalControlDifferentialCanonicalLaneLean

structure DPOptimalControlAdmissibleObject where
  stateSpace : Type
  controlSpace : Type
  costFunctional : Type
  stateEquation : Prop
  hjbEquation : Prop
  optimalPolicy : Prop
  conclusion : optimalPolicy

structure AdmissibleClass where
  object : DPOptimalControlAdmissibleObject
  endpointSatisfied : Prop
  remainderRecorded : Prop
  gateWitness : endpointSatisfied ∨ remainderRecorded

def admittedClosure (A : AdmissibleClass) : Prop :=
  DPOptimalControlWitnessClosed A.object ∧ (A.endpointSatisfied ∨ A.remainderRecorded)

end DynamicProgrammingOptimalControlDifferentialCanonicalLaneLean
end HautevilleHouse
