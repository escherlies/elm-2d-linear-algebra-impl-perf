module VecRecord exposing (..)


type alias V =
    { x : Float, y : Float }


vec2 : Float -> Float -> V
vec2 =
    V


add : V -> V -> V
add v1 v2 =
    { x = v1.x + v2.x
    , y = v1.y + v2.y
    }


sub : V -> V -> V
sub v1 v2 =
    { x = v1.x - v2.x
    , y = v1.y - v2.y
    }


scale : Float -> V -> V
scale k { x, y } =
    { x = x * k
    , y = y * k
    }


getX : V -> Float
getX =
    .x


setX : Float -> V -> V
setX x v =
    { v | x = x }
