# run in users ~/.zshrc via source

SCRIPT_DIR=$(dirname "$0") # get the base directory for this file

export ZSH_CUSTOM=$SCRIPT_DIR # set the ZSH_CUSTOM file to this ones

# if this is osx, add the homebrew to the path
if [[ $OSTYPE == darwin* ]]; then
    export PATH="/usr/local/bin:${PATH}"
fi

if [[ -x "$(command -v yarn)" ]]; then
    # add yarn global to the path
    export PATH="$(yarn global bin):$PATH"
fi

export EDITOR="micro"