type Length<A extends unknown[]> = A extends { length: infer L } ? L & number : never

type ARange<N extends number, Tuple extends unknown[] = []> = Length<Tuple> extends N
  ? Tuple
  : ARange<N, [...Tuple, Length<Tuple>]>

type Add<A extends number, B extends number> = Length<[...ARange<A>, ...ARange<B>]>

type LessThan<
  A extends number,
  B extends number,
  BRange extends unknown[] = ARange<B>
> = A extends BRange[number] ? true : false

let a: LessThan<3, 2>
let b: Length<[1,2,3]>

type IsDivisible<A extends number, B extends number, Accumulator extends number = B> = 
  A extends Accumulator
    ? true
    : LessThan<A, Accumulator> extends true 
      ? false
      : IsDivisible<A, B, Add<Accumulator, B>>

let c: IsDivisible<6, 3>
let d: IsDivisible<6, 4>

type IsDivisibleBy3<N extends number> = IsDivisible<N, 3>
type IsDivisibleBy5<N extends number> = IsDivisible<N, 5>

type Fizz = "Fizz"
type Buzz = "Buzz"
type FizzBuzz = "FizzBuzz"

type TFizzBuzz<N extends number> =
  IsDivisibleBy3<N> extends true
    ? IsDivisibleBy5<N> extends true
      ? FizzBuzz
      : Fizz
    : IsDivisibleBy5<N> extends true
    ? Buzz
    : N

type FizzBuzzRange<
    A extends number, 
    B extends number, 
    Tuple extends unknown[] = []
  > = A extends B
    ? Tuple
    : FizzBuzzRange<Add<A, 1>, B, [...Tuple, TFizzBuzz<A>]>

let fb: FizzBuzzRange<1, 16>