defmodule CircuitsQuickstart.MixProject do
  use Mix.Project

  @app :circuits_quickstart
  @version "0.13.0"
  @all_targets [
    :trellis,
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
    :mangopi_mq_pro,
    :qemu_aarch64
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
      {:nerves_core_dump, path: "~/git/nerves-project/nerves_core_dump"},
      {:nerves_runtime, "~> 0.13.0",
       targets: @all_targets, path: "~/git/nerves-project/nerves_runtime", override: true},
      {:nerves_motd,
       targets: @all_targets, path: "~/git/nerves-project/nerves_motd", override: true},
      {:nerves_pack, "~> 0.7.0", targets: @all_targets},
      {:vintage_net_wifi, "~> 0.12.5", targets: @all_targets},

      # Dependencies for specific targets
      {:nerves_system_rpi0_2, "> 0.0.0",
       runtime: false,
       targets: :rpi0_2,
       path: "~/nerves/nerves_system_br/o/configs/nerves_system_rpi0_2"},
      {:nerves_system_rpi5, "> 0.0.0",
       runtime: false,
       targets: :rpi5,
       path: "~/nerves/nerves_system_br/o/configs/nerves_system_rpi5"},
      {:nerves_system_rpi4, "> 0.0.0",
       runtime: false,
       targets: :rpi4,
       path: "~/nerves/nerves_system_br/o/configs/nerves_system_rpi4"},
      {:nerves_system_trellis, "> 0.0.0",
       runtime: false,
       targets: :trellis,
       path: "~/nerves/nerves_system_br/o/configs/nerves_system_trellis"},
      {:nerves_system_qemu_aarch64, "> 0.0.0",
       runtime: false,
       targets: :qemu_aarch64,
       path: "~/nerves/nerves_system_br/o/configs/nerves_system_qemu_aarch64"}
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
