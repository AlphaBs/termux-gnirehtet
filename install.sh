#!/bin/sh

confirm() {
    # call with a prompt string or use a default
    read -r -p "${1:-Are you sure? [y/N]} " response
    case "$response" in
        [yY][eE][sS]|[yY]) 
            true
            ;;
        *)
            false
            ;;
    esac
}

export TERMUX_ADB;

pkg install fakeroot || exit;

if [ ! "$TERMUX_ADB" ]; then
    TERMUX_ADB="$(command -v termux-adb)"
fi

if [ ! -f "$TERMUX_ADB" ]; then
    curl -s https://raw.githubusercontent.com/nohajc/termux-adb/master/install.sh | bash || exit;
fi

if [ ! -f "$TERMUX_ADB" ]; then
    echo "Failed to install termux-adb: $TERMUX_ADB";
    exit;
fi

echo -n "Is your device running Samsung's Android? ";
if [ confirm ]; then
    echo "Do you want to replace the 'adb' command with the new one? It will automatically fix the socket bug of Samsung devices.";
    if [ confirm ]; then
        cp ./adb-samsung.sh $PREFIX/bin/adb;
    else
        echo "Make sure to specify ADB every time you use gnirehtet. like this: "
        echo "ADB=adb-samsung.sh ./gnirehtet run";
    fi
else
    echo -n "Would you like to create a symbolic link for 'adb' command? ";
    if [ confirm ]; then
        ln -s "$PREFIX/bin/termux-adb" "$PREFIX/bin/adb";
    else
        echo "Make sure to specify ADB every time you use gnirehtet. like this: ";
        echo "ADB=termux-adb ./gnirehtet run";
    fi
fi

echo "Done";
