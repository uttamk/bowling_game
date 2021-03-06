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

  test "roll one spare" do
    game_pid = BowlingGame.start()

    game_pid
    |> roll_many(1, 7)
    |> roll_many(1, 3)
    |> roll_many(1, 4)
    |> roll_many(1, 5)
    |> roll_many(17, 0)

    assert BowlingGame.score(game_pid) == 23
  end


  test "roll one strike" do
    game_pid = BowlingGame.start()

    game_pid
    |> roll_many(1, 10)
    |> roll_many(1, 3)
    |> roll_many(1, 4)
    |> roll_many(17, 0)

    assert BowlingGame.score(game_pid) == 24
  end


  test "perfect game" do
    game_pid = BowlingGame.start()

    game_pid
    |> roll_many(12, 10)

    assert BowlingGame.score(game_pid) == 300
  end


  def roll_many(game_pid, times, pins) do
    Enum.each(1..times, fn _ -> BowlingGame.roll(game_pid, pins) end)
    game_pid
  end
end
