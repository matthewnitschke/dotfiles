SCRIPT_DIR=$(dirname "$0") # get the base directory for this file

alias python="python3"
alias copy="clipcopy"
alias desk="cd ~/Desktop"

alias checkoff="node ~/scripts/checkoff/checkoff.js"

if [[ $OSTYPE == darwin* ]]; then
    source $SCRIPT_DIR/osx.sh
else
    source $SCRIPT_DIR/linux.sh
fi