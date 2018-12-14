#!/bin/bash

SCRIPT_DIR=$(dirname "$0") # get the base directory for this file

if [[ -x "$(command -v pet)" ]]; then
    ln -f "$SCRIPT_DIR/config.toml" "$HOME/.config/pet/config.toml"
else
    echo "pet not installed, please install with desired package manager first"
fi