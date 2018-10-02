# Scripts

Configuration managment for my unix based system

# Installation
Add whichever of the following you want and then run `make init`

## zsh
first install [oh-my-zsh](https://github.com/robbyrussell/oh-my-zsh)

add the following in `~/.zshrc`
```
source ~/scripts/zsh/zshrc.sh
```

and set your `ZSH_THEME="vladimir"`

## vim
first install [vundle](https://github.com/VundleVim/Vundle.vim)

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

## hyper
add the plugin `vladimir` to your plugins array in `~/.hyper.js`

## iterm2
set `Vladimir` as default profile in `Preferences -> Profiles -> Other Actions -> Set Default Profile`

## pandoc
its installed with the `zsh` configuration, run the following for help
```
pdoc help
```
