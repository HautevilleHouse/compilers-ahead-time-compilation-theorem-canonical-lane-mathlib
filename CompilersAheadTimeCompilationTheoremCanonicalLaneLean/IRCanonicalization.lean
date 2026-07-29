import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CompilersAheadTimeCompilationTheoremCanonicalLaneLean

structure IntermediateRepresentationPackage where
  irType : Type u
  controlFlowGraph : Prop
  staticSingleAssignment : Prop
  phiNodes : Prop
  dominanceFrontier : Prop

structure IntermediateRepresentationEvidence (I : IntermediateRepresentationPackage) where
  controlFlowGraphClosed : I.controlFlowGraph
  staticSingleAssignmentClosed : I.staticSingleAssignment
  phiNodesClosed : I.phiNodes
  dominanceFrontierClosed : I.dominanceFrontier

def IntermediateRepresentationClosed (I : IntermediateRepresentationPackage) : Prop :=
  I.controlFlowGraph ∧ I.staticSingleAssignment ∧ I.phiNodes ∧ I.dominanceFrontier

theorem intermediate_representation_closed_from_evidence
    (I : IntermediateRepresentationPackage) (E : IntermediateRepresentationEvidence I) :
    IntermediateRepresentationClosed I := by
  exact And.intro E.controlFlowGraphClosed
    (And.intro E.staticSingleAssignmentClosed
      (And.intro E.phiNodesClosed E.dominanceFrontierClosed))

end CompilersAheadTimeCompilationTheoremCanonicalLaneLean
end HautevilleHouse