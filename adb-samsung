#!/bin/sh

export TERMUX_ADB;

if [ ! "$TERMUX_ADB" ]; then
    TERMUX_ADB="$(command -v termux-adb)";
fi

if [ ! -f "$TERMUX_ADB" ]; then
    echo "Could not find $TERMUX_ADB";
    exit 1;
fi

ANDROID_NO_USE_FWMARK_CLIENT=1 fakeroot $TERMUX_ADB $@;
