# run in users ~/.zshrc via source

SCRIPT_DIR=$(dirname "$0") # get the base directory for this file

export ZSH_CUSTOM=$SCRIPT_DIR # set the ZSH_CUSTOM file to this ones

# if this is osx, add the homebrew to the path
if [[ $OSTYPE == darwin* ]]; then
    export PATH="/usr/local/bin:${PATH}"
fi

# zsh doesn't find pdflatex for some reason
# https://superuser.com/questions/982647/cannot-find-pdflatex-after-upgrade-to-mac-os-x-10-11-el-capitan
export PATH="$PATH:/Library/TeX/texbin"

export EDITOR="vim"
