module Main exposing (..)

import Browser
import Html exposing (Html, button, div, text)
import Html.Attributes exposing (class)
import Html.Events exposing (onClick)


main : Program () Model Msg
main =
    Browser.sandbox
        { init = init
        , update = update
        , view = view
        }


init : Model
init =
    { number = 0 }


type alias Model =
    { number : Int }


type Msg
    = Increment
    | Decrement
    | Reset


update : Msg -> Model -> Model
update msg model =
    case msg of
        Increment ->
            { model | number = model.number + 1 }

        Decrement ->
            { model | number = model.number - 1 }

        Reset ->
            { model | number = 0 }


button_style : String -> String
button_style c =
    "bg-" ++ c ++ "-500 hover:bg-" ++ c ++ "-700 text-white font-bold py-2 px-4 rounded-full"


view : Model -> Html Msg
view model =
    div [ class "py-10 px-10 flex content-center" ]
        [ button [ onClick Increment, button_style "red" |> class ] [ text "Plus" ]
        , div [ class "bold px-4 font-bold" ] [ text (String.fromInt model) ]
        , button [ onClick Decrement, button_style "blue" |> class ] [ text "Minus" ]
        , button [ onClick Reset, button_style "purple" ++ " mx-4" |> class ] [ text "Reset" ]
        ]
