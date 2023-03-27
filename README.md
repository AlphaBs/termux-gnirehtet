# Tethering from Android to Android via USB cable

## Requirements

- [Termux](https://wiki.termux.com/wiki/Installation): Install from F-Droid.
- [Termux-API](https://wiki.termux.com/wiki/Termux:API)

## Usage

1. Download file from [release](https://github.com/AlphaBs/termux-gnirehtet/releases) and extract it.
2. Run `./install.sh`.
3. [Connect to device](#USB-ADB-Connecting).
4. Run `./gnirehtet run`.

## USB ADB Connecting

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

## How it works

`gnirehtet` was originally for reverse-tethering, sharing PC's internet connection to Android device, using `adb`. I recompiled `gnirehtet` to make it executable on aarch64 Termux.

To run `adb` and connect to another device on Android, I used `termux-adb`.

## Build

### gnirehtet relay server

The binary of relay server (`gnirehtet`) in this repository was built for Termux, `aarch64`. However, you may want to build relay server yourself to run on difference environment.

To build relay server:

1. Install [cargo](https://rustup.rs/) to build Rust.
2. Run `build-gnirehtet.sh` script.

Compiled binary (named `gnirehtet`) will be located in the same directory where the script is executed.

### gnirehtet android app

Normally gnirehtet android app would works on most device so you don't need to build it yourself. The apk file in this repository is from [official gnirehtet release](https://github.com/Genymobile/gnirehtet/releases).

To build android app: [gnirehtet/DEVELOP.md](https://github.com/Genymobile/gnirehtet/blob/master/DEVELOP.md)

## Related projects

- [termux-adb](https://github.com/nohajc/termux-adb)
- [gnirehtet](https://github.com/Genymobile/gnirehtet)
