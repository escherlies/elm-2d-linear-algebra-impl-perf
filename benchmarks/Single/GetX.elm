module Single.GetX exposing (..)

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
    describe "get x"
        [ benchmark "Vec" <|
            \_ -> Vec.getX (Vec.vec2 k k)
        , benchmark "VecADT" <|
            \_ -> VecADT.getX (VecADT.vec2 k k)
        , benchmark "VecRecord" <|
            \_ -> VecRecord.getX (VecRecord.vec2 k k)
        , benchmark "VecTuple" <|
            \_ -> VecTuple.getX (VecTuple.vec2 k k)
        ]


main : BenchmarkProgram
main =
    program suite
