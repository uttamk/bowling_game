defmodule BowlingGame.Game do
  import BowlingGame.Game.Guards

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

  defp frame_scores([]), do: []

  defp frame_scores(frames) do
    no_of_throws = number_of_throws(frames)

    first_frame = Enum.take(frames, no_of_throws)
    following_frames = Enum.drop(frames, no_of_throws)

    [single_frame_score(first_frame, following_frames)] ++ frame_scores(following_frames)
  end

  defp number_of_throws([first | _]) when first == 10, do: 1
  defp number_of_throws(_), do: 2

  defp single_frame_score(frame, following_frames) do
    frame_score = Enum.sum(frame)

    frame_score + strike_bonus_if_any(frame, following_frames) +
      spare_bonus_if_any(frame, following_frames)
  end

  defp spare_bonus_if_any(frame, following_frames) do
    is_spare?(frame)
    |> spare_bonus(following_frames)
  end

  defp is_spare?(frame) when length(frame) == 1, do: false
  defp is_spare?(frame), do: Enum.sum(frame) == 10

  defp spare_bonus(_is_spare = false, _), do: 0
  defp spare_bonus(_is_spare = true, [first | _rest]), do: first

  defp strike_bonus_if_any(frame, following_frames) do
    is_strike?(frame)
    |> strike_bonus(following_frames)
  end

  defp is_strike?(frame) when has_multiple_throws?(frame), do: false
  defp is_strike?(frame), do: Enum.sum(frame) == 10

  defp strike_bonus(_is_strike = false, _), do: 0
  defp strike_bonus(_is_strike = true, frames) when is_last_frame?(frames), do: 0
  defp strike_bonus(_is_strike = true, [first | [second | _rest]]), do: first + second
end
