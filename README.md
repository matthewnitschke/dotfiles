# Scripts

Configuration management for my unix based system

# Installation
Start off by running `make pre-install`

## zsh
* First run `make oh-my-zsh`
* Then run `make zsh`

Finall add the following in `~/.zshrc`
```
source ~/scripts/zsh/zshrc.sh
```
### zsh configuration
you can pick and choose which of the following to use
```shell
# sets the zsh theme to the custom one contained in this repo
ZSH_THEME="vladimir"

# include the shared aliases, [Note: Must be after 'source $ZSH/oh-my-zsh.sh' to work]
source ~/scripts/aliases/aliases.sh

# lazyload in node/nvm to speed up terminal boot times
source ~/scripts/zsh/lazyload-node.sh
```

## vim
Run `make vim`

then add the following in `~/.vimrc`
```
source ~/scripts/vim/vimrc.vim
```

## git
Run `make git`

add the following in `~/.gitconfig`
```
[include]
	path = scripts/git/gitconfig
```

## iterm2
Run `make iterm`

set `Vladimir` as default profile in `Preferences -> Profiles -> Other Actions -> Set Default Profile`

## pandoc
Run `make pandoc`

this will run some brew installations, then refer to `pdoc -h` for documentation on how to use

