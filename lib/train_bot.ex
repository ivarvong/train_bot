defmodule TrainBot do
  use Application

  def start(_type, _args) do
    import Supervisor.Spec, warn: false

    port = System.get_env("PORT") |> String.to_integer
    IO.puts "port=#{port}"

    children = [
      Plug.Adapters.Cowboy.child_spec(:http, TrainBot.Web, [], [port: port])
    ]

    opts = [strategy: :one_for_one, name: TrainBot.Supervisor]
    Supervisor.start_link(children, opts)
  end
end
