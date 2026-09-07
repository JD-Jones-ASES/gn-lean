import Mathlib

/-!
# The Gurvich–Naumova partition conjecture for powers of three

For every n, the distinct integers 1,...,n admit a partition into nonempty
sets of at most three elements, each having sum 3^k for some natural k.
This is Conjecture 1 of Gurvich and Naumova, arXiv:2508.00946v3.
The auxiliary case n=0 is included and uses the empty partition.

The union condition ensures that no integer outside [1,n] occurs. Pairwise
disjointness ensures that every integer occurs in exactly one block. Powers
include 3^0=1. There are no hypotheses on n and no unproved sequence-existence
hypothesis in the recorded statement.

This Mathlib-only file intentionally contains a placeholder. The corresponding
Solution declaration is proved in a separate environment.
-/

namespace GurvichNaumova

/-- Every initial interval has a partition into blocks of at most three
    distinct integers whose sums are nonnegative integer powers of three. -/
theorem partition_into_powers_of_three (n : ℕ) :
    ∃ blocks : Finset (Finset ℤ),
      blocks.biUnion id = Finset.Icc 1 (n : ℤ) ∧
      (∀ b ∈ blocks, ∀ c ∈ blocks, b ≠ c → Disjoint b c) ∧
      ∀ b ∈ blocks, b.Nonempty ∧ b.card ≤ 3 ∧
        ∃ k : ℕ, b.sum id = (3 : ℤ)^k := by
  sorry

end GurvichNaumova
