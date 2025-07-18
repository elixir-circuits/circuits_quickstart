defmodule CircuitsQuickstart.MixProject do
  use Mix.Project

  @app :circuits_quickstart
  @version "0.13.1"
  @all_targets [
    :rpi,
    :rpi0,
    :rpi0_2,
    :rpi2,
    :rpi3,
    :rpi3a,
    :rpi4,
    :rpi5,
    :bbb,
    :osd32mp1,
    :x86_64,
    :npi_imx6ull,
    :grisp2,
    :mangopi_mq_pro
  ]

  def project do
    [
      app: @app,
      version: @version,
      elixir: "~> 1.16",
      archives: [nerves_bootstrap: "~> 1.10"],
      start_permanent: Mix.env() == :prod,
      deps: deps(),
      releases: [{@app, release()}]
    ]
  end

  def application do
    [
      mod: {CircuitsQuickstart.Application, []},
      extra_applications: [:logger, :runtime_tools, :inets, :ssl]
    ]
  end

  def cli do
    [preferred_targets: [run: :host, test: :host]]
  end

  defp deps do
    [
      # Dependencies for all targets
      {:nerves, "~> 1.11", runtime: false},
      {:shoehorn, "~> 0.9.0"},
      {:ring_logger, "~> 0.9"},
      {:toolshed, "~> 0.3"},

      # Circuits projects
      {:circuits_uart, "~> 1.3"},
      {:circuits_gpio, "~> 2.0"},
      {:circuits_i2c, "~> 2.0"},
      {:circuits_spi, "~> 2.0"},
      {:pinout, "~> 0.1"},
      {:ramoops_logger, "~> 0.3", targets: @all_targets},

      # Dependencies for all targets except :host
      {:nerves_runtime, "~> 0.13.0", targets: @all_targets},
      {:nerves_pack, "~> 0.7.0", targets: @all_targets},
      {:vintage_net_wifi, "~> 0.12.5", targets: @all_targets},

      # Dependencies for specific targets
      {:nerves_system_rpi, "~> 1.31", runtime: false, targets: :rpi},
      {:nerves_system_rpi0, "~> 1.31", runtime: false, targets: :rpi0},
      {:nerves_system_rpi0_2, "~> 1.31", runtime: false, targets: :rpi0_2},
      {:nerves_system_rpi2, "~> 1.31", runtime: false, targets: :rpi2},
      {:nerves_system_rpi3, "~> 1.31", runtime: false, targets: :rpi3},
      {:nerves_system_rpi3a, "~> 1.31", runtime: false, targets: :rpi3a},
      {:nerves_system_rpi4, "~> 1.31", runtime: false, targets: :rpi4},
      {:nerves_system_rpi5, "~> 0.6", runtime: false, targets: :rpi5},
      {:nerves_system_bbb, "~> 2.27", runtime: false, targets: :bbb},
      {:nerves_system_osd32mp1, "~> 0.22", runtime: false, targets: :osd32mp1},
      {:nerves_system_x86_64, "~> 1.31", runtime: false, targets: :x86_64},
      {:nerves_system_npi_imx6ull, "~> 0.19", runtime: false, targets: :npi_imx6ull},
      {:nerves_system_grisp2, "~> 0.15", runtime: false, targets: :grisp2},
      {:nerves_system_mangopi_mq_pro, "~> 0.13", runtime: false, targets: :mangopi_mq_pro}
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
