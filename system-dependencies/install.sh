#!/bin/sh

SCRIPT_DIR=$(dirname "$0") # get the base directory for this file
PACKAGE_MANAGER=""

_install_package() {
    # echo $(jq -r '.git.brew')
    # $1 is the package name
    installationCommand=$(jq -r ".$1.$PACKAGE_MANAGER" $SCRIPT_DIR/dependencies.json)

    if [[ "$installationCommand" != "null" ]]; then
        if [[ ! -x "$(command -v $1)" ]]; then
            eval $instllationCommand
        else
            echo "Program $1 already installed"
        fi
    else
        echo "Cannot install $1. No installation command exists in dependencies.json for the package manager: $PACKAGE_MANAGER"
    fi
}

# validate the $OSTYPE of this system, and set the PACKAGE_MANAGER bit
if [[ "$OSTYPE" == "darwin"* ]]; then
    PACKAGE_MANAGER="brew"
elif [[ "$OSTYPE" == "linux-gnu" ]]; then
    if [[ -x "$(command -v pacman)" ]]; then
        PACKAGE_MANAGER="pacman"
    elif [[ -x "$(command -v apt-get)" ]]; then
        PACKAGE_MANAGER="apt"
    fi
else
    echo "Unknown OSTYPE var: $OSTYPE, cannot install system-dependencies"
    exit 1
fi

# if the PACKAGE_MANAGER is brew and it is not installed, install it
if [[ "$PACKAGE_MANAGER" == "brew" ]] && [[ ! -x "$(command -v brew)" ]]; then
    echo "Installing homebrew..."
    ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

# if jq is not installed, install it
if [[ ! -x "$(command -v jq)" ]]; then
    if [[ "$PACKAGE_MANAGER" == "brew" ]]; then
        brew install jq
    elif [[ "$PACKAGE_MANAGER" == "pacman" ]]; then
        pacman -Sy jq
    elif [[ "$PACKAGE_MANAGER" == "apt" ]]; then
        apt-get --yes install jq
    fi
fi

echo "$PACKAGE_MANAGER"

programs=($(jq -r 'keys[]' $SCRIPT_DIR/dependencies.json))
for program in ${programs[@]}; do
    _install_package $program
done