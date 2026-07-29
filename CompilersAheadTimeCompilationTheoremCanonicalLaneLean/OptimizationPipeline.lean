import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CompilersAheadTimeCompilationTheoremCanonicalLaneLean

structure OptimizationPass where
  passName : String
  preconditions : Prop
  postconditions : Prop
  correctnessProof : Prop

structure OptimizationPipelinePackage where
  passes : List OptimizationPass
  order : List Nat
  compositionCorrectness : Prop
  terminationGuarantee : Prop

structure OptimizationPipelineEvidence (P : OptimizationPipelinePackage) where
  compositionCorrectnessClosed : P.compositionCorrectness
  terminationGuaranteeClosed : P.terminationGuarantee
  allPassesValid : ∀ pass ∈ P.passes, pass.preconditions ∧ pass.postconditions ∧ pass.correctnessProof

def OptimizationPipelineClosed (P : OptimizationPipelinePackage) : Prop :=
  P.compositionCorrectness ∧ P.terminationGuarantee ∧
  (∀ pass ∈ P.passes, pass.preconditions ∧ pass.postconditions ∧ pass.correctnessProof)

theorem optimization_pipeline_closed_from_evidence
    (P : OptimizationPipelinePackage) (E : OptimizationPipelineEvidence P) :
    OptimizationPipelineClosed P := by
  exact And.intro E.compositionCorrectnessClosed
    (And.intro E.terminationGuaranteeClosed E.allPassesValid)

end CompilersAheadTimeCompilationTheoremCanonicalLaneLean
end HautevilleHouse