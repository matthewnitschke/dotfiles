# run in users ~/.zshrc via source

SCRIPT_DIR=$(dirname "$0") # get the base directory for this file

export ZSH_CUSTOM=$SCRIPT_DIR # set the ZSH_CUSTOM file to this ones


source $SCRIPT_DIR/../aliases/aliases.sh