import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CompilersAheadTimeCompilationTheoremCanonicalLaneLean

open HautevilleHouse.CanonicalLaneMathlibCore

structure CompilerProgram where
  carrier : Type
  semantics : carrier → Prop

structure CompilerAdmittedObject where
  program : CompilerProgram
  verifiedAOTCompilation : Prop
  targetExecutable : Type
  targetSemantics : targetExecutable → Prop
  correctness : Prop
  conclusion : correctness

structure CompilerEndgameState where
  object : CompilerAdmittedObject

def CompilerWitnessClosed (O : CompilerAdmittedObject) : Prop :=
  O.correctness

end CompilersAheadTimeCompilationTheoremCanonicalLaneLean
end HautevilleHouse