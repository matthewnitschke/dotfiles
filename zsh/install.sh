# sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended

function __join_by { local d=$1; shift; echo -n "$1"; shift; printf "%s" "${@/#/$d}"; }

SCRIPT_DIR=$(dirname "$0") # get the base directory for this file

SHOULD_COPY_TEMPLATE=$(cat ~/.zshrc | grep -q "# Installed by matthewnitschke/dotfiles/zsh/install.sh")
if [ ! -n "$SHOULD_COPY_TEMPLATE" ]; then
    printf "Installing ~/.zshrc template\n"
    PLUGIN_LIST=$(ls ./plugins)
    PLUGINS=$(__join_by '\ \n    ' $PLUGIN_LIST)

    cat zshrc.template.sh | sed "s/{{plugins}}/git\ \n    $PLUGINS/g" > ~/.zshrc
else 
    printf "Template already installed, not overriding"
fi

# install oh-my-zsh plugins
rm -rf $SCRIPT_DIR/plugins/zsh-autosuggestions
rm -rf $SCRIPT_DIR/plugins/zsh-syntax-highlighting
rm -rf $SCRIPT_DIR/plugins/git-open

git clone https://github.com/zsh-users/zsh-autosuggestions $SCRIPT_DIR/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git $SCRIPT_DIR/plugins/zsh-syntax-highlighting
git clone https://github.com/paulirish/git-open.git $SCRIPT_DIR/plugins/git-open