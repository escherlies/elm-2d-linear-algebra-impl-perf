module Single.SetX exposing (..)

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
    describe "set x"
        [ benchmark "Vec" <|
            \_ -> Vec.setX k (Vec.vec2 k k)
        , benchmark "VecADT" <|
            \_ -> VecADT.setX k (VecADT.vec2 k k)
        , benchmark "VecRecord" <|
            \_ -> VecRecord.setX k (VecRecord.vec2 k k)
        , benchmark "VecTuple" <|
            \_ -> VecTuple.setX k (VecTuple.vec2 k k)
        ]


main : BenchmarkProgram
main =
    program suite
