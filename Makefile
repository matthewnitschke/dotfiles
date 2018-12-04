.DEFAULT_GOAL := init

init:
	# install any dependencies for the following commands
	./system-dependencies/install.sh

	./zsh/install.sh # install zsh plugins
	./vim/install.sh

	./iterm2/install.sh # handle iterm2 installation
	./terminator/install.sh # setup the config link for terminator

	# install node dependencies
	(cd git/tools; npm install) # install git tools dependencies
	(cd custom-apps/checkoff; npm install) # install checkoff dependencies
