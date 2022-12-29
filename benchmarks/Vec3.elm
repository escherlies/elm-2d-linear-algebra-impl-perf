module Vec3 exposing (..)

import Benchmark exposing (..)
import Benchmark.Runner exposing (BenchmarkProgram, program)


type alias Vec3Tuple number =
    ( number, number, number )


type Vec3ADT number
    = Vec3ADT number number number


suite : Benchmark
suite =
    describe "Implementation"
        [ Benchmark.compare "Vec3 setZ"
            "ADT"
            (\_ -> setZADT 4 (Vec3ADT 1 2 3))
            "Tuple"
            (\_ -> setZT 4 ( 1, 2, 3 ))
        , Benchmark.compare "Vec3 setZ via map"
            "ADT"
            (\_ -> mapZAdt (always 4) (Vec3ADT 1 2 3))
            "Tuple"
            (\_ -> mapZT (always 4) ( 1, 2, 3 ))
        ]


mapZT : (c -> a) -> ( b, d, c ) -> ( b, d, a )
mapZT fn ( x, y, z ) =
    ( x, y, fn z )


mapZAdt : (number -> number) -> Vec3ADT number -> Vec3ADT number
mapZAdt fn (Vec3ADT a b c) =
    Vec3ADT a b (fn c)


setZADT : number -> Vec3ADT number -> Vec3ADT number
setZADT z (Vec3ADT x y _) =
    Vec3ADT x y z


setZT : number -> ( number, number, number ) -> ( number, number, number )
setZT z ( x, y, _ ) =
    ( x, y, z )


main : BenchmarkProgram
main =
    program suite
