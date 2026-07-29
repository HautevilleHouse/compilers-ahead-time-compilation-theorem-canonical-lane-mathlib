import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CompilersAheadTimeCompilationTheoremCanonicalLaneLean

structure AOTLivenessAnalysis where
  variableLiveness : Prop
  interferenceGraph : Prop
  registerAllocation : Prop
  variableLivenessClosed : variableLiveness
  interferenceGraphClosed : interferenceGraph
  registerAllocationClosed : registerAllocation

structure AOTLivenessAnalysisEvidence (L : AOTLivenessAnalysis) where
  variableLivenessClosed : L.variableLiveness
  interferenceGraphClosed : L.interferenceGraph
  registerAllocationClosed : L.registerAllocation

def AOTLivenessAnalysisClosed (L : AOTLivenessAnalysis) : Prop :=
  L.variableLiveness ∧ L.interferenceGraph ∧ L.registerAllocation

theorem aot_liveness_analysis_closed_from_evidence
    (L : AOTLivenessAnalysis) (E : AOTLivenessAnalysisEvidence L) :
    AOTLivenessAnalysisClosed L := by
  exact And.intro E.variableLivenessClosed (And.intro E.interferenceGraphClosed E.registerAllocationClosed)

end CompilersAheadTimeCompilationTheoremCanonicalLaneLean
end HautevilleHouse