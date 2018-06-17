defmodule BowlingGame.Game.Guards do
  defguard is_last_frame?(frames) when length(frames) < 3

  defguard has_multiple_throws?(frame) when length(frame) != 1
end
