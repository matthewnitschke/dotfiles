SCRIPT_DIR=$(dirname "$0") # get the base directory for this file

if [[ $OSTYPE == darwin* ]]; then
    # If we are running on osx

    if test ! $(which brew); then
        echo "Installing homebrew..."
        ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
    fi

    pushd $SCRIPT_DIR # make sure you are in the correct directory for installing brew dependencies
    brew bundle # install dependencies from the bundle
    popd

else
    echo "Not darwin system, not installing brew bundle"
fi
