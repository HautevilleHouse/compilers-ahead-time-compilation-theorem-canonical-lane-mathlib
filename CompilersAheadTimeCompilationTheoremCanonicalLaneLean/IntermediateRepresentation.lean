import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CompilersAheadTimeCompilationTheoremCanonicalLaneLean

structure IntermediateRepresentationPackage where
  irType : Type
  controlFlowGraph : Prop
  ssaForm : Prop
  typeInferenceComplete : Prop
  sideEffectInfo : Prop

structure IntermediateRepresentationEvidence (I : IntermediateRepresentationPackage) where
  controlFlowGraphClosed : I.controlFlowGraph
  ssaFormClosed : I.ssaForm
  typeInferenceCompleteClosed : I.typeInferenceComplete
  sideEffectInfoClosed : I.sideEffectInfo

def IntermediateRepresentationClosed (I : IntermediateRepresentationPackage) : Prop :=
  I.controlFlowGraph ∧ I.ssaForm ∧ I.typeInferenceComplete ∧ I.sideEffectInfo

theorem intermediate_representation_closed_from_evidence
    (I : IntermediateRepresentationPackage) (E : IntermediateRepresentationEvidence I) :
    IntermediateRepresentationClosed I := by
  exact And.intro E.controlFlowGraphClosed
    (And.intro E.ssaFormClosed
      (And.intro E.typeInferenceCompleteClosed E.sideEffectInfoClosed))

end CompilersAheadTimeCompilationTheoremCanonicalLaneLean
end HautevilleHouse