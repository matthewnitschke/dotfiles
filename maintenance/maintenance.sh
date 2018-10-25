#!/bin/bash

# if homebrew is installed, run its cleanup commands
if [ -x "$(command -v brew)" ]; then
    brew update # updates brew itself stuff
    brew upgrade # updates brew formulas
    brew cleanup # removes any uneeded brew stuff
fi

# if apt-get is installed, run its cleanup commands
if [ -x "$(command -v apt-get)" ]; then
    apt-get update
    apt-get upgrade -y
    apt-get dist-upgrade -y
    
    apt-get autoclean
    apt-get cleanup
    apt-get autoremove
fi