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
    {:ok, 0}
  end

  def handle_call({:roll, pins}, _from, state) do
    state = state + pins
    {:reply, state, state}
  end

  def handle_call({:score}, _from, state) do
    {:reply, state, state}
  end
end
