import canonicalLaneMathlib.AdmissibleClass
import CompilersAheadTimeCompilationTheoremCanonicalLaneLean.IntermediateRepresentation

namespace HautevilleHouse
namespace CompilersAheadTimeCompilationTheoremCanonicalLaneLean

structure MemoryPackage (I : IRPackage) where
  memoryModel : Type u
  aliasAnalysis : Prop
  escapeAnalysis : Prop
  aotMemoryOptimization : Prop

structure MemoryEvidence {I : IRPackage} (M : MemoryPackage I) where
  aliasAnalysisClosed : M.aliasAnalysis
  escapeAnalysisClosed : M.escapeAnalysis
  aotMemoryOptimizationClosed : M.aotMemoryOptimization

def MemoryClosed {I : IRPackage} (M : MemoryPackage I) : Prop :=
  M.aliasAnalysis ∧ M.escapeAnalysis ∧ M.aotMemoryOptimization

theorem memory_closed_from_evidence
    {I : IRPackage} (M : MemoryPackage I) (E : MemoryEvidence M) : MemoryClosed M := by
  exact And.intro E.aliasAnalysisClosed
    (And.intro E.escapeAnalysisClosed E.aotMemoryOptimizationClosed)

end CompilersAheadTimeCompilationTheoremCanonicalLaneLean
end HautevilleHouse