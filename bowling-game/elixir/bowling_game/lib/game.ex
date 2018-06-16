defmodule BowlingGame.Game do
  defstruct(rolled_pins: [])

  def init do
    %BowlingGame.Game{}
  end

  def roll(game_state, pins) do
    %BowlingGame.Game{
      rolled_pins: game_state.rolled_pins ++ [pins]
    }
  end

  def score(game_state) do
    frame_scores(game_state.rolled_pins)
    |> Enum.sum()
  end

  def frame_scores([]) do
    []
  end

  def frame_scores(rolled_pins) do
    no_of_throws = number_of_throws(rolled_pins)

    frame = Enum.take(rolled_pins, no_of_throws)
    rest = Enum.drop(rolled_pins, no_of_throws)

    [single_frame_score(frame, rest)] ++ frame_scores(rest)
  end

  def single_frame_score(frame, rest) do
    frame_score = Enum.sum(frame)
    frame_score + spare_bonus_if_any(frame, rest)
  end

  def spare_bonus_if_any(frame, rest) do
    is_spare?(frame)
    |> spare_bonus(rest)
  end

  def is_spare?(frame) do
    Enum.sum(frame) == 10
  end

  def spare_bonus(true, rest) do
    hd(rest)
  end

  def spare_bonus(false, _) do
    0
  end

  def number_of_throws(rolled_pins) when hd(rolled_pins) == 10 do
    1
  end

  def number_of_throws(_) do
    2
  end
end
