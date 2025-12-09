# This file is responsible for configuring your application and its
# dependencies.
#
# This configuration file is loaded before any dependency and is restricted to
# this project.
import Config

# Enable the Nerves integration with Mix
Application.start(:nerves_bootstrap)

# Customize non-Elixir parts of the firmware. See
# https://hexdocs.pm/nerves/advanced-configuration.html for details.

config :nerves, :firmware,
  rootfs_overlay: "rootfs_overlay",
  provisioning: "config/provisioning.conf"

# Set the SOURCE_DATE_EPOCH date for reproducible builds.
# See https://reproducible-builds.org/docs/source-date-epoch/ for more information

config :nerves, source_date_epoch: "1603310828"

config :nerves_motd,
  logo: [
    IO.ANSI.color(5),
    """

                    ;kX'
                  ,0XXXl
                 xNXNNXX.
               'KNNXXXXX0.
              ;XNNNNNNNNN0.
             ;XNNNNNNNNNNNX:
            .XNNNXXXXXXXXXXXO.
            kNNNXNNNNXXNXXNNXNo
           .NNNXNNNNNXXNNXNNXXXO
           cXXXNNNNNNXXNNNNNNNNNd
           lNNNNNNNNNXXNXXXNNNNNK
           'NNXNXNXXXXXXXXXNNNNNk
            oNXNXXXXXNXXXNNNNXXX.
             :KXXXXXXNXXXNNNNXk.
               ;xXNXXXXNXXX0o.
                  .',::;,.

    """,
    IO.ANSI.reset(),
    """
          Elixir Circuits Quickstart

    All of the Elixir Circuits projects are available in this firmware
    image. See https://github.com/elixir-circuits/circuits_quickstart for
    more details.

    """
  ]

if Mix.target() != :host do
  import_config "target.exs"
end
