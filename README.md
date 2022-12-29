# elm-linear-algebra-impl-perf

This repo compares the performance of different linear-algebra/vector implementations.

- [elm-linear-algebra-impl-perf](#elm-linear-algebra-impl-perf)
- [Result](#result)
- [Implementations](#implementations)
  - [elm-explorations/linear-algebra](#elm-explorationslinear-algebra)
  - [ADT](#adt)
  - [Record](#record)
  - [Tuple](#tuple)
- [Usage](#usage)
- [Results](#results)
  - [Darwin arm64 (Apple M1 Mac)](#darwin-arm64-apple-m1-mac)
  - [Linux x86_64 (AMD Ryzen)](#linux-x86_64-amd-ryzen)


# Result

Use an `ADT` if you want to do vector math for everything other than WebGL in Elm!

It is more descriptive and has the best performance.

# Implementations

## elm-explorations/linear-algebra

This Package uses [elm-explorations/linear-algebra](https://package.elm-lang.org/packages/elm-explorations/linear-algebra/latest/) and FFIs the [webgl-mjs](https://code.google.com/archive/p/webgl-mjs/) library.

However, for plain vector operations, this is the _slowest_ implementation.

## ADT

```elm
type Vec2
    = Vec2 Float Float
```

## Record 

```elm
type alias Vec2 =
    { x : Float
    , y : Float
    }
```

## Tuple

```elm
type alias Vec2 =
    ( Float, Float )
```

# Usage

1. `nix-shell -p elmPackages.elm`
2. `elm reactor`
3. Go to `http://localhost:8000/benchmarks/Suite.elm`

# Results

Although in firefox the performance is ~25% slower for the ADT compared to tuples, they still have significant more advantages.

## Darwin arm64 (Apple M1 Mac)

| Browser | Implementation | Runs / second | Goodness of fit | Winner |
| ------- | -------------- | ------------- | --------------- | ------ |
| Firefox | Vec            | 3,483,184     | 99.45%          |        |
| Firefox | VecADT         | 28,548,490    | 99.35%          |        |
| Firefox | VecRecord      | 20,194,153    | 99.05%          |        |
| Firefox | VecTuple       | 40,845,616    | 98.97%          | *      |
|         |                |               |                 |        |
| Chrome  | Vec            | 3,421,129     | 99.79%          |        |
| Chrome  | VecADT         | 184,913,847   | 99.84%          | *      |
| Chrome  | VecRecord      | 17,422,017    | 99.87%          |        |
| Chrome  | VecTuple       | 185,103,925   | 99.79%          | *      |
|         |                |               |                 |        |
| Safari  | Vec            | 3,482,573     | 98.69%          |        |
| Safari  | VecADT         | 12,057,775    | 98.82%          | *      |
| Safari  | VecRecord      | 8,059,167     | 99.05%          |        |
| Safari  | VecTuple       | 12,414,330    | 99.26%          | *      |

## Linux x86_64 (AMD Ryzen)

| Browser | Implementation | Runs / second | Goodness of fit | Winner |
| ------- | -------------- | ------------- | --------------- | ------ |
| Firefox | Vec            | 2,091,805     | 99.86%          |        |
| Firefox | VecADT         | 18,715,485    | 99.48%          |        |
| Firefox | VecRecord      | 10,560,354    | 99.59%          |        |
| Firefox | VecTuple       | 25,889,075    | 99.81%          | *      |
