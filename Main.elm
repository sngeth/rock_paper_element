import Html exposing (..)
import Html.Events exposing (onClick)

type Element = Fire | Wind | Lightning | Earth
type Msg = NewGame
type alias Model =
  {
    playerName : String
  , gameStarted : Bool
  , elements : List Element
  }

initialModel : Model
initialModel =
    {
      playerName = "Anonymous"
    , gameStarted = False
    , elements = []
    }

view model =
  div []
    [
      button [ onClick NewGame] [ text "New Game" ]
    ]

update : Msg -> Model -> ( Model, Cmd Msg )
update msg  model =
  case msg of
    NewGame ->
      ({ model | gameStarted = True }, Cmd.none)

main : Program Never Model Msg
main =
  Html.program
    {
      init = (initialModel, Cmd.none)
          , view = view
          , update = update
          , subscriptions = (\_ -> Sub.none)
    }
