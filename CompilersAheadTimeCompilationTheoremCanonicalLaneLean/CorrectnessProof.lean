import canonicalLaneMathlib.AdmissibleClass
import CompilersAheadTimeCompilationTheoremCanonicalLaneLean.IntermediateRepresentation
import CompilersAheadTimeCompilationTheoremCanonicalLaneLean.ControlFlowAnalysis
import CompilersAheadTimeCompilationTheoremCanonicalLaneLean.MemoryAnalysis
import CompilersAheadTimeCompilationTheoremCanonicalLaneLean.TargetCodeGeneration

namespace HautevilleHouse
namespace CompilersAheadTimeCompilationTheoremCanonicalLaneLean

structure CorrectnessPackage (I : IRPackage) (C : ControlFlowPackage I) (M : MemoryPackage I) (T : TargetCodePackage I) where
  semanticsPreservation : Prop
  aotCorrectness : Prop

structure CorrectnessEvidence {I : IRPackage} {C : ControlFlowPackage I} {M : MemoryPackage I} {T : TargetCodePackage I}
    (P : CorrectnessPackage I C M T) where
  semanticsPreservationClosed : P.semanticsPreservation
  aotCorrectnessClosed : P.aotCorrectness

def CorrectnessClosed {I : IRPackage} {C : ControlFlowPackage I} {M : MemoryPackage I} {T : TargetCodePackage I}
    (P : CorrectnessPackage I C M T) : Prop :=
  P.semanticsPreservation ∧ P.aotCorrectness

theorem correctness_closed_from_evidence
    {I : IRPackage} {C : ControlFlowPackage I} {M : MemoryPackage I} {T : TargetCodePackage I}
    (P : CorrectnessPackage I C M T) (E : CorrectnessEvidence P) : CorrectnessClosed P := by
  exact And.intro E.semanticsPreservationClosed E.aotCorrectnessClosed

end CompilersAheadTimeCompilationTheoremCanonicalLaneLean
end HautevilleHouse