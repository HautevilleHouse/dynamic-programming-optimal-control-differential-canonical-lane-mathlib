import DynamicProgrammingOptimalControlDifferentialCanonicalLaneLean.TheoremStatement
import CanonicalLaneMathlibCore
import Mathlib.Topology.Basic

namespace HautevilleHouse
namespace DynamicProgrammingOptimalControlDifferentialCanonicalLaneLean

open HautevilleHouse.CanonicalLaneMathlibCore

structure DifferentialSpace where
  carrier : Type
  topology : TopologicalSpace carrier

structure DifferentialAdmittedObject where
  space : DifferentialSpace
  smoothDynamicSystem : Prop
  optimalControlExists : Prop
  valueFunctionModel : Type
  hjbEquation : TopologicalSpace valueFunctionModel
  viscositySolutionHolds : Prop
  conclusion : viscositySolutionHolds

structure DifferentialEndgameState where
  object : DifferentialAdmittedObject

def DifferentialWitnessClosed (O : DifferentialAdmittedObject) : Prop :=
  O.viscositySolutionHolds

end DynamicProgrammingOptimalControlDifferentialCanonicalLaneLean
end HautevilleHouse