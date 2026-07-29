import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.DynamicProgrammingOptimalControlDifferentialCanonicalLaneLean.DynamicProgrammingModel

namespace HautevilleHouse
namespace DynamicProgrammingOptimalControlDifferentialCanonicalLaneLean

structure InfiniteHorizonControlPackage {M : DynamicControlModel} where
  averageCostOptimality : Prop
  discountedCostOptimality : Prop
  stationaryPolicy : Prop
  ergodicProperties : Prop
  turnpikeProperty : Prop

structure InfiniteHorizonControlEvidence {M : DynamicControlModel} (I : InfiniteHorizonControlPackage M) where
  averageCostOptimalityClosed : I.averageCostOptimality
  discountedCostOptimalityClosed : I.discountedCostOptimality
  stationaryPolicyClosed : I.stationaryPolicy
  ergodicPropertiesClosed : I.ergodicProperties
  turnpikePropertyClosed : I.turnpikeProperty

def InfiniteHorizonControlClosed {M : DynamicControlModel} (I : InfiniteHorizonControlPackage M) : Prop :=
  I.averageCostOptimality ∧ I.discountedCostOptimality ∧ I.stationaryPolicy ∧ I.ergodicProperties ∧ I.turnpikeProperty

theorem infinite_horizon_control_closed_from_evidence
    {M : DynamicControlModel} (I : InfiniteHorizonControlPackage M) (E : InfiniteHorizonControlEvidence I) :
    InfiniteHorizonControlClosed I := by
  exact And.intro E.averageCostOptimalityClosed
    (And.intro E.discountedCostOptimalityClosed
      (And.intro E.stationaryPolicyClosed
        (And.intro E.ergodicPropertiesClosed E.turnpikePropertyClosed)))

end DynamicProgrammingOptimalControlDifferentialCanonicalLaneLean
end HautevilleHouse