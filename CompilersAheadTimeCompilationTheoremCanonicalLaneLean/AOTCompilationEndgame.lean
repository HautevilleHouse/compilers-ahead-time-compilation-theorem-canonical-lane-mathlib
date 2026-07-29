import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.CompilersAheadTimeCompilationTheoremCanonicalLaneLean.IRCanonicalization
import HautevilleHouse.CompilersAheadTimeCompilationTheoremCanonicalLaneLean.TypeInference
import HautevilleHouse.CompilersAheadTimeCompilationTheoremCanonicalLaneLean.OptimizationPipeline
import HautevilleHouse.CompilersAheadTimeCompilationTheoremCanonicalLaneLean.CodeGeneration

namespace HautevilleHouse
namespace CompilersAheadTimeCompilationTheoremCanonicalLaneLean

structure AOTCompilationPackage where
  ir : IntermediateRepresentationPackage
  ti : TypeInferencePackage
  opt : OptimizationPipelinePackage
  cg : CodeGenerationPackage
  wholeCompilationCorrectness : Prop

structure AOTCompilationEvidence (A : AOTCompilationPackage) where
  irClosed : IntermediateRepresentationClosed A.ir
  tiClosed : TypeInferenceClosed A.ti
  optClosed : OptimizationPipelineClosed A.opt
  cgClosed : CodeGenerationClosed A.cg
  wholeCompilationCorrectnessClosed : A.wholeCompilationCorrectness

def AOTCompilationClosed (A : AOTCompilationPackage) : Prop :=
  IntermediateRepresentationClosed A.ir ∧ TypeInferenceClosed A.ti ∧
  OptimizationPipelineClosed A.opt ∧ CodeGenerationClosed A.cg ∧
  A.wholeCompilationCorrectness

theorem aot_compilation_closed_from_evidence
    (A : AOTCompilationPackage) (E : AOTCompilationEvidence A) :
    AOTCompilationClosed A := by
  exact And.intro E.irClosed
    (And.intro E.tiClosed
      (And.intro E.optClosed
        (And.intro E.cgClosed E.wholeCompilationCorrectnessClosed)))

end CompilersAheadTimeCompilationTheoremCanonicalLaneLean
end HautevilleHouse