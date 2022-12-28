module Single.Add exposing (..)

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
    describe "add"
        [ benchmark "Vec" <|
            \_ -> Vec.add (Vec.vec2 k k) (Vec.vec2 k k)
        , benchmark "VecADT" <|
            \_ -> VecADT.add (VecADT.vec2 k k) (VecADT.vec2 k k)
        , benchmark "VecRecord" <|
            \_ -> VecRecord.add (VecRecord.vec2 k k) (VecRecord.vec2 k k)
        , benchmark "VecTuple" <|
            \_ -> VecTuple.add (VecTuple.vec2 k k) (VecTuple.vec2 k k)
        ]


main : BenchmarkProgram
main =
    program suite
