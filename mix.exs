defmodule Plug01.MixProject do
  use Mix.Project

  def project do
    [
      app: :plug01,
      version: "0.1.0",
      elixir: "~> 1.6",
      start_permanent: Mix.env() == :prod,
      deps: deps()
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      mod: {Plug01.Application, []},
      extra_applications: [:logger],
      applications: [:cowboy, :plug, :httpoison]
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:cowboy, "~> 1.0.0"},
      {:plug, "~> 1.4"},
      {:httpoison, "~> 1.0"}
    ]
  end
end
