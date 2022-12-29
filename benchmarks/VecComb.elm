module VecComb exposing (..)

import Benchmark exposing (..)
import Benchmark.Runner exposing (BenchmarkProgram, program)
import Vec exposing (distance, distance2, vec2)


suite : Benchmark
suite =
    describe "Benchmark different set-z implementations"
        [ benchmark "distance"
            (\_ -> distance (vec2 1 1) (vec2 2 2))
        , benchmark "distance2"
            (\_ -> distance2 (vec2 1 1) (vec2 2 2))
        ]


main : BenchmarkProgram
main =
    program suite
