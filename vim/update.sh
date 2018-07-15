cp .vimrc ~/.vimrc # copy local vimrc to users vimrc
(cd ~; vim -c 'PluginInstall' -c 'qa!') # runs vundle's PluginInstall from the users directory