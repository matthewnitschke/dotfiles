.DEFAULT_GOAL := init

pre-install:
	./system-dependencies/install.sh

zsh:
	./zsh/install.sh

vim:
	./vim/install.sh

iterm:
	./iterm2/install.sh

node-tools:
	(cd git/tools; npm install)

pandoc:
	./pandoc/install.sh
