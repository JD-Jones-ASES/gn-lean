# Mathematical account

The target is Conjecture 1 of Vladimir Gurvich and Mariya Naumova,
[arXiv:2508.00946v3](https://arxiv.org/abs/2508.00946v3): every initial
interval of positive integers has a partition into nonempty sets of at most
three elements whose sums are powers of three. The exponent is a nonnegative
integer, so the singleton {1} is permitted. The development also includes n=0.
The precise build and verification status is recorded in README.md.

## 1. Permutations with prescribed displacements

For every integer k≥3 and every j∈[−k,k], construct a permutation σ of
[−k,k]∖{j} such that u↦σ(u)−u is a bijection onto [−k,k]∖{0}.
The finite cases 3≤k≤21 use explicit integer tables checked by Lean's ordinary
kernel evaluator. The finite search that found them is not an assumption.

For k≥22 put d=⌊(k+2)/3⌋ and i=k−(3d−2)∈{0,1,2}; then d≥8. An extended
Langford pairing of defect d and excess i pairs all positions except one in
[1,4d+2i−1], using every difference d,...,3d−2+i once. Swapping endpoints
produces both signs of each difference. On an adjacent prefix of length
2(d−1), the doubling permutation modulo 2d−1 produces all nonzero signed
differences of absolute value below d. Their disjoint union has all the
required displacements. Reflection covers the other end of the interval.

The low-excess families i=0,1,2 have allowed hole parities 1,d+1,0 respectively.
The families of defect d−2 and excess i+6 have the same largest difference k
and the opposite parity. Their prefixes differ in length by four, so the
hole parity is preserved by the shift. These two families cover every
upper-half hole; reflection and translation give every j∈[−k,k].

The excess-zero construction is a short direct formula. The excess-one and
excess-two tables were derived independently during this formalization. Their
coefficients were found by finite affine exact-cover searches; their coverage,
differences, and size bounds are then proved for every integer parameter in
Lean. The excess-six, seven, and eight formulas are adapted from Mor and Linek,
*Hooked extended Langford sequences of small and large defects*, Mathematica
Slovaca 64 (2014), 819–842,
[DOI:10.2478/s12175-014-0242-6](https://doi.org/10.2478/s12175-014-0242-6).
The required formulas and all hole-coverage arguments are proved inside this
repository, rather than imported as mathematical axioms.

A `LangfordPairing` records exact endpoint coverage, exact difference coverage,
and a cardinality bound. These conditions force uniqueness: the endpoint
incidence map is a bijection because its domain has at most as many elements
as the target, which is already covered. Thus a set of pairs with repeated
endpoints cannot pass merely by having the correct endpoint union. The same
cardinality argument proves that the signed differences are a bijection,
rather than merely a surjection.

## 2. Signed zero-sum triples

For k≥3 and 1≤a≤3k+1 with 3∤a, choose j so that a=|3j+1|. From the preceding
permutation on U=[−k,k]∖{j}, use the triples

    {3u+1, −(3σ(u)+1), 3(σ(u)−u)}  (u∈U).

Their residues modulo three are respectively 1,2,0, so their entries are
distinct. The two bijectivity conditions give exact coverage of
±([1,3k+1]∖{a}), and every triple sums to zero. For r=3k+2, adjoining
{a,r,−(r+a)} partitions the signed set

    [1,r] ∪ {−x : x∈[1,r−1]∖{a}} ∪ {−(r+a)}.

This is the signed frame used by the critical induction step.

## 3. Contraction and complement pairs

Suppose r≡2 mod3, r≥11, P is a power of three, P>2r, and [1,r] already has
a good partition. Its block containing r has another element a not divisible
by three: the block sum is a power of three larger than r and hence is zero
modulo three. Replace a and r in that block by a+r. This preserves its sum
and leaves a block of size at most two. The new support is

    D=([1,r−1]∖{a}) ∪ {a+r}.

Translate the signed frame by P. Its triples sum to 3P and cover
[P+1,P+r] together with P−D. Add the singleton {P}. Below P, combine the
contracted partition with complement pairs {x,P−x} that miss D.

There is one possible collision: a complement pair can meet D twice only
through its exceptional member a+r. In that case, the contracted block
containing a+r is exactly that complement pair. Its power-of-three sum is
forced to equal P by the neighboring-power bounds. Delete this block;
both its entries are already covered by the translated frame. The remaining
blocks are disjoint and cover [1,P+r]. The Lean proof includes this repair.

For r=2,5,8, explicit source partitions and signed frames prove the same
critical extension for every P>2r. The finite checks establish the frame
identities; the extension itself is still unbounded in P.

## 4. Strong induction on the interval length

Let P be the largest power of three at most n, so P≤n<3P. If 2n>3P, extend
the smaller interval [1,3P−n−1] with pairs summing to 3P. Otherwise write
n=P+r, where 2r<P. For r≡0 or1 mod3, explicit symmetric zero-sum triples
and, when needed, a central singleton extend a smaller good interval.
For r≡2 mod3 use the critical step above, supplied by the induction
hypothesis on r. The empty interval starts the induction.

The elementary symmetric and complement-pair reductions follow the motivating
Gurvich–Naumova work. The signed contraction transfer closes the remaining
residue class. This account does not claim an independent human review or a
complete survey establishing priority of the proof.
