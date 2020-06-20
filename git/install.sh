# Verify we arent already installed
if grep -q "include" "$GITCONFIG_PATH"; then
    echo "[include] already exists within ~/.gitconfig, unable to add script"
    exit 1
fi

pushd . > /dev/null
cd $(dirname "$0")
CONFIG_SCRIPT_PATH=$(pwd)/gitconfig
popd > /dev/null

GITCONFIG_PATH="$HOME/.gitconfig"

# Add the [include] tag to the users gitconifg
printf "\n[include]\n\tpath = $CONFIG_SCRIPT_PATH\n" >> "$GITCONFIG_PATH"