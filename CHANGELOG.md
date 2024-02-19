# Changelog

## v0.9.0 - 2024-02-18

* Updates
  * Update Nerves systems to `nerves_system_br v1.26.1` (Erlang/OTP 26.2.2,
    Buildroot 2023.11.1)
  * Update Circuits.GPIO to v2
  * Update all other dependencies to latest

## v0.8.1 - 2023-12-28

* Updates
  * Fix Raspberry Pi 3 (`rpi3`) regression in v0.8.0 that prevented it from
    booting.
  * Update Elixir to 1.16.0

## v0.8.0 - 2023-12-18

* Updates
  * Update Nerves systems to `nerves_system_br v1.25.2` (Erlang/OTP 26.1.2,
    Buildroot 2023.08.4)
  * Add experimental Raspberry Pi 5 image (rpi5)`
  * Add 64-bit Raspberry Pi Zero W (rpi0_2)
  * Update Circuits.I2C and Circuits.SPI to v2 versions
  * Update all other dependencies to latest

## v0.7.1 - 2023-10-09

* Updates
  * Update Nerves systems to `nerves_system_br v1.24.1` (Erlang/OTP 26.1.1,
    Buildroot 2023.05.3)

## v0.7.0 - 2023-09-27

* Updates
  * Update Nerves systems to `nerves_system_br v1.24.0` (Erlang/OTP 26.1,
    Buildroot 2023.05.2)
  * Update to Elixir 1.15.6

## v0.6.1 - 2023-07-28

* Fixes
  * UART, I2C, and SPI PMODs should work on GRiSP2 boards now

* Updates
  * Update Nerves systems to `nerves_system_br v1.23.2` (Erlang/OTP 26.0.2,
    Buildroot 2023.02.3)
  * Update to Elixir 1.15.4

## v0.6.0 - 2023-07-14

Updates:

* Update Nerves systems to `nerves_system_br v1.23.0` (Erlang/OTP 26.0.2,
  Buildroot 2023.02.2)
* Update to Elixir 1.15.2
* Update all dependencies to latest

## v0.5.6 - 2023-04-05

Updates:

* Update Nerves systems to `nerves_system_br v1.22.5` (Erlang/OTP 25.3,
  Buildroot 2022.11.3)
* Update all dependencies to latest

## v0.5.5 - 2023-02-11

Updates:

* Update Nerves systems to `nerves_system_br v1.22.1` (Erlang/OTP 25.2,
  Buildroot 2022.11)
* Update all dependencies to latest

## v0.5.4 - 2022-12-19

Updates:

* Update Nerves systems to `nerves_system_br v1.21.6` (Erlang/OTP 25.2)
* Update to Elixir 1.14.2

## v0.5.3 - 2022-11-07

Updates:

* Update Nerves systems to `nerves_system_br v1.21.2` (Erlang/OTP 25.1.2,
  Buildroot 2022.08.1)
* Update to Nerves 1.9
* Update to Elixir 1.14.1

## v0.5.2 - 2022-08-29

Updates:

* USB gadget mode networking works on the MangoPi MQ-Pro now
* Add `pinout` package. Run `Pinout.print` to see what pins go where

## v0.5.1 - 2022-08-08

Updates:

* Update to `nerves_system_br v1.20.4`-based systems (Erlang/OTP 25.0.3,
  Buildroot 2022.05, GCC 11.3)

## v0.5.0 - 2022-07-08

Updates:

* Update to `nerves_system_br v1.20.0`-based systems (Erlang/OTP 25.0.2,
  Buildroot 2022.05, GCC 11.3)
* Update to Nerves 1.8.0
* Remove default US WiFi regulatory domain. The default is now `00` for globally
  allowed frequencies.
* Add support for MangoPi MQ Pro (64-bit RISC-V device)

## v0.4.16 - 2022-05-25

Updates:

* Update to `nerves_system_br v1.19.0`-based systems (Erlang/OTP 25.0). This
  enables the JIT on the RPi4

## v0.4.15 - 2022-05-08

Updates:

* Support WiFi configuration when making the MicroSD card when using `fwup`.
  Thanks to @mnishiguchi for this.

## v0.4.14 - 2022-03-18

Updates:

* Update to `nerves_system_br v1.18.6`-based systems (Erlang/OTP 24.3.2)
* Update other dependencies (various improvements for BBB, GRiSP 2, and boot
  time performance)

## v0.4.13 - 2022-03-03

Updates:

* Various small improvements for the GRiSP 2
* Add support for the Beaglebone Green Gateway (bbb target)
* Update to Erlang 24.2.2

## v0.4.12 - 2022-02-28

Updates:

* Add experimental support for the GRiSP 2. See README for installation.

## v0.4.11 - 2022-02-13

Updates:

* Update to `nerves_system_br v1.18.4`-based systems (Erlang/OTP 24.2.1)
* Update `circuits_spi` to support devices that need the least significant bit
  first

## v0.4.10 - 2022-01-16

Updates:

* Simplify the ssh login to ignore the user. The login is not secure anyway and
  this skips the step of fixing the user when you forget to specify it.
* Update to `nerves_system_br v1.18.3`-based systems. This fixes a `cpufreq`
  regression on Raspberry Pi.

## v0.4.9 - 2021-12-31

Updates:

* Update to `nerves_system_br v1.18.2`-based systems (Erlang/OTP 24.2)

## v0.4.8 - 2021-12-28

Updates:

* Update to `nerves_system_br v1.17.4`-based systems (Erlang/OTP 24.1.7)
* Update to Elixir 1.13
* Update other dependencies to latest

## v0.4.7

Updates:

* Update to `nerves_system_br v1.17.3`-based systems (Erlang/OTP 24.1.4)
* Support USB gadget networking on Raspberry Pi 4
* Support the Raspberry Pi Zero 2 W (use the `rpi3a` version)

## v0.4.6

Updates:

* Add new Nerves MOTD
* Update all dependencies to latest

## v0.4.5

Updates:

* Update to `nerves_system_br v1.16.1` systems (Erlang/OTP 24.0.3)

## v0.4.4

Updates:

* Update to `nerves_system_br v1.15.0` systems (Erlang/OTP 23.2.7)
* Remove Giant Board support since it doesn't support nerves_system_br v1.15.0

## v0.4.3

Updates

* Add support for the Seeed Studio NPi IMX6ULL and Giant Board
* Update to `nerves_system_br v1.14.4` systems

## v0.4.2

WiFi configuration is easier now! To scan for networks, run
`VintageNetWiFi.quick_scan` and then to connect, run
`VintageNetWiFi.quick_configure("ssid", "password")`.

Updates:

* Update Nerves systems to the latest (`nerves_system_br v1.13.7`-based)
* Update `circuits_i2c` so that it includes the new `discover_*` helper
  functions
* Update `vintage_net_wifi` to pull in the "quick" helper functions

## v0.4.1

Updates:

* Update Nerves systems to latest (`nerves_system_br v1.13.5`-based)
* Raspberry Pi 4 now runs in 64-bit mode
* Path autocompletion at IEx prompt

## v0.4.0

Updates:

* Add support for the OSD32MP1
* Update to use `nerves_ssh` and properly support username/password access to
  the device
* Build with Elixir 1.11.1
* Update Nerves systems to latest (`nerves_system_br v1.13.2`-based)

## v0.3.0

Updates:

* Update to Nerves 1.6 and VintageNet/NervesPack

## v0.2.1

Updates:

* Update all Nerves Systems (Raspberry Pi's to v1.9.0 and BBB to v2.4.0)
* Keep symbols so that help is available

## v0.2.0

Updates:

* Update to Nerves 1.5
* Add support for the Raspberry Pi 4
* Support non-USB gadget board networking (like RPi B+, 2, and 3)
* Set the clock via NTP on boards with Ethernet

## v0.1.0

Initial release
