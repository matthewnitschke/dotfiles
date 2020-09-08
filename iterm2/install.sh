#!/bin/bash

pushd . > /dev/null
cd $(dirname "$0")
FULL_PATH=$(pwd)
popd > /dev/null

# iterm2 is osx only, ensure we are on an osx machine
if [[ $OSTYPE == darwin* ]]; then
    echo "Applying iterm2 settings with: $FULL_PATH"

    # Tell iTerm2 to use the custom preferences in the directory
    defaults write com.googlecode.iterm2.plist LoadPrefsFromCustomFolder -bool true

    # Specify the preferences directory
    defaults write com.googlecode.iterm2.plist PrefsCustomFolder -string "$FULL_PATH"
else
    echo "Not on osx, iterm not supported"
fi

