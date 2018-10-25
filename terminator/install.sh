#!/bin/bash

SCRIPT_DIR=$(dirname "$0")

# if terminator is installed, link the config
if [ -x "$(command -v terminator)" ]; then
    ln -f $SCRIPT_DIR/config ~/.config/terminator/config
fi