module Suite exposing (..)

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
    describe "Implementation"
        [ benchmark "Vec" <|
            \_ ->
                Vec.vec2 k k
                    |> Vec.setX k
                    |> Vec.getX
                    |> Vec.scale
                    |> flip (Vec.vec2 k k)
                    |> Vec.add (Vec.vec2 k k)
        , benchmark "VecADT" <|
            \_ ->
                VecADT.vec2 k k
                    |> VecADT.setX k
                    |> VecADT.getX
                    |> VecADT.scale
                    |> flip (VecADT.vec2 k k)
                    |> VecADT.add (VecADT.vec2 k k)
        , benchmark "VecRecord" <|
            \_ ->
                VecRecord.vec2 k k
                    |> VecRecord.setX k
                    |> VecRecord.getX
                    |> VecRecord.scale
                    |> flip (VecRecord.vec2 k k)
                    |> VecRecord.add (VecRecord.vec2 k k)
        , benchmark "VecTuple" <|
            \_ ->
                VecTuple.vec2 k k
                    |> VecTuple.setX k
                    |> VecTuple.getX
                    |> VecTuple.scale
                    |> flip (VecTuple.vec2 k k)
                    |> VecTuple.add (VecTuple.vec2 k k)
        ]


flip : a -> (a -> b) -> b
flip a b =
    b a


main : BenchmarkProgram
main =
    program suite
