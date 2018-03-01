defmodule Crazy.LightningListener do
  use GenServer
  alias GrovePi.Lightning

  def start_link([]) do
    GenServer.start_link(__MODULE__, [], name: __MODULE__)
  end

  def init([]) do
    Lightning.subscribe(:lightning)
    Lightning.subscribe(:disturber_detected)
    Lightning.subscribe(:noise_level_too_high)
    {:ok, []}
  end

  def handle_info({event, distance}, state) do
    IO.puts "#{event} @ #{distance} km"
    {:noreply, state}
  end
end
