defmodule RmDemoWeb.Drain do
  use Routemaster.Drain

  alias Routemaster, as: RM
  alias RmDemoWeb.DrainListener

  drain RM.Drains.Dedup
  drain RM.Drains.IgnoreStale
  drain RM.Drains.FetchAndCache
  drain RM.Drains.Notify, listener: DrainListener
end

defmodule RmDemoWeb.DrainListener do
  require Logger

  def call(events) do
    Logger.info """
    [#{__MODULE__}]: #{length(events)} events received:
    #{inspect events}
    """
  end
end
