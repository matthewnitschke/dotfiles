SCRIPT_DIR=$(dirname "$0") # get the base directory for this file

# ------ Dependency Validations ------
if [ ! -x "$(command -v code)" ]; then
    printf "vscode is not installed, please install then re-run the command\n"
    exit 1
fi

if [ ! -x "$(command -v jq)" ]; then
    printf "jq is not installed, please install it and re-run the command\n"
    exit 1
fi

if [[ $OSTYPE == darwin* ]]; then
    SETTINGS_PATH=$HOME/Library/Application\ Support/Code/User
else
    printf "OSTYPE: $OSTYPE, not found. Cannot install vscode settings"
    exit 1
fi

jq -s '.[0] * .[1]' "$SCRIPT_DIR/settings.json" "$SETTINGS_PATH/settings.json" > "$SETTINGS_PATH/settings.json"
jq -s '.[0] * .[1]' "$SCRIPT_DIR/keybindings.json" "$SETTINGS_PATH/keybindings.json" > "$SETTINGS_PATH/keybindings.json"