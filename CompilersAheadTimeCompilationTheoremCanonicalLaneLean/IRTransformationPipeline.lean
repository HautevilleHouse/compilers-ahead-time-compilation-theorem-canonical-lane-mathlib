import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CompilersAheadTimeCompilationTheoremCanonicalLaneLean

structure IRTransformationPipeline where
  sourceIR : Type
  targetIR : Type
  loweringPasses : List String
  optimizationPasses : List String
  programRepresentationValid : Prop

def IRTransformationPipelineClosed (P : IRTransformationPipeline) : Prop :=
  P.programRepresentationValid

structure IRTransformationPipelineEvidence (P : IRTransformationPipeline) where
  programRepresentationValidClosed : P.programRepresentationValid

theorem ir_transformation_pipeline_closed_from_evidence (P : IRTransformationPipeline) (E : IRTransformationPipelineEvidence P) :
  IRTransformationPipelineClosed P := by
  exact E.programRepresentationValidClosed

end CompilersAheadTimeCompilationTheoremCanonicalLaneLean
end HautevilleHouse