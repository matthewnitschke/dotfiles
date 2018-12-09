if [[ "$OSTYPE" == "darwin"* ]]; then
    if [[ ! -x "$(command -v brew)" ]]; then
        echo "Installing homebrew..."
        ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
    fi

    brew install git
    brew install zsh
    brew install node

elif [[ "$OSTYPE" == "linux-gnu" ]]; then
    if [[ -x "$(command -v pacman)" ]]; then

        pacman -Sy git
        pacman -Sy zsh
        pacman -Sy nodejs npm

    elif [[ -x "$(command -v apt-get)" ]]; then

        apt-get --yes install git
        apt-get --yes install zsh

        curl -sL https://deb.nodesource.com/setup_11.x | sudo -E bash -
        apt-get --yes install nodejs
        
    fi
fi