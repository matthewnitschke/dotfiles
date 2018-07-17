SCRIPT_DIR=$(dirname "$0") # get the base directory for this file

rm -rf $SCRIPT_DIR/plugins/zsh-autosuggestions
rm -rf $SCRIPT_DIR/plugins/zsh-syntax-highlighting

git clone https://github.com/zsh-users/zsh-autosuggestions $SCRIPT_DIR/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git $SCRIPT_DIR/plugins/zsh-syntax-highlighting