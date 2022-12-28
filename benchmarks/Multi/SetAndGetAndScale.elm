module Multi.SetAndGetAndScale exposing (..)

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
    describe "set and get and scale"
        [ benchmark "Vec" <|
            \_ -> Vec.setX k (Vec.vec2 k k) |> Vec.getX |> Vec.scale |> flip (Vec.vec2 k k)
        , benchmark "VecADT" <|
            \_ -> VecADT.setX k (VecADT.vec2 k k) |> VecADT.getX |> VecADT.scale |> flip (VecADT.vec2 k k)
        , benchmark "VecRecord" <|
            \_ -> VecRecord.setX k (VecRecord.vec2 k k) |> VecRecord.getX |> VecRecord.scale |> flip (VecRecord.vec2 k k)
        , benchmark "VecTuple" <|
            \_ -> VecTuple.setX k (VecTuple.vec2 k k) |> VecTuple.getX |> VecTuple.scale |> flip (VecTuple.vec2 k k)
        ]


flip : a -> (a -> b) -> b
flip a b =
    b a


main : BenchmarkProgram
main =
    program suite
