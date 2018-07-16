SCRIPT_DIR=$(dirname "$0") # get the base directory for this file

alias python="python3"
alias copy="clipcopy"

if [[ $OSTYPE == darwin* ]]; then
    source $SCRIPT_DIR/osx.sh
else
    source $SCRIPT_DIR/linux.sh
fi