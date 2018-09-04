#!/bin/bash

SCRIPT_DIR=$(dirname "$0") # get the base directory for this file

# iterm2 is osx only, ensure we are on an osx machine
if [[ $OSTYPE == darwin* ]]; then
    if [ -d "$HOME/Library/Application Support/iTerm2/DynamicProfiles" ]; then
        # only setup iterm2 config if iterm2 is installed
        ln -f "$SCRIPT_DIR/iterm2-profile.plist" "$HOME/Library/Application Support/iTerm2/DynamicProfiles/iterm2-profile.plist"
    else
        echo "iterm2 not installed, skipping iterm2 config setup"
    fi
fi
