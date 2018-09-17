#!/bin/bash

SCRIPT_DIR=$(dirname "$0") # get the base directory for this file 

if [ -f "$HOME/.hyper.js" ];
then
    # only setup hyper if there is a ~/.hyper.js file on this computer (meaning hyper is installed)
    mkdir -p "$HOME/.hyper_plugins/local"
    ln -f "$SCRIPT_DIR/vladimir.js" "$HOME/.hyper_plugins/local/vladimir.js" # setup vladimir hard link for hyper
else
   echo "~/.hyper.js does not exist, skipping hyper installation"
fi