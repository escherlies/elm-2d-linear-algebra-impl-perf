module Multi.SetAndGet exposing (..)

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
    describe "set and get"
        [ benchmark "Vec" <|
            \_ -> Vec.setX k (Vec.vec2 k k) |> Vec.getX
        , benchmark "VecADT" <|
            \_ -> VecADT.setX k (VecADT.vec2 k k) |> VecADT.getX
        , benchmark "VecRecord" <|
            \_ -> VecRecord.setX k (VecRecord.vec2 k k) |> VecRecord.getX
        , benchmark "VecTuple" <|
            \_ -> VecTuple.setX k (VecTuple.vec2 k k) |> VecTuple.getX
        ]


main : BenchmarkProgram
main =
    program suite
