init:
	./brew/install.sh # first install brew dependencies

	./zsh/update-plugins.sh # install zsh plugins
	(cd git/tools; yarn) # install git tools dependencies
	(cd ~; vim -c 'PluginInstall' -c 'qa!') # install vim plugins
	(cd checkoff; yarn) # install checkoff dependencies

	./iterm2/install.sh # handle iterm2 installation
	./terminator/install.sh # setup the config link for terminator
