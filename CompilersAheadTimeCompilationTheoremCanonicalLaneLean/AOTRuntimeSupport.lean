import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CompilersAheadTimeCompilationTheoremCanonicalLaneLean

structure AOTRuntimeSupport where
  runtimeInitialization : Prop
  garbageCollection : Prop
  exceptionHandling : Prop
  runtimeInitializationClosed : runtimeInitialization
  garbageCollectionClosed : garbageCollection
  exceptionHandlingClosed : exceptionHandling

structure AOTRuntimeSupportEvidence (R : AOTRuntimeSupport) where
  runtimeInitializationClosed : R.runtimeInitialization
  garbageCollectionClosed : R.garbageCollection
  exceptionHandlingClosed : R.exceptionHandling

def AOTRuntimeSupportClosed (R : AOTRuntimeSupport) : Prop :=
  R.runtimeInitialization ∧ R.garbageCollection ∧ R.exceptionHandling

theorem aot_runtime_support_closed_from_evidence
    (R : AOTRuntimeSupport) (E : AOTRuntimeSupportEvidence R) :
    AOTRuntimeSupportClosed R := by
  exact And.intro E.runtimeInitializationClosed (And.intro E.garbageCollectionClosed E.exceptionHandlingClosed)

end CompilersAheadTimeCompilationTheoremCanonicalLaneLean
end HautevilleHouse