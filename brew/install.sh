SCRIPT_DIR=$(dirname "$0") # get the base directory for this file

if [[ $OSTYPE == darwin* ]]; then
    # If we are running on osx

    if [ -x "$(command -v brew)" ]; then
        pushd $SCRIPT_DIR # make sure you are in the correct directory for installing brew dependencies
        brew bundle # if the brew command is actually installed, install dependencies from the bundle
        popd
    else
        echo "Brew not installed, not installing brew bundle"
    fi
else
    echo "Not darwin system, not installing brew bundle"
fi
