if [ ! -f ~/.vim/bundle/Vundle.vim ]; then
    # if vundle is not installed, install it
    echo "Installing Vundle"
    git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
fi

pushd ~
vim -c 'PluginInstall' -c 'qa!'
popd
