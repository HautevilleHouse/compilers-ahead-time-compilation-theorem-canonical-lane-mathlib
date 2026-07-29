import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CompilersAheadTimeCompilationTheoremCanonicalLaneLean

structure AOTCodeGeneration where
  instructionSelection : Prop
  instructionScheduling : Prop
  registerAllocationFinal : Prop
  peepholeOptimization : Prop
  instructionSelectionClosed : instructionSelection
  instructionSchedulingClosed : instructionScheduling
  registerAllocationFinalClosed : registerAllocationFinal
  peepholeOptimizationClosed : peepholeOptimization

structure AOTCodeGenerationEvidence (C : AOTCodeGeneration) where
  instructionSelectionClosed : C.instructionSelection
  instructionSchedulingClosed : C.instructionScheduling
  registerAllocationFinalClosed : C.registerAllocationFinal
  peepholeOptimizationClosed : C.peepholeOptimization

def AOTCodeGenerationClosed (C : AOTCodeGeneration) : Prop :=
  C.instructionSelection ∧ C.instructionScheduling ∧ C.registerAllocationFinal ∧ C.peepholeOptimization

theorem aot_code_generation_closed_from_evidence
    (C : AOTCodeGeneration) (E : AOTCodeGenerationEvidence C) :
    AOTCodeGenerationClosed C := by
  exact And.intro E.instructionSelectionClosed
    (And.intro E.instructionSchedulingClosed (And.intro E.registerAllocationFinalClosed E.peepholeOptimizationClosed))

end CompilersAheadTimeCompilationTheoremCanonicalLaneLean
end HautevilleHouse