defmodule CircuitsQuickstart.MixProject do
  use Mix.Project

  @app :circuits_quickstart
  @version "0.5.5"
  @all_targets [
    :rpi,
    :rpi0,
    :rpi2,
    :rpi3,
    :rpi3a,
    :rpi4,
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
      {:nerves, "~> 1.9.3", runtime: false},
      {:shoehorn, "~> 0.9.0"},
      {:ring_logger, "~> 0.9"},
      {:toolshed, "~> 0.3"},

      # Circuits projects
      {:circuits_uart, "~> 1.3"},
      {:circuits_gpio, "~> 1.0"},
      {:circuits_i2c, "~> 1.0"},
      {:circuits_spi, "~> 1.2"},
      {:pinout, "~> 0.1"},
      {:power_control, github: "cjfreeze/power_control"},
      {:ramoops_logger, "~> 0.3", targets: @all_targets},

      # Dependencies for all targets except :host
      {:nerves_runtime, "~> 0.13.0", targets: @all_targets},
      {:nerves_pack, "~> 0.7.0", targets: @all_targets},

      # Dependencies for specific targets
      {:nerves_system_rpi, "~> 1.22", runtime: false, targets: :rpi},
      {:nerves_system_rpi0, "~> 1.22", runtime: false, targets: :rpi0},
      {:nerves_system_rpi2, "~> 1.22", runtime: false, targets: :rpi2},
      {:nerves_system_rpi3, "~> 1.22", runtime: false, targets: :rpi3},
      {:nerves_system_rpi3a, "~> 1.22", runtime: false, targets: :rpi3a},
      {:nerves_system_rpi4, "~> 1.22", runtime: false, targets: :rpi4},
      {:nerves_system_bbb, "~> 2.17", runtime: false, targets: :bbb},
      {:nerves_system_osd32mp1, "~> 0.13", runtime: false, targets: :osd32mp1},
      {:nerves_system_x86_64, "~> 1.22", runtime: false, targets: :x86_64},
      {:nerves_system_npi_imx6ull, "~> 0.9", runtime: false, targets: :npi_imx6ull},
      {:nerves_system_grisp2, "~> 0.6", runtime: false, targets: :grisp2},
      {:nerves_system_mangopi_mq_pro, "~> 0.4", runtime: false, targets: :mangopi_mq_pro}
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
