#!/bin/bash

pushd . > /dev/null
cd $(dirname "$0")
FULL_PATH=$(pwd)
popd > /dev/null

# iterm2 is osx only, ensure we are on an osx machine
if [[ $OSTYPE == darwin* ]]; then
    # Tell iTerm2 to use the custom preferences in the directory
    defaults write com.googlecode.iterm2.plist LoadPrefsFromCustomFolder -bool true

    # Specify the preferences directory
    defaults write com.googlecode.iterm2.plist PrefsCustomFolder -string "$FULL_PATH"
fi

