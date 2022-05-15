#!/bin/bash

COMMANDS="$@"
SCRIPT_DIR=$(dirname "$0")

__show_help() {
    printf "\n"
    printf "Install tool for my dotfiles\n"
    printf "\n"
    printf "Available packages:\n"
    printf "  git homebrew iterm2 terminator vscode zsh\n"
    printf "\n"
}

if [[ "$COMMANDS" == "" ]]; then 
    __show_help
    exit 0
fi

for COMMAND in $COMMANDS
do
    pushd . > /dev/null
    cd $COMMAND
    ./install.sh
    popd > /dev/null
done