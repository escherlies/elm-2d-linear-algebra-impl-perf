module Multi.GetAndSet exposing (..)

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
    describe "get and set x"
        [ benchmark "Vec" <|
            \_ -> Vec.setX (Vec.getX (Vec.vec2 k k)) (Vec.vec2 k k)
        , benchmark "VecADT" <|
            \_ -> VecADT.setX (VecADT.getX (VecADT.vec2 k k)) (VecADT.vec2 k k)
        , benchmark "VecRecord" <|
            \_ -> VecRecord.setX (VecRecord.getX (VecRecord.vec2 k k)) (VecRecord.vec2 k k)
        , benchmark "VecTuple" <|
            \_ -> VecTuple.setX (VecTuple.getX (VecTuple.vec2 k k)) (VecTuple.vec2 k k)
        ]


main : BenchmarkProgram
main =
    program suite
