#!/bin/bash

SCRIPT_DIR=$(dirname "$0")

# if gh is installed, link the config
if [ -x "$(command -v gh)" ]; then
    mkdir -p ~/.config/gh # ensure config folder exists
    
    ln -f $SCRIPT_DIR/config.yaml ~/.config/gh/config.yaml

    printf "Linked config.yaml file\n"
else
    printf "gh (github cli) not installed, please install then re-run the command\n"
fi