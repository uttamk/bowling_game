defmodule GameTest do
  use ExUnit.Case
  doctest BowlingGame.Game

  test "gutter game" do
    game_state = %BowlingGame.Game{
      rolled_pins: [0, 0, 0]
    }

    assert BowlingGame.Game.score(game_state) == 0
  end

  test "roll all ones" do
    game_state = %BowlingGame.Game{
      rolled_pins: [1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1]
    }

    assert BowlingGame.Game.score(game_state) == 20
  end

  test "roll one spare" do
    game_state = %BowlingGame.Game{
      rolled_pins: [5, 5, 3, 3, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]
    }

    assert BowlingGame.Game.score(game_state) == 19
  end

  test "roll one strike" do
    game_state = %BowlingGame.Game{
      rolled_pins: [10, 3, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]
    }

    assert BowlingGame.Game.score(game_state) == 24
  end

  test "perfect game" do
    game_state = %BowlingGame.Game{
      rolled_pins: [10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10]
    }

    assert BowlingGame.Game.score(game_state) == 300
  end
end
