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

# Zsh History Config
setopt append_history     # Allow multiple terminal sessions to all append to one zsh command history
setopt inc_append_history # Add comamnds as they are typed, don't wait until shell exit
setopt hist_expire_dups_first # when trimming history, lose oldest duplicates first
setopt hist_ignore_dups   # Do not write events to history that are duplicates of previous events
setopt hist_ignore_space  # remove command line from history list when first character on the line is a space
setopt hist_find_no_dups  # When searching history don't display results already cycled through twice
setopt hist_reduce_blanks # Remove extra blanks from each command line being added to history

export EDITOR="micro"