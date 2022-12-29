module VecADTGeneral exposing (..)


type Vec number
    = Vec number number


add : Vec number -> Vec number -> Vec number
add (Vec x1 y1) (Vec x2 y2) =
    Vec (x1 + x2) (y1 + y2)


scale : number -> Vec number -> Vec number
scale k (Vec x y) =
    Vec (x * k) (y * k)
