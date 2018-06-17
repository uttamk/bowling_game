defmodule BowlingGame.Game do
  @type pin_throw :: integer
  @type game_state :: list(pin_throw)
  @type game_score :: integer

  @spec init() :: game_state
  def init do
    []
  end

  @spec roll(game_state, pin_throw) :: game_state
  def roll(rolled_pins, pins) do
    rolled_pins ++ [pins]
  end

  @spec score(game_state) :: game_score
  def score(rolled_pins) do
    frame_scores(rolled_pins)
    |> Enum.sum()
  end

  defp frame_scores([]) do
    []
  end

  defp frame_scores(rolled_pins) do
    no_of_throws = number_of_throws(rolled_pins)

    frame = Enum.take(rolled_pins, no_of_throws)
    rest = Enum.drop(rolled_pins, no_of_throws)

    [single_frame_score(frame, rest)] ++ frame_scores(rest)
  end

  defp single_frame_score(frame, rest) do
    frame_score = Enum.sum(frame)
    frame_score + strike_bonus_if_any(frame, rest) + spare_bonus_if_any(frame, rest)
  end

  defp spare_bonus_if_any(frame, rest) do
    is_spare?(frame)
    |> spare_bonus(rest)
  end

  defp strike_bonus_if_any(frame, rest) do
    is_strike?(frame)
    |> strike_bonus(rest)
  end

  defp is_spare?(frame) when length(frame) == 1 do
    false
  end

  defp is_spare?(frame) do
    Enum.sum(frame) == 10
  end

  defp spare_bonus(_is_spare = true, rest) do
    hd(rest)
  end

  defp spare_bonus(_is_spare = false, _) do
    0
  end

  defp is_strike?(frame) when length(frame) != 1 do
    false
  end

  defp is_strike?(frame) do
    Enum.sum(frame) == 10
  end

  defp strike_bonus(_is_strike = true, rest) when length(rest) < 3 do
    0
  end

  defp strike_bonus(_is_strike = true, rest) do
    hd(rest) + hd(tl(rest))
  end

  defp strike_bonus(_is_strike = false, _) do
    0
  end

  defp number_of_throws(rolled_pins) when hd(rolled_pins) == 10 do
    1
  end

  defp number_of_throws(_) do
    2
  end
end
