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

# sets the zsh theme to the custom one contained in this repo
ZSH_THEME="vladimir"
```

## vim
Run `make vim`

then add the following in `~/.vimrc`
```
source ~/scripts/vim/vimrc.vim
```

## git
add the following in `~/.gitconfig`
```
[include]
	path = scripts/git/gitconfig
```

## iterm2
Run `make iterm`

set `Vladimir` as default profile in `Preferences -> Profiles -> Other Actions -> Set Default Profile`

## terminator
Run `./terminator/install.sh`

Everything will magically work. I love terminator