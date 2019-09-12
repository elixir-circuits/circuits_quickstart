# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# Customize non-Elixir parts of the firmware. See
# https://hexdocs.pm/nerves/advanced-configuration.html for details.

config :nerves, :firmware, rootfs_overlay: "rootfs_overlay"
config :nerves_runtime, :kernel, use_system_registry: false

# Use shoehorn to start the main application. See the shoehorn
# docs for separating out critical OTP applications such as those
# involved with firmware updates.

config :shoehorn,
  init: [:nerves_runtime, :nerves_init_gadget],
  app: Mix.Project.config()[:app]

# Use Ringlogger as the logger backend and remove :console.
# See https://hexdocs.pm/ring_logger/readme.html for more information on
# configuring ring_logger.

config :logger, backends: [RingLogger, RamoopsLogger]

# Configure nerves_init_gadget.
# See https://hexdocs.pm/nerves_init_gadget/readme.html for more information.

# Setting the node_name will enable Erlang Distribution.
# Only enable this for prod if you understand the risks.
node_name = if Mix.env() != :prod, do: "circuits_quickstart"

network_config =
  case Mix.target() do
    board when board in [:rpi0, :rpi3a, :bbb] ->
      [ifname: "usb0", address_method: :dhcpd]

    board when board in [:rpi, :rpi2, :rpi3, :rpi4, :x86_64] ->
      [ifname: "eth0", address_method: :dhcp]

    :host ->
      []
  end

init_gadget_config =
  network_config ++
    [
      mdns_domain: "nerves.local",
      node_name: node_name,
      node_host: :mdns_domain,
      ssh_user_passwords: [{"circuits", "circuits"}]
    ]

config :nerves_init_gadget, init_gadget_config

# Import target specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
# Uncomment to use target specific configurations

# import_config "#{Mix.target()}.exs"
