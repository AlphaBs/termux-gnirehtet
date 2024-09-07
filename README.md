# Tethering from Android to Android via USB cable

- Tethering device: The device sharing its internet connection.
- Tethered deivce: The device want to connect to the Internet via 'tethering device'.

## Install for tethering device

- [Termux](https://github.com/termux/termux-app/releases/latest): Install from Github.
- [Termux-API](https://wiki.termux.com/wiki/Termux:API): Install from [Github](https://github.com/termux/termux-api/actions)

1. Clone the repository `git clone https://github.com/AlphaBs/termux-gnirehtet`
2. Run `pkg update && ./install.sh`.

## Usage

1. Make sure USB debugging is enabled on the tethered device.
2. Connect two Android devices with USB cable.
3. Set USB control mode: 
   - Tethering device: USB controlled by connected device
   - Tethered device: USB controlled by this device
4. Allow file system access and USB debugging authorization.
<img src="https://github.com/user-attachments/assets/dc9b37b7-104e-4da8-8f13-2294a749ae6a" width="256">

5. Run `adb devices` on the tethering device to check the tethered device is connected. (it may take 1-2 minutes)
<img src="https://github.com/user-attachments/assets/cda5cbf1-c31d-4791-83d3-5253c866078c" width="256">
<img src="https://github.com/user-attachments/assets/d992c57e-cee8-4177-8678-17937b557004" width="256">

6. Run `./gnirehtet run` on the tethering device.
<img src="https://github.com/user-attachments/assets/dcba643b-60cf-4335-92a9-b558e973e65f" width="256">


## How it works

`gnirehtet` was originally for reverse-tethering, sharing PC's internet connection to Android device, using `adb`. I recompiled `gnirehtet` to make it executable on aarch64 Termux.

To run `adb` and connect to another device on Android, I used `termux-adb`.

## Build

### gnirehtet relay server

The binary of relay server (`gnirehtet`) in this repository was built for Termux, `aarch64`. However, you may want to build relay server yourself to run on difference environment.

To build relay server:

1. Install [cargo](https://rustup.rs/) to build Rust.
2. Run `build-gnirehtet.sh` script.

The compiled binary (named `gnirehtet`) will be located in the same directory where the script is executed.

### gnirehtet android app

gnirehtet app would work on most devices so you don't need to build it yourself. The apk file in this repository is from [official gnirehtet release](https://github.com/Genymobile/gnirehtet/releases).

To build the Android app: [gnirehtet/DEVELOP.md](https://github.com/Genymobile/gnirehtet/blob/master/DEVELOP.md)

## Related projects

- [termux-adb](https://github.com/nohajc/termux-adb)
- [gnirehtet](https://github.com/Genymobile/gnirehtet)
