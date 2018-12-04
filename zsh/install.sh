SCRIPT_DIR=$(dirname "$0") # get the base directory for this file

# install oh-my-zsh with sh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

# install oh-my-zsh plugins
rm -rf $SCRIPT_DIR/plugins/zsh-autosuggestions
rm -rf $SCRIPT_DIR/plugins/zsh-syntax-highlighting

git clone https://github.com/zsh-users/zsh-autosuggestions $SCRIPT_DIR/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git $SCRIPT_DIR/plugins/zsh-syntax-highlighting