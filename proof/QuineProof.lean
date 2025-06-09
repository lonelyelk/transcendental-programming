-- Proving the existance of a quine program following the article
-- http://www.madore.org/~david/computers/quine.html
-- Most of the consepts and theorems are defined and proven in Mathlib.Computability

import «QuineProof».Basic
import Mathlib.Computability.PartrecCode

-- Essentially existance of a quine is a direct consequence of the fixed point theorem
-- The quine is formulated as a code that encodes itself onto the ℕ space.
theorem quine_exists :
  ∃ c : Nat.Partrec.Code,
  Nat.Partrec.Code.eval c = fun _ => Part.some (Nat.Partrec.Code.encodeCode c) :=
    by
      apply Nat.Partrec.Code.fixed_point₂
      apply Computable₂.partrec₂
      apply Computable.fst
