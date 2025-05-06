import Config

# Configure the network using vintage_net
# See https://github.com/nerves-networking/vintage_net for more information
config :vintage_net,
  config: [
    {"usb0", %{type: VintageNetDirect}},
    {"eth0", %{type: VintageNetEthernet, ipv4: %{method: :dhcp}}},
    {"wlan0", %{type: VintageNetWiFi}}
  ]

# The RPi5 supports WPA3 so this enables quick_configure to create WiFi
# configurations that support both WPA2 and WPA3.
config :vintage_net_wifi, :quick_configure, &VintageNetWiFi.Cookbook.generic/2
