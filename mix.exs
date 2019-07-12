defmodule CircuitsQuickstart.MixProject do
  use Mix.Project

  @all_targets [:rpi, :rpi0, :rpi2, :rpi3, :rpi3a, :bbb, :x86_64]

  def project do
    [
      app: :circuits_quickstart,
      version: "0.1.0",
      elixir: "~> 1.8",
      archives: [nerves_bootstrap: "~> 1.5"],
      start_permanent: Mix.env() == :prod,
      build_embedded: true,
      aliases: [loadconfig: [&bootstrap/1]],
      deps: deps()
    ]
  end

  # Starting nerves_bootstrap adds the required aliases to Mix.Project.config()
  # Aliases are only added if MIX_TARGET is set.
  def bootstrap(args) do
    Application.start(:nerves_bootstrap)
    Mix.Task.run("loadconfig", args)
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger, :runtime_tools, :inets]
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      # Dependencies for all targets
      {:nerves, "~> 1.5.0", runtime: false},
      {:shoehorn, "~> 0.4"},
      {:ring_logger, "~> 0.6"},
      {:toolshed, "~> 0.2"},
      {:distillery, "~> 2.1"},

      # Circuits projects
      {:circuits_uart, "~> 1.3"},
      {:circuits_gpio, "~> 0.4"},
      {:circuits_i2c, "~> 0.3"},
      {:circuits_spi, "~> 0.1"},
      {:power_control, github: "cjfreeze/power_control"},
      {:ramoops_logger, "~> 0.1"},

      # Dependencies for all targets except :host
      {:nerves_runtime, "~> 0.6", targets: @all_targets},
      {:nerves_init_gadget, "~> 0.4",
       github: "nerves-project/nerves_init_gadget", branch: "user_password", targets: @all_targets},

      # Dependencies for specific targets
      {:nerves_system_rpi, "~> 1.8", runtime: false, targets: :rpi},
      {:nerves_system_rpi0, "~> 1.8", runtime: false, targets: :rpi0},
      {:nerves_system_rpi2, "~> 1.8", runtime: false, targets: :rpi2},
      {:nerves_system_rpi3, "~> 1.8", runtime: false, targets: :rpi3},
      {:nerves_system_rpi3a, "~> 1.8", runtime: false, targets: :rpi3a},
      {:nerves_system_bbb, "~> 2.3", runtime: false, targets: :bbb},
      {:nerves_system_x86_64, "~> 1.8", runtime: false, targets: :x86_64}
    ]
  end
end
