sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended

function __join_by { local d=$1; shift; echo -n "$1"; shift; printf "%s" "${@/#/$d}"; }

SCRIPT_DIR=$(dirname "$0") # get the base directory for this file

# uninstall all plugins
rm -rf $SCRIPT_DIR/plugins

# install real plugins
git clone https://github.com/zsh-users/zsh-autosuggestions $SCRIPT_DIR/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git $SCRIPT_DIR/plugins/zsh-syntax-highlighting

# install fake plugins (these are ones that already are installed within oh-my-zsh)
printf "Dummy file so that ~/dotfiles/zsh/install.sh thinks the filename is a plugin" > $SCRIPT_DIR/plugins/git

SHOULD_COPY_TEMPLATE=$(cat $HOME/.zshrc | grep "zsh/zshrc.sh")
if [ ! -n "$SHOULD_COPY_TEMPLATE" ]; then
    printf "Installing ~/.zshrc template\n"
    PLUGIN_LIST=$(ls $SCRIPT_DIR/plugins)
    PLUGINS=$(__join_by '\ \n    ' $PLUGIN_LIST)

    # cat $SCRIPT_DIR/zshrc.template.sh | sed "s/{{plugins}}/$PLUGINS/g" > ~/.zshrc
    cat $SCRIPT_DIR/zshrc.template.sh > ~/.zshrc
else 
    printf "Template already installed, not overriding\n"
fi

# if we are on OSX, hide the "last login" text
if [[ $OSTYPE == darwin* ]]; then
    touch $HOME/.hushlogin
fi