module VecSetters exposing (..)

import Benchmark exposing (..)
import Benchmark.Runner exposing (BenchmarkProgram, program)


type alias Vec3Tuple number =
    ( number, number, number )


type Vec3ADT number
    = Vec3ADT number number number


suite : Benchmark
suite =
    describe "Benchmark different set-z implementations"
        [ benchmark "Inline 1"
            (\_ -> (mapZAdt << always) 4 (Vec3ADT 1 2 3))
        , benchmark "Inline 2"
            (\_ -> mapZAdt (always 4) (Vec3ADT 1 2 3))
        , benchmark "setZ1"
            (\_ -> setZ1 4 (Vec3ADT 1 2 3))
        , benchmark "setZ2"
            (\_ -> setZ2 4 (Vec3ADT 1 2 3))
        , benchmark "setZ3"
            (\_ -> setZ3 4 (Vec3ADT 1 2 3))
        ]


mapZAdt : (number -> number) -> Vec3ADT number -> Vec3ADT number
mapZAdt fn (Vec3ADT a b c) =
    Vec3ADT a b (fn c)


setZ1 : number -> Vec3ADT number -> Vec3ADT number
setZ1 =
    mapZAdt << always


setZ2 : number -> Vec3ADT number -> Vec3ADT number
setZ2 k =
    mapZAdt (always k)


setZ3 : number -> Vec3ADT number -> Vec3ADT number
setZ3 z (Vec3ADT x y _) =
    Vec3ADT x y z


main : BenchmarkProgram
main =
    program suite
