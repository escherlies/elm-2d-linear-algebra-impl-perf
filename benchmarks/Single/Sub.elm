module Single.Sub exposing (..)

import Benchmark exposing (..)
import Benchmark.Runner exposing (BenchmarkProgram, program)
import Math.Vector2 as Vec
import VecADT
import VecRecord
import VecTuple


k : Float
k =
    pi


suite : Benchmark
suite =
    describe "sub"
        [ benchmark "Vec" <|
            \_ -> Vec.sub (Vec.vec2 k k) (Vec.vec2 k k)
        , benchmark "VecADT" <|
            \_ -> VecADT.sub (VecADT.vec2 k k) (VecADT.vec2 k k)
        , benchmark "VecRecord" <|
            \_ -> VecRecord.sub (VecRecord.vec2 k k) (VecRecord.vec2 k k)
        , benchmark "VecTuple" <|
            \_ -> VecTuple.sub (VecTuple.vec2 k k) (VecTuple.vec2 k k)
        ]


main : BenchmarkProgram
main =
    program suite
