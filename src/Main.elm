module Main exposing (..)

import Browser
import Html exposing (Html, button, div, text)
import Html.Attributes exposing (class)
import Html.Events exposing (onClick)
import Random


main : Program () Model Msg
main =
    Browser.element
        { init = init
        , update = update
        , subscriptions = subscriptions
        , view = view
        }


subscriptions : Model -> Sub Msg
subscriptions _ =
    Sub.none


type alias Model =
    { number : Int }


init : () -> ( Model, Cmd Msg )
init _ =
    ( { number = 0 }, Cmd.none )


type Msg
    = Increment
    | Decrement
    | Reset
    | Roll
    | NewFace Int


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        Increment ->
            ( { model | number = model.number + 1 }, Cmd.none )

        Decrement ->
            ( { model | number = model.number - 1 }, Cmd.none )

        Reset ->
            ( { model | number = 0 }, Cmd.none )

        Roll ->
            ( model, Random.generate NewFace (Random.int 1 6) )

        NewFace newFace ->
            ( { model | number = newFace }, Cmd.none )


button_style : String -> String
button_style c =
    "bg-" ++ c ++ "-500 hover:bg-" ++ c ++ "-700 text-white font-bold py-2 px-4 rounded-full"


view : Model -> Html Msg
view model =
    div [ class "py-10 px-10 flex content-center" ]
        [ button [ onClick Increment, button_style "red" |> class ] [ text "Plus" ]
        , div [ class "bold px-4 font-bold" ] [ text (String.fromInt model.number) ]
        , button [ onClick Decrement, button_style "blue" |> class ] [ text "Minus" ]
        , button [ onClick Reset, button_style "purple" ++ " mx-4" |> class ] [ text "Reset" ]
        , button [ onClick Roll, button_style "red" ++ " mx-4" |> class ] [ text "Random" ]
        ]
