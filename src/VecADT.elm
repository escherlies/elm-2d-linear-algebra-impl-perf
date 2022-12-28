module VecADT exposing (..)


type V
    = V Float Float


vec2 : Float -> Float -> V
vec2 =
    V


add : V -> V -> V
add (V x1 y1) (V x2 y2) =
    V (x1 + x2) (y1 + y2)


sub : V -> V -> V
sub (V x1 y1) (V x2 y2) =
    V (x1 - x2) (y1 - y2)


scale : Float -> V -> V
scale k (V x y) =
    V (x * k) (y * k)


getX : V -> Float
getX (V x _) =
    x


setX : Float -> V -> V
setX x (V _ y) =
    V x y
