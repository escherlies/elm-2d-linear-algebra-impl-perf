module Single.Scale exposing (..)

import Benchmark exposing (..)
import Benchmark.Runner exposing (BenchmarkProgram, program)
import Math.Vector2 as Vec
import VecADT
import VecRecord
import VecTuple


k : Float
k =
    pi


scale : Benchmark
scale =
    describe "scale"
        [ benchmark "Vec" <|
            \_ -> Vec.scale k (Vec.vec2 k k)
        , benchmark "VecADT" <|
            \_ -> VecADT.scale k (VecADT.vec2 k k)
        , benchmark "VecRecord" <|
            \_ -> VecRecord.scale k (VecRecord.vec2 k k)
        , benchmark "VecTuple" <|
            \_ -> VecTuple.scale k (VecTuple.vec2 k k)
        ]


main : BenchmarkProgram
main =
    program scale
