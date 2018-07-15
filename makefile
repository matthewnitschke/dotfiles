init:
	(cd git/tools; yarn)
	(cd ~; vim -c 'PluginInstall' -c 'qa!')