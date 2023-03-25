# Tethering from Android to Android via USB cable

## Requirements

- [Termux](https://wiki.termux.com/wiki/Installation): Install from F-Droid.
- [Termux-API](https://wiki.termux.com/wiki/Termux:API)

## Install

1. Download file from [release](https://github.com/AlphaBs/termux-gnirehtet/releases) and extract it.
2. Run `./install`.
3. [Connect devices](#android-usb-debugging-using-termux).
4. Run `./gnirehtet start`.

## Android USB Debugging using Termux

Tethering device: The device sharing its internet connection.

Tethered deivce: The device want to connect to internet through 'tethering device'.

1. Make sure to turn on USB debugging on tethered device.
2. Run `adb start-server` on tethering deivce.
3. Connect two android device via USB cable.
4. Set USB controlling mode: 
   - Tethering device: USB controlled by connected device
   - Tethered device: USB controlled by this device
5. Allow permission to access file system and USB debugging.
6. Running `adb devices` on tethering device should print connected device.

## Related projects

- [termux-adb](https://github.com/nohajc/termux-adb)
- [gnirehtet](https://github.com/Genymobile/gnirehtet)