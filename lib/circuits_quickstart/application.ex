defmodule CircuitsQuickstart.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  def start(_type, _args) do
    if target() != :host do
      setup_wifi()
    end

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: CircuitsQuickstart.Supervisor]

    children = []

    Supervisor.start_link(children, opts)
  end

  defp setup_wifi() do
    kv = Nerves.Runtime.KV.get_all()

    if true?(kv["wifi_force"]) or wlan0_unconfigured?() do
      ssid = kv["wifi_ssid"]
      passphrase = kv["wifi_passphrase"]

      unless empty?(ssid) do
        _ = VintageNetWiFi.quick_configure(ssid, passphrase)
        :ok
      end
    end
  end

  defp wlan0_unconfigured?() do
    "wlan0" in VintageNet.configured_interfaces() and
      VintageNet.get_configuration("wlan0") == %{type: VintageNetWiFi}
  end

  defp true?(""), do: false
  defp true?(nil), do: false
  defp true?("false"), do: false
  defp true?("FALSE"), do: false
  defp true?(_), do: true

  defp empty?(""), do: true
  defp empty?(nil), do: true
  defp empty?(_), do: false

  defp target() do
    Application.get_env(:circuits_quickstart, :target)
  end
end
