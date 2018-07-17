init:
	./zsh/update-plugins.sh
	(cd git/tools; yarn)
	(cd ~; vim -c 'PluginInstall' -c 'qa!')