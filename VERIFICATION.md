# Verification record

## Local checks completed on 2026-09-07

- `lake build GN Challenge Solution Test`: passed, including the unconditional
  theorem and the exact Solution statement.
- `Test/Axioms.lean`: audited 1,655 public and private project constants;
  zero unexpected transitive axiom dependencies. The allowed axioms are exactly
  `propext`, `Classical.choice`, and `Quot.sound`.
- Every prescribed-hole permutation for `3≤k≤21` is represented by a literal
  finite certificate checked with ordinary `decide` (475 rows in total).
- The low-excess and high-excess Langford families are symbolic Lean theorems
  for all admissible parameters, rather than finite extrapolations.
- The direct v0.4 metadata was validated against the official schema at
  `99c678e569c7c4c0772db297c5ddd5e4c9b6322e`.
- AI-agent reviews checked alignment with Gurvich–Naumova Conjecture 1, the
  cardinality arguments for pair and difference bijections, the six-family
  hole coverage, and the contraction collision repair. These are not
  independent human reviews.

The build emits the intentional placeholder warning in Challenge.lean and
nonfatal style warnings in some proof modules. Solution does not import
Challenge. The proof audit traverses dependencies, including private generated
declarations, rather than checking only the final theorem's source text.

## Comparator and independent kernel replay

The [verification workflow](https://github.com/JD-Jones-ASES/gn-lean/actions/workflows/verify.yml)
runs the exact committed project on Ubuntu 24.04. Its result is recorded by
commit. A successful run means that the source guards, local axiom audit,
Comparator statement comparison, Lean exported-proof check, and NanoDa replay
all passed. Consult the run for the exact commit being reviewed; do not infer
independent replay from the local checks above.

The verifier uses the real Landrun sandbox. The argument adapter only maps
Comparator's path-option interface to the pinned Landrun CLI; it does not
remove sandboxing. NanoDa is mandatory. No alternate permitted axiom or
unchecked native evaluation is used to close the theorem.

## Official policy and tool revisions

Checked against official repositories on 2026-09-07:

| Component | Exact revision |
|---|---|
| PalomarPolicy | `42cc43f70b1b019d20d4b64e9016396e666a6bc7` |
| PalomarSubmission | `c605f23466450a52999fcfb3c6d68ed8febc56bf` |
| Comparator | `575674928e239f5bc452aab72d1dd7b0f1326494` |
| lean4export, Lean 4.33.0 | `15f6055e299ad5b89345e533cc2192f4cc00f659` |
| NanoDa | `68d5ca9db226849b41a6fff59d796ff19d0a8840` |
| Landrun | `811cfff51ceaf3d9843708aa6d22e9b84ccac8b4` |
| formalization.yaml schema | `99c678e569c7c4c0772db297c5ddd5e4c9b6322e` |

Palomar supports the released Lean 4.33.0 toolchain used here. Its current
contract requires a Mathlib-only Challenge, a separately proved Solution,
exact dependency pins, permitted-axiom checks, Comparator, and NanoDa. The
metadata follows v0.4 and omits a separate substantive-formalization wrapper
relationship because this repository contains the proof itself.

Intake requires a public repository and a full 40-character commit SHA.
Mechanical workflow identifiers and logs become public through intake.
Registration is a separate consent step and creates a permanent registry
record under the current publication and source-preservation policy. No
intake or registration has been performed as part of private preparation.
