# Type-Level Programming

Type-level programming demonstrates that type systems can be Turing-complete computational
environments. These programs perform calculations entirely at compile time using only the type
system — no runtime code execution required.

## TypeScript FizzBuzz

A complete FizzBuzz implementation that runs entirely in TypeScript's type system. The program
generates the classic 1-100 FizzBuzz sequence using only type-level computations.
Inspired by [Fizz Buzz using the TypeScript Type System](https://nickangeli.com/posts/fizz-buzz-using-the-typescript-type-system/)

### Usage

Open `fizzbuzz.ts` in VS Code or any TypeScript-aware editor. Hover over the variable declarations
to see the computed FizzBuzz sequence in the type hints—no compilation or execution needed.

```typescript
let fb: FizzBuzzRange<1, 100>
//   ^? Hover to see: [1, 2, "fizz", 4, "buzz", "fizz", 7, 8, "fizz", "buzz", ...]
```
