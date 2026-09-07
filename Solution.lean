import GN.Main

namespace GurvichNaumova

/-- The unconditional partition theorem, stated without project definitions. -/
theorem partition_into_powers_of_three (n : ℕ) :
    ∃ blocks : Finset (Finset ℤ),
      blocks.biUnion id = Finset.Icc 1 (n : ℤ) ∧
      (∀ b ∈ blocks, ∀ c ∈ blocks, b ≠ c → Disjoint b c) ∧
      ∀ b ∈ blocks, b.Nonempty ∧ b.card ≤ 3 ∧
        ∃ k : ℕ, b.sum id = (3 : ℤ)^k := by
  exact GN.gurvich_naumova n

end GurvichNaumova
