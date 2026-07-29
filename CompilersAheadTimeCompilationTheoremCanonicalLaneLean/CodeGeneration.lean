import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CompilersAheadTimeCompilationTheoremCanonicalLaneLean

structure CodeGenerationPackage where
  targetArchitecture : Type
  instructionSelection : Prop
  registerAllocation : Prop
  instructionScheduling : Prop
  objectCodeEmitted : Prop

structure CodeGenerationEvidence (C : CodeGenerationPackage) where
  instructionSelectionClosed : C.instructionSelection
  registerAllocationClosed : C.registerAllocation
  instructionSchedulingClosed : C.instructionScheduling
  objectCodeEmittedClosed : C.objectCodeEmitted

def CodeGenerationClosed (C : CodeGenerationPackage) : Prop :=
  C.instructionSelection ∧ C.registerAllocation ∧ C.instructionScheduling ∧ C.objectCodeEmitted

theorem code_generation_closed_from_evidence
    (C : CodeGenerationPackage) (E : CodeGenerationEvidence C) :
    CodeGenerationClosed C := by
  exact And.intro E.instructionSelectionClosed
    (And.intro E.registerAllocationClosed
      (And.intro E.instructionSchedulingClosed E.objectCodeEmittedClosed))

end CompilersAheadTimeCompilationTheoremCanonicalLaneLean
end HautevilleHouse