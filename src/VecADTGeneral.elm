module VecADTGeneral exposing (..)


type Vec a
    = Vec a a


add : Vec number -> Vec number -> Vec number
add (Vec x1 y1) (Vec x2 y2) =
    Vec (x1 + x2) (y1 + y2)


add2 : Vec number -> Vec number -> Vec number
add2 =
    lift2 (+)


add3 : Vec number -> Vec number -> Vec number
add3 (Vec x1 y1) (Vec x2 y2) =
    Vec ((+) x1 x2) ((+) y1 y2)


scale : number -> Vec number -> Vec number
scale k (Vec x y) =
    Vec (x * k) (y * k)


lift2 : (a -> b -> c) -> Vec a -> Vec b -> Vec c
lift2 fn (Vec x1 y1) (Vec x2 y2) =
    Vec (fn x1 x2) (fn y1 y2)
