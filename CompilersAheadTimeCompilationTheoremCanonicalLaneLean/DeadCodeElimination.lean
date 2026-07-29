import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CompilersAheadTimeCompilationTheoremCanonicalLaneLean

structure DeadCodeElimination where
  liveVariableAnalysis : Prop
  reachabilityAnalysis : Prop
  eliminationPassCorrect : Prop
  codeCorrectnessPreserved : Prop

def DeadCodeEliminationClosed (D : DeadCodeElimination) : Prop :=
  D.liveVariableAnalysis ∧ D.reachabilityAnalysis ∧ D.eliminationPassCorrect ∧ D.codeCorrectnessPreserved

structure DeadCodeEliminationEvidence (D : DeadCodeElimination) where
  liveVariableAnalysisClosed : D.liveVariableAnalysis
  reachabilityAnalysisClosed : D.reachabilityAnalysis
  eliminationPassCorrectClosed : D.eliminationPassCorrect
  codeCorrectnessPreservedClosed : D.codeCorrectnessPreserved

theorem dead_code_elimination_closed_from_evidence (D : DeadCodeElimination) (E : DeadCodeEliminationEvidence D) :
  DeadCodeEliminationClosed D := by
  exact And.intro E.liveVariableAnalysisClosed
    (And.intro E.reachabilityAnalysisClosed
      (And.intro E.eliminationPassCorrectClosed E.codeCorrectnessPreservedClosed))

end CompilersAheadTimeCompilationTheoremCanonicalLaneLean
end HautevilleHouse