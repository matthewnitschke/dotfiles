init:
	./zsh/update-plugins.sh # install zsh plugins
	(cd git/tools; yarn) # install git tools dependencies
	(cd checkoff; yarn) # install checkoff dependencies
	(cd ~; vim -c 'PluginInstall' -c 'qa!') # install vim plugins

	./iterm2/install.sh # handle iterm2 installation
	./terminator/install.sh # setup the config link for terminator

	(cd brew; brew bundle)
	./vscode/install.sh