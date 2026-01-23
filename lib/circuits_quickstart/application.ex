defmodule CircuitsQuickstart.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  def start(_type, _args) do
    if Nerves.Runtime.mix_target() != :host do
      advertise_device()
      setup_wifi()
    end

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: CircuitsQuickstart.Supervisor]

    children = []

    Supervisor.start_link(children, opts)
  end

  defp advertise_device() do
    # See https://hexdocs.pm/nerves_discovery/
    MdnsLite.add_mdns_service(%{
      id: :nerves_device,
      protocol: "nerves-device",
      transport: "tcp",
      port: 0,
      txt_payload: %{
        "serial" => Nerves.Runtime.serial_number(),
        "product" => Nerves.Runtime.KV.get_active("nerves_fw_product"),
        "description" => Nerves.Runtime.KV.get_active("nerves_fw_description"),
        "version" => Nerves.Runtime.KV.get_active("nerves_fw_version"),
        "platform" => Nerves.Runtime.KV.get_active("nerves_fw_platform"),
        "architecture" => Nerves.Runtime.KV.get_active("nerves_fw_architecture"),
        "author" => Nerves.Runtime.KV.get_active("nerves_fw_author"),
        "uuid" => Nerves.Runtime.KV.get_active("nerves_fw_uuid")
      }
    })
  end

  defp setup_wifi() do
    kv = Nerves.Runtime.KV.get_all()

    if true?(kv["wifi_force"]) or not wlan0_configured?() do
      ssid = kv["wifi_ssid"]
      passphrase = kv["wifi_passphrase"]

      if !empty?(ssid) do
        _ = VintageNetWiFi.quick_configure(ssid, passphrase)
        :ok
      end
    end
  end

  defp wlan0_configured?() do
    VintageNet.get_configuration("wlan0") |> VintageNetWiFi.network_configured?()
  catch
    _, _ -> false
  end

  defp true?(""), do: false
  defp true?(nil), do: false
  defp true?("false"), do: false
  defp true?("FALSE"), do: false
  defp true?(_), do: true

  defp empty?(""), do: true
  defp empty?(nil), do: true
  defp empty?(_), do: false
end
