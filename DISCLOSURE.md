# Authorship and automation

JD Jones directed this project, selected its objective and publication workflow,
and is its human author and responsible maintainer. OpenAI Codex (GPT-6), with
parallel agents, generated substantial mathematical arguments, construction
searches, Lean code, documentation, and automated reviews under that direction.
No independent human mathematical review is recorded.

Private exploratory research preceded this Lean development. The mathematical
arguments needed for the result are presented here, and every necessary proof
is constructed in this repository. There is no dependency on a separate private
research repository, no prior Lean formalization is imported, and no separate
wrapper repository supplies the substantive development.

Finite exact-cover searches suggested explicit permutation certificates and
affine sequence tables. Those searches are discovery aids. The Lean proof
checks the finite certificates with ordinary `decide` and proves the affine
families for all parameters. Neither a solver's success report nor finite
extrapolation is used as a proof axiom. Published tables are credited in the
source and in PROOF.md.

The mechanical checks establish formal derivability and statement agreement.
They do not establish novelty, significance, bibliographic completeness, or
independent expert endorsement. Detailed API token and monetary accounting
was not retained for this repository.
