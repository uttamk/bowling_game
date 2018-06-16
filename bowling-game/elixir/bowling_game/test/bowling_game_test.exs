defmodule BowlingGameTest do
  use ExUnit.Case
  doctest BowlingGame

  test "intital score is zero" do
    game_pid = BowlingGame.start()

    assert BowlingGame.score(game_pid) == 0
  end

  test "gutter game" do
    game_pid = BowlingGame.start()

    game_pid |> roll_many(20, 0)

    assert BowlingGame.score(game_pid) == 0
  end

  test "roll all ones" do
    game_pid = BowlingGame.start()

    game_pid |> roll_many(20, 1)

    assert BowlingGame.score(game_pid) == 20
  end

  def roll_many(game_pid, times, pins) do
    Enum.each(1..times, fn x -> BowlingGame.roll(game_pid, pins) end)
    game_pid
  end
end
