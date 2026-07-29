import canonicalLaneMathlib.AdmissibleClass
import CompilersAheadTimeCompilationTheoremCanonicalLaneLean.IntermediateRepresentation

namespace HautevilleHouse
namespace CompilersAheadTimeCompilationTheoremCanonicalLaneLean

structure TargetCodePackage (I : IRPackage) where
  targetArch : Type u
  instructionSelection : Prop
  registerAllocation : Prop
  aotCodeGeneration : Prop

structure TargetCodeEvidence {I : IRPackage} (T : TargetCodePackage I) where
  instructionSelectionClosed : T.instructionSelection
  registerAllocationClosed : T.registerAllocation
  aotCodeGenerationClosed : T.aotCodeGeneration

def TargetCodeClosed {I : IRPackage} (T : TargetCodePackage I) : Prop :=
  T.instructionSelection ∧ T.registerAllocation ∧ T.aotCodeGeneration

theorem target_code_closed_from_evidence
    {I : IRPackage} (T : TargetCodePackage I) (E : TargetCodeEvidence T) :
    TargetCodeClosed T := by
  exact And.intro E.instructionSelectionClosed
    (And.intro E.registerAllocationClosed E.aotCodeGenerationClosed)

end CompilersAheadTimeCompilationTheoremCanonicalLaneLean
end HautevilleHouse