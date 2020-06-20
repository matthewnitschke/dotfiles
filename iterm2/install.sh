#!/bin/bash

SCRIPT_DIR=$(dirname "$0") # get the base directory for this file

# iterm2 is osx only, ensure we are on an osx machine
if [[ $OSTYPE == darwin* ]]; then
    # Tell iTerm2 to use the custom preferences in the directory
    defaults write com.googlecode.iterm2.plist LoadPrefsFromCustomFolder -bool true

    # Specify the preferences directory
    defaults write com.googlecode.iterm2.plist PrefsCustomFolder -string "$SCRIPT_DIR"
fi

