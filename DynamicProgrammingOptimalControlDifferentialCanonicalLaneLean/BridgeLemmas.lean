import DynamicProgrammingOptimalControlDifferentialCanonicalLaneLean.DynamicProgrammingAdmissibleClass

namespace HautevilleHouse
namespace DynamicProgrammingOptimalControlDifferentialCanonicalLaneLean

def bridgeClosed (A : AdmissibleClass) : Prop :=
  DPOptimalControlWitnessClosed A.object

theorem bridge_from_admissible_class (A : AdmissibleClass) :
    bridgeClosed A := by
  exact A.object.conclusion

end DynamicProgrammingOptimalControlDifferentialCanonicalLaneLean
end HautevilleHouse
