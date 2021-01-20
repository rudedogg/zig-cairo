#!/bin/bash
# before_install script to use on Travis CI
# https://docs.travis-ci.com/user/installing-dependencies/#installing-projects-from-source

# https://vaneyckt.io/posts/safer_bash_scripts_with_set_euxo_pipefail/
set -euxo pipefail

export ZIG_VERSION=0.7.0

if [[ "$TRAVIS_OS_NAME" == "linux" ]]; then
    sudo apt-get install -y libcairo2-dev;
fi

if [[ $ZIG_VERSION == 0.8.0-dev* ]]; then
    wget https://ziglang.org/builds/zig-linux-x86_64-"$ZIG_VERSION".tar.xz -O /tmp/zig-linux-x86_64-"$ZIG_VERSION".tar.xz
else
    wget https://ziglang.org/download/"$ZIG_VERSION"/zig-linux-x86_64-"$ZIG_VERSION".tar.xz -O /tmp/zig-linux-x86_64-"$ZIG_VERSION".tar.xz
fi

tar -xvf /tmp/zig-linux-x86_64-"$ZIG_VERSION".tar.xz -C "$HOME"
rm /tmp/zig-linux-x86_64-"$ZIG_VERSION".tar.xz
mv "$HOME"/zig-linux-x86_64-"$ZIG_VERSION" "$HOME"/zig
export PATH=$PATH:$HOME/zig
