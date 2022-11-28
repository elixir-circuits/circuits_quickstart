defmodule CircuitsQuickstart.MixProject do
  use Mix.Project

  @app :circuits_quickstart
  @version "0.5.4"
  @all_targets [
    :jslinux
  ]

  def project do
    [
      app: @app,
      version: @version,
      elixir: "~> 1.12",
      archives: [nerves_bootstrap: "~> 1.9"],
      start_permanent: Mix.env() == :prod,
      deps: deps(),
      releases: [{@app, release()}],
      preferred_cli_target: [run: :host, test: :host]
    ]
  end

  def application do
    [
      mod: {CircuitsQuickstart.Application, []},
      extra_applications: [:logger, :runtime_tools, :inets, :ssl]
    ]
  end

  defp deps do
    [
      # Dependencies for all targets
      {:nerves, "~> 1.9.0", runtime: false},
      {:shoehorn, "~> 0.9.0"},
      {:toolshed, "~> 0.2.13"},

      # Circuits projects
      {:circuits_gpio, "~> 1.0"},
      {:circuits_i2c, "~> 1.0"},

      # Dependencies for all targets except :host
      {:nerves_runtime, "~> 0.13.0", targets: @all_targets},
      {:nerves_motd, "~> 0.1", path: "~/git/nerves-project/nerves_motd", targets: @all_targets},
      {:ring_logger, "~> 0.8", targets: @all_targets},
      {:vintage_net, "~> 0.10", targets: @all_targets},
      {:vintage_net_ethernet, "~> 0.10", targets: @all_targets},

      # Dependencies for specific targets
      {:nerves_system_jslinux,
       path: "~/git/nerves-project/nerves_systems/src/nerves_system_jslinux",
       runtime: false,
       targets: :jslinux}
    ]
  end

  def release do
    [
      overwrite: true,
      cookie: "#{@app}_cookie",
      include_erts: &Nerves.Release.erts/0,
      steps: [&Nerves.Release.init/1, :assemble],
      strip_beams: [keep: ["Docs"]]
    ]
  end
end
