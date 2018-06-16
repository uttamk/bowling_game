defmodule GameTest do
  use ExUnit.Case
  doctest BowlingGame.Game

  test "gutter game" do
    assert BowlingGame.Game.score([0, 0, 0]) == 0
  end

  test "roll all ones" do
    rolled_pins = [1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1]

    assert BowlingGame.Game.score(rolled_pins) == 20
  end

  test "roll one spare" do
    rolled_pins = [5, 5, 3, 3, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]

    assert BowlingGame.Game.score(rolled_pins) == 19
  end

  test "roll one strike" do
    rolled_pins = [10, 3, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]

    assert BowlingGame.Game.score(rolled_pins) == 24
  end

  test "perfect game" do
    rolled_pins = [10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10]

    assert BowlingGame.Game.score(rolled_pins) == 300
  end
end
