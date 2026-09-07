# gn-lean

A Lean 4.33.0 proof of the Gurvich–Naumova partition conjecture for powers of
three ([Conjecture 1, arXiv:2508.00946v3](https://arxiv.org/abs/2508.00946v3)).

**Theorem.** For every nonnegative integer `n`, the distinct integers
`1,...,n` admit a partition into nonempty sets of at most three elements,
each of whose sums is `3^k` for some nonnegative integer `k`.

The final theorem is unconditional. All required finite permutation
certificates and unbounded Langford constructions are proved in this
repository. The empty interval is included as an auxiliary case.

- [Challenge.lean](Challenge.lean) states the result directly using Mathlib,
  without project definitions or project imports.
- [Solution.lean](Solution.lean) supplies the corresponding proved declaration
  `GurvichNaumova.partition_into_powers_of_three`.
- [GN/Main.lean](GN/Main.lean) contains `GN.gurvich_naumova`.
- [PROOF.md](PROOF.md) explains the mathematical argument and source relationships.
- [VERIFICATION.md](VERIFICATION.md) records the checks and verifier pins.
- [DISCLOSURE.md](DISCLOSURE.md) records authorship, automation, and review limits.

The complete local build and transitive axiom audit passed on 2026-09-07:
1,655 project declarations, with only `propext`, `Classical.choice`, and
`Quot.sound`. There are no custom axioms or proof placeholders in the Solution
or its dependencies. The single intentional `sorry` is confined to the
separate Challenge environment.

## Reproduce

Install [Elan](https://github.com/leanprover/elan), then run:

```sh
lake exe cache get
lake build GN Challenge Solution Test
```

The committed manifest fixes all dependency revisions. The toolchain is
`leanprover/lean4:v4.33.0`; Mathlib is pinned to
`db584cd6d46c92f209a44c0f1c829460d327499d`.

On Linux, the complete statement comparison and independent replay use:

```sh
./scripts/verify-comparator.sh
```

This requires Git, Go, Cargo, Python 3, and Elan/Lake. The script pins Comparator,
lean4export, NanoDa, and Landrun to the official Palomar revisions recorded in
VERIFICATION.md. It enforces NanoDa replay and has no unsandboxed fallback.
[GitHub Actions](https://github.com/JD-Jones-ASES/gn-lean/actions/workflows/verify.yml)
records the outcome for each pushed commit. A local Lean build alone is not
an independent NanoDa replay.

## Palomar package

This repository contains the substantive Lean development and its Palomar
entry files directly. It is not an adaptation wrapper around another Lean
repository. The compared theorem, metadata, license, toolchain, dependencies,
and verifier configuration are all here.

The repository is maintained privately during preparation. Palomar's
[current submission policy](https://github.com/PalomarRegistry/PalomarPolicy/blob/42cc43f70b1b019d20d4b64e9016396e666a6bc7/CONTRIBUTING.md)
requires a public GitHub repository and an exact commit for intake. No Palomar
submission or registration is claimed by this repository. Publication and
registration are separate steps requiring the owner's authorization.

JD Jones is the human author and responsible maintainer. AI agents generated
substantial mathematics and code under his direction. No independent human
expert review or completed priority survey is recorded. Mathematical sources
are credited in PROOF.md and formalization.yaml.

License: [MIT](LICENSE).
