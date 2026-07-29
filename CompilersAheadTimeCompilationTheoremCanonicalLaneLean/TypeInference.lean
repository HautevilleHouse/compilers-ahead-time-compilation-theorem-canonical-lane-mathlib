import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CompilersAheadTimeCompilationTheoremCanonicalLaneLean

structure TypeInferencePackage where
  typeSystem : Type u
  constraintGeneration : Prop
  unificationAlgorithm : Prop
  typeChecking : Prop
  typeSafety : Prop

structure TypeInferenceEvidence (T : TypeInferencePackage) where
  constraintGenerationClosed : T.constraintGeneration
  unificationAlgorithmClosed : T.unificationAlgorithm
  typeCheckingClosed : T.typeChecking
  typeSafetyClosed : T.typeSafety

def TypeInferenceClosed (T : TypeInferencePackage) : Prop :=
  T.constraintGeneration ∧ T.unificationAlgorithm ∧ T.typeChecking ∧ T.typeSafety

theorem type_inference_closed_from_evidence
    (T : TypeInferencePackage) (E : TypeInferenceEvidence T) :
    TypeInferenceClosed T := by
  exact And.intro E.constraintGenerationClosed
    (And.intro E.unificationAlgorithmClosed
      (And.intro E.typeCheckingClosed E.typeSafetyClosed))

end CompilersAheadTimeCompilationTheoremCanonicalLaneLean
end HautevilleHouse