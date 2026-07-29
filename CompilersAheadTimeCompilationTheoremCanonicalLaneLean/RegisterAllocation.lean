import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CompilersAheadTimeCompilationTheoremCanonicalLaneLean

structure RegisterAllocation where
  registerFile : Type
  liveIntervalAnalysis : Prop
  graphColoring : Prop
  allocationValid : Prop

def RegisterAllocationClosed (R : RegisterAllocation) : Prop :=
  R.liveIntervalAnalysis ∧ R.graphColoring ∧ R.allocationValid

structure RegisterAllocationEvidence (R : RegisterAllocation) where
  liveIntervalAnalysisClosed : R.liveIntervalAnalysis
  graphColoringClosed : R.graphColoring
  allocationValidClosed : R.allocationValid

theorem register_allocation_closed_from_evidence (R : RegisterAllocation) (E : RegisterAllocationEvidence R) :
  RegisterAllocationClosed R := by
  exact And.intro E.liveIntervalAnalysisClosed
    (And.intro E.graphColoringClosed E.allocationValidClosed)

end CompilersAheadTimeCompilationTheoremCanonicalLaneLean
end HautevilleHouse