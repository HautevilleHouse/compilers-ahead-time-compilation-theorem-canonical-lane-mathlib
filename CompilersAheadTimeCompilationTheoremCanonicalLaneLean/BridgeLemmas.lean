import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.CompilersAheadTimeCompilationTheoremCanonicalLaneLean.AOTCompilationEndgame

namespace HautevilleHouse
namespace CompilersAheadTimeCompilationTheoremCanonicalLaneLean

def bridgeClosed (A : AdmissibleClass) : Prop :=
  let pkg : AOTCompilationPackage := A.object.space.carrier
  AOTCompilationClosed pkg

theorem bridge_from_admissible_class (A : AdmissibleClass) :
    bridgeClosed A := by
  exact A.object.conclusion

end CompilersAheadTimeCompilationTheoremCanonicalLaneLean
end HautevilleHouse