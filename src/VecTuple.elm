module VecTuple exposing (..)


type alias V =
    ( Float, Float )


vec2 : a -> b -> ( a, b )
vec2 x y =
    ( x, y )


add : V -> V -> V
add ( x1, y1 ) ( x2, y2 ) =
    ( x1 + x2, y1 + y2 )


sub : V -> V -> V
sub ( x1, y1 ) ( x2, y2 ) =
    ( x1 - x2, y1 - y2 )


scale : Float -> V -> V
scale k ( x, y ) =
    ( x * k, y * k )


getX : V -> Float
getX ( x, _ ) =
    x


setX : Float -> V -> V
setX x ( _, y ) =
    ( x, y )
