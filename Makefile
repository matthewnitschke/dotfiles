init:
	#git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
	./zsh/update-plugins.sh # install zsh plugins
	(cd git/tools; yarn) # install git tools dependencies
	(cd checkoff; yarn) # install checkoff dependencies
	(cd ~; vim -c 'PluginInstall' -c 'qa!') # install vim plugins

	./hyper/install.sh # handle hyper installation
	./iterm2/install.sh # handle iterm2 installation
	./pandoc/install.sh # install all required pandoc stuff