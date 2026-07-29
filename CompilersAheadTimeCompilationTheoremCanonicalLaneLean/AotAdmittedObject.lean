import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CompilersAheadTimeCompilationTheoremCanonicalLaneLean

structure AotSpace where
  carrier : Type
  topology : TopologicalSpace carrier

structure AotAdmittedObject where
  space : AotSpace
  closedThreeManifold : Prop
  simplyConnected : Prop
  sphereModel : Type
  sphereTopology : TopologicalSpace sphereModel
  homeomorphicToSphere : Prop
  conclusion : homeomorphicToSphere

structure AotEndgameState where
  object : AotAdmittedObject

def AotWitnessClosed (O : AotAdmittedObject) : Prop :=
  O.homeomorphicToSphere

end CompilersAheadTimeCompilationTheoremCanonicalLaneLean
end HautevilleHouse