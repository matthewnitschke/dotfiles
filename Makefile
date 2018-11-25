.DEFAULT_GOAL := init

init:
	./brew/install.sh # first install brew dependencies

	./zsh/install.sh # install zsh plugins1
	./vim/install.sh

	./iterm2/install.sh # handle iterm2 installation
	./terminator/install.sh # setup the config link for terminator

	# install node dependencies
	(cd git/tools; yarn) # install git tools dependencies
	(cd custom-apps/checkoff; yarn) # install checkoff dependencies
