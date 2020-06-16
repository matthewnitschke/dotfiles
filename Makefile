.DEFAULT_GOAL := init

pre-install:
	./system-dependencies/install.sh

oh-my-zsh:
	./zsh/install-oh-my-zsh.sh

.PHONY: zsh
zsh:
	./zsh/install.sh

vim:
	./vim/install.sh

iterm:
	./iterm2/install.sh

node-tools:
	(cd git/tools; npm install)