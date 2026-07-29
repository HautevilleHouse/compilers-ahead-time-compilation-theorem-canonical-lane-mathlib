import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CompilersAheadTimeCompilationTheoremCanonicalLaneLean

structure AOTOptimizationPasses where
  constantFolding : Prop
  deadCodeElimination : Prop
  loopUnrolling : Prop
  inlining : Prop
  constantFoldingClosed : constantFolding
  deadCodeEliminationClosed : deadCodeElimination
  loopUnrollingClosed : loopUnrolling
  inliningClosed : inlining

structure AOTOptimizationPassesEvidence (O : AOTOptimizationPasses) where
  constantFoldingClosed : O.constantFolding
  deadCodeEliminationClosed : O.deadCodeElimination
  loopUnrollingClosed : O.loopUnrolling
  inliningClosed : O.inlining

def AOTOptimizationPassesClosed (O : AOTOptimizationPasses) : Prop :=
  O.constantFolding ∧ O.deadCodeElimination ∧ O.loopUnrolling ∧ O.inlining

theorem aot_optimization_passes_closed_from_evidence
    (O : AOTOptimizationPasses) (E : AOTOptimizationPassesEvidence O) :
    AOTOptimizationPassesClosed O := by
  exact And.intro E.constantFoldingClosed
    (And.intro E.deadCodeEliminationClosed (And.intro E.loopUnrollingClosed E.inliningClosed))

end CompilersAheadTimeCompilationTheoremCanonicalLaneLean
end HautevilleHouse