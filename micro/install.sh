SCRIPT_DIR=$(dirname "$0")

# install micro via brew if it doesnt exist
if ! [ -x "$(command -v micro)" ]; then
    brew install micro
fi

# make sure neceessary dirs exist
mkdir -p ~/.config/micro/colorschemes

ln -f $SCRIPT_DIR/config/bindings.json ~/.config/micro/bindings.json
ln -f $SCRIPT_DIR/config/settings.json ~/.config/micro/settings.json
ln -f $SCRIPT_DIR/config/colorschemes/dracula.micro ~/.config/micro/colorschemes/dracula.micro