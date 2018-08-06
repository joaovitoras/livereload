defmodule Livereload.Mixfile do
  use Mix.Project

  def project do
    [
      app: :livereload,
      version: System.get_env("APP_VERSION") || "0.0.1",
      elixir: "~> 1.6",
      elixirc_paths: elixirc_paths(Mix.env),
      compilers: [:phoenix, :gettext] ++ Mix.compilers,
      start_permanent: Mix.env == :prod,
      deps: deps()
    ]
  end

  # Configuration for the OTP application.
  #
  # Type `mix help compile.app` for more information.
  def application do
    [
      mod: {Livereload.Application, []},
      extra_applications: [:logger, :runtime_tools]
    ]
  end

  # Specifies which paths to compile per environment.
  defp elixirc_paths(:test), do: ["lib", "test/support"]
  defp elixirc_paths(_),     do: ["lib"]

  # Specifies your project dependencies.
  #
  # Type `mix help deps` for examples and options.
  defp deps do
    [
      {:distillery, "~> 1.5"},
      {:phoenix, "~> 1.3.2"},
      {:phoenix_pubsub, "~> 1.0"},
      {:phoenix_html, "~> 2.10"},
      {:phoenix_live_reload, "~> 1.0", only: :dev},
      {:gettext, "~> 0.11"},
      {:cowboy, "~> 1.0"}
    ]
  end
end

# MIX_ENV=prod mix compile
# MIX_ENV=prod mix release
# PORT=4000 _build/prod/rel/livereload/bin/livereload start
# APP_VERSION=0.0.2 MIX_ENV=prod mix compile --force
# MIX_ENV=prod mix release --upgrade
# PORT=4000 _build/prod/rel/livereload/bin/livereload upgrade 0.2.2

