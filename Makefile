clearHyperConfig:
	cp ./hyper/clearedConfig.js ~/.hyper.js

setupAuthKeys:
	cp ./auth-keys.example.json ~/.auth-keys.json

init:
	./zsh/update-plugins.sh # install zsh plugins
	(cd git/tools; yarn) # install git tools dependencies
	(cd checkoff; yarn) # install checkoff dependencies
	(cd ~; vim -c 'PluginInstall' -c 'qa!') # install vim plugins

	mkdir -p ~/.hyper_plugins/local
	ln -f ./hyper/vladimir.js ~/.hyper_plugins/local/vladimir.js # setup vladimir hard link
