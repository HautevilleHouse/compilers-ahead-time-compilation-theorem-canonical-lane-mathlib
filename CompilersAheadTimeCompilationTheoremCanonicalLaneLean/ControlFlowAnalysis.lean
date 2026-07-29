import canonicalLaneMathlib.AdmissibleClass
import CompilersAheadTimeCompilationTheoremCanonicalLaneLean.IntermediateRepresentation

namespace HautevilleHouse
namespace CompilersAheadTimeCompilationTheoremCanonicalLaneLean

structure ControlFlowPackage (I : IRPackage) where
  cfgConstruct : Type u
  dominanceTree : Type v
  loopDetection : Prop
  aotTransformable : Prop

structure ControlFlowEvidence {I : IRPackage} (C : ControlFlowPackage I) where
  loopDetectionClosed : C.loopDetection
  aotTransformableClosed : C.aotTransformable

def ControlFlowClosed {I : IRPackage} (C : ControlFlowPackage I) : Prop :=
  C.loopDetection ∧ C.aotTransformable

theorem control_flow_closed_from_evidence
    {I : IRPackage} (C : ControlFlowPackage I) (E : ControlFlowEvidence C) :
    ControlFlowClosed C := by
  exact And.intro E.loopDetectionClosed E.aotTransformableClosed

end CompilersAheadTimeCompilationTheoremCanonicalLaneLean
end HautevilleHouse