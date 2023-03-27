#!/bin/sh

if [ ! -d "./gnirehtet-repo" ]; then
    git clone https://github.com/Genymobile/gnirehtet gnirehtet-repo
fi

cargo build --release --manifest-path="./gnirehtet-repo/relay-rust/Cargo.toml"
cp ./gnirehtet-repo/relay-rust/target/release/gnirehtet ./gnirehtet
