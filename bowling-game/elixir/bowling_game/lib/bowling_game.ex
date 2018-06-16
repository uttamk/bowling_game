defmodule BowlingGame do
  def start() do
    {:ok, pid} = GenServer.start(BowlingGameServer, [])
    pid
  end

  def roll(game_pid, pins) do
    GenServer.call(game_pid, {:roll, pins})
  end

  def score(game_pid) do
    GenServer.call(game_pid, {:score})
  end
end

defmodule BowlingGameServer do
  use GenServer

  def init(_args) do
    {:ok, BowlingGame.Game.init()}
  end

  def handle_call({:roll, pins}, _from, state) do
    state = BowlingGame.Game.roll(state, pins)
    {:reply, state, state}
  end

  def handle_call({:score}, _from, state) do
    score = BowlingGame.Game.score(state)
    {:reply, score, state}
  end
end

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
    Enum.sum(game_state.rolled_pins)
  end
end
