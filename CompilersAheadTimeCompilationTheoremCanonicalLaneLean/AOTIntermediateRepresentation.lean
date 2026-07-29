import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CompilersAheadTimeCompilationTheoremCanonicalLaneLean

structure AOTIntermediateRepresentation where
  sourceLanguage : String
  targetArchitecture : String
  irType : String
  controlFlowGraph : Prop
  staticSingleAssignment : Prop
  controlFlowGraphClosed : controlFlowGraph
  staticSingleAssignmentClosed : staticSingleAssignment

structure AOTIntermediateRepresentationEvidence (I : AOTIntermediateRepresentation) where
  controlFlowGraphClosed : I.controlFlowGraph
  staticSingleAssignmentClosed : I.staticSingleAssignment

def AOTIntermediateRepresentationClosed (I : AOTIntermediateRepresentation) : Prop :=
  I.controlFlowGraph ∧ I.staticSingleAssignment

theorem aot_intermediate_representation_closed_from_evidence
    (I : AOTIntermediateRepresentation) (E : AOTIntermediateRepresentationEvidence I) :
    AOTIntermediateRepresentationClosed I := by
  exact And.intro E.controlFlowGraphClosed E.staticSingleAssignmentClosed

end CompilersAheadTimeCompilationTheoremCanonicalLaneLean
end HautevilleHouse