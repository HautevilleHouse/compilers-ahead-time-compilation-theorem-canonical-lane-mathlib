import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CompilersAheadTimeCompilationTheoremCanonicalLaneLean

structure AheadTimeOptimizationPackage where
  deadCodeElimination : Prop
  constantFolding : Prop
  loopUnrolling : Prop
  inlining : Prop
  specialization : Prop

structure AheadTimeOptimizationEvidence (O : AheadTimeOptimizationPackage) where
  deadCodeEliminationClosed : O.deadCodeElimination
  constantFoldingClosed : O.constantFolding
  loopUnrollingClosed : O.loopUnrolling
  inliningClosed : O.inlining
  specializationClosed : O.specialization

def AheadTimeOptimizationClosed (O : AheadTimeOptimizationPackage) : Prop :=
  O.deadCodeElimination ∧ O.constantFolding ∧ O.loopUnrolling ∧ O.inlining ∧ O.specialization

theorem ahead_time_optimization_closed_from_evidence
    (O : AheadTimeOptimizationPackage) (E : AheadTimeOptimizationEvidence O) :
    AheadTimeOptimizationClosed O := by
  exact And.intro E.deadCodeEliminationClosed
    (And.intro E.constantFoldingClosed
      (And.intro E.loopUnrollingClosed
        (And.intro E.inliningClosed E.specializationClosed)))

end CompilersAheadTimeCompilationTheoremCanonicalLaneLean
end HautevilleHouse