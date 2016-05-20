defmodule TrainBot.Mixfile do
  use Mix.Project

  def project do
    [app: :train_bot,
     version: "0.0.1",
     elixir: "~> 1.2",
     build_embedded: Mix.env == :prod,
     start_permanent: Mix.env == :prod,
     deps: deps]
  end

  def application do
    [applications: [:logger, :httpoison, :plug, :cowboy],
     mod: {TrainBot, []}]
  end

  defp deps do
    [{:httpoison, "~> 0.8.0"},
     {:floki,     "~> 0.8"},
     {:poison,    "~> 2.0"},
     {:cowboy,    "~> 1.0.0"},
     {:plug,      "~> 1.0"}]
  end
end
