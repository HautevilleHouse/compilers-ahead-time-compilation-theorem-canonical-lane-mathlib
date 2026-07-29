import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CompilersAheadTimeCompilationTheoremCanonicalLaneLean

structure MemoryAliasing where
  aliasAnalysisResult : Type
  pointsToGraphConstructed : Prop
  aliasInformationSound : Prop
  memoryBehaviorValid : Prop

def MemoryAliasingClosed (M : MemoryAliasing) : Prop :=
  M.pointsToGraphConstructed ∧ M.aliasInformationSound ∧ M.memoryBehaviorValid

structure MemoryAliasingEvidence (M : MemoryAliasing) where
  pointsToGraphConstructedClosed : M.pointsToGraphConstructed
  aliasInformationSoundClosed : M.aliasInformationSound
  memoryBehaviorValidClosed : M.memoryBehaviorValid

theorem memory_aliasing_closed_from_evidence (M : MemoryAliasing) (E : MemoryAliasingEvidence M) :
  MemoryAliasingClosed M := by
  exact And.intro E.pointsToGraphConstructedClosed
    (And.intro E.aliasInformationSoundClosed E.memoryBehaviorValidClosed)

end CompilersAheadTimeCompilationTheoremCanonicalLaneLean
end HautevilleHouse