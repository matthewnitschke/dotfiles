init:
	./zsh/update-plugins.sh # install zsh plugins
	(cd git/tools; yarn) # install git tools dependencies
	(cd checkoff; yarn) # install checkoff dependencies
	(cd ~; vim -c 'PluginInstall' -c 'qa!') # install vim plugins

	./hyper/install.sh # handle hyper installation
	./iterm2/install.sh # handle iterm2 installation

	(cd brew; brew bundle)
	./vscode/install.sh