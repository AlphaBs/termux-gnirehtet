#!/bin/sh

confirm() {
    # call with a prompt string or use a default
    read -r -p "${1:-Are you sure?} [y/N] " response
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
    $TERMUX_ADB
fi

if [ ! -f "$TERMUX_ADB" ]; then
    echo "Failed to install termux-adb: $TERMUX_ADB";
    exit;
fi

if confirm "Is your device running Samsung's Android?"; then
    if confirm "Replace 'adb' with 'termux-adb'? (RECOMMENDED)"; then
        cp ./adb-samsung.sh $PREFIX/bin/adb;
    else
        echo "Set up ADB before each use of gnirehtet:"
        echo "";
        echo "ADB=adb-samsung.sh ./gnirehtet run";
        echo "";
    fi
else
    if confirm "Create a symbolic link for 'adb' command?"; then
        ln -s "$PREFIX/bin/termux-adb" "$PREFIX/bin/adb";
    else
        echo "Set up ADB before each use of gnirehtet:";
        echo "";
        echo "ADB=termux-adb ./gnirehtet run";
        echo "";
    fi
fi

echo "Done";
